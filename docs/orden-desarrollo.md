# Orden de desarrollo: landing, panel y explorer de ju-min

> **Antes de escribir código:** este repo usa Next.js 16, que tiene cambios incompatibles con versiones anteriores (APIs, convenciones, estructura). Leé la guía relevante en `node_modules/next/dist/docs/` antes de cada tarea y respetá los avisos de deprecación. El vocabulario de esta spec es el de `GLOSSARY.md`: usalo en código, copy y nombres.

## Problem Statement

Una minera repone sus insumos a mano: alguien nota que falta stock, busca proveedores por teléfono o por contactos, compara precios sin datos de confiabilidad y termina comprando tarde o a quien conoce, no al mejor proveedor. No tiene una vista única de qué insumos están por debajo del punto de reorden ni de qué proveedores verificados existen en la región.

Para el hackathon, además, el equipo necesita mostrar esta propuesta en minutos: un jurado tiene que entender el producto con la landing y verlo funcionar en un demo sin transacciones reales.

## Solution

Tres superficies:

- **Landing** en la raíz: explica el producto con una sola pieza 3D protagonista, un estante de almacén con insumos variados cuyo stock baja hasta cruzar el punto de reorden; aparece la alerta y entra el agente con una recomendación. Desde la landing se entra al panel y al explorer.
- **Panel de la minera**: vista de trabajo en 2D con el stock de sus insumos y alertas de punto de reorden, un espacio para hacerle consultas al agente, el historial de consultas y la cola de recomendaciones pendientes para aprobar o rechazar.
- **Explorer de proveedores verificados**: catálogo filtrable con trust score y la ficha de cada proveedor con sus ofertas, fuente de verificación y un botón de contacto simulado.

Los datos de proveedores vienen de un scraper que está armando otro integrante del equipo; hasta que esté listo se usa un seed mock detrás del mismo módulo de datos. El agente queda definido como interfaz con una implementación guionada; el LLM real se conecta después.

## User Stories

### Landing

1. Como jurado del hackathon, quiero entender qué hace ju-min en los primeros segundos de la landing, para evaluar la propuesta sin leer un documento.
2. Como jurado, quiero ver un estante con insumos mineros reconocibles (tambor de lubricante, casco, bolsa de reactivo, filtro u otros), para asociar el producto con el mundo minero de inmediato.
3. Como jurado, quiero ver cómo el stock de un insumo baja hasta cruzar el punto de reorden, para entender el problema que se resuelve sin explicación verbal.
4. Como jurado, quiero ver que al cruzar el punto de reorden aparece una alerta y el agente propone una recomendación, para entender el flujo completo del producto en una sola animación.
5. Como visitante, quiero un acceso claro al panel de la minera, para probar el demo.
6. Como visitante, quiero un acceso claro al explorer de proveedores verificados, para ver el catálogo.
7. Como visitante, quiero entender de dónde salen los proveedores verificados (registro provincial de proveedores mineros, cámaras del sector), para confiar en la red.
8. Como visitante, quiero ver el modelo de suscripción y la evolución futura (pagos automáticos al detectar falta de stock) explicados brevemente, para entender el negocio.
9. Como visitante con `prefers-reduced-motion`, quiero ver el estante en un estado fijo que igual comunique la alerta, para no recibir animación que no pedí.
10. Como visitante con un navegador sin WebGL o con el contexto WebGL perdido, quiero ver una ilustración de respaldo equivalente, para no encontrarme un hueco vacío.
11. Como visitante en un celular, quiero que la landing y el estante se vean bien en pantallas angostas, para poder verla desde cualquier dispositivo.
12. Como visitante, quiero que la página cargue rápido aunque tenga 3D, para no esperar antes de ver contenido.
13. Como visitante que navega con teclado, quiero un foco visible en todos los enlaces y botones, para poder recorrer la landing sin mouse.

### Panel de la minera

