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
- Modelo: Gemini Flash vía Google AI Studio (`@ai-sdk/google`)
- Package manager: **pnpm**
- Datos: mocks en archivos TypeScript (no hay base de datos)

> **Nota:** esta versión de Next.js tiene cambios que rompen convenciones
> conocidas. Antes de escribir código, leer la guía relevante en
> `node_modules/next/dist/docs/`. Ver `AGENTS.md`.

## Estructura de la app

| Ruta | Descripción |
| --- | --- |
| `/` | Landing: presenta el producto con el estante 3D protagonista (stock bajando → alerta → recomendación) y entradas al panel y al explorer. |
| `/panel` | Panel de la minera: stock con alertas de punto de reorden, consultas al agente, cola de recomendaciones pendientes e historial con las decisiones tomadas. |
| `/proveedores` | Explorer: catálogo de proveedores verificados filtrable por insumo/categoría, con trust score, ubicación y certificaciones. |
| `/proveedores/[id]` | Ficha del proveedor: insumos ofrecidos con precio y lead time, historial de entregas, desglose del trust score y botón "Contactar" (mock). |

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
echo "GOOGLE_GENERATIVE_AI_API_KEY=<tu-key>" > .env.local  # https://aistudio.google.com/apikey
pnpm dev
```

Abrir [http://localhost:3000](http://localhost:3000).

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
