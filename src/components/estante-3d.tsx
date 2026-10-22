"use client";

import { useEffect, useRef } from "react";
import {
  INSTANTE_ALERTA,
  createEstanteScene,
  type EstanteScene,
} from "./estante-escena";
import { EstanteFallback } from "./estante-fallback";

/**
 * Estante de almacén 3D procedural (three.js, sin GLB): el stock de tambores
 * baja, cruza el punto de reorden, se enciende la alerta y entra la
 * recomendación del agente. three.js se importa dinámicamente cuando la pieza
 * se acerca a la pantalla; con `prefers-reduced-motion` o navegación por
 * teclado queda en una pose fija que igual muestra la alerta; ante pérdida del
 * contexto WebGL queda el SVG de respaldo, que también se muestra hasta que el
 * canvas renderiza.
 */
export function Estante3D() {
  const hostRef = useRef<HTMLDivElement>(null);
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const host = hostRef.current;
    const canvas = canvasRef.current;
    if (!host || !canvas) return;

    const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)");
    let disposed = false;
    let loading = false;
    let failed = false;
    let intersecting = false;
    let keyboard = false;
    let frame = 0;
    let previousTime: number | null = null;
    let tiempo = 0;
    let escena: EstanteScene | null = null;
    const visible = () =>
      intersecting && document.visibilityState === "visible";

    function cancelFrame() {
      window.cancelAnimationFrame(frame);
      frame = 0;
      previousTime = null;
    }
    function fail() {
      failed = true;
      cancelFrame();
      delete host!.dataset.rendered;
      canvas!.removeEventListener("webglcontextlost", contextLost);
      escena?.dispose();
      escena = null;
    }
    function render() {
      if (!escena || disposed || failed) return;
      try {
        if (!escena.render()) {
          fail();
          return;
        }
        host!.dataset.rendered = "true";
      } catch {
        fail();
      }
    }
    function tick(time: number) {
      frame = 0;
      if (disposed || failed || !escena) return;
      if (!visible() || reducedMotion.matches || keyboard) {
        updateVisibility();
        return;
      }
      if (previousTime !== null) {
        tiempo += (time - previousTime) / 1000;
      }
      previousTime = time;
      escena.pose(tiempo);
      render();
      if (!failed) frame = window.requestAnimationFrame(tick);
    }
    function updateVisibility() {
      if (!escena || disposed || failed) return;
      if (reducedMotion.matches || keyboard) {
        cancelFrame();
        // Pose fija con la alerta encendida y la recomendación visible.
        escena.pose(INSTANTE_ALERTA);
        render();
        return;
      }
      if (!visible()) {
        cancelFrame();
        return;
      }
      if (!frame) frame = window.requestAnimationFrame(tick);
    }
    function onKeyboard() {
      keyboard = true;
      updateVisibility();
    }
    function onPointer() {
      keyboard = false;
      updateVisibility();
    }
    function contextLost(event: Event) {
      event.preventDefault();
      fail();
    }
    function resize() {
      if (!escena || disposed || failed) return;
      try {
        escena.resize();
        render();
      } catch {
        fail();
      }
    }
    async function load() {
      if (loading || disposed || failed) return;
      loading = true;
      try {
        // La librería 3D llega solo cuando la pieza se acerca a la pantalla.
        const three = await import("three");
        if (disposed) return;
        escena = createEstanteScene(three, canvas!, host!);
        if (!escena) {
          fail();
          return;
        }
        escena.resize();
        escena.pose(reducedMotion.matches ? INSTANTE_ALERTA : 0);
        render();
        updateVisibility();
      } catch {
        if (!disposed) fail();
      }
    }

    canvas.addEventListener("webglcontextlost", contextLost);
    reducedMotion.addEventListener("change", updateVisibility);
    document.addEventListener("visibilitychange", updateVisibility);
    window.addEventListener("keydown", onKeyboard);
    window.addEventListener("pointerdown", onPointer);
    window.addEventListener("resize", resize);
    const resizeObserver =
      typeof ResizeObserver !== "undefined"
        ? new ResizeObserver(resize)
        : null;
    resizeObserver?.observe(host);
    const viewportObserver =
      typeof IntersectionObserver !== "undefined"
        ? new IntersectionObserver(
            ([entry]) => {
              intersecting = entry.isIntersecting;
              updateVisibility();
            },
            { threshold: 0.05 }
          )
        : null;
    const loadObserver =
      typeof IntersectionObserver !== "undefined"
        ? new IntersectionObserver(
            ([entry]) => {
              if (!entry.isIntersecting) return;
              loadObserver?.disconnect();
              void load();
            },
            { rootMargin: "240px" }
          )
        : null;
    viewportObserver?.observe(host);
    loadObserver?.observe(host);
    if (!loadObserver) {
      intersecting = true;
      void load();
    }

    return () => {
      disposed = true;
      cancelFrame();
      loadObserver?.disconnect();
      viewportObserver?.disconnect();
      resizeObserver?.disconnect();
      canvas.removeEventListener("webglcontextlost", contextLost);
      reducedMotion.removeEventListener("change", updateVisibility);
      document.removeEventListener("visibilitychange", updateVisibility);
      window.removeEventListener("keydown", onKeyboard);
      window.removeEventListener("pointerdown", onPointer);
      window.removeEventListener("resize", resize);
      escena?.dispose();
      delete host.dataset.rendered;
    };
  }, []);

  return (
    <figure className="border border-bruma/25 bg-roca">
      <div className="franja-seguridad h-2" aria-hidden="true" />
      <div
        ref={hostRef}
        className="group relative aspect-[4/3] w-full overflow-hidden"
        aria-hidden="true"
      >
        <EstanteFallback className="absolute inset-0 h-full w-full p-6 group-data-[rendered=true]:invisible" />
        <canvas
          ref={canvasRef}
          className="absolute inset-0 h-full w-full opacity-0 transition-opacity duration-500 group-data-[rendered=true]:opacity-100"
        />
      </div>
      <figcaption className="border-t border-bruma/25 px-4 py-3 text-detalle text-bruma">
        El stock del tambor baja y cruza el punto de reorden: se enciende la
        alerta y el agente entra con una recomendación de un proveedor
        verificado.
      </figcaption>
    </figure>
  );
}
