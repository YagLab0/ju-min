# 05: Agente guionado: consultas y recomendaciones

**What to build:** desde una alerta de stock del panel, la minera le hace una consulta al agente sin escribir el contexto a mano; también puede escribir consultas libres (por ejemplo "¿quién me entrega guantes más rápido?"). El agente responde con recomendaciones: cada una indica el insumo, la oferta elegida, el proveedor verificado, el precio, el lead time, el trust score y una justificación en lenguaje claro. Si no puede recomendar nada, explica por qué. Cada recomendación nueva queda en la cola de pendientes del panel.

El agente se define como una interfaz (entra una consulta, salen cero o más recomendaciones) que se ejecuta en el servidor y obtiene datos solo a través del módulo de dominio de compras. La implementación de este ticket es guionada y determinística, así el demo funciona sin conexión. El LLM real queda pendiente: se enchufará después detrás de la misma interfaz, usando esta implementación como respaldo.

Spec: `docs/orden-desarrollo.md` (sección "Agente"). Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` antes de escribir código. Skills: `tdd`.

**Blocked by:** 04 (Panel: stock con alertas de punto de reorden)

**Status:** ready-for-agent

- [ ] Existe una interfaz única del agente: consulta (texto y, opcionalmente, el insumo en alerta que la originó) → cero o más recomendaciones
- [ ] La interfaz de usuario invoca al agente en el servidor y no conoce su implementación
- [ ] Para un insumo en alerta, la implementación guionada elige una oferta existente de un proveedor verificado con una regla explícita que combina trust score, lead time y precio
- [ ] La justificación menciona precio, lead time y trust score de la oferta elegida
- [ ] Una consulta libre reconocible produce recomendaciones; una no reconocible produce cero recomendaciones con un motivo visible
- [ ] Desde cada alerta del panel se puede iniciar una consulta con el insumo ya cargado
- [ ] Las recomendaciones nuevas aparecen en la cola de pendientes del panel
- [ ] Consultas y recomendaciones se guardan en memoria del servidor durante la sesión del demo
- [ ] Tests de Vitest del agente por su interfaz: elección determinística, justificación completa, caso sin recomendaciones
- [ ] `pnpm build`, `pnpm lint` y los tests pasan
