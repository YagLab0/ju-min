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

## Plan

| Documento | Contenido |
|---|---|
| [plan-implementacion.md](plan-implementacion.md) | Fases 0–4 del plan (setup, migraciones, seed, integración en la app, verificación) y decisiones tomadas |
