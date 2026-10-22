# 02: Explorer: listado de proveedores verificados

**What to build:** la minera entra a `/proveedores` y ve el catálogo de proveedores verificados con su trust score, ubicación y certificaciones. Puede filtrar por insumo o categoría, buscar por nombre y ordenar por trust score; si un filtro no devuelve resultados, un mensaje le indica cómo ampliar la búsqueda.

Por debajo nace el módulo de dominio de compras: la única puerta de acceso a los datos para las páginas. Los datos salen de un seed mock realista (insumos mineros variados: EPP, lubricantes, reactivos, filtros, repuestos; proveedores verosímiles de la región, cada uno con su fuente de verificación) detrás de un adaptador intercambiable, para que después se conecte el scraper de un compañero sin tocar páginas ni tests. Este ticket también instala la infraestructura de tests del repo.

Spec: `docs/orden-desarrollo.md` (secciones "Módulo de dominio de compras" y "Testing Decisions"). Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` antes de escribir código. Skills: `tdd`, `playwright-cli`.

**Blocked by:** 01 (Identidad visual y layout base)

**Status:** ready-for-agent

- [x] Los tipos del dominio siguen el glosario: Minera, Proveedor verificado (con fuente de verificación), Insumo, Oferta, Trust score (valor + desglose), Stock (con punto de reorden y consumo), Consulta, Recomendación (pendiente, aprobada, rechazada)
- [x] Las páginas consumen solo el módulo de dominio de compras, nunca el seed directamente
- [x] La fuente de datos está detrás de un adaptador; el seed mock es la implementación actual
- [x] `/proveedores` lista proveedores verificados con trust score, ubicación y certificaciones
- [x] Filtro por insumo o categoría, búsqueda por nombre y orden por trust score funcionan juntos
- [x] Estado vacío con indicación de cómo ampliar la búsqueda
- [x] Vitest y Playwright instalados como dependencias de desarrollo (versiones publicadas hace al menos 7 días) con scripts en `package.json`
- [x] Tests de Vitest del módulo de dominio por su interfaz pública: filtros, búsqueda y orden
- [x] Test E2E de Playwright: aplicar un filtro en `/proveedores` reduce el listado al esperado
- [x] `pnpm build`, `pnpm lint` y los tests pasan
