# Spec: Chat de consultas con Assistant UI y agente eve (LLM)

**Status:** ready-for-agent

## Problem Statement

La minera no tiene dónde hacerle consultas al agente. El repo ya tiene un agente
eve montado en `/eve/v1/*` que responde con un LLM (Gemini vía Google AI
Studio), pero no existe ninguna interfaz para usarlo: el panel de la minera
todavía no existe y el agente solo es alcanzable por HTTP. Para el demo del
hackathon, el jurado tiene que poder escribirle una consulta al agente y ver la
respuesta en vivo.

## Solution

Una página `/panel` con un shell mínimo (encabezado + área de chat) donde la
minera le hace consultas al agente y ve las respuestas en streaming con formato
markdown. El chat es el contenido principal de la página; el panel de stock y
las alertas llegan después en tickets aparte y conviven en el mismo `/panel`.

El frontend usa Assistant UI conectado al agente eve por el runtime
`useEveAgentRuntime`, que habla con las sesiones durables de eve en `/eve/v1/*`
(same-origin, sin proxy extra). La conversación persiste en el navegador: al
recargar, la consulta retoma la misma sesión de eve.

## User Stories

1. Como minera, quiero entrar a `/panel` y ver un espacio para consultarle al agente, para resolver dudas de compra de insumos.
2. Como minera, quiero escribir una consulta en texto libre y enviarla, para pedirle una recomendación al agente.
3. Como minera, quiero ver la respuesta del agente aparecer en vivo (streaming), para no quedarme esperando a que termine.
4. Como minera, quiero que la respuesta del agente se vea con formato markdown (listas, negritas, código), para leerla mejor.
5. Como minera, quiero que al recargar la página la conversación siga donde quedó, para no perder el contexto de mis consultas.
6. Como minera, quiero que el área de consulta ocupe la vista de trabajo, para leer la conversación sin distracciones.
7. Como jurado del hackathon, quiero ver un chat funcionando contra un LLM real, para evaluar el producto de punta a punta.
8. Como presentador del demo, quiero que el chat arranque vacío la primera vez, para iniciar la consulta en vivo frente al jurado.
9. Como presentador del demo, quiero que toda la UI del chat esté en español, para que el demo sea coherente con el público.
10. Como integrante que implementa el panel de stock, quiero que `/panel` ya exista con un layout que deje lugar al chat, para agregar mi contenido sin mover el chat.
11. Como integrante que conecta el módulo de dominio, quiero que el chat no conozca la implementación del agente, para cambiar el agente sin tocar la UI.
12. Como minera, quiero ver los términos del dominio en la UI (Consulta, Agente), para entender la app en el vocabulario del producto.
13. Como minera, quiero ver indicación de que el agente está procesando mi consulta, para saber que la consulta llegó.
14. Como visitante en un celular, quiero que el chat se vea bien en pantallas angostas, para usarlo desde cualquier dispositivo.

## Implementation Decisions

