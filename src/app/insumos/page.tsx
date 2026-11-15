import type { Metadata } from "next";
import Link from "next/link";
import { Suspense } from "react";

import { arquetipoParaInsumo } from "@/components/insumo-escena";
import { PreviewInsumo } from "@/components/preview-insumo";
import {
  listarCatalogoInsumos,
  listarCategorias,
  type InsumoEnCatalogo,
} from "@/lib/compras";

export const metadata: Metadata = {
  title: "Insumos",
};

export default function Insumos(props: PageProps<"/insumos">) {
  return (
    <div className="mx-auto w-full max-w-7xl px-5 py-10">
      <h1 className="font-display text-display font-bold tracking-tight text-tinta">
        Insumos
      </h1>
      <p className="mt-3 max-w-2xl text-subtitulo text-piedra">
        Catálogo de insumos mineros: elegí uno para comparar las ofertas de los
        proveedores verificados por precio, plazo de entrega y trust score.
      </p>
      <Suspense
        fallback={
          <p className="mt-10 rounded-2xl border border-linea bg-ficha p-5 text-detalle text-piedra">
            Cargando el catálogo…
          </p>
        }
      >
        <CatalogoInsumos searchParams={props.searchParams} />
      </Suspense>
    </div>
  );
}

type SearchParams = Promise<{
  [clave: string]: string | string[] | undefined;
}>;

async function CatalogoInsumos({
  searchParams,
}: {
  searchParams: SearchParams;
}) {
  const params = await searchParams;
  const busqueda = typeof params.busqueda === "string" ? params.busqueda : "";
  const categoriaId =
    typeof params.categoria === "string" && params.categoria !== ""
      ? params.categoria
      : undefined;

  // La página solo habla con el módulo de dominio de compras.
  const [insumos, catalogoCompleto, categorias] = await Promise.all([
    listarCatalogoInsumos({ busqueda, categoriaId }),
    listarCatalogoInsumos(),
    listarCategorias(),
  ]);

  // Solo se ofrecen en el filtro las categorías que tienen insumos.
  const categoriasConInsumos = new Set(
    catalogoCompleto.map((i) => i.categoriaId),
  );
  const opcionesCategoria = categorias.filter((c) =>
    categoriasConInsumos.has(c.id),
  );

  return (
    <div className="mt-8 grid items-start gap-8 lg:grid-cols-[15rem_minmax(0,1fr)]">
      {/* Barra lateral de filtros (en mobile queda arriba como barra). */}
      <form
        method="get"
        className="rounded-2xl border border-linea bg-ficha p-5 shadow-sm lg:sticky lg:top-20"
        aria-label="Filtrar insumos"
      >
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-1">
          <div className="flex flex-col gap-1.5">
            <label
              htmlFor="busqueda"
              className="text-detalle font-semibold text-tinta"
            >
              Buscar insumo
            </label>
            <input
              id="busqueda"
              name="busqueda"
              type="search"
              defaultValue={busqueda}
              placeholder="Ej.: guante, filtro"
              className="rounded-lg border border-linea bg-papel px-3 py-2 text-cuerpo text-tinta placeholder:text-piedra/60"
            />
          </div>
          <div className="flex flex-col gap-1.5">
            <label
              htmlFor="categoria"
              className="text-detalle font-semibold text-tinta"
            >
              Categoría
            </label>
            <select
              id="categoria"
              name="categoria"
              defaultValue={categoriaId ?? ""}
              className="rounded-lg border border-linea bg-papel px-3 py-2 text-cuerpo text-tinta"
            >
              <option value="">Todas las categorías</option>
              {opcionesCategoria.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.nombre}
                </option>
              ))}
            </select>
          </div>
        </div>
        <div className="mt-4 flex items-center gap-4">
          <button
            type="submit"
            className="rounded-lg bg-senal px-5 py-2.5 font-display font-semibold text-tinta transition-colors hover:bg-cobre hover:text-ficha"
          >
            Aplicar filtros
          </button>
          {(busqueda || categoriaId) && (
            <Link
              href="/insumos"
              className="text-detalle text-piedra underline-offset-4 hover:text-tinta hover:underline"
            >
              Limpiar filtros
            </Link>
          )}
        </div>
      </form>

      <Resultados insumos={insumos} total={catalogoCompleto.length} />
    </div>
  );
}

