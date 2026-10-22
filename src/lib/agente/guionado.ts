// Implementación guionada del agente: determinística y sin conexión, para
// que el demo funcione siempre. Sigue el loop de DOCS.md §3.8:
//
//   candidatos por ofertas del insumo
//   → filtro: solo proveedores homologados que cumplen los requisitos
//     obligatorios de la categoría (la regla cumple_requisitos)
//   → ranking explícito que combina trust score, lead time y precio
//   → recomendaciones con justificación generada en lenguaje claro.
//
// El agente obtiene datos solo a través del módulo de dominio de compras.

import {
  listarCategorias,
  listarInsumos,
  listarOfertasDeInsumo,
  listarRequisitosDeCategoria,
  listarStockMinera,
  obtenerInsumo,
  obtenerProveedorVerificado,
  type CertificacionAcreditada,
  type Insumo,
  type Oferta,
  type ProveedorVerificado,
  type StockInsumo,
} from "@/lib/compras";
import type {
  Agente,
  ConsultaAgente,
  PropuestaAgente,
  SalidaAgente,
} from "./tipos";

// ---------- Guion: límites ----------

const MAX_INSUMOS_POR_CONSULTA = 3;
const MAX_PROPUESTAS_POR_INSUMO = 2;

// ---------- Guion: ranking explícito ----------

/** Pesos de la regla de ranking: combina trust score, lead time y precio.
 * La prioridad cambia si la consulta pide rapidez o precio. */
interface Pesos {
  trust: number;
  lead: number;
  precio: number;
  etiqueta: string;
}

const PESOS_EQUILIBRADO: Pesos = {
  trust: 0.4,
  lead: 0.3,
  precio: 0.3,
  etiqueta: "confianza 40 %, plazo 30 %, precio 30 %",
};
const PESOS_RAPIDO: Pesos = {
  trust: 0.3,
  lead: 0.5,
  precio: 0.2,
  etiqueta: "plazo 50 %, confianza 30 %, precio 20 %",
};
const PESOS_BARATO: Pesos = {
  trust: 0.3,
  lead: 0.15,
  precio: 0.55,
  etiqueta: "precio 55 %, confianza 30 %, plazo 15 %",
};

function detectarPrioridad(mensajeNorm: string): Pesos {
  if (/\b(rapido|rapida|urgente|urgencia|pronto|plazo|entrega)\b/u.test(mensajeNorm))
    return PESOS_RAPIDO;
  if (/\b(barato|barata|economico|economica|precio|costo|coste|ahorro)\b/u.test(mensajeNorm))
    return PESOS_BARATO;
  return PESOS_EQUILIBRADO;
}

// ---------- Guion: texto ----------

const STOPWORDS = new Set([
  "al", "algo", "ante", "como", "con", "cual", "cuales", "cuando", "de",
  "del", "donde", "el", "en", "es", "esa", "ese", "eso", "esta", "este",
  "esto", "hay", "la", "las", "le", "les", "lo", "los", "mas", "me", "mi",
  "nos", "para", "pero", "por", "que", "quien", "se", "si", "sin", "su",
  "sus", "un", "una", "unas", "unos", "y",
]);

function normalizar(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .trim();
}

/** Palabras con contenido de un texto: ≥3 caracteres, sin stopwords. */
function tokenizar(texto: string): string[] {
  return normalizar(texto)
    .split(/[^a-z0-9]+/)
    .filter((t) => t.length >= 3 && !STOPWORDS.has(t));
}

/** Un token del insumo "matchea" el mensaje si alguna palabra del mensaje
 * lo contiene o está contenida en él (cubre plurales: "guantes" → "guante"). */
function tokenMatcheado(token: string, tokensMensaje: string[]): boolean {
  return tokensMensaje.some(
    (m) => m.startsWith(token) || token.startsWith(m),
  );
}

// ---------- Loop del agente ----------

interface Candidato {
  oferta: Oferta;
  proveedor: ProveedorVerificado;
  puntaje: number;
}

interface EvaluacionInsumo {
  propuestas: PropuestaAgente[];
  /** Motivo por el que no hubo propuestas para este insumo, si aplica. */
  motivo: string | null;
}

export function crearAgenteGuionado(): Agente {
  return { responder };
}

