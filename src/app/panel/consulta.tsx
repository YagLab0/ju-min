"use client";

import { useState, useSyncExternalStore } from "react";
import { AssistantRuntimeProvider, useAui } from "@assistant-ui/react";
import { useEveAgentRuntime, useEveReset } from "@assistant-ui/eve";
import { MessageSquarePlusIcon } from "lucide-react";
import { Thread } from "@/components/assistant-ui/elements/thread.aui";
import type { ClientSessionState, MessageStreamEvent } from "eve/client";

const STORAGE_KEY = "ju-min.consulta";

type ConsultaGuardada = {
  events?: readonly MessageStreamEvent[];
  session?: ClientSessionState;
};

function leerConsultaGuardada(): ConsultaGuardada {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return {};
    const parsed: unknown = JSON.parse(raw);
    return typeof parsed === "object" && parsed !== null
      ? (parsed as ConsultaGuardada)
      : {};
  } catch {
    return {};
  }
}

function actualizarConsultaGuardada(patch: ConsultaGuardada) {
  try {
    const actual = { ...leerConsultaGuardada(), ...patch };
    localStorage.setItem(STORAGE_KEY, JSON.stringify(actual));
  } catch {
    // localStorage no disponible o lleno: la sesión sigue viva en el servidor.
  }
}

function borrarConsultaGuardada() {
  try {
    localStorage.removeItem(STORAGE_KEY);
  } catch {
    // localStorage no disponible: la sesión sigue viva en el servidor.
  }
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
 * Cierra la sesión durable actual y arranca una conversación vacía. Hay que
 * borrar el localStorage además de llamar a `reset()`: la sesión persistida
 * puede apuntar a un run de dev que ya no existe (el server se reinicia sin
 * `--resume` y los runs quedan dormant), y si quedara guardada el próximo
 * reload intentaría resumirla y volvería a fallar.
 */
function BotonNuevaConsulta() {
  const reset = useEveReset();
  return (
    <button
      type="button"
      onClick={() => {
        borrarConsultaGuardada();
        reset();
      }}
      className="inline-flex items-center gap-1.5 rounded-lg px-2.5 py-1.5 text-xs font-medium text-piedra transition-colors hover:bg-foreground/5 hover:text-tinta focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring/50"
    >
      <MessageSquarePlusIcon className="size-3.5" aria-hidden="true" />
      Nueva conversación
    </button>
  );
}

/**
 * Área de consulta: monta el runtime de eve (`useEveAgentRuntime`) y renderiza
 * el Thread de assistant-ui. La sesión durable de eve se persiste en
 * localStorage para retomarla al recargar.
 */
function ConsultaRuntime() {
  const [guardada] = useState<ConsultaGuardada>(leerConsultaGuardada);

  const runtime = useEveAgentRuntime({
    initialEvents: guardada.events ?? [],
    initialSession: guardada.session,
    resume: guardada.session !== undefined,
    onSessionChange(session) {
      if (session) {
        actualizarConsultaGuardada({ session });
      } else {
        borrarConsultaGuardada();
      }
    },
    onFinish(snapshot) {
      actualizarConsultaGuardada({
        events: snapshot.events,
        ...(snapshot.session ? { session: snapshot.session } : {}),
      });
    },
  });

  return (
    <AssistantRuntimeProvider runtime={runtime}>
      <div className="flex h-full flex-col">
        <div className="flex justify-end px-3 pt-2">
          <BotonNuevaConsulta />
        </div>
        <div className="min-h-0 flex-1">
          <Thread components={{ Welcome: BienvenidaAgente }} />
        </div>
      </div>
    </AssistantRuntimeProvider>
  );
}

const suscripcionVacia = () => () => {};

export function Consulta() {
  // La sesión guardada vive en localStorage: esperar a montar en el cliente
  // para no romper la hidratación del shell del panel. useSyncExternalStore
  // devuelve false en el servidor y true tras la hidratación.
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

  return <ConsultaRuntime />;
}
