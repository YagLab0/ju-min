# Plan de implementación

Parte de la documentación de ju-min — índice en [DOCS.md](DOCS.md).


### Fase 0 — Setup del stack local

| # | Tarea | Artefacto | Criterio de aceptación |
|---|---|---|---|
| 0.1 | Instalar CLI: `pnpm add supabase --save-dev --allow-build=supabase` | `package.json` | `pnpm supabase --version` responde |
| 0.2 | `pnpm supabase init` | `supabase/config.toml` | Directorio `supabase/` creado |
| 0.3 | `pnpm supabase start` (requiere Docker) | stack corriendo | `pnpm supabase status` muestra API/DB/Studio en 54321–54323 |
| 0.4 | Instalar cliente: `pnpm add @supabase/supabase-js` | `package.json` | — |
| 0.5 | Crear `.env.local` con URL + anon/service keys + DATABASE_URL (copiar a `.env.example` sin valores) | `.env.local`, `.env.example` | vars disponibles en `next dev` |
| 0.6 | Agregar `.env.local` a `.gitignore` si no está | `.gitignore` | secrets no commiteados |

**Decisión tomada:** el mapa del explorer solo muestra marcadores y filtra por
provincia — **no se usa postgis**. `lat`/`lng` + filtro por `provincia` /
`provincias_operacion` alcanza para el demo.

### Fase 1 — Migraciones (DDL de [schema-base-de-datos.md](schema-base-de-datos.md) §4.3)

Orden de migraciones, una por archivo en `supabase/migrations/`:

| # | Migración | Contenido | Depende de |
|---|---|---|---|
| 1.1 | `00001_extensions` | `pg_trgm` | — |
| 1.2 | `00002_enums` | los 6 `create type` | — |
| 1.3 | `00003_catalogos` | `categorias`, `certificaciones`, `requisitos_categoria` | 1.2 |
| 1.4 | `00004_proveedores` | `proveedores`, `contactos_proveedor`, `proveedor_categorias`, `documentos`, `proveedor_certificaciones`, `auditorias` + índice trgm | 1.3 |
| 1.5 | `00005_insumos` | `insumos`, `ofertas_insumo` | 1.4 |
| 1.6 | `00006_minera_stock` | `mineras`, `stock_minera` | 1.5 |
| 1.7 | `00007_agente` | `consultas`, `recomendaciones`, `entregas`, `trust_score_historial` | 1.4–1.6 |
| 1.8 | `00008_vistas_funciones` | vista `proveedores_explorer`, función `cumple_requisitos()`, trigger `updated_at` | todas |
| 1.9 | `00009_storage` | bucket `documentos` (privado) + policies | — |
| 1.10 | `00010_rls` | habilitar RLS: lectura pública (anon) de proveedores `homologado`/`validado`, escritura solo service role | todas |

Verificación: `pnpm supabase db reset` corre todo limpio; chequear en Studio
(localhost:54323) que las tablas existen.

### Fase 2 — Datos semilla (`supabase/seed.sql` + script opcional)

**Catálogos (curados a mano, ~1 hora):**

| Dataset | Volumen | Fuente |
|---|---|---|
| `certificaciones` | ~25 filas | Tablas §1.3 y §1.4 de [investigacion-proveedores.md](investigacion-proveedores.md) |
| `categorias` | ~30 principales (EPP, Lubricantes, Explosivos, Bolas de Molino, Filtros, Bombas, Geomembranas, Estructuras Metálicas, Transporte, Higiene y Seguridad…) | Listado real CAPMIN (~180 → subset) |
| `requisitos_categoria` | ~40 relaciones | [modelo-clasificacion.md](modelo-clasificacion.md) §3.3 |

**Datos de dominio:**

