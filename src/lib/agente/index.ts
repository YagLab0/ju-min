// Agente de ju-min: la interfaz única consulta → cero o más recomendaciones.
// Se ejecuta en el servidor; la interfaz de usuario lo invoca sin conocer
// la implementación. Hoy la implementación es la guionada (determinística,
// funciona sin conexión); el LLM real se enchufa detrás de esta misma
// interfaz y la usa como respaldo si falla.

import "server-only";

import { registrarConsulta, type Consulta } from "@/lib/compras";

import { crearAgenteGuionado } from "./guionado";
import type { Agente, ConsultaAgente } from "./tipos";

export type {
  Agente,
  ConsultaAgente,
  PropuestaAgente,
  SalidaAgente,
} from "./tipos";
export { crearAgenteGuionado } from "./guionado";

/** Punto de enchufe de la implementación del agente. Cuando esté el LLM,
 * esta fábrica lo devuelve envuelto con la guionada como respaldo, sin
 * tocar la interfaz ni las páginas. */
export function obtenerAgente(): Agente {
  return crearAgenteGuionado();
}

/** Ejecuta una consulta de la minera contra la interfaz del agente y
 * registra la consulta con sus recomendaciones (nacen pendientes) en la
 * fuente de datos: en memoria del servidor durante la sesión del demo. */
export async function consultarAlAgente(
  entrada: ConsultaAgente,
): Promise<Consulta> {
  const mensaje = entrada.mensaje.trim();
  if (!mensaje && !entrada.insumoId) throw new Error("consulta_sin_mensaje");

  const salida = await obtenerAgente().responder({
    mensaje,
    insumoId: entrada.insumoId,
  });
  return registrarConsulta({
    mensaje: mensaje || "Reposición de insumo en alerta",
    respuesta: salida.respuesta,
    recomendaciones: salida.propuestas.map((p) => ({
      ofertaId: p.oferta.id,
      justificacion: p.justificacion,
      puntaje: p.puntaje,
    })),
  });
}
