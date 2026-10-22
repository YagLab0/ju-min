# ju-min — Consultor inteligente de compras para minería

Proyecto de hackathon: un agente inteligente que gestiona las compras de insumos
de una empresa minera a partir de una red de proveedores verificados.

## Concepto

Las mineras usan el agente como consultor de procurement: monitorea el stock de
insumos, detecta faltantes, recomienda proveedores de la red verificada y genera
propuestas de compra que un humano aprueba. El modelo de negocio es por
suscripción y escala a pagos automáticos al detectar falta de stock.

**Scope de la demo:** los proveedores, insumos y cotizaciones están mockeados.
No hay transacciones reales — el contacto con proveedores es un botón simulado.
El foco es el loop del agente: *alerta de stock → consulta → recomendación con
justificación → aprobación humana*.

## Stack

- Next.js 16 (App Router, Turbopack) + React 19 + TypeScript
- Tailwind CSS 4
- Agente: [eve](https://eve.dev) (Vercel, beta) en `agent/`, montado en Next.js con `withEve` (`/eve/v1/*`)
- Modelo: Claude Haiku directo vía `eve/models/anthropic`
- Package manager: **pnpm**
- Datos: seed en memoria (`src/lib/compras/semilla.ts`) o Supabase local
  (`supabase/`) detrás del mismo adaptador — ver [Fuente de datos](#fuente-de-datos)

> **Nota:** esta versión de Next.js tiene cambios que rompen convenciones
> conocidas. Antes de escribir código, leer la guía relevante en
> `node_modules/next/dist/docs/`. Ver `AGENTS.md`.

## Estructura de la app

| Ruta | Descripción |
| --- | --- |
| `/` | Landing: hero con maqueta industrial 3D, widgets en loop de stock, proveedores y recomendación; control humano, preguntas frecuentes y accesos al panel y al explorer. |
| `/panel` | Panel de la minera: stock con alertas de punto de reorden, consultas al agente, cola de recomendaciones pendientes e historial con las decisiones tomadas. |
| `/proveedores` | Explorer: catálogo de proveedores verificados filtrable por insumo/categoría, con trust score, ubicación y certificaciones. |
| `/proveedores/[id]` | Ficha del proveedor: insumos ofrecidos con precio y lead time, historial de entregas, desglose del trust score y botón "Contactar" (mock). |

La landing conserva la paleta mineral (papel, tinta, amarillo señal y cobre).
Su contenido sigue el pitch del proyecto: proveedores certificados, trust score
en cinco dimensiones, alertas de stock y recomendaciones con aprobación humana.
El bloque de alcance recoge las cifras del pitch (277 proveedores, 188 categorías
y 58 reglas); las integraciones y pagos futuros se presentan aparte como roadmap.
Las cifras de los widgets son ejemplos ilustrativos, no consultas al stock real.
Los widgets y la escena tienen controles de pausa y respetan
`prefers-reduced-motion`; la escena usa un render WebP propio de alta resolución
si WebGL no está disponible. El modelo tiene geometría biselada, reflejos de
estudio precalculados y sombras de contacto. El canvas renderiza a 2×, limitado
a 1,6 megapíxeles, y se pausa fuera de pantalla.
Si cambia el modelo, actualizar `public/almacen-minero.webp` capturando el canvas
en la pose de alerta para mantener el respaldo visual sincronizado.
Los estilos están aislados en CSS Modules, excluidos del loader de Tailwind en
`next.config.ts` para conservar los exports de clases de Turbopack.

## Modelo de datos (mock)

- **`Proveedor`**: nombre, CUIT, ubicación, certificaciones, trust score, contacto.
- **`OfertaInsumo`**: insumo ofrecido por un proveedor — precio, unidad, lead time, disponibilidad.
- **`StockMinera`**: insumo que la minera trackea — cantidad actual, punto de reorden, consumo mensual.
- **`Consulta`**: mensaje del usuario, respuesta del agente, recomendaciones asociadas, estado (pendiente/aprobada/rechazada), timestamp.

El trust score es una señal calculada sobre datos simulados (historial de
entregas, certificaciones, CUIT validado, tiempo de respuesta). En la demo se
presenta como "red verificada".

## Flujo del demo

1. El dashboard muestra una alerta: un insumo está bajo el punto de reorden.
2. El usuario le pregunta al agente qué hacer (o el agente sugiere proactivamente).
3. El agente recomienda un proveedor con justificación (precio, lead time, trust score).
4. El usuario revisa la ficha del proveedor en el explorer y lo contacta.
5. La recomendación queda registrada como aprobada en el historial.

## Roadmap (pitch)

- Verificación real de proveedores contra registros públicos.
- Pagos automáticos al detectar falta de stock.
- Integración con ERPs y facturación electrónica.

## Desarrollo

Requiere Node 24 (el agente eve lo exige). Con nvm: `nvm install && nvm use` lee `.nvmrc`.

```bash
pnpm install
echo "ANTHROPIC_API_KEY=<tu-key>" > .env.local  # https://console.anthropic.com/
pnpm dev
```

Abrir [http://localhost:3000](http://localhost:3000).

## Fuente de datos

El módulo de compras (`src/lib/compras`) lee detrás de un adaptador
intercambiable con dos implementaciones:

- **Seed en memoria** (default): el demo funciona sin base de datos.
- **Supabase**: si `.env.local` define `NEXT_PUBLIC_SUPABASE_URL` y
  `SUPABASE_SERVICE_ROLE_KEY`, la app intenta leer de ahí.

En modo `auto` (default) la app sondea Supabase una vez por proceso: si no
responde o está sin el seed, **cae al seed en memoria con un aviso en el log
del servidor** — el demo nunca queda en pantalla vacía. Para cambiar de modo
hay que reiniciar `pnpm dev`.

`JUMIN_FUENTE_DATOS` fuerza el modo:

| Valor | Comportamiento |
| --- | --- |
| `auto` | Supabase si responde con datos; si no, memoria (default). |
| `memoria` | Seed en memoria siempre, aunque haya env vars de Supabase. |
| `supabase` | Supabase siempre; los errores se propagan sin fallback (pipeline real). |

### Levantar Supabase local

Requiere Docker corriendo. Las migraciones (`supabase/migrations/*.sql`) se
aplican solas al arrancar; `supabase/seed.sql` puebla la demo:

```bash
pnpm supabase start                 # levanta el stack local
pnpm supabase status                # copia las keys a .env.local (ver .env.example)
pnpm supabase db reset              # reaplica migraciones + seed (idempotente)
```

Con el stack arriba y las env vars puestas, `pnpm dev` loguea
`[compras] Fuente de datos: Supabase (...)`. Si el stack está apagado o sin
seed, el log muestra `[compras] ... Se usa el seed en memoria para el demo.`
Detalle del stack en [docs/supabase-local.md](docs/supabase-local.md).

## Tests

```bash
# Unitarios del dominio y del agente (Vitest)
pnpm test

# E2E del flujo del demo (Playwright)
pnpm e2e:install   # solo la primera vez: descarga el browser de Playwright
pnpm test:e2e
```

Los tests E2E levantan solos el build de producción en un puerto dedicado
(`3200`; se puede cambiar con `JUMIN_E2E_PORT`) y no dependen de red externa:
verifican el flujo completo del demo — alerta de stock → consulta al agente →
recomendación → ficha del proveedor → contacto simulado → aprobación en el
historial — y el respaldo del estante con `prefers-reduced-motion`.
