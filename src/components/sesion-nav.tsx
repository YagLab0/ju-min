// Área de sesión de la navegación: server component que lee la cookie por
// request (por eso se monta detrás de un Suspense en el layout). Muestra el
// usuario activo con Cerrar sesión, o el enlace de ingreso si no hay sesión.

import Link from "next/link";

import { leerSesion } from "@/lib/auth";
import { cerrarSesion } from "@/lib/auth/acciones";

const ETIQUETA_ROL: Record<string, string> = {
  admin: "admin",
  comprador: "comprador",
  aprobador: "aprobador",
};

export async function AreaSesion() {
  const sesion = await leerSesion();

  if (!sesion) {
    return (
      <Link
        href="/login"
        className="ml-1 rounded-md bg-tinta px-3.5 py-1.5 text-detalle font-semibold text-ficha transition-colors hover:bg-cobre"
      >
        Ingresar
      </Link>
    );
  }

  return (
    <form
      action={cerrarSesion}
      className="ml-1 flex items-center gap-2 border-l border-linea pl-4"
    >
      <span className="hidden text-micro text-piedra sm:inline">
        {sesion.nombre}
        <span aria-hidden="true"> · </span>
        {ETIQUETA_ROL[sesion.rol] ?? sesion.rol}
      </span>
      <button
        type="submit"
        className="rounded-md border border-linea px-3 py-1.5 text-detalle font-semibold text-tinta transition-colors hover:border-cobre hover:text-cobre"
      >
        Cerrar sesión
      </button>
    </form>
  );
}
