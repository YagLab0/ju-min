// Sello de la cookie de sesión: payload JSON en base64url firmado con
// HMAC-SHA256. Usa Web Crypto (crypto.subtle) y atob/btoa para correr igual
// en el proxy de Next, en las server actions y en los tests de Vitest.
//
// El secreto sale de JUMIN_AUTH_SECRET; en el demo local la cookie se firma
// con un valor fijo porque el seed ya es público. En producción se configura
// la variable y no hay nada que commitear.

import type { RolUsuario } from "./usuarios";

export const NOMBRE_COOKIE_SESION = "ju-min.sesion";

export interface SesionFirmada {
  sub: string;
  nombre: string;
  email: string;
  rol: RolUsuario;
  exp: number;
}

const SECRETO =
  process.env.JUMIN_AUTH_SECRET ?? "ju-min-demo:sello-de-sesion-local";

const codificador = new TextEncoder();
const decodificador = new TextDecoder();

function aBase64Url(bytes: ArrayBuffer | Uint8Array): string {
  const arr = bytes instanceof Uint8Array ? bytes : new Uint8Array(bytes);
  let binario = "";
  for (const b of arr) binario += String.fromCharCode(b);
  return btoa(binario).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

function deBase64Url(b64: string): Uint8Array {
  const binario = atob(b64.replace(/-/g, "+").replace(/_/g, "/"));
  const arr = new Uint8Array(binario.length);
  for (let i = 0; i < binario.length; i++) arr[i] = binario.charCodeAt(i);
  return arr;
}

async function claveHmac(): Promise<CryptoKey> {
  return crypto.subtle.importKey(
    "raw",
    codificador.encode(SECRETO),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign", "verify"],
  );
}

export async function firmarSesion(
  payload: Omit<SesionFirmada, "exp">,
  duracionSegundos: number,
): Promise<string> {
  const cuerpo: SesionFirmada = {
    ...payload,
    exp: Math.floor(Date.now() / 1000) + duracionSegundos,
  };
  const json = aBase64Url(codificador.encode(JSON.stringify(cuerpo)));
  const firma = await crypto.subtle.sign(
    "HMAC",
    await claveHmac(),
    codificador.encode(json),
  );
  return `${json}.${aBase64Url(firma)}`;
}

export async function verificarSello(
  token: string | undefined | null,
): Promise<SesionFirmada | null> {
  if (!token) return null;
  const corte = token.lastIndexOf(".");
  if (corte <= 0 || corte === token.length - 1) return null;
  const json = token.slice(0, corte);
  let firma: Uint8Array;
  try {
    firma = deBase64Url(token.slice(corte + 1));
  } catch {
    return null;
  }
  const valida = await crypto.subtle.verify(
    "HMAC",
    await claveHmac(),
    firma as BufferSource,
    codificador.encode(json),
  );
  if (!valida) return null;
  try {
    const payload = JSON.parse(
      decodificador.decode(deBase64Url(json)),
    ) as SesionFirmada;
    if (
      typeof payload.sub !== "string" ||
      typeof payload.nombre !== "string" ||
      typeof payload.exp !== "number" ||
      payload.exp * 1000 <= Date.now()
    ) {
      return null;
    }
    return payload;
  } catch {
    return null;
  }
}
