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

const ETIQUETA_FUENTE: Record<ProveedorVerificado["fuente"], string> = {
  capmin: "CAPMIN",
  caem: "CAEM",
  registro_jujuy: "Registro Provincial de Proveedores Mineros de Jujuy",
  manual: "Carga manual",
};

const ORDENES: readonly OrdenProveedores[] = [
  "trust_score_desc",
  "trust_score_asc",
  "nombre_asc",
];

export default function Proveedores(props: PageProps<"/proveedores">) {
  return (
    <div className="mx-auto w-full max-w-6xl px-5 py-14">
      <h1 className="font-display text-display font-bold text-sal">
        Proveedores verificados
      </h1>
      <p className="mt-4 max-w-2xl text-subtitulo text-bruma">
        La red de proveedores verificados del Registro Provincial de
        Proveedores Mineros de Jujuy y las cámaras del sector, con su trust
        score, ubicación y certificaciones.
      </p>
      <Suspense
        fallback={
          <p className="mt-10 border border-bruma/25 bg-roca p-5 text-detalle text-bruma">
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
    <>
      <form
        method="get"
        className="mt-10 border border-bruma/25 bg-roca p-5"
        aria-label="Filtrar proveedores"
      >
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <div className="flex flex-col gap-1.5">
            <label
              htmlFor="busqueda"
              className="text-detalle font-semibold text-sal"
            >
              Buscar por nombre
            </label>
            <input
              id="busqueda"
              name="busqueda"
              type="search"
              defaultValue={busqueda}
              placeholder="Ej.: FiltroPuna"
              className="border border-bruma/40 bg-grafito px-3 py-2 text-cuerpo text-sal placeholder:text-bruma/60"
            />
          </div>
          <div className="flex flex-col gap-1.5">
            <label
              htmlFor="categoria"
              className="text-detalle font-semibold text-sal"
            >
              Categoría
            </label>
            <select
              id="categoria"
              name="categoria"
              defaultValue={categoriaId ?? ""}
              className="border border-bruma/40 bg-grafito px-3 py-2 text-cuerpo text-sal"
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
              className="text-detalle font-semibold text-sal"
            >
              Insumo
            </label>
            <select
              id="insumo"
              name="insumo"
              defaultValue={insumoId ?? ""}
              className="border border-bruma/40 bg-grafito px-3 py-2 text-cuerpo text-sal"
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
              className="text-detalle font-semibold text-sal"
            >
              Ordenar por
            </label>
            <select
              id="orden"
              name="orden"
              defaultValue={orden}
              className="border border-bruma/40 bg-grafito px-3 py-2 text-cuerpo text-sal"
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
            className="bg-senal px-5 py-2.5 font-display font-semibold text-grafito transition-colors hover:bg-sal"
          >
            Aplicar filtros
          </button>
          {(busqueda || categoriaId || insumoId) && (
            <Link
              href="/proveedores"
              className="text-detalle text-bruma underline-offset-4 hover:text-sal hover:underline"
            >
              Limpiar filtros
            </Link>
          )}
        </div>
      </form>

      <Resultados proveedores={proveedores} total={redCompleta.length} />
    </>
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
      <div className="mt-8 border border-bruma/25 bg-roca">
        <div className="franja-seguridad h-1.5" aria-hidden="true" />
        <div className="p-5">
          <h2 className="font-display text-titulo font-semibold text-sal">
            Ningún proveedor verificado coincide con esos filtros
          </h2>
          <p className="mt-2 max-w-xl text-detalle text-bruma">
            Probá ampliar la búsqueda: elegí otra categoría u otro insumo,
            escribí una parte del nombre o mirá la red verificada completa
            ({total} proveedores).
          </p>
          <Link
            href="/proveedores"
            className="mt-4 inline-block border border-bruma/40 px-5 py-2.5 font-display font-semibold text-sal transition-colors hover:border-senal hover:text-senal"
          >
            Ver todos los proveedores
          </Link>
        </div>
      </div>
    );
  }

  return (
    <>
      <p className="mt-6 text-detalle text-bruma" role="status">
        {proveedores.length === total
          ? `${total} proveedores verificados`
          : `${proveedores.length} de ${total} proveedores verificados`}
      </p>
      <ul className="mt-4 grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
        {proveedores.map((p) => (
          <TarjetaProveedor key={p.id} proveedor={p} />
        ))}
      </ul>
    </>
  );
}

function TarjetaProveedor({ proveedor: p }: { proveedor: ProveedorVerificado }) {
  const certificaciones = p.certificaciones
    .filter((c) => c.estado === "verificado")
    .map((c) => c.certificacion.codigo ?? c.certificacion.nombre);
  const visibles = certificaciones.slice(0, 3);
  const restantes = certificaciones.length - visibles.length;

  return (
    <li className="border border-bruma/25 bg-roca">
      <article className="flex h-full flex-col gap-4 p-5">
        <div className="flex items-start justify-between gap-4">
          <div className="min-w-0">
            <div className="flex items-center gap-2">
              <h2 className="truncate font-display font-semibold text-sal">
                <Link
                  href={`/proveedores/${p.id}`}
                  className="transition-colors hover:text-senal"
                >
                  {p.nombreFantasia ?? p.razonSocial}
                </Link>
              </h2>
              {p.estado === "homologado" && (
                <span className="shrink-0 bg-senal px-1.5 py-0.5 text-micro font-semibold text-grafito">
                  homologado
                </span>
              )}
            </div>
            {p.nombreFantasia && (
              <p className="truncate text-micro text-bruma">{p.razonSocial}</p>
            )}
            <p className="mt-1 text-detalle text-bruma">
              {[p.localidad, p.provincia].filter(Boolean).join(", ")}
            </p>
          </div>
          <div className="shrink-0 text-right">
            <p className="font-display text-titulo font-bold leading-none text-sal">
              {Math.round(p.trustScore.valor)}
            </p>
            <p className="text-micro text-bruma">trust score</p>
            <div
              className="mt-1.5 h-1 w-16 bg-bruma/20"
              role="img"
              aria-label={`Trust score ${Math.round(p.trustScore.valor)} de 100`}
            >
              <div
                className="h-1 bg-cobre"
                style={{ width: `${Math.round(p.trustScore.valor)}%` }}
              />
            </div>
          </div>
        </div>

        <div className="flex flex-wrap gap-1.5">
          {p.categorias.map((c) => (
            <span
              key={c.id}
              className="border border-bruma/30 px-2 py-0.5 text-micro text-bruma"
            >
              {c.nombre}
            </span>
          ))}
        </div>

        <div className="mt-auto">
          <p className="text-micro text-bruma">Certificaciones</p>
          <div className="mt-1 flex flex-wrap gap-1.5">
            {visibles.map((codigo) => (
              <span
                key={codigo}
                className="border border-cobre/40 px-2 py-0.5 text-micro text-sal"
              >
                {codigo}
              </span>
            ))}
            {restantes > 0 && (
              <span className="px-1 py-0.5 text-micro text-bruma">
                +{restantes}
              </span>
            )}
          </div>
        </div>

        <p className="text-micro text-bruma">
          Fuente: {ETIQUETA_FUENTE[p.fuente]}
          {p.registroJujuyEstado === "aprobado" &&
            " · Registro de Jujuy aprobado"}
        </p>

        <Link
          href={`/proveedores/${p.id}`}
          className="mt-1 inline-block w-fit border border-bruma/40 px-4 py-2 font-display text-detalle font-semibold text-sal transition-colors hover:border-senal hover:text-senal"
        >
          Ver ficha
        </Link>
      </article>
    </li>
  );
}