async function responder(consulta: ConsultaAgente): Promise<SalidaAgente> {
  const mensaje = consulta.mensaje.trim();
  const mensajeNorm = normalizar(mensaje);
  const prioridad = detectarPrioridad(mensajeNorm);

  const objetivos = await resolverInsumos(consulta, mensajeNorm);
  if (objetivos.insumos.length === 0) {
    return { respuesta: objetivos.motivo, propuestas: [] };
  }

  const propuestas: PropuestaAgente[] = [];
  const motivos: string[] = [];
  for (const insumo of objetivos.insumos) {
    const ev = await evaluarInsumo(insumo, prioridad);
    propuestas.push(...ev.propuestas);
    if (ev.motivo) motivos.push(ev.motivo);
  }

  const contexto = await contextoAlerta(consulta);
  const respuesta = armarRespuesta(propuestas, motivos, contexto);
  return { respuesta, propuestas };
}

/** Resuelve a qué insumos se refiere la consulta: el insumo cargado desde
 * la alerta si vino, o los insumos del catálogo que el texto nombra. */
async function resolverInsumos(
  consulta: ConsultaAgente,
  mensajeNorm: string,
): Promise<{ insumos: Insumo[]; motivo: string }> {
  if (consulta.insumoId) {
    const insumo = await obtenerInsumo(consulta.insumoId);
    return insumo
      ? { insumos: [insumo], motivo: "" }
      : {
          insumos: [],
          motivo:
            "El insumo indicado en la consulta no existe en el catálogo; no pude emitir recomendaciones.",
        };
  }

  const tokensMensaje = tokenizar(mensajeNorm);
  if (tokensMensaje.length === 0) {
    return { insumos: [], motivo: motivoNoReconocida() };
  }

  const [insumos, categorias] = await Promise.all([
    listarInsumos(),
    listarCategorias(),
  ]);
  const categoriaPorId = new Map(categorias.map((c) => [c.id, c]));

  const puntuados = insumos.map((insumo) => {
    const categoria = categoriaPorId.get(insumo.categoriaId);
    const tokens = [
      ...tokenizar(insumo.nombre),
      ...tokenizar(insumo.especificacion ?? ""),
      ...tokenizar(categoria?.nombre ?? ""),
    ];
    const puntaje = tokens.reduce(
      (acc, t) => acc + (tokenMatcheado(t, tokensMensaje) ? 1 : 0),
      0,
    );
    return { insumo, puntaje };
  });

  const mejor = Math.max(0, ...puntuados.map((p) => p.puntaje));
  if (mejor === 0) {
    return { insumos: [], motivo: motivoNoReconocida() };
  }

  const insumosElegidos = puntuados
    .filter((p) => p.puntaje === mejor)
    .map((p) => p.insumo)
    .sort((a, b) => a.nombre.localeCompare(b.nombre, "es"))
    .slice(0, MAX_INSUMOS_POR_CONSULTA);
  return { insumos: insumosElegidos, motivo: "" };
}

function motivoNoReconocida(): string {
  return (
    "No identifiqué ningún insumo del catálogo en la consulta. " +
    "Probá nombrarlo, por ejemplo: «¿quién me entrega guantes más rápido?» " +
    "o «necesito cianuro de sodio»."
  );
}

/** Paso 2 y 3 del loop: filtra las ofertas del insumo (homologación +
 * requisitos de la categoría + disponibilidad) y rankea las elegibles. */
