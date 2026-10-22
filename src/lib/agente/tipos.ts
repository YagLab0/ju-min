// Tipos de la interfaz del agente (vocabulario: GLOSSARY.md).
//
// La interfaz es la costura 2 de la spec: entra una consulta de la minera
// (texto y, opcionalmente, el insumo en alerta que la originó) y salen cero
// o más recomendaciones. Cualquier implementación — la guionada de hoy o el
// LLM de mañana — cumple esta misma forma.

import type { Insumo, Oferta, ProveedorVerificado } from "@/lib/compras";

/** Entrada de la interfaz del agente: el texto de la minera y, si la
 * consulta nació de una alerta de stock, el insumo que la originó. */
export interface ConsultaAgente {
  mensaje: string;
  insumoId?: string;
}

/** Una recomendación elegida por el agente: el insumo, la oferta puntual y
 * el proveedor verificado, con la justificación en lenguaje claro y el
 * puntaje que le dio el ranking. */
export interface PropuestaAgente {
  insumo: Insumo;
  oferta: Oferta;
  proveedor: ProveedorVerificado;
  justificacion: string;
  puntaje: number;
}

/** Salida de la interfaz del agente: la respuesta en lenguaje claro (con el
 * motivo cuando no hay recomendaciones) y las propuestas que la sostienen. */
export interface SalidaAgente {
  respuesta: string;
  propuestas: PropuestaAgente[];
}

/** La interfaz del agente: entra una consulta, salen cero o más
 * recomendaciones. Se ejecuta en el servidor y obtiene datos solo a través
 * del módulo de dominio de compras. */
export interface Agente {
  responder(consulta: ConsultaAgente): Promise<SalidaAgente>;
}
