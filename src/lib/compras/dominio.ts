import { ESTADOS_RED_VERIFICADA } from "./tipos";
import type {
  Categoria,
  Certificacion,
  CertificacionAcreditada,
  Consulta,
  ConsultaDetallada,
  ContenidoInforme,
  Informe,
  Insumo,
  Minera,
  Oferta,
  ProveedorVerificado,
  ProveedorVerificadoDetalle,
  Recomendacion,
  RecomendacionDetallada,
  RequisitoCategoria,
  StockInsumo,
} from "./tipos";
import type {
  FilaCategoria,
  FilaCertificacion,
  FilaConsulta,
  FilaInforme,
  FilaInsumo,
  FilaMinera,
  FilaOferta,
  FilaProveedor,
  FilaRecomendacion,
  FuenteDatosCompras,
  NuevaRecomendacion,
  TablasCompras,
} from "./fuente-datos";
import { FuenteDatosMemoria } from "./memoria";

export * from "./tipos";
export type { NuevaRecomendacion, FuenteDatosCompras } from "./fuente-datos";

// ---------- Selección del adaptador ----------

const globalCompras = globalThis as unknown as {
  __juMinFuenteCompras?: Promise<FuenteDatosCompras>;
};

/** Tope de espera al sondear Supabase: un host apagado tarda ~1 minuto en
 * rechazar la conexión TCP y el demo no puede esperar eso. */
const ESPERA_SONDA_MS = 8000;

type ModoFuente = "auto" | "memoria" | "supabase";

/** JUMIN_FUENTE_DATOS: auto (default), memoria o supabase. */
function modoFuente(): ModoFuente {
  const modo = process.env.JUMIN_FUENTE_DATOS;
  if (modo === "auto" || modo === "memoria" || modo === "supabase") return modo;
  if (modo) {
    console.warn(
      `[compras] JUMIN_FUENTE_DATOS="${modo}" no es válido (auto|memoria|supabase); se usa "auto".`,
    );
  }
  return "auto";
}

function fuenteDatos(): Promise<FuenteDatosCompras> {
  globalCompras.__juMinFuenteCompras ??= crearFuenteDatos();
  return globalCompras.__juMinFuenteCompras;
}

/** Resuelve la fuente una vez por proceso. En modo "auto" el demo nunca
 * queda en pantalla vacía: si Supabase está configurado pero no responde o
 * no tiene el seed cargado, se cae al seed en memoria con un aviso en el
 * log del servidor. Con "supabase" los errores se propagan sin fallback
 * (pipeline real); con "memoria" se ignora Supabase aunque haya env vars. */
async function crearFuenteDatos(): Promise<FuenteDatosCompras> {
  const modo = modoFuente();
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (modo === "memoria" || !url || !serviceKey) {
    return new FuenteDatosMemoria();
  }

  const { AdaptadorSupabase } = await import("./adaptador-supabase");
  const supabase = new AdaptadorSupabase(url, serviceKey);
  if (modo === "supabase") return supabase;

  try {
    const t = await sondear(supabase);
    if (t.proveedores.length === 0) {
      console.warn(
        `[compras] Supabase responde pero no tiene el seed cargado ` +
          `(pnpm supabase db reset). Se usa el seed en memoria para el demo.`,
      );
      return new FuenteDatosMemoria();
    }
    console.info(`[compras] Fuente de datos: Supabase (${url}).`);
    return supabase;
  } catch (error) {
    console.warn(
      `[compras] Supabase no responde en ${url} ` +
        `(${error instanceof Error ? error.message : String(error)}). ` +
        `Se usa el seed en memoria para el demo.`,
    );
    return new FuenteDatosMemoria();
  }
}

async function sondear(fuente: FuenteDatosCompras): Promise<TablasCompras> {
  let timer: ReturnType<typeof setTimeout>;
  const expira = new Promise<never>((_, reject) => {
    timer = setTimeout(
      () => reject(new Error(`sin respuesta en ${ESPERA_SONDA_MS / 1000}s`)),
      ESPERA_SONDA_MS,
    );
  });
  try {
    return await Promise.race([fuente.leerTablas(), expira]);
  } finally {
    clearTimeout(timer!);
  }
}