| Dataset | Volumen | Origen |
|---|---|---|
| `proveedores` | 15–25 | CAPMIN (nombres/direcciones/webs/categorías reales) + marcar 3–5 con `registro_jujuy_estado='aprobado'` |
| `proveedor_certificaciones` | 2–4 por proveedor | Sintético pero plausible (ISO 9001+14001+45001 comunes; especializadas según categoría). Mezclar estados: mayoría `verificado`, algunos `declarado`/`vencido` para mostrar el filtro |
| `auditorias` | 3–5 | Sintético |
| `insumos` | 10–15 | Por categoría (bola de molienda, guante nitrilo, geomembrana HDPE, filtro, lubricante, emulsión explosiva…) |
| `ofertas_insumo` | 1–3 por insumo | Precios sintéticos con magnitud de referencia MercadoLibre |
| `mineras` | 1–2 | Sales de Jujuy / Minera Exar (CAEM) |
| `stock_minera` | 5–8 | Uno deliberadamente bajo punto de reorden → dispara el flujo del demo |
| `entregas` | ~30 | Sintético, para alimentar OTIF del trust score |
| `consultas`/`recomendaciones` | 2–3 | Historial de ejemplo |
| `trust_score` | calculado | Ver Fase 3.4 |

**Extracción de datos reales (decisión tomada: script de scraping):**
- CAPMIN: listado HTML paginado scrapeable (campos: nombre, dirección, web,
  categorías, rating). **Script Node one-shot** (`scripts/scrape-capmin.ts`)
  que vuelca a `supabase/seed-data/capmin.csv` → `seed.sql` hace `COPY`/`insert`
  desde ahí. Reproducible y el dataset crece gratis.
- Registro Jujuy: el sitio es una app JS — el fetch directo no devuelve tabla.
  Evaluar si tiene API interna (inspeccionar network) o tomar muestra manual.
- Geocodificación: Nominatim sobre las direcciones extraídas (respetar
  1 req/seg).

### Fase 3 — Integración en la app

| # | Tarea | Detalle |
|---|---|---|
| 3.1 | `src/lib/supabase/client.ts` + `server.ts` | Cliente browser (anon key) y server (service key) — patrón estándar App Router |
| 3.2 | Generar tipos: `pnpm supabase gen types typescript --local > src/lib/database.types.ts` | Script en `package.json`: `"db:types"` |
| 3.3 | Función de trust score | `src/lib/trust-score.ts`: lee señales (certs vigentes, OTIF de `entregas`, registro Jujuy, antigüedad CUIT) → puntaje 0–100 con desglose JSONB. Job one-shot en seed + recálculo al cambiar datos |
| 3.4 | Reemplazar mocks | Crear mocks en `src/data/` primero con la forma exacta de las tablas (puente), luego queries reales |
| 3.5 | `/` dashboard | `stock_minera` bajo punto de reorden → alerta; cola de `consultas` |
| 3.6 | `/proveedores` | Vista `proveedores_explorer`, filtros por categoría/provincia/estado, mapa (opcional, lat/lng ya están) |
| 3.7 | `/proveedores/[id]` | Ficha: ofertas, certificaciones con estado y vencimiento, desglose de trust score, historial de entregas |
| 3.8 | Loop del agente | Al consultar: candidatos por `ofertas_insumo` del insumo → filtro `cumple_requisitos()` → ranking por precio/lead_time/trust_score → `recomendaciones` con `justificacion` generada |

### Fase 4 — Verificación y demo

- `pnpm build && pnpm lint` limpio
- Recorrido del demo (README §"Flujo del demo") end-to-end contra la DB local
- `pnpm supabase db reset` + `seed.sql` reproduce el escenario completo
- README actualizado con `pnpm supabase start` en instrucciones de desarrollo

### Decisiones tomadas

1. **Schema completo** — incluye `auditorias`, `trust_score_historial` y
   `documentos`/Storage. Refuerza la narrativa "evidencia verificable" y el
   costo extra es bajo.
2. **Datos CAPMIN vía script de scraping** — `scripts/scrape-capmin.ts` →
   CSV en `supabase/seed-data/` → `seed.sql`. Reproducible.
3. **Sin postgis** — el mapa muestra marcadores y filtra por provincia;
   no hay filtro por distancia.
4. **RLS desde el inicio** — policies reales desde el día 1: lectura anon
   solo de proveedores `homologado`/`validado` (la "red verificada"), todo lo
   demás por service role. El estado del proveedor pasa a ser también un
   mecanismo de seguridad, no solo una etiqueta.
