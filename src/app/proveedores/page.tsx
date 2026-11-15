import type { Metadata } from "next";
import Link from "next/link";
import { Suspense } from "react";

import {
  listarCategorias,
  listarInsumos,
  listarProveedoresVerificados,
  type OrdenProveedores,
  type ProveedorVerificado,
} from "@/lib/compras";

export const metadata: Metadata = {
  title: "Proveedores verificados",
};

const ORDENES: readonly OrdenProveedores[] = [
  "trust_score_desc",
  "trust_score_asc",
  "nombre_asc",
];

export default function Proveedores(props: PageProps<"/proveedores">) {
  return (
    <div className="mx-auto w-full max-w-7xl px-5 py-10">
      <h1 className="font-display text-display font-bold tracking-tight text-tinta">
        Proveedores verificados
      </h1>
      <p className="mt-3 max-w-2xl text-subtitulo text-piedra">
        Directorio de la red verificada: cada proveedor con su trust score,
        categorías y ofertas publicadas. Para comparar precios de un insumo,
        andá al{" "}
        <Link
          href="/insumos"
          className="text-tinta underline decoration-cobre/40 underline-offset-4 hover:text-cobre"
        >
          catálogo de insumos
        </Link>
        .
      </p>
      <Suspense
        fallback={
          <p className="mt-10 rounded-2xl border border-linea bg-ficha p-5 text-detalle text-piedra">
            Cargando la red verificada…
          </p>
        }
      >
        <ExplorerProveedores searchParams={props.searchParams} />
      </Suspense>
    </div>
  );
}

type SearchParams = Promise<{
  [clave: string]: string | string[] | undefined;
}>;

