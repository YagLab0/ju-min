# 07: Landing con estante 3D

**What to build:** en la raíz, un jurado entiende ju-min en segundos. La pieza protagonista es un estante de almacén 3D con insumos mineros variados (por ejemplo tambor de 200 L, casco, bolsa de reactivo, filtro). El stock de un insumo baja hasta cruzar el punto de reorden, aparece la alerta y entra el agente con una recomendación: el producto entero contado en una sola animación. Debajo, secciones breves sobre de dónde salen los proveedores verificados (registro provincial de proveedores mineros de Jujuy, cámaras del sector) y sobre la suscripción y el roadmap (pagos automáticos al detectar falta de stock), con accesos al panel y al explorer. El resto de la landing va sin animación de scroll: sin Lenis ni animaciones de entrada por sección.

El 3D es 100% procedural con three.js, sin GLB ni assets de terceros. Adaptar (no copiar tal cual) el patrón de ciclo de vida de `BigBag` del proyecto julit (`/home/mauri/Escritorio/Projects/julit/app/landing/big-bag.tsx`); como referencia para animar una cantidad, ver `lot-model.tsx` en el explorer de julit.

Spec: `docs/orden-desarrollo.md` (sección "Landing y 3D"). Vocabulario: `GLOSSARY.md`. Leer la guía de Next.js 16 en `node_modules/next/dist/docs/` antes de escribir código. Skill: `frontend-design`.

**Blocked by:** 01 (Identidad visual y layout base)

**Status:** ready-for-agent

- [ ] El estante muestra al menos tres insumos distintos y reconocibles, modelados por código
- [ ] La secuencia stock bajando → cruce del punto de reorden → alerta → recomendación del agente se entiende sin texto adicional
- [ ] three.js se importa dinámicamente cuando el estante se acerca a la pantalla
- [ ] Los colores del 3D salen de las variables CSS del tema
- [ ] Con `prefers-reduced-motion` o navegación por teclado, el estante queda en una pose fija que muestra la alerta
- [ ] La animación se pausa fuera de pantalla y con la pestaña oculta
- [ ] Ante pérdida del contexto WebGL o sin WebGL se ve un SVG de respaldo equivalente, que también se muestra hasta que el canvas renderiza
- [ ] Al desmontar se liberan geometrías, materiales, texturas y el renderer; el pixel ratio está limitado
- [ ] El estante es decorativo para lectores de pantalla y su mensaje también está en texto
- [ ] Secciones de fuentes de verificación y de suscripción/roadmap, con accesos a `/panel` y `/proveedores`
- [ ] Sin animaciones de scroll ni de entrada fuera del estante
- [ ] Responsive hasta mobile, revisado con capturas
- [ ] `pnpm build` y `pnpm lint` pasan
