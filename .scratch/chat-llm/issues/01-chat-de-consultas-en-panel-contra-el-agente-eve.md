# 01: Chat de consultas en /panel contra el agente eve

**What to build:** la minera entra a `/panel` y encuentra un espacio de consulta al agente: escribe una consulta en texto libre y ve la respuesta del agente aparecer en vivo con formato markdown. La página tiene un shell mínimo (encabezado con la identidad del producto + el chat como contenido principal) que después va a convivir con el panel de stock. Toda la UI está en español con el vocabulario del glosario: "Consulta", "Agente"; nunca "chat" ni "conversación". La instalación de Assistant UI es manual (dependencias + componente Thread por el CLI), el runtime es `useEveAgentRuntime` de `@assistant-ui/eve` envuelto en `AssistantRuntimeProvider`, y `next.config.ts` queda `withEve(withAui(nextConfig))` preservando las opciones existentes. El scaffold de ejemplo del CLI (`app/api/chat`, `assistant.tsx`, deps `@assistant-ui/ai-sdk`/`@ai-sdk/openai`) se descarta: el runtime es eve.

Spec: `.scratch/chat-llm/spec.md`. Vocabulario: `GLOSSARY.md`. Arquitectura: `docs/flujo-agente.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` y las docs de eve en `node_modules/eve/docs/` antes de escribir código. Skill: `playwright-cli` para el test.

**Blocked by:** None (can start immediately)

**Status:** ready-for-agent

- [x] `/panel` existe con shell mínimo: encabezado + área de consulta como contenido principal
- [x] Se puede enviar una consulta de texto y la respuesta del agente llega en streaming con markdown
- [x] La UI indica que el agente está procesando mientras la respuesta no llega
- [x] El copy usa los términos del glosario en español ("Consulta", "Agente")
- [x] Assistant UI instalado a mano: `@assistant-ui/react`, `@assistant-ui/eve`, `@assistant-ui/next` + componente Thread via CLI; sin `@assistant-ui/ai-sdk` ni `@ai-sdk/openai`
- [x] `next.config.ts` queda `withEve(withAui(nextConfig))` con `cacheComponents`, `partialPrefetching` y la regla de Turbopack intactos
- [x] Estilo: tema default de assistant-ui con ajuste mínimo; la identidad de marca es ticket 01 del MVP, no acá
- [x] Test E2E con Playwright: enviar una consulta en `/panel` produce una respuesta no vacía del agente (corre contra eve + Gemini reales, test de dev no CI)
- [x] `pnpm build`, `pnpm lint` y el test E2E pasan
