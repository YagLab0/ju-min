# DOCS — Índice de documentación de ju-min

Consultor inteligente de compras para minería. Documentación organizada por
tema; el vocabulario del dominio está en [`../GLOSSARY.md`](../GLOSSARY.md).

## Producto y desarrollo

| Documento | Contenido |
|---|---|
| [orden-desarrollo.md](orden-desarrollo.md) | Spec del MVP: problem statement, solución, user stories y tickets (landing, panel, explorer) |

## Proveedores y clasificación

| Documento | Contenido |
|---|---|
| [investigacion-proveedores.md](investigacion-proveedores.md) | Qué información brindan los proveedores (certificaciones, normas, cumplimientos), fuentes de datos reales (Registro Jujuy, CAPMIN, CAEM) y listado de proveedores del seed |
| [modelo-clasificacion.md](modelo-clasificacion.md) | Pipeline de verificación (registrado → homologado), inputs del trust score y reglas de requisitos por categoría de insumo |

## Base de datos

| Documento | Contenido |
|---|---|
| [schema-base-de-datos.md](schema-base-de-datos.md) | Decisiones de modelado, diagrama ER, DDL completo, vista del explorer, función `cumple_requisitos()` y mapeo de los mocks a tablas |
| [usuarios-auth.md](usuarios-auth.md) | Modelo de usuarios sobre Supabase Auth: perfiles, roles, trigger de signup, RLS por minera, usuarios de prueba y uso de la API sin página de login |
| [supabase-local.md](supabase-local.md) | Cómo levantar Supabase local con la CLI (Docker) o con un docker-compose mínimo, compartir la instancia por LAN y conexión desde Next.js |
| [troubleshooting-red.md](troubleshooting-red.md) | Workaround para `pnpm install` cuando `registry.npmjs.org` está bloqueado (mirror npmmirror) y fallback de Google Fonts |
| [scraper-capmin.md](scraper-capmin.md) | Scraper del directorio CAPMIN: qué extrae, reglas del SQL generado e instructivo de regeneración del seed |

## Plan

| Documento | Contenido |
|---|---|
| [plan-implementacion.md](plan-implementacion.md) | Fases 0–4 del plan (setup, migraciones, seed, integración en la app, verificación) y decisiones tomadas |

## Negocio

Método de Alex Osterwalder (Value Proposition Canvas + Business Model Canvas).

| Documento | Contenido |
|---|---|
| [negocio/propuesta-de-valor.md](negocio/propuesta-de-valor.md) | Value Proposition Canvas de la minera y del proveedor verificado, encaje y declaraciones de propuesta de valor |
| [negocio/business-model-canvas.md](negocio/business-model-canvas.md) | Los 9 bloques, patrones (plataforma multilateral) y competencia |
| [negocio/hipotesis.md](negocio/hipotesis.md) | Hipótesis riesgosas del modelo y experimentos para validarlas |
| [negocio/historias-de-usuario.md](negocio/historias-de-usuario.md) | Casos de uso contados: reponer un insumo crítico y cargar el stock desde Excel |
| [negocio/beneficios.es.md](negocio/beneficios.es.md) | Documento de beneficios por destinatario, preparado para traducción |

## Pitch

| Documento | Contenido |
|---|---|
| [pitch.md](pitch.md) | Guion extendido del pitch (5 min): gancho, solución, demo, defensibilidad, modelo/roadmap y respuestas al jurado |
| [slide-deck.html](../public/slide-deck.html) | Deck de 8 láminas 16:9 con navegación por flechas — se sirve desde la app en `/slide-deck.html` |
