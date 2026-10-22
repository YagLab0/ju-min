// Fachada del módulo de auth del demo: el resto de la app solo conoce
// `leerSesion` / `crearSesion` / `borrarSesion`. La verificación de
// credenciales vive en credenciales.ts como función aislada para cambiarla
// por Supabase Auth cuando el servicio corra en el entorno.

import "server-only";

import { cookies } from "next/headers";

import { firmarSesion, NOMBRE_COOKIE_SESION, verificarSello } from "./sello";
import type { SesionFirmada } from "./sello";
import type { UsuarioDemo } from "./usuarios";

export type { SesionFirmada } from "./sello";
export type { RolUsuario, UsuarioDemo } from "./usuarios";
export { verificarCredenciales } from "./credenciales";
export {
  CLAVE_DEMO,
  USUARIOS_DEMO,
  buscarUsuarioPorId,
} from "./usuarios";
export { NOMBRE_COOKIE_SESION, verificarSello } from "./sello";

/** Doce horas: una jornada de trabajo del demo. */
export const DURACION_SESION_SEGUNDOS = 60 * 60 * 12;

export async function crearSesion(usuario: UsuarioDemo): Promise<void> {
  const valor = await firmarSesion(
    {
      sub: usuario.id,
      nombre: usuario.nombre,
      email: usuario.email,
      rol: usuario.rol,
    },
    DURACION_SESION_SEGUNDOS,
  );
  const almacen = await cookies();
  almacen.set(NOMBRE_COOKIE_SESION, valor, {
    httpOnly: true,
    sameSite: "lax",
    path: "/",
    maxAge: DURACION_SESION_SEGUNDOS,
    secure: process.env.NODE_ENV === "production",
  });
}

export async function leerSesion(): Promise<SesionFirmada | null> {
  const almacen = await cookies();
  return verificarSello(almacen.get(NOMBRE_COOKIE_SESION)?.value);
}

/** La sesión es condición para seguir: sin sesión válida la acción falla. */
export async function exigirSesion(): Promise<SesionFirmada> {
  const sesion = await leerSesion();
  if (!sesion) throw new Error("sin_sesion");
  return sesion;
}

export async function borrarSesion(): Promise<void> {
  const almacen = await cookies();
  almacen.delete(NOMBRE_COOKIE_SESION);
}
