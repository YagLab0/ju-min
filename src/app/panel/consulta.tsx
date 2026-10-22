"use client";

import { useEffect, useState, useSyncExternalStore } from "react";
import { AssistantRuntimeProvider, useAui } from "@assistant-ui/react";
import { useEveAgentRuntime } from "@assistant-ui/eve";
import { MessageSquarePlusIcon, Trash2Icon } from "lucide-react";
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
          "w-full truncate rounded-lg px-2.5 py-2 pr-8 text-start text-xs transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50",
          activa
            ? "bg-foreground/[0.07] font-medium text-tinta"
            : "text-piedra hover:bg-foreground/[0.04] hover:text-tinta",
        )}
      >
        {item.titulo ?? "Conversación sin título"}
      </button>
      <button
        type="button"
        onClick={onEliminar}
        aria-label={`Eliminar «${item.titulo ?? "conversación"}»`}
        title="Eliminar conversación"
        className="absolute top-1/2 right-1.5 -translate-y-1/2 rounded-md p-1 text-piedra opacity-0 transition-opacity group-hover:opacity-100 hover:bg-foreground/[0.06] hover:text-destructive focus-visible:opacity-100 focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50"
      >
        <Trash2Icon className="size-3.5" aria-hidden="true" />
      </button>
    </li>
  );
}

/**
 * Columna de conversaciones anteriores, estilo ChatGPT/Gemini: lista por
 * recientes, click para retomar (la sesión durable de eve sigue viva en el
 * servidor y se resume), tachito para borrar el acceso local.
 */
function BarraConversaciones({
  items,
  activaId,
  onNueva,
  onAbrir,
  onEliminar,
}: {
  items: ConversacionGuardada[];
  activaId: string | undefined;
  onNueva: () => void;
  onAbrir: (item: ConversacionGuardada) => void;
  onEliminar: (item: ConversacionGuardada) => void;
}) {
  return (
    <aside
      aria-label="Conversaciones anteriores"
      className="flex w-44 shrink-0 flex-col border-r border-linea"
    >
      <div className="p-2">
        <button
          type="button"
          onClick={onNueva}
          className="inline-flex w-full items-center gap-1.5 rounded-lg px-2.5 py-2 text-xs font-medium text-piedra transition-colors hover:bg-foreground/[0.05] hover:text-tinta focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50"
        >
          <MessageSquarePlusIcon className="size-3.5" aria-hidden="true" />
          Nueva conversación
        </button>
      </div>
      <ul className="flex-1 space-y-0.5 overflow-y-auto px-2 pb-2">
        {items.map((item) => (
          <ItemConversacion
            key={item.session.sessionId}
            item={item}
            activa={item.session.sessionId === activaId}
            onAbrir={() => onAbrir(item)}
            onEliminar={() => onEliminar(item)}
          />
        ))}
      </ul>
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

  return (
    <div className="flex h-full">
      <BarraConversaciones
        items={itemsOrdenados}
        activaId={sesionActual?.sessionId}
        onNueva={nuevaConversacion}
        onAbrir={(item) => {
          setSlot(item.session.sessionId);
          setSesionActual(item.session);
        }}
        onEliminar={eliminarConversacion}
      />
      <div className="min-w-0 flex-1">
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
