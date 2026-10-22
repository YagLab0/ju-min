# 04: Panel: stock con alertas de punto de reorden

**What to build:** la minera entra a `/panel` y ve todos sus insumos con stock actual, punto de reorden y días de stock restantes según su consumo. Los insumos por debajo del punto de reorden aparecen destacados como alerta, para saber qué reponer primero. Al abrir el demo ya hay al menos una alerta visible, sin preparación en vivo. El panel es 2D, sobrio y sin elementos decorativos.

Spec: `docs/orden-desarrollo.md`. Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` antes de escribir código. Skills: `tdd`, `frontend-design`.

**Blocked by:** 02 (Explorer: listado de proveedores verificados)

**Status:** ready-for-agent

- [x] El módulo de dominio de compras expone el stock de la minera con el estado de cada insumo (normal o en alerta) y los días de stock restantes
- [x] `/panel` lista los insumos con stock, punto de reorden y días restantes
- [x] Los insumos en alerta se distinguen visualmente y no solo por color (texto o ícono)
- [x] Los insumos en alerta aparecen primero o en una sección propia
- [x] El seed garantiza al menos un insumo en alerta al arrancar
- [x] El panel no tiene 3D
- [x] Tests de Vitest: alerta por debajo del punto de reorden, comportamiento en el borde exacto y cálculo de días de stock
- [x] `pnpm build`, `pnpm lint` y los tests pasan
