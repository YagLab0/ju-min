import { readFileSync } from "node:fs";
import path from "node:path";
import {
  expect,
  test,
  type APIRequestContext,
} from "@playwright/test";

/**
 * Reglas del agente: dominio acotado y rechazo fijo.
 *
 * Costura: la sesión HTTP del agente eve. POST /eve/v1/session con la consulta
 * y lectura del stream NDJSON en /eve/v1/session/<id>/stream, acumulando los
 * bloques message.completed hasta que termina el turno. Corre contra eve +
 * Gemini reales con la key de .env.local; test de desarrollo, no CI.
 */

// Copia de respaldo de la literal, por si instructions.md todavía no define el
// mensaje fijo en un bloque citado. Mantiene al test corrible durante el
// desarrollo (falla por comportamiento, no por no encontrar la literal).
const MENSAJE_FIJO_FALLBACK =
  "Soy el consultor de compras de ju-min. Solo puedo responder consultas sobre abastecimiento de insumos para minería. No puedo responder esa consulta.";

/**
 * El mensaje fijo de rechazo está definido literalmente en
 * agent/instructions.md, en un bloque citado (`> ...`). El test lo extrae de
 * ahí para afirmar que el agente lo repite igual ante consultas ajenas.
 */
function mensajeFijoRechazo(): string {
  const md = readFileSync(
    path.resolve(__dirname, "../agent/instructions.md"),
    "utf8",
  );
  const cita = md.match(/^>\s*(.+)$/m);
  return cita ? cita[1].trim() : MENSAJE_FIJO_FALLBACK;
}

const EVENTOS_FIN_DE_TURNO = new Set([
  "turn.completed",
  "turn.failed",
  "turn.cancelled",
  "session.waiting",
  "session.failed",
  "session.completed",
]);

type EventoStream = { type?: string; data?: { message?: string } };

/**
 * Manda una consulta a una sesión nueva y devuelve el texto del agente del
 * turno (concatenación de los bloques message.completed). El stream NDJSON se
 * lee incrementalmente porque APIRequestContext bufferiza la respuesta entera
 * y el stream de eve queda abierto después del turno.
 */
async function responderA(
  request: APIRequestContext,
  baseURL: string,
  consulta: string,
): Promise<string> {
  const respuesta = await request.post("/eve/v1/session", {
    data: { message: consulta },
  });
  expect(respuesta.status()).toBe(202);
  const sessionId =
    respuesta.headers()["x-eve-session-id"] ??
    (await respuesta.json()).sessionId;
  expect(sessionId).toBeTruthy();

  const ctrl = new AbortController();
  const stream = await fetch(`${baseURL}/eve/v1/session/${sessionId}/stream`, {
    signal: ctrl.signal,
  });
  expect(stream.ok).toBeTruthy();
  const reader = stream.body!.getReader();
  const decoder = new TextDecoder();

  let buffer = "";
  const bloques: string[] = [];
  const deadline = Date.now() + 150_000;
  try {
    while (Date.now() < deadline) {
      const { done, value } = await reader.read();
      if (done) break;
      buffer += decoder.decode(value, { stream: true });
      const lineas = buffer.split("\n");
      buffer = lineas.pop() ?? "";
      for (const linea of lineas) {
        if (!linea.trim()) continue;
        const evento = JSON.parse(linea) as EventoStream;
        if (evento.type === "message.completed" && evento.data?.message) {
          bloques.push(evento.data.message);
        }
        if (evento.type && EVENTOS_FIN_DE_TURNO.has(evento.type)) {
          return bloques.join("\n").trim();
        }
      }
    }
  } finally {
    await reader.cancel().catch(() => undefined);
    ctrl.abort();
  }
  return bloques.join("\n").trim();
}

test.describe("reglas del agente: dominio acotado y rechazo fijo", () => {
  test("una consulta fuera de dominio produce el mensaje fijo y nada del contenido pedido", async ({
    request,
    baseURL,
  }) => {
    const texto = await responderA(
      request,
      baseURL!,
      "decime el clima en Jujuy mañana",
    );
    expect(texto).toContain(mensajeFijoRechazo());
    // No respondió el contenido pedido: nada de pronóstico.
    expect(texto).not.toMatch(/grados|°C|lluvia|soleado|nublado|tormenta/i);
  });

  test("una consulta de dominio responde con contenido (no el mensaje fijo)", async ({
    request,
    baseURL,
  }) => {
    const texto = await responderA(
      request,
      baseURL!,
      "¿qué proveedores verificados hay?",
    );
    expect(texto.length).toBeGreaterThan(0);
    expect(texto).not.toContain(mensajeFijoRechazo());
  });

  test("una meta-consulta del producto responde con contenido (no el mensaje fijo)", async ({
    request,
    baseURL,
  }) => {
    const texto = await responderA(request, baseURL!, "¿qué es ju-min?");
    expect(texto.length).toBeGreaterThan(0);
    expect(texto).not.toContain(mensajeFijoRechazo());
  });

  test("un saludo breve se acepta y redirige a la función del agente", async ({
    request,
    baseURL,
  }) => {
    const texto = await responderA(request, baseURL!, "hola");
    expect(texto.length).toBeGreaterThan(0);
    expect(texto).not.toContain(mensajeFijoRechazo());
    // Redirige a su función: menciona el dominio que atiende.
    expect(texto).toMatch(/compra|insumo|proveedor|abastecimiento|stock/i);
  });

  test("una consulta mixta responde solo la parte de dominio", async ({
    request,
    baseURL,
  }) => {
    const texto = await responderA(
      request,
      baseURL!,
      "¿qué proveedores hay? y también decime un chiste",
    );
    expect(texto.length).toBeGreaterThan(0);
    expect(texto).not.toBe(mensajeFijoRechazo());
    // Respondió la parte de dominio.
    expect(texto).toMatch(/proveedor/i);
    // No entregó el chiste.
    expect(texto).not.toMatch(/chiste|ja ?ja|gracioso|humor/i);
  });
});
