import { createClient, type SupabaseClient } from "@supabase/supabase-js";

let cached: SupabaseClient | null = null;

/**
 * Cliente server-side de Supabase para las tools del agente.
 * Usa la service role key (bypasea RLS); nunca exponer al cliente.
 */
export function getSupabase(): SupabaseClient {
  if (cached) return cached;
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !key) {
    throw new Error(
      "Faltan NEXT_PUBLIC_SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY en el entorno.",
    );
  }
  cached = createClient(url, key, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  return cached;
}

/**
 * El cliente no tiene tipos generados de la BD; los resultados llegan como
 * GenericStringError. `rows` castea `data` a un arreglo de filas.
 */
export function rows<T>(data: unknown): T[] {
  return (Array.isArray(data) ? data : []) as T[];
}

/**
 * Las relaciones embebidas (ej. `insumos(nombre)`) pueden llegar como objeto
 * o como arreglo según el tipado; `rel` normaliza a un solo objeto o null.
 */
export function rel<T>(value: unknown): T | null {
  if (value === null || value === undefined) return null;
  if (Array.isArray(value)) return (value[0] as T) ?? null;
  return value as T;
}
