"use client";

import { useEffect, useState, useSyncExternalStore } from "react";
import { AssistantRuntimeProvider, useAui } from "@assistant-ui/react";
import { useEveAgentRuntime } from "@assistant-ui/eve";
import {
  MessageSquarePlusIcon,
  PanelLeftCloseIcon,
  PanelLeftOpenIcon,
  Trash2Icon,
} from "lucide-react";
import { Thread } from "@/components/assistant-ui/elements/thread.aui";
import { cn } from "@/lib/utils";
import type { ClientSessionState, MessageStreamEvent } from "eve/client";

const STORAGE_KEY = "ju-min.consultas";
const LEGACY_STORAGE_KEY = "ju-min.consulta";

type ConversacionGuardada = {
  session: ClientSessionState;
  events?: readonly MessageStreamEvent[];
  titulo?: string;
  actualizadaEn: number;
};

type ConsultasGuardadas = {
  /** sessionId de la última conversación abierta. */
  activa?: string;
  /** Preferencia de UI: sidebar oculta. */
  barraOculta?: boolean;
  items: ConversacionGuardada[];
};

function leerConsultasGuardadas(): ConsultasGuardadas {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (raw) {
      const parsed: unknown = JSON.parse(raw);
      if (
        typeof parsed === "object" &&
        parsed !== null &&
        Array.isArray((parsed as ConsultasGuardadas).items)
      ) {
        return parsed as ConsultasGuardadas;
      }
    }
    // Migración de la clave anterior, que guardaba una sola consulta.
    const legacy = localStorage.getItem(LEGACY_STORAGE_KEY);
    if (legacy) {
      const parsed = JSON.parse(legacy) as {
        session?: ClientSessionState;
        events?: readonly MessageStreamEvent[];
      };
      if (parsed.session) {
        return {
          activa: parsed.session.sessionId,
          items: [
            {
              session: parsed.session,
              events: parsed.events,
              actualizadaEn: Date.now(),
            },
          ],
        };
      }
    }
  } catch {
    // localStorage no disponible o JSON corrupto: arrancar sin historial.
  }
  return { items: [] };
}

/**
 * El primer mensaje del usuario bautiza la conversación, como en ChatGPT:
 * sale del evento `message.received` del stream durable de eve.
 */
function tituloDeEventos(
  events: readonly MessageStreamEvent[] | undefined,
): string | undefined {
  const recibido = events?.find(
    (e): e is Extract<MessageStreamEvent, { type: "message.received" }> =>
      e.type === "message.received",
  );
  const mensaje = recibido?.data.message.trim();
  if (!mensaje) return undefined;
  return mensaje.length > 48 ? `${mensaje.slice(0, 48)}…` : mensaje;
}

const SUGERENCIAS = [
  {
    titulo: "¿Qué proveedores homologados venden EPP en Jujuy?",
    detalle: "La red verificada filtrada por categoría",
  },
  {
    titulo: "¿Qué certificaciones exige la categoría de lubricantes?",
    detalle: "Los requisitos que el agente valida al recomendar",
  },
  {
    titulo: "Compará ofertas para reponer guantes de nitrilo",
    detalle: "Precio, lead time y trust score lado a lado",
  },
] as const;

/**
 * Estado vacío del chat: además del saludo muestra consultas de ejemplo
 * clickeables, que llenan el área vacía y guían el primer mensaje del demo.
 */
function BienvenidaAgente() {
  const aui = useAui();
  return (
    <div className="mb-6 flex flex-col px-2">
      <p className="fade-in slide-in-from-bottom-1 animate-in fill-mode-both text-2xl font-medium tracking-tight duration-200">
        ¿Qué consulta querés hacerle al agente?
      </p>
      <div className="mt-5 grid gap-2.5 sm:grid-cols-3">
        {SUGERENCIAS.map((s) => (
          <button
            key={s.titulo}
            type="button"
            onClick={() => aui.thread.append(s.titulo)}
            className="fade-in slide-in-from-bottom-2 animate-in fill-mode-both rounded-xl border border-foreground/10 bg-foreground/[0.02] px-3.5 py-3 text-start transition-colors duration-200 hover:border-foreground/25 hover:bg-foreground/[0.05] focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50"
          >
            <span className="block text-sm font-medium text-foreground">
              {s.titulo}
            </span>
            <span className="mt-1 block text-xs text-muted-foreground">
              {s.detalle}
            </span>
          </button>
        ))}
      </div>
    </div>
  );
}

