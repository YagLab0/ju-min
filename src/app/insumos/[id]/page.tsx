import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Suspense } from "react";

import { arquetipoParaInsumo } from "@/components/insumo-escena";
import { PreviewInsumo } from "@/components/preview-insumo";
import {
  obtenerInsumoConOfertas,
  type InsumoDetalle,
  type OfertaConProveedor,
} from "@/lib/compras";

// La ficha es siempre de tiempo de petición (params + datos del módulo):
// no produce shell estático y se le permite bloquear la navegación.
export const instant = false;

export async function generateMetadata(
  props: PageProps<"/insumos/[id]">,
): Promise<Metadata> {
  const { id } = await props.params;
  const insumo = await obtenerInsumoConOfertas(id);
  return { title: insumo ? insumo.nombre : "Insumo no encontrado" };
}

const formatoPrecio = (precio: number, moneda: string) =>
  new Intl.NumberFormat("es-AR", {
    style: "currency",
    currency: moneda,
    maximumFractionDigits: 0,
  }).format(precio);

export default function FichaInsumoPage(props: PageProps<"/insumos/[id]">) {
  return (
    <div className="mx-auto w-full max-w-6xl px-5 py-14">
      <Link
        href="/insumos"
        className="text-detalle text-piedra underline-offset-4 hover:text-tinta hover:underline"
      >
        Volver al catálogo de insumos
      </Link>
      <Suspense
        fallback={
          <p className="mt-10 rounded-2xl border border-linea bg-ficha shadow-sm p-5 text-detalle text-piedra">
            Cargando la ficha del insumo…
          </p>
        }
      >
        <FichaInsumo params={props.params} />
      </Suspense>
    </div>
  );
}

