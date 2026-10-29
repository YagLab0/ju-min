// Contrato de la fuente de datos del módulo de compras.
//
// Las páginas nunca hablan con la fuente: solo con el módulo (index.ts).
// La fuente se implementa detrás de un adaptador intercambiable — hoy el
// seed en memoria; cuando esté el scraper o Supabase local, otro adaptador
// cumple la misma interfaz sin tocar páginas ni tests.
//
// Los tipos `Fila*` tienen la misma forma que las tablas de
// `supabase/migrations/` (snake_case, columnas de DOCS.md §4.3).

import type {
  AmbitoCertificacion,
  ContenidoInforme,
  CondicionIva,
  EstadoProveedor,
  EstadoRecomendacion,
  EstadoVerificacion,
  FuenteVerificacion,
  TipoCertificacion,
} from "./tipos";

export interface FilaCategoria {
  id: string;
  nombre: string;
  slug: string;
  categoria_padre_id: string | null;
  origen: string | null;
  created_at: string;
}

export interface FilaCertificacion {
  id: string;
  nombre: string;
  codigo: string | null;
  tipo: TipoCertificacion;
  ambito: AmbitoCertificacion;
  organismo_tipico: string | null;
  descripcion: string | null;
  created_at: string;
}

export interface FilaRequisitoCategoria {
  id: string;
  categoria_id: string;
  certificacion_id: string;
  obligatorio: boolean;
}

export interface FilaProveedor {
  id: string;
  razon_social: string;
  nombre_fantasia: string | null;
  cuit: string | null;
  condicion_iva: CondicionIva;
  fecha_constitucion: string | null;
  domicilio: string | null;
  localidad: string | null;
  provincia: string | null;
  pais: string;
  lat: number | null;
  lng: number | null;
  sitio_web: string | null;
  email: string | null;
  telefono: string | null;
  provincias_operacion: string[] | null;
  estado: EstadoProveedor;
  registro_jujuy_estado: "aprobado" | "pendiente" | null;
  fuente: FuenteVerificacion;
  fuente_url: string | null;
  trust_score: number | null;
  trust_score_detalle: TrustScoreDetalleFila | null;
  created_at: string;
  updated_at: string;
}

/** Desglose del trust score por grupo de señales (DOCS.md §3.2). */
export interface TrustScoreDetalleFila {
  identidad: number;
  compliance: number;
  esg: number;
  capacidad: number;
}

export interface FilaContactoProveedor {
  id: string;
  proveedor_id: string;
  nombre: string;
  rol: string | null;
  email: string | null;
  telefono: string | null;
}

export interface FilaProveedorCategoria {
  proveedor_id: string;
  categoria_id: string;
}

export interface FilaDocumento {
  id: string;
  proveedor_id: string;
  tipo: string;
  storage_path: string;
  nombre_archivo: string | null;
  created_at: string;
}

export interface FilaProveedorCertificacion {
  id: string;
  proveedor_id: string;
  certificacion_id: string;
  numero_certificado: string | null;
  organismo: string | null;
  fecha_emision: string | null;
  fecha_vencimiento: string | null;
  alcance: string | null;
  estado: EstadoVerificacion;
  documento_id: string | null;
  created_at: string;
}

export interface FilaAuditoria {
  id: string;
  proveedor_id: string;
  fecha: string;
  tipo: string | null;
  auditor: string | null;
  puntaje: number | null;
  informe_documento_id: string | null;
  resultado: string | null;
  created_at: string;
}

export interface FilaInsumo {
  id: string;
  categoria_id: string;
  nombre: string;
  unidad: string;
  especificacion: string | null;
  created_at: string;
}

export interface FilaOferta {
  id: string;
  proveedor_id: string;
  insumo_id: string;
  precio: number;
  moneda: string;
  lead_time_dias: number | null;
  disponible: boolean;
  vigente_desde: string | null;
  vigente_hasta: string | null;
  created_at: string;
}

export interface FilaMinera {
  id: string;
  nombre: string;
  ubicacion: string | null;
  created_at: string;
}

export interface FilaStockMinera {
  id: string;
  minera_id: string;
  insumo_id: string;
  cantidad_actual: number;
  punto_reorden: number;
  consumo_mensual: number | null;
  updated_at: string;
}

export interface FilaConsulta {
  id: string;
  minera_id: string | null;
  mensaje: string;
  respuesta: string | null;
  created_at: string;
}

export interface FilaRecomendacion {
  id: string;
  consulta_id: string;
  proveedor_id: string | null;
  insumo_id: string | null;
  justificacion: string | null;
  puntaje: number | null;
  estado: EstadoRecomendacion;
  created_at: string;
}

export interface FilaEntrega {
  id: string;
  proveedor_id: string;
  insumo_id: string | null;
  fecha_compromiso: string | null;
  fecha_entrega: string | null;
  conforme: boolean | null;
  created_at: string;
}

export interface FilaTrustScoreHistorial {
  id: string;
  proveedor_id: string;
  puntaje: number;
  detalle: TrustScoreDetalleFila | null;
  created_at: string;
}

export interface FilaInforme {
  id: string;
  codigo: string;
  minera_id: string;
  recomendacion_id: string | null;
  generado_por_id: string;
  generado_por_nombre: string;
  generado_por_email: string;
  contenido: ContenidoInforme;
  sello: string;
  created_at: string;
}

/** Todas las tablas del dominio, tal como las lee un adaptador. */
export interface TablasCompras {
  categorias: FilaCategoria[];
  certificaciones: FilaCertificacion[];
  requisitosCategoria: FilaRequisitoCategoria[];
  proveedores: FilaProveedor[];
  contactosProveedor: FilaContactoProveedor[];
  proveedorCategorias: FilaProveedorCategoria[];
  documentos: FilaDocumento[];
  proveedorCertificaciones: FilaProveedorCertificacion[];
  auditorias: FilaAuditoria[];
  insumos: FilaInsumo[];
  ofertas: FilaOferta[];
  minera: FilaMinera;
  stockMinera: FilaStockMinera[];
  consultas: FilaConsulta[];
  recomendaciones: FilaRecomendacion[];
  entregas: FilaEntrega[];
  trustScoreHistorial: FilaTrustScoreHistorial[];
  informes: FilaInforme[];
}

export interface NuevaRecomendacion {
  ofertaId: string;
  justificacion: string;
  puntaje: number | null;
}

export interface NuevaConsulta {
  mineraId: string;
  mensaje: string;
  respuesta: string | null;
}

/** Adaptador intercambiable de la fuente de datos. El seed en memoria y el
 * cliente Supabase implementan esta misma interfaz. */
export interface FuenteDatosCompras {
  /** Lee todas las tablas del dominio. */
  leerTablas(): Promise<TablasCompras>;
  /** Registra una consulta de la minera; devuelve la fila creada. */
  insertarConsulta(consulta: NuevaConsulta): Promise<FilaConsulta>;
  /** Registra las recomendaciones emitidas para una consulta. */
  insertarRecomendaciones(
    consultaId: string,
    recomendaciones: {
      proveedorId: string | null;
      insumoId: string | null;
      justificacion: string;
      puntaje: number | null;
    }[],
  ): Promise<FilaRecomendacion[]>;
  /** Registra un informe generado. */
  insertarInforme(informe: Omit<FilaInforme, "id">): Promise<FilaInforme>;
}