/**
 * Área de consulta: monta el runtime de eve (`useEveAgentRuntime`) y renderiza
 * el Thread de assistant-ui. `inicial` trae la sesión durable persistida para
 * retomarla; sin `inicial` arranca una conversación nueva.
 */
function ConsultaRuntime({
  inicial,
  onSessionChange,
  onFinish,
}: {
  inicial: ConversacionGuardada | undefined;
  onSessionChange: (session: ClientSessionState | undefined) => void;
  onFinish: (snapshot: {
    events: readonly MessageStreamEvent[];
    session: ClientSessionState | undefined;
  }) => void;
}) {
  const runtime = useEveAgentRuntime({
    initialEvents: inicial?.events ?? [],
    initialSession: inicial?.session,
    resume: inicial !== undefined,
    onSessionChange,
    onFinish,
  });

  return (
    <AssistantRuntimeProvider runtime={runtime}>
      <Thread components={{ Welcome: BienvenidaAgente }} />
    </AssistantRuntimeProvider>
  );
}

const DIA_MS = 24 * 60 * 60 * 1000;

/**
 * Agrupa las conversaciones en bandas temporales, como el historial de
 * ChatGPT. `items` ya viene ordenado por más reciente, así que cada banda
 * se forma en una sola pasada sin reordenar.
 */
function agruparPorFecha(items: ConversacionGuardada[]) {
  const hoy = new Date();
  const inicioHoy = new Date(
    hoy.getFullYear(),
    hoy.getMonth(),
    hoy.getDate(),
  ).getTime();
  const bandas: { etiqueta: string; desde: number }[] = [
    { etiqueta: "Hoy", desde: inicioHoy },
    { etiqueta: "Ayer", desde: inicioHoy - DIA_MS },
    { etiqueta: "Últimos 7 días", desde: inicioHoy - 6 * DIA_MS },
    { etiqueta: "Anteriores", desde: Number.NEGATIVE_INFINITY },
  ];
  const grupos: { etiqueta: string; items: ConversacionGuardada[] }[] = [];
  for (const item of items) {
    const etiqueta = bandas.find((b) => item.actualizadaEn >= b.desde)!
      .etiqueta;
    const ultimo = grupos[grupos.length - 1];
    if (ultimo?.etiqueta === etiqueta) {
      ultimo.items.push(item);
    } else {
      grupos.push({ etiqueta, items: [item] });
    }
  }
  return grupos;
}

function ItemConversacion({
  item,
  activa,
  onAbrir,
  onEliminar,
}: {
  item: ConversacionGuardada;
  activa: boolean;
  onAbrir: () => void;
  onEliminar: () => void;
}) {
  return (
    <li className="group relative">
      <button
        type="button"
        onClick={onAbrir}
        aria-current={activa || undefined}
        title={item.titulo}
        className={cn(
          "w-full truncate rounded-lg px-2.5 py-2 pr-8 text-start text-micro transition-all focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50",
          activa
            ? "bg-ficha font-medium text-tinta shadow-sm ring-1 ring-linea"
            : "text-piedra hover:bg-ficha/70 hover:text-tinta",
        )}
      >
        {item.titulo ?? "Conversación sin título"}
      </button>
      <button
        type="button"
        onClick={onEliminar}
        aria-label={`Eliminar «${item.titulo ?? "conversación"}»`}
        title="Eliminar conversación"
        className="absolute top-1/2 right-1.5 -translate-y-1/2 rounded-md p-1 text-piedra opacity-0 transition-opacity group-hover:opacity-100 hover:text-destructive focus-visible:opacity-100 focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50"
      >
        <Trash2Icon className="size-3.5" aria-hidden="true" />
      </button>
    </li>
  );
}

