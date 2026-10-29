// GET /informes/[codigo]: vuelve a descargar un informe ya generado. Solo
// para la minera dueña del informe.

import { leerSesion } from "@/lib/auth";
import { obtenerMinera, verificarInforme } from "@/lib/compras";
import { respuestaInformePdf } from "@/lib/informes/respuesta";

export async function GET(
  request: Request,
  { params }: { params: Promise<{ codigo: string }> },
) {
  const sesion = await leerSesion();
  if (!sesion) return new Response("Sin sesión", { status: 401 });

  const { codigo } = await params;
  const [resultado, minera] = await Promise.all([
    verificarInforme(codigo),
    obtenerMinera(),
  ]);
  if (!resultado || resultado.informe.mineraId !== minera.id) {
    return new Response("Informe inexistente", { status: 404 });
  }
  return respuestaInformePdf(resultado.informe, request);
}