14. Como minera, quiero ver todos mis insumos con su stock actual y su punto de reorden, para saber de un vistazo cómo estoy.
15. Como minera, quiero que los insumos por debajo del punto de reorden se destaquen como alerta, para saber qué reponer primero.
16. Como minera, quiero ver cuántos días de stock me quedan según el consumo, para priorizar urgencias.
17. Como minera, quiero hacerle una consulta al agente sobre un insumo en alerta, para recibir una recomendación de compra.
18. Como minera, quiero iniciar una consulta directamente desde una alerta de stock, para no tener que escribir el contexto a mano.
19. Como minera, quiero hacerle consultas libres al agente (por ejemplo "¿quién me entrega guantes más rápido?"), para resolver dudas de compra.
20. Como minera, quiero que cada recomendación indique el insumo, la oferta elegida, el proveedor verificado, el precio, el lead time y el trust score, para decidir con datos.
21. Como minera, quiero que cada recomendación traiga una justificación en lenguaje claro, para entender por qué el agente eligió esa oferta.
22. Como minera, quiero saber cuando una consulta no produjo recomendaciones y por qué, para no quedarme esperando.
23. Como minera, quiero aprobar una recomendación, para dejar registrada mi decisión.
24. Como minera, quiero rechazar una recomendación, para descartarla sin perderla del historial.
25. Como minera, quiero ver la cola de recomendaciones pendientes separada de las ya decididas, para saber qué me falta resolver.
26. Como minera, quiero ver el historial de consultas con sus recomendaciones y el estado de cada una, para revisar decisiones anteriores.
27. Como minera, quiero ir desde una recomendación a la ficha del proveedor verificado en el explorer, para ver más detalle antes de decidir.
28. Como minera, quiero que el panel sea sobrio y legible, sin elementos decorativos que distraigan, para trabajar rápido.
29. Como presentador del demo, quiero que el panel arranque con datos que ya muestren al menos una alerta de stock, para no tener que preparar nada en vivo.
30. Como presentador del demo, quiero que el agente responda aunque no haya conexión al LLM, para que el demo no falle en el escenario.

### Explorer de proveedores verificados

31. Como minera, quiero ver el listado de proveedores verificados, para conocer la red disponible.
32. Como minera, quiero filtrar proveedores por insumo o categoría, para encontrar rápido quién vende lo que necesito.
33. Como minera, quiero buscar proveedores por nombre, para encontrar uno que ya conozco.
34. Como minera, quiero ver en el listado el trust score, la ubicación y las certificaciones de cada proveedor, para comparar sin entrar a cada ficha.
35. Como minera, quiero ordenar proveedores por trust score, para ver primero los más confiables.
36. Como minera, quiero ver la ficha de un proveedor verificado con todas sus ofertas (precio, unidad, lead time, disponibilidad), para evaluarlo en detalle.
37. Como minera, quiero ver el desglose del trust score de un proveedor, para entender en qué se basa.
38. Como minera, quiero ver la fuente de verificación de cada proveedor, para saber por qué figura en la red.
39. Como minera, quiero un botón de contacto en la ficha del proveedor, para iniciar el contacto (en el demo es simulado y no envía nada).
40. Como minera, quiero un mensaje claro cuando un filtro no devuelve proveedores, para saber cómo ampliar la búsqueda.
41. Como minera, quiero un mensaje claro si entro a la ficha de un proveedor que no existe, para volver al listado.
42. Como minera, quiero (opcionalmente) ver los proveedores verificados y la mina en un mapa de Jujuy, para entender distancias y logística.

### Equipo

43. Como integrante que arma el scraper, quiero un contrato de datos claro basado en el glosario, para conectar mis datos sin tocar las páginas.
44. Como integrante que conecta el LLM, quiero una interfaz del agente ya definida y usada por el panel, para reemplazar la implementación guionada sin tocar la interfaz de usuario.
45. Como integrante del equipo, quiero tests que verifiquen el flujo del demo de punta a punta, para detectar si algo se rompe antes de presentar.

## Implementation Decisions

### Rutas

- Landing en la raíz, panel de la minera en `/panel`, explorer en `/proveedores` y ficha en `/proveedores/[id]`.
- La página inicial del scaffold de create-next-app se reemplaza por la landing.
- Solo español. Sin estructura de i18n.

### Módulo de dominio de compras (costura de tests 1)

