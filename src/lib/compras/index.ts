// Módulo de dominio de compras: la única puerta de acceso a los datos.
// Las páginas consumen solo estas funciones; nunca el seed ni la fuente.
// La fuente vive detrás de un adaptador intercambiable (FuenteDatosCompras):
// por defecto el seed en memoria; si están las variables de entorno de
// Supabase (ver .env.example) se usa el adaptador Supabase.

import "server-only";

import { ESTADOS_RED_VERIFICADA } from "./tipos";
import type {
  Categoria,
  Certificacion,
  Consulta,
  ConsultaDetallada,
  DecisionRecomendacion,
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

function fuenteDatos(): Promise<FuenteDatosCompras> {
  globalCompras.__juMinFuenteCompras ??= (async () => {
    const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
    if (url && serviceKey) {
      const { AdaptadorSupabase } = await import("./adaptador-supabase");
      return new AdaptadorSupabase(url, serviceKey);
    }
    return new FuenteDatosMemoria();
  })();
  return globalCompras.__juMinFuenteCompras;
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

/** Registra la decisión de la minera sobre una recomendación pendiente.
 * Una recomendación ya decidida no puede decidirse de nuevo. */
export async function decidirRecomendacion(
  id: string,
  decision: DecisionRecomendacion,
): Promise<Recomendacion> {
  const t = await tablas();
  const rec = t.recomendaciones.find((r) => r.id === id);
  if (!rec) throw new Error("recomendacion_inexistente");
  if (rec.estado !== "pendiente") throw new Error("recomendacion_ya_decidida");

  const fuente = await fuenteDatos();
  const actualizada = await fuente.actualizarRecomendacion(id, {
    estado: decision,
  });
  if (!actualizada) throw new Error("recomendacion_inexistente");
  return mapearRecomendacion(actualizada, t);
}

/** Cola de pendientes del panel: las recomendaciones aún sin decidir, con
 * insumo, oferta y proveedor ya resueltos. Más nueva primero. */
export async function listarRecomendacionesPendientes(): Promise<
  RecomendacionDetallada[]
> {
  const t = await tablas();
  return t.recomendaciones
    .filter((r) => r.estado === "pendiente")
    .map((r) => detallarRecomendacion(r, t))
    .sort((a, b) => b.creadaEn.localeCompare(a.creadaEn));
}

/** Las recomendaciones ya decididas por la minera (aprobadas o rechazadas),
 * detalladas para mostrarlas separadas de la cola de pendientes. Más nueva
 * primero. */
export async function listarRecomendacionesDecididas(): Promise<
  RecomendacionDetallada[]
> {
  const t = await tablas();
  return t.recomendaciones
    .filter((r) => r.estado !== "pendiente")
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
        desempeno: 0,
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