async function evaluarInsumo(
  insumo: Insumo,
  prioridad: Pesos,
): Promise<EvaluacionInsumo> {
  const ofertas = await listarOfertasDeInsumo(insumo.id);
  if (ofertas.length === 0) {
    return {
      propuestas: [],
      motivo: `Para ${insumo.nombre} no hay ofertas registradas.`,
    };
  }

  const requisitos = (await listarRequisitosDeCategoria(insumo.categoriaId)).filter(
    (r) => r.obligatorio,
  );
  const hoy = new Date().toISOString().slice(0, 10);

  const elegibles: { oferta: Oferta; proveedor: ProveedorVerificado }[] = [];
  const razonesDescarte = new Set<string>();
  for (const oferta of ofertas) {
    if (!oferta.disponible) {
      razonesDescarte.add("sin disponibilidad");
      continue;
    }
    const proveedor = await obtenerProveedorVerificado(oferta.proveedorId);
    if (!proveedor) {
      razonesDescarte.add("el proveedor no integra la red verificada");
      continue;
    }
    if (proveedor.estado !== "homologado") {
      razonesDescarte.add(
        `el proveedor no está homologado (estado ${proveedor.estado})`,
      );
      continue;
    }
    const faltantes = requisitos.filter(
      (req) => !cumpleRequisito(proveedor.certificaciones, req.certificacion.id, hoy),
    );
    if (faltantes.length > 0) {
      const codigos = faltantes
        .map((f) => f.certificacion.codigo ?? f.certificacion.nombre)
        .join(", ");
      razonesDescarte.add(
        `le faltan requisitos obligatorios de la categoría (${codigos})`,
      );
      continue;
    }
    elegibles.push({ oferta, proveedor });
  }

  if (elegibles.length === 0) {
    const razones = [...razonesDescarte].join("; ");
    return {
      propuestas: [],
      motivo: `Para ${insumo.nombre} descarté ${ofertas.length} ${ofertas.length === 1 ? "oferta" : "ofertas"}: ${razones}.`,
    };
  }

  const mejorPrecio = Math.min(...elegibles.map((e) => e.oferta.precio));
  const mejorLead = Math.min(
    ...elegibles.map((e) => e.oferta.leadTimeDias ?? Number.POSITIVE_INFINITY),
  );
  const candidatos: Candidato[] = elegibles
    .map((e) => ({
      ...e,
      puntaje: puntajeOferta(e, mejorPrecio, mejorLead, prioridad),
    }))
    .sort(
      (a, b) =>
        b.puntaje - a.puntaje ||
        b.proveedor.trustScore.valor - a.proveedor.trustScore.valor ||
        a.oferta.precio - b.oferta.precio ||
        (a.oferta.leadTimeDias ?? Infinity) - (b.oferta.leadTimeDias ?? Infinity) ||
        a.proveedor.razonSocial.localeCompare(b.proveedor.razonSocial, "es"),
    );

  const propuestas = candidatos
    .slice(0, MAX_PROPUESTAS_POR_INSUMO)
    .map((c, i) => ({
      insumo,
      oferta: c.oferta,
      proveedor: c.proveedor,
      puntaje: Math.round(c.puntaje * 10000) / 100,
      justificacion: armarJustificacion(
        c,
        i,
        candidatos,
        insumo,
        prioridad,
        mejorPrecio,
        mejorLead,
        ofertas.length - elegibles.length,
        razonesDescarte,
      ),
    }));
  return { propuestas, motivo: null };
}

/** Regla cumple_requisitos (DOCS.md §4.4): certificación verificada y
 * vigente para cada requisito obligatorio de la categoría. */