/**
 * Columna de conversaciones anteriores, estilo ChatGPT/Gemini: agrupadas por
 * fecha, click para retomar (la sesión durable de eve sigue viva en el
 * servidor y se resume), tachito para borrar el acceso local.
 */
function BarraConversaciones({
  items,
  activaId,
  onNueva,
  onAbrir,
  onEliminar,
  onOcultar,
}: {
  items: ConversacionGuardada[];
  activaId: string | undefined;
  onNueva: () => void;
  onAbrir: (item: ConversacionGuardada) => void;
  onEliminar: (item: ConversacionGuardada) => void;
  onOcultar: () => void;
}) {
  const grupos = agruparPorFecha(items);
  return (
    <aside
      aria-label="Conversaciones anteriores"
      className="flex w-48 shrink-0 flex-col border-r border-linea bg-papel/60"
    >
      <div className="space-y-2.5 border-b border-linea p-3">
        <div className="flex items-center justify-between px-0.5">
          <span className="text-[0.65rem] font-semibold tracking-wider text-piedra/80 uppercase">
            Conversaciones
          </span>
          <span className="flex items-center gap-0.5">
            {items.length > 0 && (
              <span className="mr-1 text-micro text-piedra">
                {items.length}
              </span>
            )}
            <button
              type="button"
              onClick={onOcultar}
              aria-label="Ocultar conversaciones"
              title="Ocultar conversaciones"
              className="rounded-md p-1 text-piedra transition-colors hover:bg-foreground/[0.06] hover:text-tinta focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50"
            >
              <PanelLeftCloseIcon className="size-3.5" aria-hidden="true" />
            </button>
          </span>
        </div>
        <button
          type="button"
          onClick={onNueva}
          className="inline-flex w-full items-center justify-center gap-1.5 rounded-lg border border-linea bg-ficha px-2.5 py-2 text-micro font-medium text-tinta shadow-sm transition-all hover:border-piedra/40 hover:shadow focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50"
        >
          <MessageSquarePlusIcon
            className="size-3.5 text-piedra"
            aria-hidden="true"
          />
          Nueva conversación
        </button>
      </div>
      <nav className="flex-1 overflow-y-auto px-2 py-2">
        {items.length === 0 ? (
          <p className="px-2.5 py-6 text-center text-micro text-piedra">
            Todavía no hay conversaciones guardadas.
          </p>
        ) : (
          grupos.map((grupo) => (
            <section key={grupo.etiqueta} className="mb-1">
              <h3 className="px-2.5 pt-2.5 pb-1 text-[0.65rem] font-semibold tracking-wider text-piedra/70 uppercase">
                {grupo.etiqueta}
              </h3>
              <ul className="space-y-0.5">
                {grupo.items.map((item) => (
                  <ItemConversacion
                    key={item.session.sessionId}
                    item={item}
                    activa={item.session.sessionId === activaId}
                    onAbrir={() => onAbrir(item)}
                    onEliminar={() => onEliminar(item)}
                  />
                ))}
              </ul>
            </section>
          ))
        )}
      </nav>
    </aside>
  );
}

/**
 * Mantiene la lista de conversaciones en localStorage y decide cuál monta el
 * runtime. `slot` es la key del runtime: cambiarla remonta con otra sesión.
 * Cuando un chat nuevo emite su sessionId se guarda como ítem, pero el slot
 * no cambia — remontar a mitad de un turno rompería el stream en curso.
 */
