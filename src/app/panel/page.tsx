import type { Metadata } from "next";
import { Suspense } from "react";

import {
  listarStockMinera,
  obtenerMinera,
  type StockInsumo,
} from "@/lib/compras";

export const metadata: Metadata = {
  title: "Panel de la minera",
};

const zonas = [
  {
    titulo: "Consultas al agente",
    texto:
      "Espacio para hacerle consultas al agente, desde una alerta de stock o con texto libre.",
  },
  {
    titulo: "Recomendaciones pendientes",
    texto:
      "La cola de recomendaciones del agente para aprobar o rechazar, separada del historial ya decidido.",
  },
] as const;

export default function Panel() {
  return (
    <div className="mx-auto w-full max-w-6xl px-5 py-14">
      <h1 className="font-display text-display font-bold text-sal">
        Panel de la minera
      </h1>
      <p className="mt-4 max-w-2xl text-subtitulo text-bruma">
        La vista de trabajo de la minera: qué insumos hay que reponer, qué
        recomienda el agente y qué decisiones quedan pendientes.
      </p>
      <Suspense
        fallback={
          <p className="mt-10 border border-bruma/25 bg-roca p-5 text-detalle text-bruma">
            Cargando el stock de la minera…
          </p>
        }
      >
        <PanelStock />
      </Suspense>
      <div className="mt-10 grid gap-6 lg:grid-cols-2">
        {zonas.map(({ titulo, texto }) => (
          <section
            key={titulo}
            className="border border-bruma/25 bg-roca p-5"
          >
            <h2 className="font-display font-semibold text-sal">{titulo}</h2>
            <p className="mt-2 text-detalle text-bruma">{texto}</p>
            <p className="mt-4 w-fit border border-bruma/30 px-2 py-0.5 text-micro text-bruma">
              En construcción
            </p>
          </section>
        ))}
      </div>
    </div>
  );
}

function formatoNumero(n: number): string {
  return n.toLocaleString("es-AR");
}

const PLURAL_UNIDAD: Record<string, string> = {
  par: "pares",
  unidad: "unidades",
  litro: "litros",
  metro: "metros",
  kg: "kg",
  m2: "m2",
};

function formatoCantidad(n: number, unidad: string): string {
  const plural = PLURAL_UNIDAD[unidad] ?? `${unidad}s`;
  return `${formatoNumero(n)} ${n === 1 ? unidad : plural}`;
}

function formatoDias(dias: number | null): string {
  return dias === null ? "—" : `${dias} días`;
}

async function PanelStock() {
  // La página solo habla con el módulo de dominio de compras.
  const [minera, stock] = await Promise.all([
    obtenerMinera(),
    listarStockMinera(),
  ]);
  const alertas = stock.filter((s) => s.estado === "alerta");

  return (
    <>
      <p className="mt-6 text-detalle text-bruma">
        {minera.nombre}
        {minera.ubicacion && ` · ${minera.ubicacion}`}
      </p>

      {alertas.length > 0 && <SeccionAlertas alertas={alertas} />}

      <section aria-labelledby="stock-insumos" className="mt-10">
        <div className="flex items-baseline justify-between gap-4">
          <h2
            id="stock-insumos"
            className="font-display text-titulo font-semibold text-sal"
          >
            Stock de insumos
          </h2>
          <p className="text-detalle text-bruma" role="status">
            {stock.length} {stock.length === 1 ? "insumo" : "insumos"} ·{" "}
            {alertas.length} en alerta
          </p>
        </div>
        <div className="mt-4 overflow-x-auto border border-bruma/25 bg-roca">
          <table className="w-full min-w-[40rem] text-left text-detalle">
            <thead>
              <tr className="border-b border-bruma/25 text-micro text-bruma">
                <th scope="col" className="px-5 py-3 font-semibold">
                  Insumo
                </th>
                <th scope="col" className="px-5 py-3 font-semibold">
                  Stock actual
                </th>
                <th scope="col" className="px-5 py-3 font-semibold">
                  Punto de reorden
                </th>
                <th scope="col" className="px-5 py-3 font-semibold">
                  Consumo mensual
                </th>
                <th scope="col" className="px-5 py-3 font-semibold">
                  Días restantes
                </th>
                <th scope="col" className="px-5 py-3 font-semibold">
                  Estado
                </th>
              </tr>
            </thead>
            <tbody>
              {stock.map((s) => (
                <FilaStock key={s.insumo.id} item={s} />
              ))}
            </tbody>
          </table>
        </div>
      </section>
    </>
  );
}