async function ExplorerProveedores({
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
  const insumoId =
    typeof params.insumo === "string" && params.insumo !== ""
      ? params.insumo
      : undefined;
  const orden: OrdenProveedores = ORDENES.includes(
    params.orden as OrdenProveedores,
  )
    ? (params.orden as OrdenProveedores)
    : "trust_score_desc";

  // La página solo habla con el módulo de dominio de compras.
  const [proveedores, redCompleta, categorias, insumos] = await Promise.all([
    listarProveedoresVerificados({ busqueda, categoriaId, insumoId, orden }),
    listarProveedoresVerificados(),
    listarCategorias(),
    listarInsumos(),
  ]);

  // Solo se ofrecen en el filtro las categorías que la red verificada cubre.
  const categoriasEnRed = new Set(
    redCompleta.flatMap((p) => p.categorias.map((c) => c.id)),
  );
  const opcionesCategoria = categorias.filter((c) => categoriasEnRed.has(c.id));

  return (
    <div className="mt-8 grid items-start gap-8 lg:grid-cols-[15rem_minmax(0,1fr)]">
      {/* Barra lateral de filtros (en mobile queda arriba como barra). */}
      <form
        method="get"
        className="rounded-2xl border border-linea bg-ficha p-5 shadow-sm lg:sticky lg:top-20"
        aria-label="Filtrar proveedores"
      >
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-1">
          <div className="flex flex-col gap-1.5">
            <label
              htmlFor="busqueda"
              className="text-detalle font-semibold text-tinta"
            >
              Buscar por nombre
            </label>
            <input
              id="busqueda"
              name="busqueda"
              type="search"
              defaultValue={busqueda}
              placeholder="Ej.: FiltroPuna"
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
          <div className="flex flex-col gap-1.5">
            <label
              htmlFor="insumo"
              className="text-detalle font-semibold text-tinta"
            >
              Insumo
            </label>
            <select
              id="insumo"
              name="insumo"
              defaultValue={insumoId ?? ""}
              className="rounded-lg border border-linea bg-papel px-3 py-2 text-cuerpo text-tinta"
            >
              <option value="">Todos los insumos</option>
              {insumos.map((i) => (
                <option key={i.id} value={i.id}>
                  {i.nombre}
                </option>
              ))}
            </select>
          </div>
          <div className="flex flex-col gap-1.5">
            <label
              htmlFor="orden"
              className="text-detalle font-semibold text-tinta"
            >
              Ordenar por
            </label>
            <select
              id="orden"
              name="orden"
              defaultValue={orden}
              className="rounded-lg border border-linea bg-papel px-3 py-2 text-cuerpo text-tinta"
            >
              <option value="trust_score_desc">Mayor trust score</option>
              <option value="trust_score_asc">Menor trust score</option>
              <option value="nombre_asc">Nombre A–Z</option>
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
          {(busqueda || categoriaId || insumoId) && (
            <Link
              href="/proveedores"
              className="text-detalle text-piedra underline-offset-4 hover:text-tinta hover:underline"
            >
              Limpiar filtros
            </Link>
          )}
        </div>
      </form>

      <Resultados proveedores={proveedores} total={redCompleta.length} />
    </div>
  );
}

function Resultados({
  proveedores,
  total,
}: {
  proveedores: ProveedorVerificado[];
  total: number;
}) {
  if (proveedores.length === 0) {
    return (
      <div className="overflow-hidden rounded-2xl border border-linea bg-ficha shadow-sm">
        <div className="franja-seguridad h-1.5" aria-hidden="true" />
        <div className="p-5">
          <h2 className="font-display text-titulo font-semibold text-tinta">
            Ningún proveedor verificado coincide con esos filtros
          </h2>
          <p className="mt-2 max-w-xl text-detalle text-piedra">
            Probá ampliar la búsqueda: elegí otra categoría u otro insumo,
            escribí una parte del nombre o mirá la red verificada completa
            ({total} proveedores).
          </p>
          <Link
            href="/proveedores"
            className="mt-4 inline-block rounded-lg border border-linea px-5 py-2.5 font-display font-semibold text-tinta transition-colors hover:border-cobre hover:text-cobre"
          >
            Ver todos los proveedores
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div>
      <p className="text-detalle text-piedra" role="status">
        {proveedores.length === total
          ? `${total} proveedores verificados`
          : `${proveedores.length} de ${total} proveedores verificados`}
      </p>
      <ul className="mt-4 grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
        {proveedores.map((p) => (
          <TarjetaProveedor key={p.id} proveedor={p} />
        ))}
      </ul>
    </div>
  );
}

/** Categorías visibles en la tarjeta antes de resumir el resto. */
const MAX_CATEGORIAS = 3;

function TarjetaProveedor({ proveedor: p }: { proveedor: ProveedorVerificado }) {
  const trust = Math.round(p.trustScore.valor);
  const visibles = p.categorias.slice(0, MAX_CATEGORIAS);
  const resto = p.categorias.length - visibles.length;

  return (
    <li className="overflow-hidden rounded-2xl border border-linea bg-ficha shadow-sm transition-shadow hover:shadow-md">
      <article className="flex h-full flex-col gap-3 p-4">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <h2 className="truncate font-display text-cuerpo font-semibold text-tinta">
              <Link
                href={`/proveedores/${p.id}`}
                className="transition-colors hover:text-cobre"
              >
                {p.nombreFantasia ?? p.razonSocial}
              </Link>
            </h2>
            {p.nombreFantasia && (
              <p className="truncate text-micro text-piedra">{p.razonSocial}</p>
            )}
            <p className="truncate text-micro text-piedra">
              {[p.localidad, p.provincia].filter(Boolean).join(", ")}
            </p>
          </div>
          {/* Badge de trust score */}
          <div className="shrink-0 rounded-lg border border-linea bg-papel px-2 py-1 text-center">
            <p className="font-display text-subtitulo font-bold leading-none text-cobre">
              {trust}
            </p>
            <p className="text-[0.625rem] font-semibold uppercase tracking-wide text-piedra">
              trust
            </p>
          </div>
        </div>

        <div
          className="h-1 bg-linea"
          role="img"
          aria-label={`Trust score ${trust} de 100`}
        >
          <div className="h-1 bg-cobre" style={{ width: `${trust}%` }} />
        </div>

        {visibles.length > 0 && (
          <div className="flex flex-wrap gap-1.5">
            {visibles.map((c) => (
              <span
                key={c.id}
                className="rounded-md border border-linea px-2 py-0.5 text-micro text-piedra"
              >
                {c.nombre}
              </span>
            ))}
            {resto > 0 && (
              <span className="px-1 py-0.5 text-micro text-piedra">
                +{resto}
              </span>
            )}
          </div>
        )}

        <div className="mt-auto flex items-center justify-between gap-3 pt-1">
          <p className="text-micro text-piedra">
            {p.cantidadOfertas}{" "}
            {p.cantidadOfertas === 1 ? "oferta publicada" : "ofertas publicadas"}
            {p.estado === "homologado" && (
              <span className="ml-2 rounded-md bg-senal px-1.5 py-0.5 font-semibold text-tinta">
                homologado
              </span>
            )}
          </p>
          <Link
            href={`/proveedores/${p.id}`}
            className="rounded-lg border border-linea px-3.5 py-1.5 font-display text-detalle font-semibold text-tinta transition-colors hover:border-cobre hover:text-cobre"
          >
            Ver ficha
          </Link>
        </div>
      </article>
    </li>
  );
}