- Un único módulo profundo concentra los datos y las reglas del dominio. Las páginas solo hablan con él; nunca leen el seed ni la fuente de datos directamente.
- Expone, con nombres del glosario:
  - listar proveedores verificados, con filtros por insumo/categoría y búsqueda por nombre, y orden por trust score;
  - obtener un proveedor verificado por id, con sus ofertas y el desglose del trust score;
  - listar las ofertas de un insumo;
  - listar el stock de la minera con el estado de cada insumo (normal o en alerta por estar por debajo del punto de reorden) y los días de stock restantes según el consumo;
  - registrar consultas, sus recomendaciones y la decisión de la minera (aprobar o rechazar), y leer el historial.
- Tipos del dominio, derivados del glosario: Minera, Proveedor verificado (incluye fuente de verificación), Insumo, Oferta, Trust score (valor + desglose de señales), Stock (con punto de reorden y consumo), Consulta, Recomendación (estado: pendiente, aprobada, rechazada).
- La fuente de datos va detrás del módulo como un adaptador intercambiable. Ahora: seed mock realista con insumos mineros variados (EPP, lubricantes, reactivos, filtros y repuestos) y proveedores con nombres y ubicaciones verosímiles de la región. Después: el adaptador al scraper del compañero, cuyo formato todavía no está definido (puede ser JSON, una base de datos o una API). Cambiar de adaptador no debe tocar páginas ni tests de dominio.
- El seed garantiza al menos un insumo en alerta al arrancar, para el demo.
- Consultas y decisiones se guardan en memoria del servidor durante la sesión del demo; no hay base de datos propia.

### Agente (costura de tests 2)

- Interfaz única: entra una consulta de la minera (texto y, opcionalmente, el insumo en alerta que la originó) y salen cero o más recomendaciones, cada una con insumo, oferta, proveedor verificado y justificación en texto.
- El agente obtiene datos solo a través del módulo de dominio de compras.
- Implementación actual guionada y determinística: para un insumo en alerta elige la oferta según una regla explícita que combina trust score, lead time y precio, y arma la justificación con esos datos. Responde a consultas libres reconocibles y devuelve cero recomendaciones con un motivo cuando no entiende la consulta.
- **Pendiente:** el equipo va a usar un LLM todavía no definido. La implementación con LLM se enchufa detrás de la misma interfaz y usa la guionada como respaldo si falla. Fuera de esta spec.
- La ejecución del agente ocurre en el servidor; la interfaz de usuario lo invoca y no conoce la implementación.

### Landing y 3D

- Una sola pieza 3D protagonista: el estante de almacén con insumos variados y la secuencia stock bajando → cruce del punto de reorden → alerta → recomendación del agente. El resto de la landing va sin animación de scroll: sin Lenis ni animaciones de entrada por sección.
- 3D 100% procedural con three.js: geometría armada en código, sin archivos GLB ni assets de terceros.
- La pieza adapta el patrón de ciclo de vida del componente `BigBag` del proyecto julit:
  - three.js se importa dinámicamente cuando el elemento se acerca a la pantalla;
  - los colores salen de las variables CSS del tema;
  - con `prefers-reduced-motion` o navegación por teclado se queda en una pose fija que igual muestra la alerta;
  - la animación se pausa fuera de pantalla o con la pestaña oculta;
  - maneja la pérdida del contexto WebGL y libera geometrías, materiales y texturas;
  - limita el pixel ratio;
  - tiene un SVG de respaldo con la misma escena, visible hasta que el canvas renderiza;
  - es decorativo para lectores de pantalla y el mensaje se transmite también en texto.
- El panel de la minera no tiene 3D.

### Identidad visual

- Dirección de seguridad industrial minera: grafito, amarillo de señalización y tonos minerales de la Puna. Tiene que diferenciarse claramente de julit (blanco + turquesa).
- Paleta final, tipografías y layout los define quien implemente, siguiendo la skill `frontend-design`: plan de tokens primero, revisión contra los defaults genéricos que la skill enumera y recién después código.
- Calidad mínima: responsive hasta mobile, foco visible, contraste accesible y reduced motion respetado.

### Contacto con proveedores

- El botón de contacto abre un modal simulado que confirma la acción; no envía correos ni hace llamadas externas.

### Mapa (opcional, última tarea)

