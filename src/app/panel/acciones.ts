"use server";

import { refresh } from "next/cache";

import { consultarAlAgente } from "@/lib/agente";

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