async function tablas(): Promise<TablasCompras> {
  return (await fuenteDatos()).leerTablas();
}

// ---------- Proveedores verificados ----------

export type OrdenProveedores =
  | "trust_score_desc"
  | "trust_score_asc"
  | "nombre_asc";

export interface FiltrosProveedores {
  busqueda?: string;
  categoriaId?: string;
  insumoId?: string;
  orden?: OrdenProveedores;
}

const ESTADOS_RED = new Set<string>(ESTADOS_RED_VERIFICADA);

/** La red verificada: proveedores validado o homologado según DOCS.md,
 * con filtros por insumo/categoría, búsqueda por nombre y orden. */
export async function listarProveedoresVerificados(
  filtros: FiltrosProveedores = {},
): Promise<ProveedorVerificado[]> {
  const t = await tablas();

  let lista = t.proveedores
    .filter((p) => ESTADOS_RED.has(p.estado))
    .map((p) => mapearProveedor(p, t));

  if (filtros.categoriaId) {
    lista = lista.filter((p) =>
      p.categorias.some((c) => c.id === filtros.categoriaId),
    );
  }
  if (filtros.insumoId) {
    const insumoId = filtros.insumoId;
    const ofertantes = new Set(
      t.ofertas.filter((o) => o.insumo_id === insumoId).map((o) => o.proveedor_id),
    );
    lista = lista.filter((p) => ofertantes.has(p.id));
  }
  const busqueda = normalizarTexto(filtros.busqueda ?? "");
  if (busqueda) {
    lista = lista.filter(
      (p) =>
        normalizarTexto(p.razonSocial).includes(busqueda) ||
        (p.nombreFantasia !== null &&
          normalizarTexto(p.nombreFantasia).includes(busqueda)),
    );
  }

  const orden = filtros.orden ?? "trust_score_desc";
  return [...lista].sort((a, b) => {
    switch (orden) {
      case "trust_score_asc":
        return (
          a.trustScore.valor - b.trustScore.valor ||
          a.razonSocial.localeCompare(b.razonSocial, "es")
        );
      case "nombre_asc":
        return a.razonSocial.localeCompare(b.razonSocial, "es");
      case "trust_score_desc":
      default:
        return (
          b.trustScore.valor - a.trustScore.valor ||
          a.razonSocial.localeCompare(b.razonSocial, "es")
        );
    }
  });
}

/** Ficha de un proveedor verificado con sus ofertas y el desglose del
 * trust score. null si no existe o no integra la red verificada. */
export async function obtenerProveedorVerificado(
  id: string,
): Promise<ProveedorVerificadoDetalle | null> {
  const t = await tablas();
  const fila = t.proveedores.find((p) => p.id === id);
  if (!fila || !ESTADOS_RED.has(fila.estado)) return null;
  const insumos = new Map(t.insumos.map((i) => [i.id, i]));
  return {
    ...mapearProveedor(fila, t),
    ofertas: t.ofertas
      .filter((o) => o.proveedor_id === id)
      .flatMap((o) => {
        const insumo = insumos.get(o.insumo_id);
        if (!insumo) return [];
        return [{ ...mapearOferta(o), insumo: mapearInsumo(insumo) }];
      })
      .sort((a, b) => a.insumo.nombre.localeCompare(b.insumo.nombre, "es")),
  };
}

export async function listarCategorias(): Promise<Categoria[]> {
  const t = await tablas();
  return t.categorias
    .map(mapearCategoria)
    .sort((a, b) => a.nombre.localeCompare(b.nombre, "es"));
}

export async function listarInsumos(): Promise<Insumo[]> {
  const t = await tablas();
  return t.insumos
    .map(mapearInsumo)
    .sort((a, b) => a.nombre.localeCompare(b.nombre, "es"));
}

/** Un insumo del catálogo por id; null si no existe. */
export async function obtenerInsumo(id: string): Promise<Insumo | null> {
  const t = await tablas();
  const fila = t.insumos.find((i) => i.id === id);
  return fila ? mapearInsumo(fila) : null;
}

