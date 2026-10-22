"use client";

import { useEffect, useRef, useState } from "react";
import {
  INSTANTE_ALERTA,
  createEstanteScene,
  type EstanteScene,
} from "./estante-escena";
import { EstanteFallback } from "./estante-fallback";
import { Button } from "./ui/button";
import styles from "./estante-3d.module.css";

/** Maqueta procedural: consumo → alerta → propuesta → aprobación humana → reposición. */
export function Estante3D() {
  const hostRef = useRef<HTMLDivElement>(null);
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [userPaused, setUserPaused] = useState(false);
  const pausedRef = useRef(false);
  const updatePlaybackRef = useRef<(() => void) | null>(null);

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
      host!.dataset.phase = "propuesta";
      host!.style.setProperty("--stock-level", "25%");
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
      if (!visible() || reducedMotion.matches || keyboard || pausedRef.current) {
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
      if (pausedRef.current) {
        cancelFrame();
        return;
      }
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
    updatePlaybackRef.current = () => {
      keyboard = false;
      updateVisibility();
    };

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
      updatePlaybackRef.current = null;
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
    <figure className={styles.figure}>
      <div className={styles.topline}>
        <span className={styles.title}><span aria-hidden="true" /> Operación en movimiento</span>
        <Button
          type="button"
          size="xs"
          variant="ghost"
          className={styles.playback}
          aria-label={userPaused ? "Reanudar escena 3D" : "Pausar escena 3D"}
          aria-pressed={userPaused}
          onClick={() => {
            const paused = !pausedRef.current;
            pausedRef.current = paused;
            setUserPaused(paused);
            updatePlaybackRef.current?.();
          }}
        >
          <svg viewBox="0 0 12 12" width="12" height="12" fill="currentColor" aria-hidden="true">
            {userPaused ? <path d="M3 1.5 10 6l-7 4.5z" /> : <path d="M2 2h3v8H2zm5 0h3v8H7z" />}
          </svg>
          {userPaused ? "Reanudar" : "Pausar"}
        </Button>
      </div>
      <div ref={hostRef} className={styles.stage} data-phase="propuesta" aria-hidden="true">
        <div className={styles.coordinate}>ALM–01 <span>/</span> VISTA DEMO</div>
        <div className={styles.visual}>
          <EstanteFallback className={styles.fallback} />
          <canvas ref={canvasRef} className={styles.canvas} />
        </div>
        <div className={styles.instrument}>
          <div className={styles.status}>
            <span className={styles.statusIcon}>
              <svg viewBox="0 0 20 20" width="20" height="20" fill="none">
                <path d="m5 10 3.2 3.2L15 6.5" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round" strokeLinejoin="round" />
              </svg>
            </span>
            <div>
              <span className={styles.eyebrow}>SEÑAL → DECISIÓN</span>
              <strong className={styles.stock}>Stock bajo control</strong>
              <strong className={styles.alerta}>Punto de reorden detectado</strong>
              <strong className={styles.propuesta}>Proveedor elegible encontrado</strong>
              <strong className={styles.aprobado}>Compra aprobada por vos</strong>
              <strong className={styles.repuesto}>Reposición de insumos</strong>
              <span className={styles.detailStock}>Monitoreo de insumos críticos</span>
              <span className={styles.detailAlert}>El agente prepara una recomendación</span>
              <span className={styles.detailProposal}>Certificaciones al día · Trust score 92</span>
              <span className={styles.detailApproved}>Decisión humana, siempre</span>
              <span className={styles.detailRestocked}>El almacén vuelve a estar listo</span>
            </div>
          </div>
          <div className={styles.level}>
            <span>STOCK</span>
            <div><i /></div>
            <small>Lubricante · 200 L</small>
          </div>
        </div>
      </div>
      <figcaption className="sr-only">
        Demostración de un almacén minero en miniatura, con estanterías, tambores,
        casco y mineral en un pallet. El stock baja, activa una alerta de reorden
        y genera una recomendación de proveedor certificado. Una persona aprueba
        la compra antes de la reposición. La secuencia se repite.
      </figcaption>
    </figure>
  );
}
