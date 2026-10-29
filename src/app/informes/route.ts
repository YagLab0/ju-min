// POST /informes: genera (o reutiliza) el informe de una recomendación y
// devuelve el PDF para descargar. Lo llama el formulario del panel.

import { leerSesion } from "@/lib/auth";
import { generarInforme } from "@/lib/compras";
import { respuestaInformePdf } from "@/lib/informes/respuesta";

export async function POST(request: Request) {
  const sesion = await leerSesion();
  if (!sesion) return new Response("Sin sesión", { status: 401 });

  const datos = await request.formData();
  const recomendacionId = String(datos.get("recomendacion_id") ?? "").trim();
  if (!recomendacionId) {
    return new Response("Falta la recomendación", { status: 400 });
  }

  try {
    const informe = await generarInforme(recomendacionId, {
      id: sesion.sub,
      nombre: sesion.nombre,
      email: sesion.email,
    });
    return respuestaInformePdf(informe, request);
  } catch {
    return new Response("Recomendación inexistente", { status: 404 });
  }
}
