// Tipos del dominio de compras de ju-min.
// Vocabulario: GLOSSARY.md. Estados y pesos de señales: docs/DOCS.md.

/** Pipeline de verificación del proveedor (DOCS.md §3.1):
 * registrado → documentado → validado → auditado → homologado. */
export type EstadoProveedor =
  | "registrado"
  | "documentado"
  | "validado"
  | "auditado"
  | "homologado"
  | "suspendido";

/** Estados que integran la red verificada visible para la minera
 * (DOCS.md §7 decisión 4: lectura pública solo de validado y homologado). */
export const ESTADOS_RED_VERIFICADA = ["validado", "homologado"] as const;

export type EstadoVerificacion =
  | "declarado"
  | "en_revision"
  | "verificado"
  | "rechazado"
  | "vencido";

export type AmbitoCertificacion = "empresa" | "producto" | "proceso" | "persona";

export type TipoCertificacion =
  | "sistema_gestion"
  | "producto"
  | "habilitacion_regulatoria"
  | "esg"
  | "registro";

export type CondicionIva =
  | "responsable_inscripto"
  | "monotributo"
  | "exento"
  | "no_responsable"
  | "desconocido";

/** Decisión de la minera sobre una recomendación del agente. */
export type EstadoRecomendacion = "pendiente" | "aprobada" | "rechazada";
export type DecisionRecomendacion = "aprobada" | "rechazada";
export type EstadoConsulta = "pendiente" | "aprobada" | "rechazada";

/** Fuente de verificación de la que salió el registro del proveedor. */
export type FuenteVerificacion =
  | "capmin"
  | "caem"
  | "registro_jujuy"
  | "manual";

/** La empresa minera suscripta que usa ju-min. */
export interface Minera {
  id: string;
  nombre: string;
  ubicacion: string | null;
}

/** Categoría de insumos que ofrece un proveedor (subset del listado CAPMIN). */
export interface Categoria {
  id: string;
  nombre: string;
  slug: string;
  categoriaPadreId: string | null;
}

/** Norma o habilitación del catálogo (empresa o producto). */
export interface Certificacion {
  id: string;
  nombre: string;
  codigo: string | null;
  tipo: TipoCertificacion;
  ambito: AmbitoCertificacion;
  organismoTipico: string | null;
}

/** Trust score: puntaje 0–100 con desglose por grupo de señales.
 * Pesos de DOCS.md §3.2: identidad 20, compliance 30, desempeño 30, ESG 10,
 * capacidad 10. Los valores del desglose suman el valor total. */
export interface TrustScore {
  valor: number;
  desglose: {
    identidad: number;
    compliance: number;
    desempeno: number;
    esg: number;
    capacidad: number;
  };
}

/** Certificación acreditada por un proveedor, con evidencia y vigencia. */
export interface CertificacionAcreditada {
  certificacion: Certificacion;
  numeroCertificado: string | null;
  organismo: string | null;
  fechaEmision: string | null;
  fechaVencimiento: string | null;
  estado: EstadoVerificacion;
}

/** Empresa que vende insumos a la minería y figura en una fuente de
 * verificación. En el listado solo aparecen los de la red verificada. */
export interface ProveedorVerificado {
  id: string;
  razonSocial: string;
  nombreFantasia: string | null;
  cuit: string | null;
  condicionIva: CondicionIva;
  fechaConstitucion: string | null;
  domicilio: string | null;
  localidad: string | null;
  provincia: string | null;
  pais: string;
  lat: number | null;
  lng: number | null;
  sitioWeb: string | null;
  email: string | null;
  telefono: string | null;
  provinciasOperacion: string[];
  estado: EstadoProveedor;
  registroJujuyEstado: "aprobado" | "pendiente" | null;
  fuente: FuenteVerificacion;
  fuenteUrl: string | null;
  trustScore: TrustScore;
  categorias: Categoria[];
  certificaciones: CertificacionAcreditada[];
}

/** Oferta con el insumo resuelto: lo que muestra la ficha del proveedor
 * (precio, unidad, lead time, disponibilidad). */
export interface OfertaConInsumo extends Oferta {
  insumo: Insumo;
}

/** Ficha de un proveedor verificado: el proveedor más sus ofertas. */
export interface ProveedorVerificadoDetalle extends ProveedorVerificado {
  ofertas: OfertaConInsumo[];
}

/** Producto genérico que consume la operación minera. */
export interface Insumo {
  id: string;
  categoriaId: string;
  nombre: string;
  unidad: string;
  especificacion: string | null;
}

/** Un insumo vendido por un proveedor verificado puntual. */
export interface Oferta {
  id: string;
  proveedorId: string;
  insumoId: string;
  precio: number;
  moneda: string;
  leadTimeDias: number | null;
  disponible: boolean;
}

export type EstadoStock = "normal" | "alerta";

/** Stock de un insumo en la minera, con su punto de reorden y consumo.
 * En alerta cuando la cantidad actual está por debajo del punto de reorden. */
export interface StockInsumo {
  insumo: Insumo;
  cantidadActual: number;
  puntoReorden: number;
  consumoMensual: number | null;
  estado: EstadoStock;
  diasRestantes: number | null;
}

/** Propuesta del agente de comprar un insumo a través de una oferta. */
export interface Recomendacion {
  id: string;
  consultaId: string;
  ofertaId: string;
  proveedorId: string;
  insumoId: string;
  justificacion: string;
  puntaje: number | null;
  estado: EstadoRecomendacion;
  creadaEn: string;
}

/** Pregunta o pedido de la minera al agente, con sus recomendaciones. */
export interface Consulta {
  id: string;
  mensaje: string;
  respuesta: string | null;
  estado: EstadoConsulta;
  recomendaciones: Recomendacion[];
  creadaEn: string;
}