function GestorConsultas() {
  const [guardadas, setGuardadas] = useState<ConsultasGuardadas>(
    leerConsultasGuardadas,
  );
  const [slot, setSlot] = useState(
    () => guardadas.activa ?? `nueva-${crypto.randomUUID()}`,
  );
  const [sesionActual, setSesionActual] = useState<
    ClientSessionState | undefined
  >(() =>
    guardadas.items.find((i) => i.session.sessionId === guardadas.activa)
      ?.session,
  );

  useEffect(() => {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(guardadas));
    } catch {
      // localStorage lleno o no disponible: las sesiones viven en el servidor.
    }
  }, [guardadas]);

  const itemsOrdenados = [...guardadas.items].sort(
    (a, b) => b.actualizadaEn - a.actualizadaEn,
  );
  const activa = guardadas.items.find(
    (i) => i.session.sessionId === slot,
  );

  const registrarSesion = (session: ClientSessionState | undefined) => {
    setSesionActual(session);
    if (!session) return;
    setGuardadas((prev) => {
      const indice = prev.items.findIndex(
        (i) => i.session.sessionId === session.sessionId,
      );
      const items =
        indice === -1
          ? [
              { session, actualizadaEn: Date.now() },
              ...prev.items,
            ]
          : prev.items.map((i, n) =>
              n === indice
                ? { ...i, session, actualizadaEn: Date.now() }
                : i,
            );
      return { ...prev, activa: session.sessionId, items };
    });
  };

  const registrarTurnoFinalizado = (snapshot: {
    events: readonly MessageStreamEvent[];
    session: ClientSessionState | undefined;
  }) => {
    const { session, events } = snapshot;
    if (!session) return;
    setGuardadas((prev) => {
      const existe = prev.items.some(
        (i) => i.session.sessionId === session.sessionId,
      );
      const items = existe
        ? prev.items.map((i) =>
            i.session.sessionId === session.sessionId
              ? {
                  ...i,
                  session,
                  events,
                  titulo: tituloDeEventos(events) ?? i.titulo,
                  actualizadaEn: Date.now(),
                }
              : i,
          )
        : [
            {
              session,
              events,
              titulo: tituloDeEventos(events),
              actualizadaEn: Date.now(),
            },
            ...prev.items,
          ];
      return { ...prev, activa: session.sessionId, items };
    });
  };

  const nuevaConversacion = () => {
    setSlot(`nueva-${crypto.randomUUID()}`);
    setSesionActual(undefined);
  };

  const eliminarConversacion = (item: ConversacionGuardada) => {
    setGuardadas((prev) => ({
      ...prev,
      items: prev.items.filter(
        (i) => i.session.sessionId !== item.session.sessionId,
      ),
    }));
    if (item.session.sessionId === sesionActual?.sessionId) {
      nuevaConversacion();
    }
  };

  const barraVisible = guardadas.barraOculta !== true;
  const alternarBarra = (visible: boolean) =>
    setGuardadas((prev) => ({ ...prev, barraOculta: !visible }));

  return (
    <div className="flex h-full">
      {barraVisible && (
        <BarraConversaciones
          items={itemsOrdenados}
          activaId={sesionActual?.sessionId}
          onNueva={nuevaConversacion}
          onAbrir={(item) => {
            setSlot(item.session.sessionId);
            setSesionActual(item.session);
          }}
          onEliminar={eliminarConversacion}
          onOcultar={() => alternarBarra(false)}
        />
      )}
      <div className="relative min-w-0 flex-1">
        {!barraVisible && (
          <button
            type="button"
            onClick={() => alternarBarra(true)}
            aria-label="Mostrar conversaciones"
            title="Mostrar conversaciones"
            className="absolute top-2.5 left-2.5 z-10 rounded-lg border border-linea bg-ficha p-1.5 text-piedra shadow-sm transition-colors hover:text-tinta focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50"
          >
            <PanelLeftOpenIcon className="size-4" aria-hidden="true" />
          </button>
        )}
        <ConsultaRuntime
          key={slot}
          inicial={activa}
          onSessionChange={registrarSesion}
          onFinish={registrarTurnoFinalizado}
        />
      </div>
    </div>
  );
}

const suscripcionVacia = () => () => {};

export function Consulta() {
  // Las conversaciones guardadas viven en localStorage: esperar a montar en
  // el cliente para no romper la hidratación del shell del panel.
  // useSyncExternalStore devuelve false en el servidor y true tras la
  // hidratación.
  const montado = useSyncExternalStore(
    suscripcionVacia,
    () => true,
    () => false,
  );

  if (!montado) {
    return (
      <div
        role="status"
        className="flex h-full items-center justify-center text-sm text-muted-foreground"
      >
        Cargando la consulta…
      </div>
    );
  }

  return <GestorConsultas />;
}
