import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "Proveedor no encontrado",
};

export default function ProveedorNoEncontrado() {
  return (
    <div className="mx-auto w-full max-w-6xl px-5 py-14">
      <div className="rounded-2xl border border-linea bg-ficha shadow-sm">
        <div className="franja-seguridad h-1.5" aria-hidden="true" />
        <div className="p-5">
          <h1 className="font-display text-titulo font-semibold text-tinta">
            Proveedor no encontrado
          </h1>
          <p className="mt-2 max-w-xl text-detalle text-piedra">
            El proveedor no existe o ya no integra la red verificada. Volvé al
            listado para explorar los proveedores verificados disponibles.
          </p>
          <Link
            href="/proveedores"
            className="mt-4 inline-block rounded-lg border border-linea px-5 py-2.5 font-display font-semibold text-tinta transition-colors hover:border-cobre hover:text-cobre"
          >
            Volver al listado de proveedores
          </Link>
        </div>
      </div>
    </div>
  );
}
