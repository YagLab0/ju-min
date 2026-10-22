"use server";

import { refresh } from "next/cache";

import { consultarAlAgente } from "@/lib/agente";
import { decidirRecomendacion } from "@/lib/compras";

/** La interfaz de usuario invoca al agente en el servidor y no conoce su
 * implementación (hoy la guionada; después el LLM detrás de la misma
 * interfaz). Recibe el texto de la consulta y, si nació de una alerta, el
 * insumo en alerta ya cargado. */
export async function consultarAlAgenteDesdePanel(
  formData: FormData,
): Promise<void> {
  const mensaje = String(formData.get("mensaje") ?? "").trim();
  const insumoId = String(formData.get("insumo_id") ?? "").trim();
  if (!mensaje) return;

  await consultarAlAgente({
    mensaje,
    ...(insumoId ? { insumoId } : {}),
  });
  refresh();
}

/** Registra la decisión de la minera sobre una recomendación pendiente
 * (aprobar o rechazar). El dominio impide decidir dos veces: si el envío se
 * duplica o la recomendación ya fue decidida, no pasa nada y la interfaz se
 * refresca con el estado real. */
export async function decidirRecomendacionDesdePanel(
  formData: FormData,
): Promise<void> {
  const recomendacionId = String(
    formData.get("recomendacion_id") ?? "",
  ).trim();
  const decision = String(formData.get("decision") ?? "").trim();
  if (!recomendacionId) return;
  if (decision !== "aprobada" && decision !== "rechazada") return;

  try {
    await decidirRecomendacion(recomendacionId, decision);
  } catch {
    // recomendacion_ya_decidida o recomendacion_inexistente: nada que hacer.
  }
  refresh();
}
