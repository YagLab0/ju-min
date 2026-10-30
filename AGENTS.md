# AGENTS.md

## Docs first

- **Next.js 16** tiene cambios que rompen convenciones conocidas. Antes de escribir código, leer la guía relevante en `node_modules/next/dist/docs/`.
- **eve** está en beta (0.x). Las docs que vienen en `node_modules/eve/docs/` coinciden con la versión instalada y tienen prioridad sobre eve.dev.

## Comandos

- `pnpm dev`: levanta Next.js **y** el runtime de eve (vía `withEve`). El agente queda en `http://localhost:3000/eve/v1/*`. La primera request a `/eve` tarda unos segundos mientras eve arranca.
- `pnpm eve:dev`: terminal UI de eve para chatear con el agente sin frontend (`--no-ui` para headless).
- `pnpm lint` / `pnpm exec tsc --noEmit` / `pnpm build`: verificación.
- Producción local: `next build` no compila el agente. Correr `pnpm eve:build` (genera `.output/`) antes de `next start`.
- Smoke test: `curl localhost:3000/eve/v1/health` y `curl localhost:3000/eve/v1/info`.
- Las tools del agente importan `@/lib/compras/dominio` (sin `import "server-only"`); la app Next importa `@/lib/compras`, que agrega la guarda `server-only` y re-exporta `dominio`. Así eve compila sin `--conditions=react-server`, que en Vercel no llega al build del agente. **No** setear `NODE_OPTIONS=--conditions=react-server` como env var de Vercel: se aplica también en runtime y las funciones de Next crashean (`Cannot find module .../react.react-server.js`). Los scripts locales de package.json la siguen llevando y no molesta.

## Agente (eve)

- `agent/agent.ts`: modelo. Usa OpenCode Go (el modelo sale de `OPENCODE_MODEL`, default `beam-free` gratis bajo la suscripción) vía `@ai-sdk/openai-compatible` (`createOpenAICompatible` con `baseURL` `https://opencode.ai/inference/go/openai/v1` — Go tiene base URL distinta del pay-as-you-go), no AI Gateway. El gateway exige `x-opencode-session` + user-agent propio en headers, y `modelContextWindowTokens` va explícito porque el modelo no se resuelve por el catálogo de Gateway. Lista de modelos Go: `GET https://opencode.ai/zen/go/v1/models`.
- `agent/instructions.md`: system prompt (en español).
- `agent/channels/eve.ts`: auth de las rutas `/eve/v1`. `localDev()` abre localhost en dev; `placeholderAuth()` rechaza requests de browser en producción hasta reemplazarlo por auth real (o `none()` para demo pública).
- `agent/tools/`: solo lectura, una tool por archivo (el nombre de la tool es el nombre del archivo). Acceden a los datos solo por el módulo de dominio (`@/lib/compras/dominio`); nunca crean clientes de Supabase ni leen tablas.
- Credenciales: `OPENCODE_API_KEY` en `.env.local` (gitignored). eve dev y Next leen `.env.local`. En deploy, configurarla como env var del servidor.

## pnpm 12

- Solo pnpm (no npm/yarn).
- Aprobación de build scripts: `allowBuilds:` en `pnpm-workspace.yaml` (el campo `pnpm.onlyBuiltDependencies` de package.json se ignora). `sharp: false` significa que el optimizador de imágenes de Next no usa sharp nativo.
- `minimumReleaseAge` puede bloquear dependencias transitivas recién publicadas (`ERR_PNPM_MINIMUM_RELEASE_AGE_VIOLATION`). Resolverlo con `pnpm update <pkg>` a una versión anterior dentro del rango, no relajando la política.
- Node 24 requerido (`engines.node: 24.x`).

## Directorios generados (gitignored + eslint-ignored)

`.eve/` (runtime de dev, sesiones en `.eve/.workflow-data`), `.output/`, `.nitro/`.

<!-- BEGIN:nextjs-agent-rules -->

## This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` (resolved from this file's directory; in monorepos the `next` package may not be visible from the repo root) before writing any code. Heed deprecation notices.

This block is written and re-added by `next dev` — verify at `node_modules/next/dist/server/lib/generate-agent-files.js`. Removing it from a diff only re-creates the uncommitted change; committing it with your work keeps the tree clean.

<!-- END:nextjs-agent-rules -->
