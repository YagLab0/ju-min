# 09: Mapa de Jujuy (opcional)

**What to build:** en el explorer, la minera ve la mina y los proveedores verificados sobre un mapa de Jujuy, para entender distancias y logística. Desde un proveedor del mapa puede abrir su ficha. Es la última tarea y solo se hace si sobra tiempo.

Adaptar (no copiar tal cual) la capa 3D de MapLibre y la mina procedural de julit (`/home/mauri/Escritorio/Projects/julit/app/explorer/components/mine-layer.ts` y `mine-geometry.ts`), con la identidad visual de ju-min.

Spec: `docs/orden-desarrollo.md` (sección "Mapa"). Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` antes de escribir código. Skill: `frontend-design`.

**Blocked by:** 03 (Ficha del proveedor verificado)

**Status:** ready-for-agent

- [ ] El explorer muestra un mapa de Jujuy con la mina de la minera y los proveedores verificados ubicados
- [ ] Cada proveedor del mapa enlaza a su ficha
- [ ] La mina se dibuja con geometría procedural, sin assets de terceros
- [ ] El mapa se carga de forma diferida y no bloquea el listado del explorer
- [ ] El listado sigue siendo usable sin el mapa (sin WebGL o si falla la carga)
- [ ] MapLibre agregado con una versión publicada hace al menos 7 días
- [ ] `pnpm build`, `pnpm lint` y los tests pasan