function SeccionAlertas({ alertas }: { alertas: StockInsumo[] }) {
  return (
    <section aria-labelledby="alertas-reorden" className="mt-8">
      <div className="border border-senal/60 bg-roca">
        <div className="franja-seguridad h-1.5" aria-hidden="true" />
        <div className="p-5">
          <h2
            id="alertas-reorden"
            className="font-display text-titulo font-semibold text-sal"
          >
            {alertas.length === 1
              ? "1 insumo por debajo del punto de reorden"
              : `${alertas.length} insumos por debajo del punto de reorden`}
          </h2>
          <ul
            className={`mt-4 grid gap-4 ${alertas.length > 1 ? "sm:grid-cols-2" : ""}`}
          >
            {alertas.map((s) => (
              <TarjetaAlerta key={s.insumo.id} item={s} />
            ))}
          </ul>
        </div>
      </div>
    </section>
  );
}

function IconoAlerta({ className }: { className?: string }) {
  return (
    <svg
      aria-hidden="true"
      viewBox="0 0 24 24"
      className={className}
      fill="currentColor"
    >
      {/* Triángulo de advertencia con signo de exclamación */}
      <path d="M12 2 1 21h22L12 2zm0 4.2 7.6 13.3H4.4L12 6.2zM11 10v4h2v-4h-2zm0 5.5V18h2v-2.5h-2z" />
    </svg>
  );
}

function TarjetaAlerta({ item: s }: { item: StockInsumo }) {
  const faltante = s.puntoReorden - s.cantidadActual;
  const porcentaje = Math.min(
    100,
    Math.round((s.cantidadActual / s.puntoReorden) * 100),
  );

  return (
    <li className="border border-bruma/25 bg-grafito p-4">
      <div className="flex items-start justify-between gap-4">
        <div className="min-w-0">
          <div className="flex items-center gap-2">
            <IconoAlerta className="h-4 w-4 shrink-0 text-senal" />
            <h3 className="font-display font-semibold text-sal">
              {s.insumo.nombre}
            </h3>
          </div>
          {s.insumo.especificacion && (
            <p className="mt-0.5 text-micro text-bruma">
              {s.insumo.especificacion}
            </p>
          )}
        </div>
        <span className="shrink-0 bg-senal px-1.5 py-0.5 text-micro font-semibold text-grafito">
          En alerta
        </span>
      </div>

      <div
        className="mt-3 h-1.5 bg-bruma/20"
        role="img"
        aria-label={`Stock al ${porcentaje}% del punto de reorden`}
      >
        <div className="h-1.5 bg-senal" style={{ width: `${porcentaje}%` }} />
      </div>

      <p className="mt-3 text-detalle text-sal">
        {formatoCantidad(s.cantidadActual, s.insumo.unidad)} en stock · faltan{" "}
        {formatoCantidad(faltante, s.insumo.unidad)} para el punto de reorden (
        {formatoNumero(s.puntoReorden)})
      </p>
      <p className="mt-1 text-detalle text-bruma">
        {s.diasRestantes === null
          ? "Sin consumo registrado para estimar días restantes"
          : `≈ ${s.diasRestantes} días de stock al consumo actual`}
      </p>
    </li>
  );
}

function FilaStock({ item: s }: { item: StockInsumo }) {
  const enAlerta = s.estado === "alerta";
  return (
    <tr className="border-b border-bruma/15 last:border-0">
      <th scope="row" className="px-5 py-3 font-normal">
        <span className="font-semibold text-sal">{s.insumo.nombre}</span>
        {s.insumo.especificacion && (
          <span className="block text-micro text-bruma">
            {s.insumo.especificacion}
          </span>
        )}
      </th>
      <td className="px-5 py-3 text-sal">
        {formatoCantidad(s.cantidadActual, s.insumo.unidad)}
      </td>
      <td className="px-5 py-3 text-bruma">
        {formatoCantidad(s.puntoReorden, s.insumo.unidad)}
      </td>
      <td className="px-5 py-3 text-bruma">
        {s.consumoMensual === null
          ? "—"
          : formatoCantidad(s.consumoMensual, s.insumo.unidad)}
      </td>
      <td className="px-5 py-3">
        <span
          className={`font-display font-semibold ${enAlerta ? "text-senal" : "text-sal"}`}
        >
          {formatoDias(s.diasRestantes)}
        </span>
      </td>
      <td className="px-5 py-3">
        {enAlerta ? (
          <span className="inline-flex items-center gap-1.5 bg-senal px-1.5 py-0.5 text-micro font-semibold text-grafito">
            <IconoAlerta className="h-3 w-3" />
            En alerta
          </span>
        ) : (
          <span className="text-bruma">Normal</span>
        )}
      </td>
    </tr>
  );
}
