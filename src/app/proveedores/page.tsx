import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Proveedores verificados",
};

export default function Proveedores() {
  return (
    <div className="mx-auto w-full max-w-6xl px-5 py-14">
      <h1 className="font-display text-display font-bold text-sal">
        Proveedores verificados
      </h1>
      <p className="mt-4 max-w-2xl text-subtitulo text-bruma">
        El catálogo de la red: proveedores verificados del Registro Provincial
        de Proveedores Mineros de Jujuy y las cámaras del sector, con su trust
        score, ubicación y certificaciones.
      </p>
      <div className="mt-10 border border-bruma/25 bg-roca p-5">
        <h2 className="font-display font-semibold text-sal">
          Listado de proveedores
        </h2>
        <p className="mt-2 text-detalle text-bruma">
          Acá va el listado filtrable por insumo y categoría, con búsqueda por
          nombre y orden por trust score. Cada proveedor enlaza a su ficha con
          sus ofertas y la fuente de verificación.
        </p>
        <p className="mt-4 w-fit border border-bruma/30 px-2 py-0.5 text-micro text-bruma">
          En construcción
        </p>
      </div>
    </div>
  );
}
