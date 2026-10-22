# 06: Aprobar o rechazar recomendaciones e historial

**What to build:** en el panel, la minera aprueba o rechaza cada recomendación pendiente; la decisión queda registrada y la recomendación sale de la cola de pendientes. El historial de consultas muestra cada consulta con sus recomendaciones y el estado de cada una (pendiente, aprobada, rechazada). Desde cualquier recomendación puede abrir la ficha del proveedor verificado en el explorer para revisarlo antes de decidir.

Spec: `docs/orden-desarrollo.md`. Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` antes de escribir código. Skills: `tdd`.

**Blocked by:** 03 (Ficha del proveedor verificado), 05 (Agente guionado: consultas y recomendaciones)

**Status:** done

- [x] Cada recomendación pendiente tiene acciones de aprobar y rechazar
- [x] Una recomendación decidida no se puede volver a decidir
- [x] La cola de pendientes y las recomendaciones decididas se ven separadas
- [x] El historial lista las consultas con sus recomendaciones y el estado de cada una
- [x] Cada recomendación enlaza a la ficha de su proveedor verificado
- [x] Las acciones usan nombres consistentes en botón y confirmación (ej. "Aprobar" → "Aprobada")
- [x] Tests de Vitest del módulo de dominio: pendiente → aprobada, pendiente → rechazada, rechazo de una segunda decisión
- [x] `pnpm build`, `pnpm lint` y los tests pasan
