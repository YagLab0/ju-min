# 03: Tool: listar ofertas de insumo (nombre o id)

**What to build:** la minera pregunta en la consulta "¿quién me entrega guantes más rápido?" usando el nombre común del insumo, y el agente compara las ofertas: precio, moneda, lead time, disponibilidad y el proveedor verificado con su trust score. Con esos datos recomienda en texto una oferta justificada con precio, lead time y trust score reales. Si el insumo no existe o no tiene ofertas, el agente lo dice.

La tool recibe el insumo por texto parcial o por id, resuelve los insumos que coinciden y devuelve sus ofertas. Obtiene los datos solo a través del módulo de dominio de compras (lectura de insumos y de ofertas). No registra recomendaciones: el agente es de solo lectura. Sigue el patrón establecido en el ticket 01.

Spec: `.scratch/tools-agente/spec.md`. Vocabulario: `GLOSSARY.md`. Leer `node_modules/eve/docs/` (tools) antes de escribir código. Skills: `tdd`.

**Blocked by:** 01 (Prefactor y tool de stock vía módulo de dominio)

**Status:** ready-for-agent

- [ ] Existe la tool de listar ofertas de insumo: acepta texto parcial (nombre común) o id del insumo
- [ ] Para cada insumo que coincide devuelve sus ofertas con precio, moneda, lead time, disponibilidad y proveedor verificado (nombre y trust score)
- [ ] Un insumo inexistente o sin ofertas devuelve lista vacía (no error)
- [ ] Acceso a datos solo por el módulo de dominio de compras; no escribe en la base
- [ ] La salida es JSON compacto pensado para el modelo, con vocabulario del glosario
- [ ] Tests de Vitest de la tool por su interfaz contra el seed en memoria: texto parcial resuelve al insumo con sus ofertas, búsqueda por id, insumo inexistente
- [ ] `pnpm test`, `pnpm lint` y `pnpm exec tsc --noEmit` pasan
