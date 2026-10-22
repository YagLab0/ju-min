import type { Metadata } from "next";
import Link from "next/link";
import { connection } from "next/server";
import { Suspense } from "react";

import {
  listarHistorialConsultas,
  listarRecomendacionesDecididas,
  listarRecomendacionesPendientes,
  listarStockMinera,
  obtenerMinera,
  type ConsultaDetallada,
  type Oferta,
  type RecomendacionDetallada,
  type StockInsumo,
} from "@/lib/compras";

import {
  consultarAlAgenteDesdePanel,
  decidirRecomendacionDesdePanel,
} from "./acciones";
import { Consulta } from "./consulta";

export const metadata: Metadata = {
  title: "Panel de la minera",
};

// El panel es dinámico (sesión + datos por request): no puede producir un
// shell instantáneo, igual que /login y /proveedores/[id].
export const instant = false;

export default function Panel() {
  return (
    <div className="mx-auto w-full max-w-7xl px-5 py-10">
      <h1 className="font-display text-display font-bold tracking-tight text-tinta">
        Panel de la minera
      </h1>
      <p className="mt-3 max-w-2xl text-subtitulo text-piedra">
        La vista de trabajo de la minera: qué insumos hay que reponer, qué
        recomienda el agente y qué decisiones quedan pendientes.
      </p>
      <Suspense
        fallback={
          <p className="mt-2 text-detalle text-piedra">
            Cargando la minera…
          </p>
        }
      >
        <CabeceraMinera />
      </Suspense>

      {/* El chat con el agente es el centro de la pantalla. En la columna
          lateral va todo el circuito de trabajo: la alerta dispara el
          pedido de recomendación y la cola de pendientes espera la
          decisión. Ambas columnas se estiran a la misma altura: la última
          card de cada una crece hasta alinear los bordes y el contenido
          que sobra scrollea adentro. */}
      <div className="mt-8 grid items-stretch gap-6 lg:grid-cols-[minmax(0,1fr)_minmax(20rem,24rem)]">
        <div className="flex min-w-0 flex-col gap-6">
          <ChatAgente />
          <Suspense
            fallback={
              <PanelCargando texto="Cargando el historial de consultas…" />
            }
          >
            <HistorialConsultas />
          </Suspense>
        </div>
        <aside className="flex min-w-0 flex-col gap-6">
          <Suspense
            fallback={<PanelCargando texto="Cargando las alertas de stock…" />}
          >
            <Alertas />
          </Suspense>
          <Suspense
            fallback={<PanelCargando texto="Cargando la cola de pendientes…" />}
          >
            <ColaPendientes />
          </Suspense>
        </aside>
      </div>

      <Suspense
        fallback={<PanelCargando texto="Cargando el detalle del stock…" />}
      >
        <TablaStock />
      </Suspense>
    </div>
  );
}

function ChatAgente() {
  return (
    <section
      aria-labelledby="chat-agente"
      className="overflow-hidden rounded-2xl border border-linea bg-ficha shadow-sm"
    >
      <div className="franja-seguridad h-1.5" aria-hidden="true" />
      <div className="border-b border-linea px-5 py-4">
        <h2
          id="chat-agente"
          className="font-display text-subtitulo font-semibold text-tinta"
        >
          Agente de compras
        </h2>
        <p className="mt-1 text-detalle text-piedra">
          Conversá con el agente sobre compras, proveedores y certificaciones.
          Para reponer un insumo concreto usá «Pedir recomendación» en su
          alerta: la propuesta llega a la cola de pendientes.
        </p>
      </div>
      <div className="h-[38rem]">
        <Consulta />
      </div>
    </section>
  );
}

function PanelCargando({ texto }: { texto: string }) {
  return (
    <section className="rounded-2xl border border-linea bg-ficha p-5">
      <p className="text-detalle text-piedra">{texto}</p>
    </section>
  );
}

function formatoNumero(n: number): string {
  return n.toLocaleString("es-AR");
}

function formatoPrecio(oferta: Oferta): string {
  return new Intl.NumberFormat("es-AR", {
    style: "currency",
    currency: oferta.moneda,
    maximumFractionDigits: 0,
  }).format(oferta.precio);
}

