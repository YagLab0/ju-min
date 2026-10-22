# 08: E2E del flujo completo del demo

**What to build:** el equipo puede correr un solo test que confirma que el demo funciona de punta a punta antes de presentar: entrar a la landing, ir al panel, ver la alerta de stock, consultar al agente desde la alerta, recibir la recomendación, abrir la ficha del proveedor verificado, usar el contacto simulado, volver, aprobar la recomendación y verla aprobada en el historial. Además se verifica que la landing muestra el respaldo SVG del estante con reduced motion.

Spec: `docs/orden-desarrollo.md` (sección "Testing Decisions"). Vocabulario: `GLOSSARY.md`. Skill: `playwright-cli` para generar, correr y depurar los tests.

**Blocked by:** 06 (Aprobar o rechazar recomendaciones e historial), 07 (Landing con estante 3D)

**Status:** ready-for-agent

- [ ] Un test de Playwright recorre el flujo completo del demo descrito arriba
- [ ] Los selectores usan roles y textos accesibles, no clases de CSS
- [ ] Un test emula `prefers-reduced-motion` y verifica la pose fija o el respaldo del estante en la landing
- [ ] Los tests levantan el servidor solos y no dependen de red externa
- [ ] Hay un script en `package.json` para correrlos y la instrucción está en el README
- [ ] Los tests pasan de forma estable en tres corridas seguidas