function Resultados({
  insumos,
  total,
}: {
  insumos: InsumoEnCatalogo[];
  total: number;
}) {
  if (insumos.length === 0) {
    return (
      <div className="overflow-hidden rounded-2xl border border-linea bg-ficha shadow-sm">
        <div className="franja-seguridad h-1.5" aria-hidden="true" />
        <div className="p-5">
          <h2 className="font-display text-titulo font-semibold text-tinta">
            Ningún insumo coincide con esos filtros
          </h2>
          <p className="mt-2 max-w-xl text-detalle text-piedra">
            Probá ampliar la búsqueda: elegí otra categoría, escribí una parte
            del nombre o mirá el catálogo completo ({total} insumos).
          </p>
          <Link
            href="/insumos"
            className="mt-4 inline-block rounded-lg border border-linea px-5 py-2.5 font-display font-semibold text-tinta transition-colors hover:border-cobre hover:text-cobre"
          >
            Ver todos los insumos
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div>
      <p className="text-detalle text-piedra" role="status">
        {insumos.length === total
          ? `${total} insumos`
          : `${insumos.length} de ${total} insumos`}
      </p>
      <ul className="mt-4 grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
        {insumos.map((i) => (
          <TarjetaInsumo key={i.id} insumo={i} />
        ))}
      </ul>
    </div>
  );
}

function formatoPrecio(precio: number, moneda: string): string {
  return new Intl.NumberFormat("es-AR", {
    style: "currency",
    currency: moneda,
    maximumFractionDigits: 0,
  }).format(precio);
}

/* Fondo del preview: patrón CSS-only determinístico según el slug con la
   inicial de la categoría. Queda debajo del render 3D y es el respaldo si
   WebGL no está disponible. */
const PATRONES_CATEGORIA = [
  "bg-[repeating-linear-gradient(-45deg,var(--color-linea)_0_8px,transparent_8px_18px)]",
  "bg-[radial-gradient(var(--color-linea)_1.5px,transparent_1.5px)] bg-[size:14px_14px]",
  "bg-[repeating-linear-gradient(90deg,var(--color-linea)_0_2px,transparent_2px_16px)]",
  "bg-[repeating-linear-gradient(0deg,var(--color-linea)_0_2px,transparent_2px_16px)]",
];

function FondoCategoria({ nombre, slug }: { nombre: string; slug: string }) {
  let hash = 0;
  for (const ch of slug) hash = (hash * 31 + ch.charCodeAt(0)) | 0;
  const patron = PATRONES_CATEGORIA[Math.abs(hash) % PATRONES_CATEGORIA.length];
  return (
    <div aria-hidden="true" className={`absolute inset-0 ${patron}`}>
      <span className="absolute bottom-2 left-3 font-display text-4xl font-bold text-tinta/15">
        {nombre.slice(0, 1).toUpperCase()}
      </span>
    </div>
  );
}

function TarjetaInsumo({ insumo: i }: { insumo: InsumoEnCatalogo }) {
  return (
    <li className="overflow-hidden rounded-2xl border border-linea bg-ficha shadow-sm transition-shadow hover:shadow-md">
      <article className="flex h-full flex-col">
        <div className="relative h-28 overflow-hidden border-b border-linea bg-papel">
          {i.categoria && (
            <FondoCategoria nombre={i.categoria.nombre} slug={i.categoria.slug} />
          )}
          <PreviewInsumo
            arquetipo={arquetipoParaInsumo(i.nombre, i.categoria?.slug)}
            className="absolute inset-0"
          />
          {i.categoria && (
            <span className="absolute bottom-2 right-3 rounded-md bg-ficha/90 px-2 py-0.5 text-micro font-semibold text-piedra ring-1 ring-linea">
              {i.categoria.nombre}
            </span>
          )}
        </div>

        <div className="flex flex-1 flex-col gap-2.5 p-3.5">
          <div className="min-w-0">
            <h2 className="font-display text-cuerpo font-semibold text-tinta">
              <Link
                href={`/insumos/${i.id}`}
                className="transition-colors hover:text-cobre"
              >
                {i.nombre}
              </Link>
            </h2>
            {i.especificacion && (
              <p className="truncate text-micro text-piedra">
                {i.especificacion}
              </p>
            )}
          </div>

          {/* Resumen de las ofertas de la red verificada */}
          {i.mejorPrecio ? (
            <div className="rounded-xl border border-linea bg-papel px-3 py-2">
              <div className="flex items-baseline justify-between gap-2">
                <p className="font-display text-cuerpo font-bold text-tinta">
                  <span className="mr-1 text-micro font-normal text-piedra">
                    desde
                  </span>
                  {formatoPrecio(i.mejorPrecio.precio, i.mejorPrecio.moneda)}
                </p>
                <p className="text-micro text-piedra">por {i.unidad}</p>
              </div>
              <p className="mt-0.5 text-micro text-piedra">
                {i.leadTimeMinimoDias === null
                  ? "Plazo a convenir"
                  : `Entrega desde ${i.leadTimeMinimoDias} días`}
              </p>
            </div>
          ) : (
            <p className="rounded-xl border border-linea bg-papel px-3 py-2 text-micro text-piedra">
              Sin ofertas en la red verificada
            </p>
          )}

          <div className="mt-auto flex items-center justify-between gap-3">
            <p className="text-micro text-piedra">
              {i.cantidadOfertas}{" "}
              {i.cantidadOfertas === 1 ? "oferta" : "ofertas"}
            </p>
            <Link
              href={`/insumos/${i.id}`}
              className="rounded-lg border border-linea px-3.5 py-1.5 font-display text-detalle font-semibold text-tinta transition-colors hover:border-cobre hover:text-cobre"
            >
              Comparar ofertas
            </Link>
          </div>
        </div>
      </article>
    </li>
  );
}