/** Requisitos de certificación de una categoría (DOCS.md §3.3): el agente
 * solo recomienda proveedores que acreditan los obligatorios, verificados
 * y vigentes. */
export async function listarRequisitosDeCategoria(
  categoriaId: string,
): Promise<RequisitoCategoria[]> {
  const t = await tablas();
  return t.requisitosCategoria
    .filter((r) => r.categoria_id === categoriaId)
    .flatMap((r) => {
      const cert = t.certificaciones.find((c) => c.id === r.certificacion_id);
      return cert
        ? [{ certificacion: mapearCertificacion(cert), obligatorio: r.obligatorio }]
        : [];
    });
}

/** Ofertas de un insumo puntual, con el proveedor que las emite. */
export async function listarOfertasDeInsumo(
  insumoId: string,
): Promise<Oferta[]> {
  const t = await tablas();
  return t.ofertas.filter((o) => o.insumo_id === insumoId).map(mapearOferta);
}

// ---------- Stock de la minera ----------

const DIAS_POR_MES = 30;

/** La minera suscripta del demo. */
export async function obtenerMinera(): Promise<Minera> {
  const t = await tablas();
  return mapearMinera(t.minera);
}

/** Stock de la minera con el estado de cada insumo (normal o en alerta por
 * estar por debajo del punto de reorden) y los días de stock restantes.
 * Ordenado para reponer primero: alertas antes y, dentro de cada estado,
 * el que se agota antes. */
export async function listarStockMinera(): Promise<StockInsumo[]> {
  const t = await tablas();
  const insumos = new Map(t.insumos.map((i) => [i.id, i]));
  return t.stockMinera
    .filter((s) => s.minera_id === t.minera.id)
    .flatMap((s) => {
      const insumo = insumos.get(s.insumo_id);
      if (!insumo) return [];
      const consumo = s.consumo_mensual;
      return [
        {
          insumo: mapearInsumo(insumo),
          cantidadActual: s.cantidad_actual,
          puntoReorden: s.punto_reorden,
          consumoMensual: consumo,
          estado:
            s.cantidad_actual < s.punto_reorden
              ? ("alerta" as const)
              : ("normal" as const),
          diasRestantes: consumo
            ? Math.round((s.cantidad_actual / consumo) * DIAS_POR_MES)
            : null,
        },
      ];
    })
    .sort((a, b) => {
      if (a.estado !== b.estado) return a.estado === "alerta" ? -1 : 1;
      return (
        (a.diasRestantes ?? Infinity) - (b.diasRestantes ?? Infinity) ||
        a.insumo.nombre.localeCompare(b.insumo.nombre, "es")
      );
    });
}

// ---------- Consultas y recomendaciones ----------

export interface NuevaConsultaInput {
  mensaje: string;
  respuesta?: string | null;
  recomendaciones?: NuevaRecomendacion[];
}

/** Registra una consulta de la minera con las recomendaciones que emitió el
 * agente (si hubo). Las recomendaciones nacen en estado pendiente. */
export async function registrarConsulta(
  entrada: NuevaConsultaInput,
): Promise<Consulta> {
  const mensaje = entrada.mensaje.trim();
  if (!mensaje) throw new Error("consulta_sin_mensaje");

  const t = await tablas();
  const items = (entrada.recomendaciones ?? []).map((r) => {
    const oferta = t.ofertas.find((o) => o.id === r.ofertaId);
    if (!oferta) throw new Error("oferta_inexistente");
    return {
      proveedorId: oferta.proveedor_id,
      insumoId: oferta.insumo_id,
      justificacion: r.justificacion,
      puntaje: r.puntaje ?? null,
    };
  });

  const fuente = await fuenteDatos();
  const fila = await fuente.insertarConsulta({
    mineraId: t.minera.id,
    mensaje,
    respuesta: entrada.respuesta ?? null,
  });
  const filas = items.length
    ? await fuente.insertarRecomendaciones(fila.id, items)
    : [];
  return mapearConsulta(fila, filas, t);
}

