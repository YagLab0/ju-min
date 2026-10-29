// Respuesta HTTP con el PDF del informe, compartida por la ruta que lo
// genera y la que lo vuelve a descargar.

import "server-only";

import type { Informe } from "@/lib/compras";

import { renderizarInformePdf } from "./pdf";

export async function respuestaInformePdf(
  informe: Informe,
  request: Request,
): Promise<Response> {
  const urlVerificacion = new URL("/verificar", request.url).toString();
  const pdf = await renderizarInformePdf(informe, urlVerificacion);
  return new Response(new Blob([pdf as BlobPart], { type: "application/pdf" }), {
    headers: {
      "Content-Type": "application/pdf",
      "Content-Disposition": `attachment; filename="informe-${informe.codigo}.pdf"`,
      "Cache-Control": "no-store",
    },
  });
}
