# Flujo del agente

Arquitectura del agente real (LLM) que se enchufa detrás de la interfaz definida
en `orden-desarrollo.md` (sección "Agente"). La implementación guionada queda
como respaldo.

## Piezas

- **eve** (Vercel, beta): framework del agente. Vive en `agent/` dentro del mismo
  repo Next.js. `withEve` en `next.config.ts` monta su API same-origin en
  `/eve/v1/*`: un solo `pnpm dev` levanta app y agente.
- **Google AI Studio**: el modelo es un `LanguageModel` directo de
  `@ai-sdk/google` (`gemini-3.8-flash`) con `GOOGLE_GENERATIVE_AI_API_KEY` en
  `.env.local`. No pasa por AI Gateway.
- **Assistant UI**: frontend del chat. `@assistant-ui/eve` expone
  `useEveAgentRuntime()`, que adapta el hook `useEveAgent` de eve al
  `ExternalStoreRuntime` de assistant-ui. Renderiza mensajes, tool calls,
  reasoning y los approvals human-in-the-loop de eve como UI de aprobación.

## Estructura del agente

```
agent/
├── agent.ts              # defineAgent({ model: google("gemini-3.8-flash") })
├── instructions.md       # system prompt del consultor de compras (español)
├── channels/eve.ts       # auth de /eve/v1: localDev() en dev, placeholder en prod
├── tools/                # (pendiente) acciones tipadas con zod
└── skills/               # (opcional) procedimientos que el modelo carga on demand
```

Tools previstos, sobre el módulo de dominio de compras:

- `get_stock` — stock de la minera con estado de cada insumo (normal / en alerta).
- `list_providers`, `get_provider` — red de proveedores verificados y trust score.
- `list_ofertas` — ofertas de un insumo (precio, unidad, lead time, disponibilidad).
- `propose_recommendation` — emite una recomendación; **gated por aprobación
  humana**, la recomendación queda pendiente hasta que la minera decide.
- `contact_provider` — contacto simulado (mock).

## Flujo de datos

1. El panel muestra alertas de stock desde el módulo de dominio (server
   components, sin agente).
2. La minera escribe una consulta en el chat (o la inicia desde una alerta, con
   el insumo ya cargado): `POST /eve/v1/session {message}` → sesión durable con
   `sessionId`.
3. eve corre el loop: `instructions.md` → tool calls contra el módulo de dominio
   → Gemini razona → stream NDJSON → assistant-ui renderiza en vivo.
4. El agente invoca `propose_recommendation` → se pausa esperando aprobación →
   assistant-ui muestra el approval card.
5. La minera aprueba o rechaza → la recomendación queda registrada con su
   decisión. La sesión es durable: `useEveAgentRuntime({ resume: true })`
   re-adjunta tras reload; cada `sessionId` equivale a una Consulta en el
   historial.

## Encaje con el MVP

- La interfaz pública no cambia: entra una consulta, salen cero o más
  recomendaciones. La implementación guionada sigue siendo el respaldo si el
  LLM falla (y para el demo sin conexión).
- Datos solo a través del módulo de dominio de compras: los tools de eve son la
  única vía de acceso del agente, igual que la implementación guionada.
- El historial de consultas del panel se alimenta de las sesiones de eve.

## Configuración y auth

- `GOOGLE_GENERATIVE_AI_API_KEY` en `.env.local` (gitignored; en deploy, env var
  del servidor).
- `agent/channels/eve.ts`: `localDev()` abre localhost en dev;
  `placeholderAuth()` rechaza requests de browser en producción hasta
  reemplazarlo por auth real (o `none()` para una demo pública).
- Producción local: `pnpm exec eve build` antes de `next start` (`next build`
  no compila el agente).

## Caveats

- eve está en beta (0.x): las docs de `node_modules/eve/docs/` tienen prioridad
  sobre eve.dev.
- Modelo directo (no Gateway): sin cost tracking de AI Gateway.
- Ver `AGENTS.md` para los detalles de pnpm 12 y comandos.