/** Recomendaciones de la minera, detalladas y con el código de su informe
 * si ya se generó. Más nueva primero. */
export async function listarRecomendaciones(): Promise<
  RecomendacionDetallada[]
> {
  const t = await tablas();
  const consultasMinera = new Set(
    t.consultas.filter((c) => c.minera_id === t.minera.id).map((c) => c.id),
  );
  return t.recomendaciones
    .filter((r) => consultasMinera.has(r.consulta_id))
    .map((r) => detallarRecomendacion(r, t))
    .sort((a, b) => b.creadaEn.localeCompare(a.creadaEn));
}

/** La consulta más reciente con sus recomendaciones detalladas; null si la
 * minera todavía no consultó. */
export async function obtenerUltimaConsulta(): Promise<ConsultaDetallada | null> {
  const t = await tablas();
  const ultima = t.consultas.reduce<FilaConsulta | null>(
    (acc, c) => (acc && acc.created_at > c.created_at ? acc : c),
    null,
  );
  if (!ultima) return null;
  return {
    ...mapearConsulta(ultima, [], t),
    recomendaciones: t.recomendaciones
      .filter((r) => r.consulta_id === ultima.id)
      .map((r) => detallarRecomendacion(r, t)),
  };
}

/** Historial de consultas con sus recomendaciones detalladas (insumo,
 * oferta y proveedor resueltos, para enlazar la ficha), más reciente
 * primero. */
export async function listarHistorialConsultas(): Promise<
  ConsultaDetallada[]
> {
  const t = await tablas();
  const porConsulta = new Map<string, FilaRecomendacion[]>();
  for (const r of t.recomendaciones) {
    const lista = porConsulta.get(r.consulta_id) ?? [];
    lista.push(r);
    porConsulta.set(r.consulta_id, lista);
  }
  return t.consultas
    .map((c) => ({
      ...mapearConsulta(c, [], t),
      recomendaciones: (porConsulta.get(c.id) ?? []).map((r) =>
        detallarRecomendacion(r, t),
      ),
    }))
    .sort((a, b) => b.creadaEn.localeCompare(a.creadaEn));
}

// ---------- Informes ----------

/** Regla cumple_requisitos (DOCS.md §4.4): certificación verificada y
 * vigente para cada requisito obligatorio de la categoría. */
export function cumpleRequisito(
  certificaciones: CertificacionAcreditada[],
  certificacionId: string,
  hoy: string,
): boolean {
  return certificaciones.some(
    (c) =>
      c.certificacion.id === certificacionId &&
      c.estado === "verificado" &&
      (c.fechaVencimiento === null || c.fechaVencimiento > hoy),
  );
}

/** Quien descarga el informe: la persona con sesión en el panel. */
export interface AutorInforme {
  id: string;
  nombre: string;
  email: string;
}

/** Genera el informe de una recomendación de la minera, o devuelve el que
 * ya existe: cada recomendación tiene un solo informe, así el PDF que la
 * minera adjunta a su orden de compra es siempre el mismo. */
export async function generarInforme(
  recomendacionId: string,
  autor: AutorInforme,
): Promise<Informe> {
  const t = await tablas();
  const rec = t.recomendaciones.find((r) => r.id === recomendacionId);
  const consulta = rec && t.consultas.find((c) => c.id === rec.consulta_id);
  if (!rec || consulta?.minera_id !== t.minera.id) {
    throw new Error("recomendacion_inexistente");
  }
  const existente = t.informes.find((i) => i.recomendacion_id === rec.id);
  if (existente) return mapearInforme(existente);

  const codigo = nuevoCodigoInforme();
  const creadoEn = new Date().toISOString();
  const generadoPor = {
    id: autor.id,
    nombre: autor.nombre,
    email: autor.email,
  };
  const contenido = armarContenidoInforme(rec, t);
  const sello = await sellarInforme({
    codigo,
    creadoEn,
    generadoPor,
    contenido,
  });
  const fuente = await fuenteDatos();
  const fila = await fuente.insertarInforme({
    codigo,
    minera_id: t.minera.id,
    recomendacion_id: rec.id,
    generado_por_id: generadoPor.id,
    generado_por_nombre: generadoPor.nombre,
    generado_por_email: generadoPor.email,
    contenido,
    sello,
    created_at: creadoEn,
  });
  return mapearInforme(fila);
}