- **Página `/panel` nueva** con shell mínimo: encabezado con la identidad del producto y el área de chat como contenido principal a pantalla completa. El layout deja espacio para que después conviva el panel de stock (otro ticket).
- **Assistant UI instalado a mano**, no por `eve add`: dependencias `@assistant-ui/react`, `@assistant-ui/eve`, `@assistant-ui/next`, y componentes generados con el CLI de assistant-ui (`thread`), que caen bajo `src/components/` con el alias `@/*` existente (`@/*` → `./src/*`). El item de registry `eve add @assistant-ui/eve-chat` queda descartado porque sobrescribe `app/page.tsx` (la landing) y asume el scaffold de Web Chat.
- **Runtime eve:** el componente de chat es client-side y usa `useEveAgentRuntime()` de `@assistant-ui/eve`, que adapta el hook `useEveAgent` de eve al `ExternalStoreRuntime` de assistant-ui. Se envuelve en `AssistantRuntimeProvider` y renderiza el componente `Thread`.
- **Config de Next:** `next.config.ts` queda `withEve(withAui(nextConfig))`, preservando las opciones existentes (`cacheComponents`, `partialPrefetching`, regla de Turbopack para Tailwind). `withAui` aplica el transform de assistant-ui; `withEve` monta el agente en `/eve/v1/*`.
- **Sesión durable persistida en el navegador:** después de la primera consulta aceptada se guarda el `sessionId` de eve en `localStorage`; al montar el componente, si hay `sessionId` guardado se pasa como `initialSession` con `resume: true`, que reproduce el historial y sigue un turno en vuelo si lo hay. Una sola conversación por navegador; no hay selector de sesiones.
- **Scope del chat:** enviar consulta de texto y renderizar la respuesta en streaming con markdown. Sin botón de "nueva consulta", sin UI de error personalizada, sin prompts sugeridos. El `Thread` default ya cubre composer, scroll, estados de carga y errores mínimos.
- **Copy:** todo en español con el vocabulario de `GLOSSARY.md`: "Consulta", "Agente". Evitado: "chat", "conversación", "bot", "asistente".
- **Estilo:** tema default de assistant-ui con ajuste mínimo. La identidad visual (grafito + amarillo industrial) es el ticket 01 del MVP y se aplica una sola vez en tokens, no acá.
- **El scaffold de ejemplo del CLI no se usa:** el CLI de assistant-ui genera `app/api/chat` y un `assistant.tsx` que hablan con el transport de AI SDK; ambos se descartan porque el runtime es eve, no una route handler de AI SDK. Las deps `@assistant-ui/ai-sdk` y `@ai-sdk/openai` no se instalan.
- **Componentes shadcn:** el CLI deja `components.json`, `src/lib/utils.ts` y componentes UI base (`button`, `tooltip`, etc.) que el `Thread` necesita. Se aceptan tal cual.
- **Auth:** en dev alcanza con `localDev()` de `agent/channels/eve.ts` (ya configurado). El `placeholderAuth()` de producción se resuelve en el ticket de deploy, no acá.
- **Credenciales:** el agente usa `GOOGLE_GENERATIVE_AI_API_KEY` desde `.env.local` (ya configurada). Sin key, el envío falla en el paso del modelo y eso es esperado, no un bug del frontend.

## Testing Decisions

- **Qué es un buen test:** verifica comportamiento externo por la interfaz pública (la página en un navegador real), nunca detalles internos de implementación ni contenido exacto del LLM, que es no determinístico.
- **Una sola costura, la más alta:** test E2E con Playwright contra la app real en `/panel`: enviar una consulta → esperar una respuesta no vacía del agente (verifica que llega texto, no su contenido) → recargar `/panel` → verificar que la conversación se restauró (resume desde localStorage). Corre contra eve + Gemini reales con la key de `.env.local`; es test de desarrollo, no de CI.
- **Sin costuras nuevas:** no hay Vitest. El único código propio es la persistencia de sesión en `localStorage`, que el escenario de recarga del E2E ya cubre desde afuera.
- **Prior art:** el ticket 08 del MVP usa Playwright para el flujo del demo y el repo tiene la skill `playwright-cli` para generar, correr y depurar los tests.

## Out of Scope

- El panel de stock con alertas de punto de reorden (ticket 04 del MVP).
- Iniciar consultas desde una alerta con el insumo ya cargado (depende del panel).
- Tools del agente y su UI: recomendaciones como cards con precio/lead time/trust score, aprobación humana de propuestas. El agente hoy responde solo texto.
- La implementación guionada del agente del spec del MVP (ticket 05) y su rol como respaldo: este spec usa el LLM directamente.
- Historial de consultas como lista, selector de sesiones, y la página `/consultas`.
- Identidad visual de marca (grafito/amarillo): ticket 01.
- Auth de producción en `agent/channels/eve.ts` y deploy a Vercel.
- Selector/creación de nuevas conversaciones.

## Further Notes

- **Desviación del spec del MVP:** `docs/orden-desarrollo.md` plantea el agente como interfaz con implementación guionada y el LLM después. Este spec implementa el chat directamente contra el agente eve con LLM (decisión del equipo: se usa LLM ya). La UI no conoce la implementación del agente, así que la costura se mantiene.
- eve está en beta (0.x): las docs de `node_modules/eve/docs/` tienen prioridad sobre eve.dev. Igual para Next 16: leer la guía relevante en `node_modules/next/dist/docs/` antes de escribir código.
- pnpm 12: build approvals en `allowBuilds` de `pnpm-workspace.yaml`; si `minimumReleaseAge` bloquea una dep nueva, resolver con `pnpm update <pkg>` a una versión anterior dentro del rango, no relajando la política.
- Referencia de arquitectura completa: `docs/flujo-agente.md`.
- Durante la preparación se verificó en un intento previo que el CLI de assistant-ui funciona con este repo (Tailwind 4, alias `@/*`, src dir): genera `components.json`, componentes en `src/components/`, `src/lib/utils.ts`, actualiza `globals.css` con el tema base shadcn e instala sus dependencias. Esos cambios se revirtieron; el implement debe repetirlos.
