// Seed de usuarios del demo, espejo de supabase/seed.sql (ver
// docs/usuarios-auth.md): tres roles sobre la minera Sales de Jujuy S.A.
// y la misma clave de demo. Sirve de fallback cuando Supabase Auth no
// está configurado o no responde — las mismas credenciales funcionan en
// ambos modos.

export type RolUsuario = "admin" | "comprador" | "aprobador";

export interface UsuarioDemo {
  id: string;
  email: string;
  clave: string;
  nombre: string;
  rol: RolUsuario;
  minera: string;
}

export const CLAVE_DEMO = "ju-min-demo";
const MINERA_DEMO = "Sales de Jujuy S.A.";

export const USUARIOS_DEMO: readonly UsuarioDemo[] = [
  {
    id: "b0a7c0de-0000-4000-8000-000000000001",
    email: "admin@salesdejujuy.ju-min.local",
    clave: CLAVE_DEMO,
    nombre: "Marina Cabrera",
    rol: "admin",
    minera: MINERA_DEMO,
  },
  {
    id: "b0a7c0de-0000-4000-8000-000000000002",
    email: "comprador@salesdejujuy.ju-min.local",
    clave: CLAVE_DEMO,
    nombre: "Julián Paredes",
    rol: "comprador",
    minera: MINERA_DEMO,
  },
  {
    id: "b0a7c0de-0000-4000-8000-000000000003",
    email: "aprobador@salesdejujuy.ju-min.local",
    clave: CLAVE_DEMO,
    nombre: "Carla Giménez",
    rol: "aprobador",
    minera: MINERA_DEMO,
  },
];

export function buscarUsuarioPorId(id: string): UsuarioDemo | undefined {
  return USUARIOS_DEMO.find((u) => u.id === id);
}