/** Busca un informe por su código y recalcula el sello: `integro` es false
 * si el registro guardado ya no coincide con el sello original. */
export async function verificarInforme(
  codigo: string,
): Promise<{ informe: Informe; integro: boolean } | null> {
  const buscado = codigo.trim().toUpperCase();
  if (!buscado) return null;
  const t = await tablas();
  const fila = t.informes.find((i) => i.codigo === buscado);
  if (!fila) return null;
  const informe = mapearInforme(fila);
  const sello = await sellarInforme(informe);
  return { informe, integro: sello === informe.sello };
}

/** Alfabeto Crockford base32: sin I, L, O ni U para que el código se dicte
 * y se tipee sin confusiones. */
const ALFABETO_CODIGO = "0123456789ABCDEFGHJKMNPQRSTVWXYZ";

/** Código del informe: JM-XXXX-XXXX-XXXX (60 bits aleatorios). */
function nuevoCodigoInforme(): string {
  const bytes = crypto.getRandomValues(new Uint8Array(12));
  const chars = [...bytes].map((b) => ALFABETO_CODIGO[b % 32]).join("");
  return `JM-${chars.slice(0, 4)}-${chars.slice(4, 8)}-${chars.slice(8, 12)}`;
}

/** SHA-256 (hex) del informe en JSON canónico. La fecha se normaliza a ISO
 * porque Postgres la devuelve con otro formato que el que se selló. */
