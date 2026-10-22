// Punto de intercambio con el proveedor de identidad. Si Supabase está
// configurado y responde, la verificación pasa por Supabase Auth
// (signInWithPassword) y el perfil sale de public.usuarios; si no hay envs
// o el servicio no responde, cae al seed local — misma filosofía que la
// selección de fuente de datos en src/lib/compras (envs presentes →
// Supabase; si no, memoria).

import { USUARIOS_DEMO, type RolUsuario, type UsuarioDemo } from "./usuarios";

interface PerfilSupabase {
  nombre: string | null;
  rol: RolUsuario | null;
  mineras: { nombre: string } | null;
}

/** Verifica contra Supabase Auth. Devuelve:
 *  - UsuarioDemo si las credenciales son válidas,
 *  - null si GoTrue rechazó las credenciales (respuesta definitiva),
 *  - undefined si Supabase no respondió → el caller cae al seed local. */
async function verificarConSupabase(
  email: string,
  clave: string,
): Promise<UsuarioDemo | null | undefined> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const apikey =
    process.env.SUPABASE_SERVICE_ROLE_KEY ??
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !apikey) return undefined;

  try {
    const { createClient } = await import("@supabase/supabase-js");
    const supabase = createClient(url, apikey, {
      auth: { persistSession: false, autoRefreshToken: false },
    });
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password: clave,
    });
    if (!data.user) {
      // 400 = GoTrue respondió "invalid credentials": definitivo.
      // Cualquier otro error (red, 5xx, timeout) se trata como caída.
      return error?.status === 400 ? null : undefined;
    }

    const { data: perfil } = await supabase
      .from("usuarios")
      .select("nombre, rol, mineras(nombre)")
      .eq("id", data.user.id)
      .single();
    const p = perfil as PerfilSupabase | null;

    return {
      id: data.user.id,
      email: data.user.email ?? email,
      clave: "",
      nombre: p?.nombre ?? email.split("@")[0],
      rol: p?.rol ?? "comprador",
      minera: p?.mineras?.nombre ?? "",
    };
  } catch {
    return undefined;
  }
}

/** Verificación de credenciales del login: Supabase Auth cuando está
 * disponible; seed local como fallback. */
export async function verificarCredenciales(
  email: string,
  clave: string,
): Promise<UsuarioDemo | null> {
  const normalizado = email.trim().toLowerCase();
  if (!normalizado || !clave) return null;

  const viaSupabase = await verificarConSupabase(normalizado, clave);
  if (viaSupabase !== undefined) return viaSupabase;

  const usuario = USUARIOS_DEMO.find(
    (u) => u.email === normalizado && u.clave === clave,
  );
  return usuario ?? null;
}
