import type { Metadata } from "next";

import { CLAVE_DEMO, USUARIOS_DEMO } from "@/lib/auth";

import { FormularioLogin } from "./formulario";

export const metadata: Metadata = {
  title: "Ingresar",
};

// El login lee `desde` de searchParams por request: ruta bloqueante, no
// produce shell estático (misma convención que la ficha de proveedor).
export const instant = false;

export default async function Login(props: PageProps<"/login">) {
  const params = await props.searchParams;
  const desde = typeof params.desde === "string" ? params.desde : "/panel";

  return (
    <div className="mx-auto flex w-full max-w-md flex-col px-5 py-16 sm:py-24">
      <div className="overflow-hidden rounded-xl border border-linea bg-ficha shadow-sm">
        <div className="franja-seguridad h-1.5" aria-hidden="true" />
        <div className="p-6 sm:p-8">
          <h1 className="font-display text-titulo font-bold text-tinta">
            Ingresar al panel
          </h1>
          <p className="mt-2 text-detalle text-piedra">
            Acceso al demo de compras de la minera. Usá una cuenta de la lista
            de abajo: todas comparten la misma clave.
          </p>

          <FormularioLogin desde={desde} />

          <div className="mt-6 rounded-lg bg-papel p-4">
            <p className="text-micro font-semibold uppercase tracking-wide text-piedra">
              Cuentas del demo
            </p>
            <ul className="mt-2 space-y-1 text-detalle text-piedra">
              {USUARIOS_DEMO.map((u) => (
                <li key={u.id} className="flex items-baseline justify-between gap-3">
                  <span className="truncate">{u.email}</span>
                  <span className="shrink-0 text-micro">{u.rol}</span>
                </li>
              ))}
            </ul>
            <p className="mt-2 text-detalle text-piedra">
              Clave: <code className="text-tinta">{CLAVE_DEMO}</code>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
