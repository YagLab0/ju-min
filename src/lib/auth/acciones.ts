"use server";

import { redirect } from "next/navigation";

import { borrarSesion, crearSesion, verificarCredenciales } from ".";

export interface EstadoLogin {
  error?: string;
}

/** Server action del login: valida contra el seed aislado, sella la cookie
 * httpOnly y manda al panel (o a la ruta protegida que originó el redirect).
 * `desde` solo acepta rutas internas para no abrir un open-redirect. */
export async function iniciarSesion(
  _estado: EstadoLogin | undefined,
  formData: FormData,
): Promise<EstadoLogin> {
  const email = String(formData.get("email") ?? "");
  const clave = String(formData.get("clave") ?? "");
  const desde = String(formData.get("desde") ?? "");

  const usuario = await verificarCredenciales(email, clave);
  if (!usuario) {
    return { error: "Email o contraseña incorrectos." };
  }
  await crearSesion(usuario);

  const destino =
    desde.startsWith("/") && !desde.startsWith("//") ? desde : "/panel";
  redirect(destino);
}

export async function cerrarSesion(): Promise<void> {
  await borrarSesion();
  redirect("/login");
}
