"use client";

import { useEffect, useRef } from "react";
import {
  registrarPreview,
  type ArquetipoInsumo,
} from "./insumo-escena";

/**
 * Preview 3D de un insumo para las cards. Ocupa el área que le dé el padre:
 * el canvas queda transparente sobre el fondo/patrón de debajo (que es también
 * el respaldo si WebGL no está disponible o el contexto se pierde). three.js
 * se importa dinámicamente; el render lo hace el renderer offscreen
 * compartido de insumo-escena (un solo contexto WebGL para toda la página).
 */
export function PreviewInsumo({
  arquetipo,
  className,
}: {
  arquetipo: ArquetipoInsumo;
  className?: string;
}) {
  const hostRef = useRef<HTMLDivElement>(null);
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const host = hostRef.current;
    const canvas = canvasRef.current;
    if (!host || !canvas) return;

    let desregistrar: (() => void) | null = null;
    let disposed = false;

    async function load() {
      try {
        const three = await import("three");
        if (disposed) return;
        desregistrar = registrarPreview(three, {
          host: host!,
          canvas: canvas!,
          arquetipo,
        });
      } catch {
        // Sin librería 3D: queda el patrón de respaldo.
      }
    }
    void load();

    return () => {
      disposed = true;
      desregistrar?.();
    };
  }, [arquetipo]);

  return (
    <div ref={hostRef} className={className} aria-hidden="true">
      <canvas
        ref={canvasRef}
        className="h-full w-full opacity-0 transition-opacity duration-500 [[data-rendered=true]>&]:opacity-100"
      />
    </div>
  );
}
