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
- **`NODE_OPTIONS="--conditions=react-server"` es obligatorio** en cualquier proceso que compile o corra módulos authored de eve (`pnpm dev`, `eve:dev`, `eve:build`): las tools importan `src/lib/compras`, que arranca con `import "server-only"`; la condición lo resuelve al export vacío. Los scripts de package.json ya lo llevan.

## Agente (eve)

- `agent/agent.ts`: modelo. Usa Claude Haiku directo vía `@ai-sdk/anthropic` (`createAnthropic`), no AI Gateway. `modelContextWindowTokens` va explícito porque el modelo no se resuelve por el catálogo de Gateway. Si la API key es de nivel organización (no scoped a un workspace), definir `ANTHROPIC_WORKSPACE_ID` en `.env.local` para que se envíe el header `anthropic-workspace-id`.
- `agent/instructions.md`: system prompt (en español).
- `agent/channels/eve.ts`: auth de las rutas `/eve/v1`. `localDev()` abre localhost en dev; `placeholderAuth()` rechaza requests de browser en producción hasta reemplazarlo por auth real (o `none()` para demo pública).
- `agent/tools/`: solo lectura, una tool por archivo (el nombre de la tool es el nombre del archivo). Acceden a los datos solo por el módulo de dominio `src/lib/compras`; nunca crean clientes de Supabase ni leen tablas.
- Credenciales: `ANTHROPIC_API_KEY` (y `ANTHROPIC_WORKSPACE_ID` si la key no es scoped a un workspace) en `.env.local` (gitignored). eve dev y Next leen `.env.local`. En deploy, configurarlas como env vars del servidor.

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
