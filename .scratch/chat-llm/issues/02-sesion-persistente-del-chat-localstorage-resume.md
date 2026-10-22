# 02: Sesión persistente del chat (localStorage + resume)

**What to build:** la minera recarga `/panel` y la conversación sigue donde quedó: el `sessionId` de la sesión durable de eve se guarda en `localStorage` después de la primera consulta aceptada, y al montar el chat se retoma esa sesión con `resume: true`, que reproduce el historial y sigue un turno en vuelo si lo hay. Una sola conversación por navegador; no hay selector ni lista de sesiones.

Spec: `.scratch/chat-llm/spec.md`. Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` y las docs de eve en `node_modules/eve/docs/` antes de escribir código. Skill: `playwright-cli` para el test.

**Blocked by:** 01 (Chat de consultas en /panel contra el agente eve)

**Status:** ready-for-agent

- [ ] Después de la primera consulta aceptada, el `sessionId` de eve queda guardado en `localStorage`
- [ ] Al recargar `/panel`, el chat retoma la sesión guardada y reproduce la conversación anterior
- [ ] Si un turno quedó en vuelo, el resume lo sigue mostrando
- [ ] Sin selector ni lista de sesiones: una conversación por navegador
- [ ] Test E2E con Playwright extendido: enviar consulta → respuesta → recargar `/panel` → la conversación restaurada es visible
- [ ] `pnpm build`, `pnpm lint` y el test E2E pasan
