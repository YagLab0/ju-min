# 02: Tool: listar proveedores verificados

**What to build:** la minera pregunta en la consulta "¿qué proveedores verificados hay en Jujuy?" o "¿quién vende EPP?" y el agente responde con proveedores de la red verificada, ordenados por trust score, con su ubicación, provincias de operación, categorías y certificaciones relevantes. Los proveedores que menciona son los mismos que muestra el listado de proveedores verificados de la app. Si ningún proveedor coincide, el agente lo dice.

La tool obtiene los datos solo a través del módulo de dominio de compras (usa los filtros que el módulo ya soporta: categoría, provincia, texto y orden). Sigue el patrón establecido en el ticket 01.

Spec: `.scratch/tools-agente/spec.md`. Vocabulario: `GLOSSARY.md`. Leer `node_modules/eve/docs/` (tools) antes de escribir código. Skills: `tdd`.

**Blocked by:** 01 (Prefactor y tool de stock vía módulo de dominio)

**Status:** ready-for-agent

- [ ] Existe la tool de listar proveedores verificados: solo red verificada, con trust score (valor y desglose), ubicación, provincias de operación, categorías y certificaciones
- [ ] Filtros opcionales por categoría, provincia y texto; por defecto ordenada por trust score descendente
- [ ] Un filtro sin coincidencias devuelve lista vacía (no error)
- [ ] Acceso a datos solo por el módulo de dominio de compras
- [ ] La salida es JSON compacto pensado para el modelo (sin coordenadas ni URLs de fuente), con vocabulario del glosario
- [ ] Tests de Vitest de la tool por su interfaz contra el seed en memoria: orden por trust score, un filtro que acota, filtro sin coincidencias
- [ ] `pnpm test`, `pnpm lint` y `pnpm exec tsc --noEmit` pasan
