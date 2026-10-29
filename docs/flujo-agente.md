# Flujo del agente

Arquitectura del agente real (LLM) que se enchufa detrás de la interfaz definida
en `orden-desarrollo.md` (sección "Agente"). La implementación guionada queda
como respaldo.

## Piezas

- **eve** (Vercel, beta): framework del agente. Vive en `agent/` dentro del mismo
  repo Next.js. `withEve` en `next.config.ts` monta su API same-origin en
  `/eve/v1/*`: un solo `pnpm dev` levanta app y agente.
- **Anthropic**: el modelo es un `LanguageModel` directo de
  `eve/models/anthropic` (`claude-haiku-5-5`) con `ANTHROPIC_API_KEY` en
  `.env.local`. No pasa por AI Gateway.
- **Assistant UI**: frontend del chat. `@assistant-ui/eve` expone
  `useEveAgentRuntime()`, que adapta el hook `useEveAgent` de eve al
  `ExternalStoreRuntime` de assistant-ui. Renderiza mensajes, tool calls,
  reasoning y los approvals human-in-the-loop de eve como UI de aprobación.

## Estructura del agente

```
agent/
├── agent.ts              # defineAgent({ model: anthropic("claude-haiku-5-5") })
├── instructions.md       # system prompt del consultor de compras (español)
├── channels/eve.ts       # auth de /eve/v1: localDev() en dev, placeholder en prod
└── tools/                # acciones tipadas con zod, de solo lectura
```

Tools, sobre el módulo de dominio de compras (el nombre sale del archivo):

- `consultar_stock` — stock de la minera con estado de cada insumo (normal /
  en alerta) y días restantes.
- `listar_proveedores_verificados` — red verificada con trust score,
  ubicación, provincias de operación, categorías y certificaciones.
- `listar_ofertas_de_insumo` — ofertas de un insumo por nombre común o id
  (precio, moneda, lead time, disponibilidad, proveedor verificado).
- `web_search` — archivo `disableTool()`: la key de modelo no tiene cuota de
  búsqueda y una búsqueda web contradice el dominio acotado.

El agente es de solo lectura: recomienda en el texto de la consulta con
precio, lead time y trust score reales; no registra recomendaciones en el
panel (las registra el agente guionado al usar «Pedir recomendación», y de
ahí sale el informe PDF).

## Flujo de datos

1. El panel muestra alertas de stock desde el módulo de dominio (server
   components, sin agente).
2. La minera escribe una consulta en el chat (o la inicia desde una alerta, con
   el insumo ya cargado): `POST /eve/v1/session {message}` → sesión durable con
   `sessionId`.
3. eve corre el loop: `instructions.md` → tool calls contra el módulo de dominio
   → el modelo razona → stream NDJSON → assistant-ui renderiza en vivo.
4. El agente recomienda en el texto de la consulta, justificando con precio,
   lead time y trust score de las ofertas leídas por las tools.
5. La minera descarga el informe PDF de la recomendación del panel y aprueba
   en su propio sistema de compras. La sesión es durable: `useEveAgentRuntime({ resume: true })`
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

- `ANTHROPIC_API_KEY` en `.env.local` (gitignored; en deploy, env var
  del servidor).
- `agent/channels/eve.ts`: `localDev()` abre localhost en dev;
  `placeholderAuth()` rechaza requests de browser en producción hasta
  reemplazarlo por auth real (o `none()` para una demo pública).
- Producción local: `pnpm eve:build` antes de `next start` (`next build`
  no compila el agente). Los procesos de eve corren con
  `NODE_OPTIONS="--conditions=react-server"` para resolver el guard
  `server-only` del módulo de dominio (ver AGENTS.md).

## Caveats

- eve está en beta (0.x): las docs de `node_modules/eve/docs/` tienen prioridad
  sobre eve.dev.
- Modelo directo (no Gateway): sin cost tracking de AI Gateway.
- Ver `AGENTS.md` para los detalles de pnpm 12 y comandos.