async function sellarInforme(
  informe: Pick<Informe, "codigo" | "creadoEn" | "generadoPor" | "contenido">,
): Promise<string> {
  const texto = jsonCanonico({
    codigo: informe.codigo,
    creadoEn: new Date(informe.creadoEn).toISOString(),
    generadoPor: informe.generadoPor,
    contenido: informe.contenido,
  });
  const hash = await crypto.subtle.digest(
    "SHA-256",
    new TextEncoder().encode(texto),
  );
  return [...new Uint8Array(hash)]
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

/** JSON con las claves ordenadas: jsonb no conserva el orden de las claves,
 * y el sello tiene que dar igual al leer el informe de la base. */
function jsonCanonico(valor: unknown): string {
  if (Array.isArray(valor)) return `[${valor.map(jsonCanonico).join(",")}]`;
  if (valor !== null && typeof valor === "object") {
    const entradas = Object.entries(valor as Record<string, unknown>)
      .filter(([, v]) => v !== undefined)
      .sort(([a], [b]) => (a < b ? -1 : a > b ? 1 : 0));
    return `{${entradas
      .map(([k, v]) => `${JSON.stringify(k)}:${jsonCanonico(v)}`)
      .join(",")}}`;
  }
  return JSON.stringify(valor);
}

/** Copia los datos que respaldan la recomendación: la elegida, las otras
 * ofertas que cumplen y las descartadas con su motivo (mismas reglas que
 * aplica el agente). */
function armarContenidoInforme(
  rec: FilaRecomendacion,
  t: TablasCompras,
): ContenidoInforme {
  const elegida = detallarRecomendacion(rec, t);
  if (!elegida.insumo || !elegida.oferta || !elegida.proveedor) {
    throw new Error("recomendacion_incompleta");
  }
  const insumo = elegida.insumo;
  const hoy = new Date().toISOString().slice(0, 10);
  const requisitos = t.requisitosCategoria
    .filter((r) => r.categoria_id === insumo.categoriaId && r.obligatorio)
    .flatMap((r) => {
      const cert = t.certificaciones.find((c) => c.id === r.certificacion_id);
      return cert ? [mapearCertificacion(cert)] : [];
    });

  const alternativas: ContenidoInforme["alternativas"] = [];
  const descartados: ContenidoInforme["descartados"] = [];
  for (const fila of t.ofertas) {
    if (fila.insumo_id !== insumo.id || fila.id === elegida.oferta.id) continue;
    const proveedorFila = t.proveedores.find((p) => p.id === fila.proveedor_id);
    const nombre = proveedorFila?.razon_social ?? "Proveedor desconocido";
    if (!fila.disponible) {
      descartados.push({ proveedor: nombre, motivo: "Sin disponibilidad" });
      continue;
    }
    if (!proveedorFila || !ESTADOS_RED.has(proveedorFila.estado)) {
      descartados.push({
        proveedor: nombre,
        motivo: "No integra la red verificada",
      });
      continue;
    }
    const proveedor = mapearProveedor(proveedorFila, t);
    if (proveedor.estado !== "homologado") {
      descartados.push({
        proveedor: nombre,
        motivo: `No está homologado (estado ${proveedor.estado})`,
      });
      continue;
    }
    const faltantes = requisitos.filter(
      (c) => !cumpleRequisito(proveedor.certificaciones, c.id, hoy),
    );
    if (faltantes.length > 0) {
      descartados.push({
        proveedor: nombre,
        motivo: `Le faltan requisitos obligatorios: ${faltantes
          .map((c) => c.codigo ?? c.nombre)
          .join(", ")}`,
      });
      continue;
    }
    alternativas.push({
      proveedor: nombre,
      precio: fila.precio,
      moneda: fila.moneda,
      leadTimeDias: fila.lead_time_dias,
      trustScore: proveedor.trustScore.valor,
    });
  }

  const stock = t.stockMinera.find(
    (s) => s.minera_id === t.minera.id && s.insumo_id === insumo.id,
  );
  return {
    minera: t.minera.nombre,
    insumo: {
      nombre: insumo.nombre,
      unidad: insumo.unidad,
      especificacion: insumo.especificacion,
    },
    stock: stock
      ? {
          cantidadActual: stock.cantidad_actual,
          puntoReorden: stock.punto_reorden,
          diasRestantes: stock.consumo_mensual
            ? Math.round(
                (stock.cantidad_actual / stock.consumo_mensual) * DIAS_POR_MES,
              )
            : null,
        }
      : null,
    proveedor: {
      razonSocial: elegida.proveedor.razonSocial,
      cuit: elegida.proveedor.cuit,
      trustScore: elegida.proveedor.trustScore.valor,
    },
    oferta: {
      precio: elegida.oferta.precio,
      moneda: elegida.oferta.moneda,
      leadTimeDias: elegida.oferta.leadTimeDias,
    },
    justificacion: elegida.justificacion,
    requisitos: requisitos.map((c) => c.codigo ?? c.nombre),
    alternativas,
    descartados,
  };
}

// ---------- Mapeos fila → dominio ----------

function normalizarTexto(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .trim();
}

function mapearCategoria(f: FilaCategoria): Categoria {
  return {
    id: f.id,
    nombre: f.nombre,
    slug: f.slug,
    categoriaPadreId: f.categoria_padre_id,
  };
}

function mapearCertificacion(f: FilaCertificacion): Certificacion {
  return {
    id: f.id,
    nombre: f.nombre,
    codigo: f.codigo,
    tipo: f.tipo,
    ambito: f.ambito,
    organismoTipico: f.organismo_tipico,
  };
}

function mapearMinera(f: FilaMinera): Minera {
  return {
    id: f.id,
    nombre: f.nombre,
    ubicacion: f.ubicacion,
  };
}

function mapearInsumo(f: FilaInsumo): Insumo {
  return {
    id: f.id,
    categoriaId: f.categoria_id,
    nombre: f.nombre,
    unidad: f.unidad,
    especificacion: f.especificacion,
  };
}

function mapearOferta(f: FilaOferta): Oferta {
  return {
    id: f.id,
    proveedorId: f.proveedor_id,
    insumoId: f.insumo_id,
    precio: f.precio,
    moneda: f.moneda,
    leadTimeDias: f.lead_time_dias,
    disponible: f.disponible,
  };
}

function mapearProveedor(
  f: FilaProveedor,
  t: TablasCompras,
): ProveedorVerificado {
  const categoriaIds = new Set(
    t.proveedorCategorias
      .filter((pc) => pc.proveedor_id === f.id)
      .map((pc) => pc.categoria_id),
  );
  const certificaciones = t.proveedorCertificaciones
    .filter((pc) => pc.proveedor_id === f.id)
    .flatMap((pc) => {
      const cert = t.certificaciones.find((c) => c.id === pc.certificacion_id);
      if (!cert) return [];
      return [
        {
          certificacion: mapearCertificacion(cert),
          numeroCertificado: pc.numero_certificado,
          organismo: pc.organismo,
          fechaEmision: pc.fecha_emision,
          fechaVencimiento: pc.fecha_vencimiento,
          estado: pc.estado,
        },
      ];
    });
  return {
    id: f.id,
    razonSocial: f.razon_social,
    nombreFantasia: f.nombre_fantasia,
    cuit: f.cuit,
    condicionIva: f.condicion_iva,
    fechaConstitucion: f.fecha_constitucion,
    domicilio: f.domicilio,
    localidad: f.localidad,
    provincia: f.provincia,
    pais: f.pais,
    lat: f.lat,
    lng: f.lng,
    sitioWeb: f.sitio_web,
    email: f.email,
    telefono: f.telefono,
    provinciasOperacion: f.provincias_operacion ?? [],
    estado: f.estado,
    registroJujuyEstado: f.registro_jujuy_estado,
    fuente: f.fuente,
    fuenteUrl: f.fuente_url,
    trustScore: {
      valor: f.trust_score ?? 0,
      desglose: f.trust_score_detalle ?? {
        identidad: 0,
        compliance: 0,
        esg: 0,
        capacidad: 0,
      },
    },
    categorias: t.categorias
      .filter((c) => categoriaIds.has(c.id))
      .map(mapearCategoria)
      .sort((a, b) => a.nombre.localeCompare(b.nombre, "es")),
    certificaciones,
  };
}

function mapearRecomendacion(
  f: FilaRecomendacion,
  t: TablasCompras,
): Recomendacion {
  const oferta = t.ofertas.find(
    (o) => o.proveedor_id === f.proveedor_id && o.insumo_id === f.insumo_id,
  );
  return {
    id: f.id,
    consultaId: f.consulta_id,
    ofertaId: oferta?.id ?? "",
    proveedorId: f.proveedor_id ?? "",
    insumoId: f.insumo_id ?? "",
    justificacion: f.justificacion ?? "",
    puntaje: f.puntaje,
    estado: f.estado,
    creadaEn: f.created_at,
  };
}

function detallarRecomendacion(
  f: FilaRecomendacion,
  t: TablasCompras,
): RecomendacionDetallada {
  const base = mapearRecomendacion(f, t);
  const oferta = t.ofertas.find((o) => o.id === base.ofertaId);
  const proveedor = t.proveedores.find((p) => p.id === f.proveedor_id);
  const insumo = t.insumos.find((i) => i.id === f.insumo_id);
  return {
    ...base,
    insumo: insumo ? mapearInsumo(insumo) : null,
    oferta: oferta ? mapearOferta(oferta) : null,
    proveedor: proveedor ? mapearProveedor(proveedor, t) : null,
    informeCodigo:
      t.informes.find((i) => i.recomendacion_id === f.id)?.codigo ?? null,
  };
}

function mapearInforme(f: FilaInforme): Informe {
  return {
    id: f.id,
    codigo: f.codigo,
    mineraId: f.minera_id,
    recomendacionId: f.recomendacion_id,
    generadoPor: {
      id: f.generado_por_id,
      nombre: f.generado_por_nombre,
      email: f.generado_por_email,
    },
    creadoEn: f.created_at,
    contenido: f.contenido,
    sello: f.sello,
  };
}

function mapearConsulta(
  f: FilaConsulta,
  recomendaciones: FilaRecomendacion[],
  t: TablasCompras,
): Consulta {
  return {
    id: f.id,
    mensaje: f.mensaje,
    respuesta: f.respuesta,
    recomendaciones: recomendaciones.map((r) => mapearRecomendacion(r, t)),
    creadaEn: f.created_at,
  };
}