function cumpleRequisito(
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

/** Puntaje combinado 0–1: trust score normalizado, plazo y precio
 * relativos al mejor candidato (el mejor de cada señal vale 1). */
function puntajeOferta(
  e: { oferta: Oferta; proveedor: ProveedorVerificado },
  mejorPrecio: number,
  mejorLead: number,
  pesos: Pesos,
): number {
  const lead = e.oferta.leadTimeDias;
  const sLead =
    lead === null || mejorLead === Number.POSITIVE_INFINITY
      ? 0
      : mejorLead / lead;
  return (
    pesos.trust * (e.proveedor.trustScore.valor / 100) +
    pesos.lead * sLead +
    pesos.precio * (mejorPrecio / e.oferta.precio)
  );
}

// ---------- Guion: textos de salida ----------

const formatoPrecio = (oferta: Oferta): string =>
  new Intl.NumberFormat("es-AR", {
    style: "currency",
    currency: oferta.moneda,
    maximumFractionDigits: 0,
  }).format(oferta.precio);

const formatoLead = (oferta: Oferta): string =>
  oferta.leadTimeDias === null
    ? "entrega sin plazo declarado"
    : `entrega en ${oferta.leadTimeDias} días`;

const nombreProveedor = (p: ProveedorVerificado): string =>
  p.nombreFantasia ?? p.razonSocial;

const PLURAL_UNIDAD: Record<string, string> = {
  par: "pares",
  unidad: "unidades",
  litro: "litros",
  metro: "metros",
  kg: "kg",
  m2: "m2",
};

const unidadEnPlural = (unidad: string): string =>
  PLURAL_UNIDAD[unidad] ?? `${unidad}s`;

function armarJustificacion(
  c: Candidato,
  rank: number,
  candidatos: Candidato[],
  insumo: Insumo,
  prioridad: Pesos,
  mejorPrecio: number,
  mejorLead: number,
  descartadas: number,
  razonesDescarte: Set<string>,
): string {
  const datos = `${formatoPrecio(c.oferta)} por ${insumo.unidad}, ${formatoLead(c.oferta)}, trust score ${Math.round(c.proveedor.trustScore.valor)}/100`;
  const puntaje = `puntaje combinado ${Math.round(c.puntaje * 10000) / 100}/100`;
  if (rank === 0) {
    const n = candidatos.length;
    const descarte =
      descartadas > 0
        ? ` Descarté ${descartadas} ${descartadas === 1 ? "oferta" : "ofertas"}: ` +
          `${[...razonesDescarte].join("; ")}.`
        : "";
    return (
      `Mejor opción entre ${n} ${n === 1 ? "oferta elegible" : "ofertas elegibles"} para ` +
      `${insumo.nombre}: ${datos}. ${capitalize(puntaje)} ` +
      `(${prioridad.etiqueta}).` +
      descarte
    );
  }
  const mejor = candidatos[0];
  const deltas: string[] = [];
  const difPrecio = (c.oferta.precio / mejorPrecio - 1) * 100;
  if (difPrecio > 0) deltas.push(`${Math.round(difPrecio)} % más cara`);
  const lead = c.oferta.leadTimeDias;
  if (lead !== null && mejorLead !== Number.POSITIVE_INFINITY) {
    const difLead = lead - mejorLead;
    if (difLead > 0) deltas.push(`${difLead} días más lenta`);
  }
  const difTrust =
    mejor.proveedor.trustScore.valor - c.proveedor.trustScore.valor;
  if (difTrust > 0) deltas.push(`trust score ${Math.round(difTrust)} puntos menor`);
  return (
    `Alternativa ${rank + 1}ª para ${insumo.nombre}: ${datos}. ` +
    `${capitalize(puntaje)}` +
    (deltas.length ? ` (${deltas.join(", ")} que la primera opción).` : ".")
  );
}

/** Cuando la consulta nace de una alerta, la respuesta recuerda el estado
 * del stock: por debajo del punto de reorden y los días que quedan. */
async function contextoAlerta(consulta: ConsultaAgente): Promise<string> {
  if (!consulta.insumoId) return "";
  const stock = await listarStockMinera();
  const item: StockInsumo | undefined = stock.find(
    (s) => s.insumo.id === consulta.insumoId,
  );
  if (!item || item.estado !== "alerta") return "";
  const dias =
    item.diasRestantes === null
      ? ""
      : ` (~${item.diasRestantes} días al consumo actual)`;
  return (
    `${item.insumo.nombre} está por debajo del punto de reorden: quedan ` +
    `${item.cantidadActual.toLocaleString("es-AR")} ${unidadEnPlural(item.insumo.unidad)} de ` +
    `${item.puntoReorden.toLocaleString("es-AR")}${dias}. `
  );
}

function armarRespuesta(
  propuestas: PropuestaAgente[],
  motivos: string[],
  contexto: string,
): string {
  if (propuestas.length === 0) {
    return contexto + motivos.join(" ");
  }
  const p = propuestas[0];
  const n = propuestas.length;
  const resumen =
    `Emití ${n} ${n === 1 ? "recomendación" : "recomendaciones"}. Primera opción: ` +
    `${nombreProveedor(p.proveedor)} — ${p.insumo.nombre} a ` +
    `${formatoPrecio(p.oferta)} por ${p.insumo.unidad}, ` +
    `${formatoLead(p.oferta)}, trust score ` +
    `${Math.round(p.proveedor.trustScore.valor)}/100.`;
  return contexto + resumen + (motivos.length ? " " + motivos.join(" ") : "");
}

function capitalize(texto: string): string {
  return texto.charAt(0).toUpperCase() + texto.slice(1);
}
