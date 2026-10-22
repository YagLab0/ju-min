# 03: Ficha del proveedor verificado

**What to build:** desde el listado del explorer, la minera abre la ficha de un proveedor verificado y ve todas sus ofertas (precio, unidad, lead time, disponibilidad), el desglose de su trust score y la fuente de verificación por la que figura en la red. Un botón de contacto abre un modal simulado que confirma la acción sin enviar nada. Si el proveedor no existe, ve un mensaje claro con el camino de vuelta al listado.

Spec: `docs/orden-desarrollo.md`. Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` antes de escribir código. Skills: `tdd`, `frontend-design`.

**Blocked by:** 02 (Explorer: listado de proveedores verificados)

**Status:** ready-for-agent

- [ ] Cada proveedor del listado enlaza a su ficha en `/proveedores/[id]`
- [ ] La ficha muestra las ofertas con precio, unidad, lead time y disponibilidad
- [ ] La ficha muestra el desglose del trust score por señal (historial de entregas, certificaciones, antigüedad fiscal, etc.)
- [ ] La ficha muestra la fuente de verificación del proveedor
- [ ] El botón de contacto abre un modal simulado, accesible por teclado, que no hace llamadas externas
- [ ] Un id inexistente muestra un estado de "proveedor no encontrado" con enlace al listado
- [ ] Test de Vitest del módulo de dominio: obtener proveedor por id (existente e inexistente)
- [ ] `pnpm build`, `pnpm lint` y los tests pasan
