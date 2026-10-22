# AGENTS.md

## Docs first

- **Next.js 16** tiene cambios que rompen convenciones conocidas. Antes de escribir código, leer la guía relevante en `node_modules/next/dist/docs/`.
- **eve** está en beta (0.x). Las docs que vienen en `node_modules/eve/docs/` coinciden con la versión instalada y tienen prioridad sobre eve.dev.

## Comandos

- `pnpm dev`: levanta Next.js **y** el runtime de eve (vía `withEve`). El agente queda en `http://localhost:3000/eve/v1/*`. La primera request a `/eve` tarda unos segundos mientras eve arranca.
- `pnpm exec eve dev`: terminal UI de eve para chatear con el agente sin frontend (`--no-ui` para headless).
- `pnpm lint` / `pnpm exec tsc --noEmit` / `pnpm build`: verificación.
- Producción local: `next build` no compila el agente. Correr `pnpm exec eve build` (genera `.output/`) antes de `next start`.
- Smoke test: `curl localhost:3000/eve/v1/health` y `curl localhost:3000/eve/v1/info`.

## Agente (eve)

- `agent/agent.ts`: modelo. Usa Gemini Flash directo vía Google AI Studio (`@ai-sdk/google`), no AI Gateway. `modelContextWindowTokens` va explícito porque el modelo no se resuelve por el catálogo de Gateway.
- `agent/instructions.md`: system prompt (en español).
- `agent/channels/eve.ts`: auth de las rutas `/eve/v1`. `localDev()` abre localhost en dev; `placeholderAuth()` rechaza requests de browser en producción hasta reemplazarlo por auth real (o `none()` para demo pública).
- Credenciales: `GOOGLE_GENERATIVE_AI_API_KEY` en `.env.local` (gitignored). eve dev y Next leen `.env.local`. En deploy, configurarla como env var del servidor.

## pnpm 12

- Solo pnpm (no npm/yarn).
- Aprobación de build scripts: `allowBuilds:` en `pnpm-workspace.yaml` (el campo `pnpm.onlyBuiltDependencies` de package.json se ignora). `sharp: false` significa que el optimizador de imágenes de Next no usa sharp nativo.
- `minimumReleaseAge` puede bloquear dependencias transitivas recién publicadas (`ERR_PNPM_MINIMUM_RELEASE_AGE_VIOLATION`). Resolverlo con `pnpm update <pkg>` a una versión anterior dentro del rango, no relajando la política.
- Node 24 requerido (`engines.node: 24.x`).

## Directorios generados (gitignored + eslint-ignored)

`.eve/` (runtime de dev, sesiones en `.eve/.workflow-data`), `.output/`, `.nitro/`.