- Mapa de Jujuy en el explorer con MapLibre, adaptando la capa `MineLayer` y la geometría procedural de mina de julit para mostrar la mina y los proveedores verificados. Solo si sobra tiempo después de todo lo demás.

## Testing Decisions

- **Qué es un buen test:** verifica comportamiento externo a través de la interfaz pública, nunca detalles internos. Un refactor que no cambia el comportamiento no debe romper tests.
- **Costura 1, módulo de dominio de compras (Vitest):** filtros y búsqueda de proveedores, orden por trust score, detección de alerta cuando el stock está por debajo del punto de reorden (incluido el borde exacto), cálculo de días de stock, ficha inexistente, y ciclo de una recomendación (pendiente → aprobada o rechazada, sin poder decidir dos veces). Corre contra el seed mock; cuando llegue el adaptador del scraper, los mismos tests validan que respeta el contrato.
- **Costura 2, agente (Vitest):** para un insumo en alerta devuelve una recomendación con una oferta existente de un proveedor verificado y una justificación que menciona precio, lead time y trust score; aplica la regla de elección de forma determinística; devuelve cero recomendaciones con motivo ante una consulta que no entiende. Los mismos tests deben seguir pasando cuando se agregue la implementación con LLM y su respaldo.
- **E2E (Playwright):** un test del flujo del demo completo: entrar a la landing → ir al panel → ver la alerta de stock → consultar al agente desde la alerta → recibir la recomendación → abrir la ficha del proveedor → usar el contacto simulado → volver y aprobar la recomendación → verla aprobada en el historial. Más chequeos de que la landing muestra el respaldo SVG con reduced motion y de que el filtro del explorer funciona. Usar la skill `playwright-cli` del repo para generar, correr y depurar los tests.
- **Sin tests automáticos:** la fidelidad visual del 3D y el estilo. Se revisan a mano con capturas, como pide `frontend-design`.
- **Prior art:** el repo no tiene tests todavía; hay que agregar Vitest y Playwright como dependencias de desarrollo (versiones publicadas hace al menos 7 días). Como referencia de estilo están los tests de Vitest de julit (acciones de lotes y verificación de lotes), que prueban módulos de dominio por su interfaz pública.

## Out of Scope

- Transacciones, pagos y órdenes de compra reales (los pagos automáticos son roadmap del pitch).
- Suscripción y facturación.
- Autenticación y múltiples mineras: el demo tiene una sola minera fija.
- Integración con el LLM real (pendiente, detrás de la interfaz del agente).
- Implementación del scraper (lo hace otro integrante); acá solo el adaptador cuando esté listo.
- Base de datos propia y persistencia entre reinicios.
- Envío real de mensajes al proveedor.
- 3D en el panel de la minera.
- Modelos GLB o assets 3D de terceros.
- Internacionalización.
- Integración con APIs de compras públicas (ChileCompra u otras): solo se mencionan en el pitch.

## Further Notes

- **Referencias en julit** (`/home/mauri/Escritorio/Projects/julit`), para adaptar patrones, no para copiar tal cual:
  - `app/landing/big-bag.tsx`: ciclo de vida completo de una pieza 3D procedural (carga diferida, colores de CSS, reduced motion, pérdida de contexto, respaldo SVG).
  - `app/explorer/components/lot-model.tsx`: animación 3D que representa una cantidad (bolsas que caen y se apilan) en React Three Fiber; útil para mostrar el stock bajando.
  - `app/explorer/components/mine-layer.ts` y `mine-geometry.ts`: capa 3D en MapLibre y mina procedural, para la tarea opcional del mapa.
- **Skills del repo** (`.devin/skills/`): `frontend-design` para landing y estilo; `tdd` para el módulo de dominio y el agente; `playwright-cli` para los tests E2E; `code-review` antes de mergear; `to-tickets` para partir esta spec en tickets independientes y repartirlos.
- **Orden sugerido:** módulo de dominio + seed → agente guionado → explorer → panel → landing con el estante 3D → E2E → mapa (opcional).
- Fuentes de proveedores verificados identificadas para el scraper: Registro Provincial de Proveedores Mineros de Jujuy, directorio de CAPMIN y asociados de CAEM.