function formatoLead(oferta: Oferta): string {
  return oferta.leadTimeDias === null
    ? "sin plazo declarado"
    : `${oferta.leadTimeDias} días de entrega`;
}

function formatoFecha(iso: string): string {
  return new Intl.DateTimeFormat("es-AR", {
    day: "numeric",
    month: "short",
    hour: "2-digit",
    minute: "2-digit",
  }).format(new Date(iso));
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

// ---------- Alertas de stock ----------

async function CabeceraMinera() {
  // Los datos viven en memoria del servidor y cambian durante la sesión del
  // demo: se leen por request, no en el prerender (ver connection()).
  await connection();
  // La página solo habla con el módulo de dominio de compras.
  const minera = await obtenerMinera();

  return (
    <p className="mt-2 text-detalle text-piedra">
      {minera.nombre}
      {minera.ubicacion && ` · ${minera.ubicacion}`}
    </p>
  );
}

async function Alertas() {
  await connection();
  const stock = await listarStockMinera();
  const alertas = stock.filter((s) => s.estado === "alerta");
  if (alertas.length === 0) return null;

  return <SeccionAlertas alertas={alertas} />;
}

function SeccionAlertas({ alertas }: { alertas: StockInsumo[] }) {
  return (
    <section aria-labelledby="alertas-reorden">
      <div className="overflow-hidden rounded-2xl border border-senal/70 bg-ficha shadow-sm">
        <div className="franja-seguridad h-1.5" aria-hidden="true" />
        <div className="p-5">
          <h2
            id="alertas-reorden"
            className="font-display text-subtitulo font-semibold text-tinta"
          >
            {alertas.length === 1
              ? "1 insumo por debajo del punto de reorden"
              : `${alertas.length} insumos por debajo del punto de reorden`}
          </h2>
          <ul className="mt-4 grid gap-4">
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
    <li className="rounded-xl border border-linea bg-papel p-4">
      <div className="flex items-start justify-between gap-4">
        <div className="min-w-0">
          <div className="flex items-center gap-2">
            <IconoAlerta className="h-4 w-4 shrink-0 text-cobre" />
            <h3 className="font-display font-semibold text-tinta">
              {s.insumo.nombre}
            </h3>
          </div>
          {s.insumo.especificacion && (
            <p className="mt-0.5 text-micro text-piedra">
              {s.insumo.especificacion}
            </p>
          )}
        </div>
        <span className="shrink-0 rounded-md bg-senal px-1.5 py-0.5 text-micro font-semibold text-tinta">
          En alerta
        </span>
      </div>

      <div
        className="mt-3 h-1.5 rounded-full bg-linea"
        role="img"
        aria-label={`Stock al ${porcentaje}% del punto de reorden`}
      >
        <div
          className="h-1.5 rounded-full bg-senal"
          style={{ width: `${porcentaje}%` }}
        />
      </div>

      <p className="mt-3 text-detalle text-tinta">
        {formatoCantidad(s.cantidadActual, s.insumo.unidad)} en stock · faltan{" "}
        {formatoCantidad(faltante, s.insumo.unidad)} para el punto de reorden (
        {formatoNumero(s.puntoReorden)})
      </p>
      <p className="mt-1 text-detalle text-piedra">
        {s.diasRestantes === null
          ? "Sin consumo registrado para estimar días restantes"
          : `≈ ${s.diasRestantes} días de stock al consumo actual`}
      </p>

      {/* El pedido sale con el insumo ya cargado: la minera no escribe el
          contexto a mano. */}
      <form action={consultarAlAgenteDesdePanel} className="mt-4">
        <input type="hidden" name="insumo_id" value={s.insumo.id} />
        <input
          type="hidden"
          name="mensaje"
          value={`Reponer ${s.insumo.nombre}: stock por debajo del punto de reorden`}
        />
        <button
          type="submit"
          className="rounded-lg bg-senal px-4 py-2 font-display font-semibold text-tinta transition-colors hover:bg-cobre hover:text-ficha"
        >
          Pedir recomendación
        </button>
      </form>
    </li>
  );
}

// ---------- Cola de pendientes y decididas ----------

async function ColaPendientes() {
  await connection();
  const [pendientes, decididas] = await Promise.all([
    listarRecomendacionesPendientes(),
    listarRecomendacionesDecididas(),
  ]);

  return (
    <section
      aria-labelledby="cola-pendientes"
      className="flex flex-1 flex-col rounded-2xl border border-linea bg-ficha shadow-sm"
    >
      <div className="border-b border-linea px-5 py-4">
        <div className="flex flex-wrap items-baseline justify-between gap-2">
          <h2
            id="cola-pendientes"
            className="font-display text-subtitulo font-semibold text-tinta"
          >
            Recomendaciones pendientes
          </h2>
          <p className="text-detalle text-piedra" role="status">
            {pendientes.length === 1
              ? "1 pendiente"
              : `${pendientes.length} pendientes`}
          </p>
        </div>
        <p className="mt-1.5 text-detalle text-piedra">
          Las recomendaciones nuevas del agente entran a esta cola para que
          la minera las revise. Al aprobarlas o rechazarlas pasan a
          «Decididas».
        </p>
      </div>

      {/* Un solo scroll para pendientes y decididas: el cuerpo de la card
          crece hasta el borde inferior de la columna y el contenido que
          sobra scrollea adentro, sin cards cortadas a la mitad por un
          segundo scrollbar. */}
      <div className="min-h-[14rem] flex-1 overflow-y-auto p-5">
        {pendientes.length === 0 ? (
          <p className="rounded-xl border border-linea bg-papel p-4 text-detalle text-piedra">
            No hay recomendaciones pendientes: las que emita el agente
            aparecen acá.
          </p>
        ) : (
          <ul className="grid gap-4">
            {pendientes.map((r) => (
              <TarjetaRecomendacion key={r.id} rec={r} />
            ))}
          </ul>
        )}

        {decididas.length > 0 && (
          <div className="mt-6 border-t border-linea pt-4">
            <h3 className="font-display text-detalle font-semibold text-piedra">
              Decididas
            </h3>
            <ul className="mt-3 grid gap-4">
              {decididas.map((r) => (
                <TarjetaRecomendacion key={r.id} rec={r} />
              ))}
            </ul>
          </div>
        )}
      </div>
    </section>
  );
}

// ---------- Tarjeta de recomendación ----------

const ETIQUETA_ESTADO: Record<RecomendacionDetallada["estado"], string> = {
  pendiente: "Pendiente",
  aprobada: "Aprobada",
  rechazada: "Rechazada",
};

const ESTILO_ESTADO: Record<RecomendacionDetallada["estado"], string> = {
  pendiente: "bg-senal text-tinta",
  aprobada: "border border-tinta/40 text-tinta",
  rechazada: "border border-linea text-piedra",
};

function TarjetaRecomendacion({ rec }: { rec: RecomendacionDetallada }) {
  const proveedor = rec.proveedor;
  const oferta = rec.oferta;

  return (
    <li className="rounded-xl border border-linea bg-papel p-4">
      <div className="flex items-start justify-between gap-4">
        <h3 className="font-display font-semibold text-tinta">
          {rec.insumo?.nombre ?? "Insumo"}
        </h3>
        <span
          className={`shrink-0 rounded-md px-1.5 py-0.5 text-micro font-semibold ${ESTILO_ESTADO[rec.estado]}`}
        >
          {ETIQUETA_ESTADO[rec.estado]}
        </span>
      </div>

      {proveedor && (
        <p className="mt-1 text-detalle text-piedra">
          {/* Cada recomendación enlaza a la ficha del proveedor verificado
              para revisarlo antes de decidir. */}
          <Link
            href={`/proveedores/${proveedor.id}`}
            className="font-semibold text-cobre underline decoration-cobre/40 underline-offset-2 transition-colors hover:text-tinta hover:decoration-tinta"
          >
            {proveedor.nombreFantasia ?? proveedor.razonSocial}
          </Link>
          {proveedor.nombreFantasia && ` · ${proveedor.razonSocial}`}
          {proveedor.estado === "homologado" && (
            <span className="ml-2 rounded-md border border-cobre/50 px-1.5 py-0.5 text-micro text-cobre">
              homologado
            </span>
          )}
        </p>
      )}

      {oferta && proveedor && (
        <dl className="mt-3 grid grid-cols-3 gap-3 text-detalle">
          <div>
            <dt className="text-micro text-piedra">Precio</dt>
            <dd className="font-display font-semibold text-tinta">
              {formatoPrecio(oferta)}
              <span className="block text-micro font-normal text-piedra">
                por {rec.insumo?.unidad}
              </span>
            </dd>
          </div>
          <div>
            <dt className="text-micro text-piedra">Lead time</dt>
            <dd className="font-display font-semibold text-tinta">
              {formatoLead(oferta)}
            </dd>
          </div>
          <div>
            <dt className="text-micro text-piedra">Trust score</dt>
            <dd className="font-display font-semibold text-tinta">
              {Math.round(proveedor.trustScore.valor)}
              <span className="text-micro font-normal text-piedra">/100</span>
            </dd>
          </div>
        </dl>
      )}

      <p className="mt-3 text-detalle text-tinta">{rec.justificacion}</p>
      <p className="mt-2 text-micro text-piedra">
        {formatoFecha(rec.creadaEn)}
      </p>

      {/* Solo las pendientes se pueden decidir: una vez aprobada o
          rechazada la tarjeta muestra el estado y no vuelve a ofrecer
          acciones. */}
      {rec.estado === "pendiente" && (
        <form
          action={decidirRecomendacionDesdePanel}
          className="mt-4 flex flex-wrap gap-3"
        >
          <input type="hidden" name="recomendacion_id" value={rec.id} />
          <button
            type="submit"
            name="decision"
            value="aprobada"
            className="rounded-lg bg-senal px-4 py-2 font-display text-detalle font-semibold text-tinta transition-colors hover:bg-cobre hover:text-ficha"
          >
            Aprobar
          </button>
          <button
            type="submit"
            name="decision"
            value="rechazada"
            className="rounded-lg border border-linea px-4 py-2 font-display text-detalle font-semibold text-piedra transition-colors hover:border-tinta hover:text-tinta"
          >
            Rechazar
          </button>
        </form>
      )}
    </li>
  );
}

// ---------- Historial de consultas ----------

async function HistorialConsultas() {
  await connection();
  const historial = await listarHistorialConsultas();

  return (
    <section
      aria-labelledby="historial-consultas"
      className="flex flex-1 flex-col rounded-2xl border border-linea bg-ficha shadow-sm"
    >
      <div className="flex flex-wrap items-baseline justify-between gap-2 border-b border-linea px-5 py-4">
        <h2
          id="historial-consultas"
          className="font-display text-subtitulo font-semibold text-tinta"
        >
          Historial de consultas
        </h2>
        <p className="text-detalle text-piedra" role="status">
          {historial.length === 1
            ? "1 consulta registrada"
            : `${historial.length} consultas registradas`}
        </p>
      </div>

      {historial.length === 0 ? (
        <p className="min-h-[10rem] flex-1 p-5 text-detalle text-piedra">
          Todavía no hay consultas: las que le hagas al agente quedan
          registradas acá.
        </p>
      ) : (
        /* Timeline compacto: cada consulta es una línea con sus
           recomendaciones resumidas. La card se estira hasta el borde de
           la columna y el contenido scrollea adentro. */
        <ol className="min-h-[10rem] flex-1 overflow-y-auto px-5 py-2">
          {historial.map((c) => (
            <ConsultaDelHistorial key={c.id} consulta={c} />
          ))}
        </ol>
      )}
    </section>
  );
}

function ConsultaDelHistorial({ consulta }: { consulta: ConsultaDetallada }) {
  return (
    <li className="relative border-b border-linea py-4 pl-6 last:border-b-0">
      {/* Punto de la línea de tiempo */}
      <span
        aria-hidden="true"
        className="absolute left-0 top-[1.35rem] h-2.5 w-2.5 rounded-full border-2 border-senal bg-ficha"
      />
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <h3 className="font-display text-detalle font-semibold text-tinta">
          «{consulta.mensaje}»
        </h3>
        <p className="text-micro text-piedra">
          {formatoFecha(consulta.creadaEn)}
        </p>
      </div>
      <p className="mt-1 line-clamp-2 text-detalle text-piedra">
        {consulta.respuesta ?? "Sin respuesta."}
      </p>
      {consulta.recomendaciones.length === 0 ? (
        <p className="mt-1.5 text-micro text-piedra">
          La consulta no produjo recomendaciones.
        </p>
      ) : (
        <ul className="mt-2 flex flex-wrap gap-2">
          {consulta.recomendaciones.map((r) => (
            <RecomendacionCompacta key={r.id} rec={r} />
          ))}
        </ul>
      )}
    </li>
  );
}

function RecomendacionCompacta({ rec }: { rec: RecomendacionDetallada }) {
  const proveedor = rec.proveedor;
  return (
    <li className="flex items-center gap-2 rounded-lg border border-linea bg-papel px-2.5 py-1.5 text-micro">
      <span className="font-semibold text-tinta">
        {rec.insumo?.nombre ?? "Insumo"}
      </span>
      {proveedor && (
        <Link
          href={`/proveedores/${proveedor.id}`}
          className="text-cobre underline decoration-cobre/40 underline-offset-2 transition-colors hover:text-tinta"
        >
          {proveedor.nombreFantasia ?? proveedor.razonSocial}
        </Link>
      )}
      <span
        className={`rounded px-1.5 py-0.5 font-semibold ${ESTILO_ESTADO[rec.estado]}`}
      >
        {ETIQUETA_ESTADO[rec.estado]}
      </span>
    </li>
  );
}

// ---------- Tabla de stock ----------

async function TablaStock() {
  await connection();
  const stock = await listarStockMinera();
  const alertas = stock.filter((s) => s.estado === "alerta");

  return (
    <section aria-labelledby="stock-insumos" className="mt-8">
      <div className="flex items-baseline justify-between gap-4">
        <h2
          id="stock-insumos"
          className="font-display text-subtitulo font-semibold text-tinta"
        >
          Stock de insumos
        </h2>
        <p className="text-detalle text-piedra" role="status">
          {stock.length} {stock.length === 1 ? "insumo" : "insumos"} ·{" "}
          {alertas.length} en alerta
        </p>
      </div>
      <div className="mt-4 overflow-x-auto rounded-2xl border border-linea bg-ficha shadow-sm">
        <table className="w-full min-w-[40rem] text-left text-detalle">
          <thead>
            <tr className="border-b border-linea text-micro text-piedra">
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
  );
}

function FilaStock({ item: s }: { item: StockInsumo }) {
  const enAlerta = s.estado === "alerta";
  return (
    <tr className="border-b border-linea last:border-0">
      <th scope="row" className="px-5 py-3 font-normal">
        <span className="font-semibold text-tinta">{s.insumo.nombre}</span>
        {s.insumo.especificacion && (
          <span className="block text-micro text-piedra">
            {s.insumo.especificacion}
          </span>
        )}
      </th>
      <td className="px-5 py-3 text-tinta">
        {formatoCantidad(s.cantidadActual, s.insumo.unidad)}
      </td>
      <td className="px-5 py-3 text-piedra">
        {formatoCantidad(s.puntoReorden, s.insumo.unidad)}
      </td>
      <td className="px-5 py-3 text-piedra">
        {s.consumoMensual === null
          ? "—"
          : formatoCantidad(s.consumoMensual, s.insumo.unidad)}
      </td>
      <td className="px-5 py-3">
        <span
          className={`font-display font-semibold ${enAlerta ? "text-cobre" : "text-tinta"}`}
        >
          {formatoDias(s.diasRestantes)}
        </span>
      </td>
      <td className="px-5 py-3">
        {enAlerta ? (
          <span className="inline-flex items-center gap-1.5 rounded-md bg-senal px-1.5 py-0.5 text-micro font-semibold text-tinta">
            <IconoAlerta className="h-3 w-3" />
            En alerta
          </span>
        ) : (
          <span className="text-piedra">Normal</span>
        )}
      </td>
    </tr>
  );
}
