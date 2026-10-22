import type { Metadata } from "next";
import Link from "next/link";
import { Suspense } from "react";

import { arquetipoParaInsumo } from "@/components/insumo-escena";
import { PreviewInsumo } from "@/components/preview-insumo";
import {
  listarCategorias,
  listarInsumos,
  listarProveedoresVerificados,
  obtenerProveedorVerificado,
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
        Marketplace de la red verificada: cada oferta muestra precio, unidad,
        plazo de entrega y el trust score del proveedor que la emite.
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

  // Cada tarjeta destaca una oferta del proveedor: se resuelven los detalles
  // en paralelo (la fuente en memoria lo vuelve barato).
  const detalles = await Promise.all(
    proveedores.map((p) => obtenerProveedorVerificado(p.id)),
  );
  const ofertaDestacada = new Map(
    proveedores.map((p, i) => [
      p.id,
      detalles[i]?.ofertas
        .filter((o) => o.disponible)
        .sort((a, b) => (a.leadTimeDias ?? 999) - (b.leadTimeDias ?? 999))[0] ??
        detalles[i]?.ofertas[0] ??
        null,
    ]),
  );
  const totalOfertas = new Map(
    proveedores.map((p, i) => [p.id, detalles[i]?.ofertas.length ?? 0]),
  );

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

      <Resultados
        proveedores={proveedores}
        total={redCompleta.length}
        ofertaDestacada={ofertaDestacada}
        totalOfertas={totalOfertas}
      />
    </div>
  );
}

function Resultados({
  proveedores,
  total,
  ofertaDestacada,
  totalOfertas,
}: {
  proveedores: ProveedorVerificado[];
  total: number;
  ofertaDestacada: Map<string, OfertaDetalle>;
  totalOfertas: Map<string, number>;
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
          <TarjetaOferta
            key={p.id}
            proveedor={p}
            oferta={ofertaDestacada.get(p.id) ?? null}
            cantidadOfertas={totalOfertas.get(p.id) ?? 0}
          />
        ))}
      </ul>
    </div>
  );
}

type OfertaDetalle = NonNullable<
  Awaited<ReturnType<typeof obtenerProveedorVerificado>>
>["ofertas"][number] | null;

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

function TarjetaOferta({
  proveedor: p,
  oferta,
  cantidadOfertas,
}: {
  proveedor: ProveedorVerificado;
  oferta: OfertaDetalle;
  cantidadOfertas: number;
}) {
  const categoria = p.categorias[0];
  const conPreview = !!(categoria || oferta);

  return (
    <li className="overflow-hidden rounded-2xl border border-linea bg-ficha shadow-sm transition-shadow hover:shadow-md">
      <article className="flex h-full flex-col">
        {conPreview && (
          <div className="relative h-24 overflow-hidden border-b border-linea bg-papel">
            {categoria && (
              <FondoCategoria nombre={categoria.nombre} slug={categoria.slug} />
            )}
            <PreviewInsumo
              arquetipo={arquetipoParaInsumo(
                oferta?.insumo.nombre ?? categoria?.nombre ?? "",
                categoria?.slug,
              )}
              className="absolute inset-0"
            />
            {p.estado === "homologado" && (
              <span className="absolute right-3 top-2.5 rounded-md bg-senal px-1.5 py-0.5 text-micro font-semibold text-tinta shadow-sm">
                homologado
              </span>
            )}
            {categoria && (
              <span className="absolute bottom-2 right-3 rounded-md bg-ficha/90 px-2 py-0.5 text-micro font-semibold text-piedra ring-1 ring-linea">
                {categoria.nombre}
              </span>
            )}
          </div>
        )}

        <div className="flex flex-1 flex-col gap-2.5 p-3.5">
          {/* Insumo de la oferta destacada */}
          <div className="flex items-start justify-between gap-3">
            <div className="min-w-0">
              <p className="truncate text-micro font-semibold uppercase tracking-wide text-piedra">
                {oferta?.insumo.nombre ?? "Insumos de la categoría"}
              </p>
              <h2 className="mt-0.5 truncate font-display text-cuerpo font-semibold text-tinta">
                <Link
                  href={`/proveedores/${p.id}`}
                  className="transition-colors hover:text-cobre"
                >
                  {p.nombreFantasia ?? p.razonSocial}
                </Link>
              </h2>
              <p className="truncate text-micro text-piedra">
                {[p.localidad, p.provincia].filter(Boolean).join(", ")}
              </p>
            </div>
            {/* Badge de trust score */}
            <div className="shrink-0 rounded-lg border border-linea bg-papel px-1.5 py-0.5 text-center">
              <p className="font-display text-cuerpo font-bold leading-none text-cobre">
                {Math.round(p.trustScore.valor)}
              </p>
              <p className="text-[0.625rem] font-semibold uppercase tracking-wide text-piedra">
                trust
              </p>
            </div>
          </div>

          {/* Precio, unidad y lead time de la oferta */}
          {oferta && (
            <div className="rounded-xl border border-linea bg-papel px-3 py-2">
              <div className="flex items-baseline justify-between gap-2">
                <p className="font-display text-cuerpo font-bold text-tinta">
                  {formatoPrecio(oferta.precio, oferta.moneda)}
                </p>
                <p className="text-micro text-piedra">
                  por {oferta.insumo.unidad}
                </p>
              </div>
              <p className="mt-0.5 text-micro text-piedra">
                {oferta.leadTimeDias === null
                  ? "Plazo a convenir"
                  : `Entrega en ${oferta.leadTimeDias} días`}
                {" · "}
                {oferta.disponible ? "Disponible" : "A pedido"}
              </p>
            </div>
          )}

          <div className="mt-auto flex items-center justify-between gap-3">
            <p className="text-micro text-piedra">
              {cantidadOfertas}{" "}
              {cantidadOfertas === 1 ? "oferta publicada" : "ofertas publicadas"}
              {/* Sin bloque de preview el tag vuelve a su lugar en el pie. */}
              {p.estado === "homologado" && !conPreview && (
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
        </div>
      </article>
    </li>
  );
}