async function FichaInsumo({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  // La página solo habla con el módulo de dominio de compras.
  const insumo = await obtenerInsumoConOfertas(id);
  if (!insumo) notFound();

  return (
    <>
      <header className="mt-6 flex flex-wrap items-center gap-6 rounded-2xl border border-linea bg-ficha shadow-sm p-5">
        <div className="relative h-28 w-40 shrink-0 overflow-hidden rounded-xl border border-linea bg-papel">
          <PreviewInsumo
            arquetipo={arquetipoParaInsumo(insumo.nombre, insumo.categoria?.slug)}
            className="absolute inset-0"
          />
        </div>
        <div className="min-w-0">
          {insumo.categoria && (
            <p className="text-micro font-semibold uppercase tracking-wide text-piedra">
              {insumo.categoria.nombre}
            </p>
          )}
          <h1 className="mt-1 font-display text-titulo font-bold text-tinta">
            {insumo.nombre}
          </h1>
          <p className="mt-1 text-detalle text-piedra">
            {[insumo.especificacion, `Se vende por ${insumo.unidad}`]
              .filter(Boolean)
              .join(" · ")}
          </p>
        </div>
      </header>

      <OfertasComparadas insumo={insumo} />
    </>
  );
}

function OfertasComparadas({ insumo }: { insumo: InsumoDetalle }) {
  const { ofertas } = insumo;
  // Las ofertas llegan de menor a mayor precio: la primera es la más barata.
  const idMenorPrecio = ofertas[0]?.id;
  const idMasRapida = ofertas
    .filter((o) => o.leadTimeDias !== null)
    .sort((a, b) => a.leadTimeDias! - b.leadTimeDias!)[0]?.id;

  return (
    <section
      className="mt-8 rounded-2xl border border-linea bg-ficha shadow-sm"
      aria-labelledby="ofertas"
    >
      <div className="border-b border-linea px-5 py-4">
        <h2
          id="ofertas"
          className="font-display text-subtitulo font-semibold text-tinta"
        >
          Ofertas de la red verificada
        </h2>
        <p className="mt-1 text-micro text-piedra">
          {ofertas.length === 1
            ? "1 proveedor verificado ofrece este insumo"
            : `${ofertas.length} proveedores verificados ofrecen este insumo`}
          , de menor a mayor precio.
        </p>
      </div>
      {ofertas.length === 0 ? (
        <p className="p-5 text-detalle text-piedra">
          Ningún proveedor verificado ofrece este insumo todavía.
        </p>
      ) : (
        <div className="overflow-x-auto">
          <table className="w-full min-w-[40rem] text-left text-detalle">
            <thead>
              <tr className="border-b border-linea text-micro text-piedra">
                <th scope="col" className="px-5 py-3 font-medium">
                  Proveedor
                </th>
                <th scope="col" className="px-3 py-3 font-medium">
                  Trust score
                </th>
                <th scope="col" className="px-3 py-3 font-medium">
                  Precio
                </th>
                <th scope="col" className="px-3 py-3 font-medium">
                  Lead time
                </th>
                <th scope="col" className="px-5 py-3 font-medium">
                  Disponibilidad
                </th>
              </tr>
            </thead>
            <tbody>
              {ofertas.map((o) => (
                <FilaOferta
                  key={o.id}
                  oferta={o}
                  unidad={insumo.unidad}
                  menorPrecio={o.id === idMenorPrecio && ofertas.length > 1}
                  masRapida={o.id === idMasRapida && ofertas.length > 1}
                />
              ))}
            </tbody>
          </table>
        </div>
      )}
    </section>
  );
}

function FilaOferta({
  oferta: o,
  unidad,
  menorPrecio,
  masRapida,
}: {
  oferta: OfertaConProveedor;
  unidad: string;
  menorPrecio: boolean;
  masRapida: boolean;
}) {
  const p = o.proveedor;
  const trust = Math.round(p.trustScore.valor);
  return (
    <tr className="border-b border-linea last:border-b-0">
      <td className="px-5 py-3">
        <Link
          href={`/proveedores/${p.id}`}
          className="font-medium text-tinta transition-colors hover:text-cobre"
        >
          {p.nombreFantasia ?? p.razonSocial}
        </Link>
        {p.estado === "homologado" && (
          <span className="ml-2 rounded-md bg-senal px-1.5 py-0.5 text-micro font-semibold text-tinta">
            homologado
          </span>
        )}
        <p className="text-micro text-piedra">
          {[p.localidad, p.provincia].filter(Boolean).join(", ")}
        </p>
      </td>
      <td className="whitespace-nowrap px-3 py-3">
        <p className="font-display font-semibold text-tinta">{trust}</p>
        <div
          className="mt-1 h-1 w-16 bg-linea"
          role="img"
          aria-label={`Trust score ${trust} de 100`}
        >
          <div className="h-1 bg-cobre" style={{ width: `${trust}%` }} />
        </div>
      </td>
      <td className="whitespace-nowrap px-3 py-3">
        <p className="font-display font-semibold text-tinta">
          {formatoPrecio(o.precio, o.moneda)}
        </p>
        <p className="text-micro text-piedra">por {unidad}</p>
        {menorPrecio && (
          <span className="mt-1 inline-block rounded-md border border-cobre/40 px-1.5 py-0.5 text-micro text-tinta">
            Menor precio
          </span>
        )}
      </td>
      <td className="whitespace-nowrap px-3 py-3 text-piedra">
        {o.leadTimeDias !== null ? `${o.leadTimeDias} días` : "A convenir"}
        {masRapida && (
          <span className="mt-1 block w-fit rounded-md border border-cobre/40 px-1.5 py-0.5 text-micro text-tinta">
            Entrega más rápida
          </span>
        )}
      </td>
      <td className="whitespace-nowrap px-5 py-3">
        {o.disponible ? (
          <span className="border border-cobre/40 rounded-md px-2 py-0.5 text-micro text-tinta">
            Disponible
          </span>
        ) : (
          <span className="bg-senal rounded-md px-2 py-0.5 text-micro font-semibold text-tinta">
            Sin stock
          </span>
        )}
      </td>
    </tr>
  );
}
