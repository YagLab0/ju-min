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
  obtenerUltimaConsulta,
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
        <PanelAlertas />
      </Suspense>

      <div className="mt-10 grid items-start gap-6 lg:grid-cols-2">
        <Suspense
          fallback={
            <PanelCargando texto="Cargando el espacio de consultas…" />
          }
        >
          <SeccionAgente />
        </Suspense>
        <Suspense
          fallback={
            <PanelCargando texto="Cargando la cola de pendientes…" />
          }
        >
          <ColaPendientes />
        </Suspense>
      </div>

      <ChatAgente />

      <Suspense
        fallback={
          <p className="mt-10 border border-bruma/25 bg-roca p-5 text-detalle text-bruma">
            Cargando el historial de consultas…
          </p>
        }
      >
        <HistorialConsultas />
      </Suspense>

      <Suspense
        fallback={
          <p className="mt-10 border border-bruma/25 bg-roca p-5 text-detalle text-bruma">
            Cargando el detalle del stock…
          </p>
        }
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
      className="mt-10 border border-bruma/25 bg-roca"
    >
      <div className="border-b border-bruma/25 p-5">
        <h2
          id="chat-agente"
          className="font-display text-titulo font-semibold text-sal"
        >
          Conversar con el agente
        </h2>
        <p className="mt-2 text-detalle text-bruma">
          Chat con el agente eve para preguntas abiertas sobre compras. La
          conversación se retoma al recargar la página.
        </p>
      </div>
      <div className="h-[36rem]">
        <Consulta />
      </div>
    </section>
  );
}

