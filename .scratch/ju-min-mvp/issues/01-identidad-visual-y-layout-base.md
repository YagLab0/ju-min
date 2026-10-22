# 01: Identidad visual y layout base

**What to build:** ju-min tiene una identidad visual propia de seguridad industrial minera (grafito, amarillo de señalización, tonos minerales de la Puna), claramente distinta de julit. Una navegación común lleva entre la landing, el panel de la minera y el explorer de proveedores verificados; las tres rutas existen y se pueden visitar aunque todavía tengan contenido mínimo. La página del scaffold de create-next-app desaparece. Este ticket es preparación previa para que las páginas siguientes se construyan directo con el estilo final.

Spec: `docs/orden-desarrollo.md`. Vocabulario: `GLOSSARY.md`. Antes de escribir código, leer la guía relevante de Next.js 16 en `node_modules/next/dist/docs/`. Usar la skill `frontend-design`.

**Blocked by:** None (can start immediately)

**Status:** ready-for-agent

- [x] Hay un plan de tokens documentado en el código del tema: 4 a 6 colores con nombre, tipografías con su rol y escala tipográfica, revisado contra los defaults genéricos que enumera `frontend-design`
- [x] Los tokens están disponibles como variables CSS y utilidades de Tailwind, para que el 3D pueda leer los colores desde CSS
- [x] Las rutas raíz, `/panel` y `/proveedores` responden y comparten la navegación
- [x] La página y los assets del scaffold de create-next-app fueron eliminados
- [x] Toda la interfaz está en español y usa los términos del glosario (minera, proveedor verificado, etc.)
- [x] Foco visible en enlaces y botones, contraste accesible, responsive hasta mobile
- [x] `pnpm build` y `pnpm lint` pasan
