# 01: Prefactor y tool de stock vía módulo de dominio

**What to build:** la minera pregunta en la consulta "¿qué insumos están bajo el punto de reorden?" y el agente responde con el stock real (cantidad actual, punto de reorden, estado y días restantes), obtenido a través del módulo de dominio de compras. Si no hay stock cargado, el agente lo dice.

Para llegar ahí, este ticket deja el terreno listo para las otras tools:

- El runtime de eve puede importar el módulo de dominio de compras sin que falle el guard de solo-servidor. Arreglo menos invasivo: preferentemente la condición de resolución en el bundler de eve si sus docs instaladas lo soportan; si no, separar el guard en el punto de entrada que consume Next. El módulo sigue sin poder importarse desde componentes cliente.
- Se descarta el trabajo parcial de tools con cliente Supabase propio y su helper. Se conserva la tool que deshabilita la búsqueda web (la key no tiene cuota de grounding).
- La configuración de Vitest incluye los tests de las tools del agente.
- Las instrucciones del agente indican usar las tools para obtener datos y decir explícitamente cuando una tool devuelve vacío.

Spec: `.scratch/tools-agente/spec.md`. Vocabulario: `GLOSSARY.md`. Leer `node_modules/eve/docs/` (tools, bundler/config) antes de escribir código. Skills: `tdd`.

**Blocked by:** None (can start immediately)

**Status:** ready-for-agent

- [ ] El runtime de eve importa el módulo de dominio de compras sin error (verificado con `pnpm dev` y `/eve/v1/health` en ready)
- [ ] El módulo de dominio sigue protegido: importarlo desde un componente cliente falla el build
- [ ] No quedan tools ni helpers que accedan a Supabase directo desde el agente; la tool que deshabilita la búsqueda web sigue
- [ ] Existe la tool de consultar stock: devuelve por insumo cantidad actual, punto de reorden, consumo mensual, estado y días restantes; filtro opcional para solo los insumos en alerta
- [ ] Sin stock cargado, la tool devuelve lista vacía (no error)
- [ ] La salida es JSON compacto pensado para el modelo, con vocabulario del glosario
- [ ] Las instrucciones del agente piden usar las tools y declarar cuando no hay datos; las reglas de dominio acotado y rechazo fijo no cambian
- [ ] Tests de Vitest de la tool por su interfaz contra el seed en memoria: listado completo con estado y días restantes; filtro de alertas
- [ ] `pnpm test`, `pnpm lint`, `pnpm exec tsc --noEmit` y `pnpm build` pasan
