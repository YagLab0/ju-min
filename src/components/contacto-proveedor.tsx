"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import { createPortal } from "react-dom";

const SELECTOR_ENFOCABLES =
  'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])';

interface BotonContactoProveedorProps {
  nombreProveedor: string;
  email: string | null;
  telefono: string | null;
}

/** Botón de contacto del demo: abre un modal simulado que confirma la acción
 * sin enviar nada (no hay llamadas externas). Accesible por teclado: Escape
 * cierra, Tab queda atrapado dentro del diálogo y el foco vuelve al botón. */
export function BotonContactoProveedor({
  nombreProveedor,
  email,
  telefono,
}: BotonContactoProveedorProps) {
  const [abierto, setAbierto] = useState(false);
  const [confirmado, setConfirmado] = useState(false);
  const dialogoRef = useRef<HTMLDivElement>(null);

  const cerrar = useCallback(() => {
    setAbierto(false);
    setConfirmado(false);
  }, []);

  useEffect(() => {
    if (!abierto) return;

    const dialogo = dialogoRef.current;
    const focoPrevio =
      document.activeElement instanceof HTMLElement
        ? document.activeElement
        : null;

    const enfocables = () =>
      Array.from(
        dialogo?.querySelectorAll<HTMLElement>(SELECTOR_ENFOCABLES) ?? [],
      );

    enfocables()[0]?.focus();

    const onKeyDown = (evento: KeyboardEvent) => {
      if (evento.key === "Escape") {
        evento.preventDefault();
        cerrar();
        return;
      }
      if (evento.key !== "Tab" || !dialogo) return;
      const items = enfocables();
      if (items.length === 0) return;
      const primero = items[0];
      const ultimo = items[items.length - 1];
      const activo = document.activeElement;
      if (evento.shiftKey && (activo === primero || !dialogo.contains(activo))) {
        evento.preventDefault();
        ultimo.focus();
      } else if (!evento.shiftKey && activo === ultimo) {
        evento.preventDefault();
        primero.focus();
      }
    };

    document.addEventListener("keydown", onKeyDown);
    const overflowPrevio = document.body.style.overflow;
    document.body.style.overflow = "hidden";

    return () => {
      document.removeEventListener("keydown", onKeyDown);
      document.body.style.overflow = overflowPrevio;
      focoPrevio?.focus();
    };
  }, [abierto, cerrar]);

  return (
    <>
      <button
        type="button"
        onClick={() => setAbierto(true)}
        aria-haspopup="dialog"
        className="bg-senal px-5 py-2.5 font-display font-semibold text-grafito transition-colors hover:bg-sal"
      >
        Contactar al proveedor
      </button>
      {abierto &&
        createPortal(
          <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
            <div
              className="absolute inset-0 bg-grafito/80"
              aria-hidden="true"
              onClick={cerrar}
            />
            <div
              ref={dialogoRef}
              role="dialog"
              aria-modal="true"
              aria-labelledby="contacto-titulo"
              className="relative w-full max-w-md border border-bruma/25 bg-roca"
            >
              <div className="franja-seguridad h-1.5" aria-hidden="true" />
              <div className="p-5">
                {confirmado ? (
                  <div role="status">
                    <h2
                      id="contacto-titulo"
                      className="font-display text-subtitulo font-semibold text-sal"
                    >
                      Contacto registrado
                    </h2>
                    <p className="mt-2 text-detalle text-bruma">
                      Tu pedido de contacto con {nombreProveedor} quedó
                      registrado. Esto es una simulación del demo: no se envió
                      ningún mensaje.
                    </p>
                    <button
                      type="button"
                      onClick={cerrar}
                      className="mt-5 bg-senal px-5 py-2.5 font-display font-semibold text-grafito transition-colors hover:bg-sal"
                    >
                      Cerrar
                    </button>
                  </div>
                ) : (
                  <>
                    <h2
                      id="contacto-titulo"
                      className="font-display text-subtitulo font-semibold text-sal"
                    >
                      Contactar a {nombreProveedor}
                    </h2>
                    <p className="mt-2 text-detalle text-bruma">
                      En el demo el contacto es simulado: al confirmar no se
                      envía ningún mensaje al proveedor.
                    </p>
                    {(email || telefono) && (
                      <dl className="mt-4 space-y-1 text-detalle">
                        {email && (
                          <div className="flex gap-2">
                            <dt className="text-bruma">Email</dt>
                            <dd className="text-sal">{email}</dd>
                          </div>
                        )}
                        {telefono && (
                          <div className="flex gap-2">
                            <dt className="text-bruma">Teléfono</dt>
                            <dd className="text-sal">{telefono}</dd>
                          </div>
                        )}
                      </dl>
                    )}
                    <div className="mt-5 flex flex-wrap items-center gap-3">
                      <button
                        type="button"
                        onClick={() => setConfirmado(true)}
                        className="bg-senal px-5 py-2.5 font-display font-semibold text-grafito transition-colors hover:bg-sal"
                      >
                        Confirmar contacto
                      </button>
                      <button
                        type="button"
                        onClick={cerrar}
                        className="border border-bruma/40 px-5 py-2.5 font-display font-semibold text-sal transition-colors hover:border-senal hover:text-senal"
                      >
                        Cancelar
                      </button>
                    </div>
                  </>
                )}
              </div>
            </div>
          </div>,
          document.body,
        )}
    </>
  );
}
