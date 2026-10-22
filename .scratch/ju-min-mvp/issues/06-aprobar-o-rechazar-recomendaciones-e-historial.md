# 06: Aprobar o rechazar recomendaciones e historial

**What to build:** en el panel, la minera aprueba o rechaza cada recomendación pendiente; la decisión queda registrada y la recomendación sale de la cola de pendientes. El historial de consultas muestra cada consulta con sus recomendaciones y el estado de cada una (pendiente, aprobada, rechazada). Desde cualquier recomendación puede abrir la ficha del proveedor verificado en el explorer para revisarlo antes de decidir.

Spec: `docs/orden-desarrollo.md`. Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` antes de escribir código. Skills: `tdd`.

**Blocked by:** 03 (Ficha del proveedor verificado), 05 (Agente guionado: consultas y recomendaciones)

**Status:** ready-for-agent

- [ ] Cada recomendación pendiente tiene acciones de aprobar y rechazar
- [ ] Una recomendación decidida no se puede volver a decidir
- [ ] La cola de pendientes y las recomendaciones decididas se ven separadas
- [ ] El historial lista las consultas con sus recomendaciones y el estado de cada una
- [ ] Cada recomendación enlaza a la ficha de su proveedor verificado
- [ ] Las acciones usan nombres consistentes en botón y confirmación (ej. "Aprobar" → "Aprobada")
- [ ] Tests de Vitest del módulo de dominio: pendiente → aprobada, pendiente → rechazada, rechazo de una segunda decisión
- [ ] `pnpm build`, `pnpm lint` y los tests pasan