function PanelCargando({ texto }: { texto: string }) {
  return (
    <section className="border border-bruma/25 bg-roca p-5">
      <p className="text-detalle text-bruma">{texto}</p>
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

async function PanelAlertas() {
  // Los datos viven en memoria del servidor y cambian durante la sesión del
  // demo: se leen por request, no en el prerender (ver connection()).
  await connection();
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

      {/* La consulta sale con el insumo ya cargado: la minera no escribe el
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
          className="bg-senal px-4 py-2 font-display font-semibold text-grafito transition-colors hover:bg-sal"
        >
          Consultar al agente
        </button>
      </form>
    </li>
  );
}

// ---------- Consultas al agente ----------

async function SeccionAgente() {
  await connection();
  const ultima = await obtenerUltimaConsulta();

  return (
    <section
      aria-labelledby="consultas-agente"
      className="border border-bruma/25 bg-roca p-5"
    >
      <h2
        id="consultas-agente"
        className="font-display text-titulo font-semibold text-sal"
      >
        Consultas al agente
      </h2>
      <p className="mt-2 text-detalle text-bruma">
        Preguntale al agente en texto libre, o usá «Consultar al agente» en
        una alerta para salir con el insumo ya cargado.
      </p>

      <form action={consultarAlAgenteDesdePanel} className="mt-4">
        <label
          htmlFor="mensaje"
          className="text-detalle font-semibold text-sal"
        >
          Consulta libre
        </label>
        <div className="mt-1.5 flex flex-col gap-3 sm:flex-row">
          <input
            id="mensaje"
            name="mensaje"
            type="text"
            required
            autoComplete="off"
            placeholder="Ej.: ¿quién me entrega guantes más rápido?"
            className="w-full border border-bruma/40 bg-grafito px-3 py-2 text-cuerpo text-sal placeholder:text-bruma/60"
          />
          <button
            type="submit"
            className="shrink-0 bg-senal px-5 py-2 font-display font-semibold text-grafito transition-colors hover:bg-sal"
          >
            Consultar
          </button>
        </div>
      </form>

      {ultima && <UltimaRespuesta consulta={ultima} />}
    </section>
  );
}

function UltimaRespuesta({ consulta }: { consulta: ConsultaDetallada }) {
  return (
    <article
      aria-label="Última respuesta del agente"
      className="mt-6 border border-bruma/25 bg-grafito p-4"
    >
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <h3 className="font-display font-semibold text-sal">
          Última respuesta del agente
        </h3>
        <p className="text-micro text-bruma">
          {formatoFecha(consulta.creadaEn)}
        </p>
      </div>
      <p className="mt-2 text-detalle text-bruma">
        Consulta: «{consulta.mensaje}»
      </p>
      <p className="mt-2 text-cuerpo text-sal">
        {consulta.respuesta ?? "Sin respuesta."}
      </p>
      {consulta.recomendaciones.length === 0 ? (
        <p className="mt-3 text-detalle text-bruma">
          La consulta no produjo recomendaciones.
        </p>
      ) : (
        <ul className="mt-4 grid gap-3">
          {consulta.recomendaciones.map((r) => (
            <TarjetaRecomendacion key={r.id} rec={r} />
          ))}
        </ul>
      )}
    </article>
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
      className="border border-bruma/25 bg-roca p-5"
    >
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <h2
          id="cola-pendientes"
          className="font-display text-titulo font-semibold text-sal"
        >
          Recomendaciones pendientes
        </h2>
        <p className="text-detalle text-bruma" role="status">
          {pendientes.length === 1
            ? "1 pendiente"
            : `${pendientes.length} pendientes`}
        </p>
      </div>
      <p className="mt-2 text-detalle text-bruma">
        Las recomendaciones nuevas del agente entran a esta cola para que la
        minera las revise. Al aprobarlas o rechazarlas pasan a «Decididas».
      </p>

      {pendientes.length === 0 ? (
        <p className="mt-4 border border-bruma/25 bg-grafito p-4 text-detalle text-bruma">
          No hay recomendaciones pendientes: las que emita el agente
          aparecen acá.
        </p>
      ) : (
        <ul className="mt-4 grid gap-4">
          {pendientes.map((r) => (
            <TarjetaRecomendacion key={r.id} rec={r} />
          ))}
        </ul>
      )}

      {decididas.length > 0 && (
        <div className="mt-6 border-t border-bruma/25 pt-4">
          <h3 className="font-display text-detalle font-semibold text-bruma">
            Decididas
          </h3>
          <ul className="mt-3 grid gap-4">
            {decididas.map((r) => (
              <TarjetaRecomendacion key={r.id} rec={r} />
            ))}
          </ul>
        </div>
      )}
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
  pendiente: "bg-senal text-grafito",
  aprobada: "border border-sal/50 text-sal",
  rechazada: "border border-bruma/40 text-bruma",
};

function TarjetaRecomendacion({ rec }: { rec: RecomendacionDetallada }) {
  const proveedor = rec.proveedor;
  const oferta = rec.oferta;

  return (
    <li className="border border-bruma/25 bg-grafito p-4">
      <div className="flex items-start justify-between gap-4">
        <h3 className="font-display font-semibold text-sal">
          {rec.insumo?.nombre ?? "Insumo"}
        </h3>
        <span
          className={`shrink-0 px-1.5 py-0.5 text-micro font-semibold ${ESTILO_ESTADO[rec.estado]}`}
        >
          {ETIQUETA_ESTADO[rec.estado]}
        </span>
      </div>

      {proveedor && (
        <p className="mt-1 text-detalle text-bruma">
          {/* Cada recomendación enlaza a la ficha del proveedor verificado
              para revisarlo antes de decidir. */}
          <Link
            href={`/proveedores/${proveedor.id}`}
            className="font-semibold text-sal underline decoration-bruma/50 underline-offset-2 transition-colors hover:text-senal hover:decoration-senal"
          >
            {proveedor.nombreFantasia ?? proveedor.razonSocial}
          </Link>
          {proveedor.nombreFantasia && ` · ${proveedor.razonSocial}`}
          {proveedor.estado === "homologado" && (
            <span className="ml-2 border border-cobre/50 px-1.5 py-0.5 text-micro text-sal">
              homologado
            </span>
          )}
        </p>
      )}

      {oferta && proveedor && (
        <dl className="mt-3 grid grid-cols-3 gap-3 text-detalle">
          <div>
            <dt className="text-micro text-bruma">Precio</dt>
            <dd className="font-display font-semibold text-sal">
              {formatoPrecio(oferta)}
              <span className="block text-micro font-normal text-bruma">
                por {rec.insumo?.unidad}
              </span>
            </dd>
          </div>
          <div>
            <dt className="text-micro text-bruma">Lead time</dt>
            <dd className="font-display font-semibold text-sal">
              {formatoLead(oferta)}
            </dd>
          </div>
          <div>
            <dt className="text-micro text-bruma">Trust score</dt>
            <dd className="font-display font-semibold text-sal">
              {Math.round(proveedor.trustScore.valor)}
              <span className="text-micro font-normal text-bruma">/100</span>
            </dd>
          </div>
        </dl>
      )}

      <p className="mt-3 text-detalle text-sal">{rec.justificacion}</p>
      <p className="mt-2 text-micro text-bruma">
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
            className="bg-senal px-4 py-2 font-display text-detalle font-semibold text-grafito transition-colors hover:bg-sal"
          >
            Aprobar
          </button>
          <button
            type="submit"
            name="decision"
            value="rechazada"
            className="border border-bruma/40 px-4 py-2 font-display text-detalle font-semibold text-bruma transition-colors hover:border-sal hover:text-sal"
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
    <section aria-labelledby="historial-consultas" className="mt-10">
      <h2
        id="historial-consultas"
        className="font-display text-titulo font-semibold text-sal"
      >
        Historial de consultas
      </h2>
      <p className="mt-2 text-detalle text-bruma">
        Cada consulta con las recomendaciones que emitió el agente y el
        estado de cada una.
      </p>

      {historial.length === 0 ? (
        <p className="mt-4 border border-bruma/25 bg-roca p-5 text-detalle text-bruma">
          Todavía no hay consultas: las que le hagas al agente quedan
          registradas acá.
        </p>
      ) : (
        <ol className="mt-4 grid gap-4">
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
    <li className="border border-bruma/25 bg-roca p-5">
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <h3 className="font-display font-semibold text-sal">
          «{consulta.mensaje}»
        </h3>
        <p className="text-micro text-bruma">
          {formatoFecha(consulta.creadaEn)}
        </p>
      </div>
      <p className="mt-2 text-detalle text-bruma">
        {consulta.respuesta ?? "Sin respuesta."}
      </p>
      {consulta.recomendaciones.length === 0 ? (
        <p className="mt-3 text-detalle text-bruma">
          La consulta no produjo recomendaciones.
        </p>
      ) : (
        <ul className="mt-4 grid gap-4 lg:grid-cols-2">
          {consulta.recomendaciones.map((r) => (
            <TarjetaRecomendacion key={r.id} rec={r} />
          ))}
        </ul>
      )}
    </li>
  );
}

// ---------- Tabla de stock ----------

async function TablaStock() {
  await connection();
  const stock = await listarStockMinera();
  const alertas = stock.filter((s) => s.estado === "alerta");

  return (
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
