"use client";

import { useState, useSyncExternalStore } from "react";
import { AssistantRuntimeProvider } from "@assistant-ui/react";
import { useEveAgentRuntime } from "@assistant-ui/eve";
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
      actualizarConsultaGuardada(session ? { session } : {});
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
      <Thread />
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
