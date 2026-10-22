# Spec: Reglas del agente — solo consultor de compras

**Status:** ready-for-agent

## Problem Statement

El agente de ju-min hoy responde cualquier cosa que le escriban: si la minera (o
el jurado del demo) le pregunta "¿cómo está el clima?" o le pide ayuda de
programación, responde igual. Eso rompe la ilusión del producto: ju-min es un
consultor de compras de insumos para minería, no un asistente general. Las
reglas actuales del system prompt describen el rol pero no acotan qué consultas
atiende ni qué hace ante una fuera de dominio.

## Solution

Las reglas del agente quedan explícitas en sus instrucciones: solo atiende
consultas del dominio de abastecimiento minero y meta-consultas sobre el
producto; cualquier otra consulta recibe un mensaje fijo de rechazo, siempre el
mismo, sin responder ni un fragmento del contenido pedido. El refuerzo es a
nivel de instrucciones del agente (prompt-level), suficiente para el demo.

## User Stories

1. Como minera, quiero que el agente responda mis consultas de stock, insumos, proveedores verificados, ofertas y recomendaciones, para resolver mis dudas de compra.
2. Como minera, quiero preguntarle al agente qué es ju-min, cómo funciona la red de proveedores verificados o qué significa el trust score, para entender el producto sin salir de la conversación.
3. Como minera, quiero saludar al agente brevemente y que me oriente sobre qué puedo consultarle, para empezar la conversación sin fricción.
4. Como jurado del hackathon, quiero que una consulta fuera de dominio ("¿qué tiempo hace?", "escribime un componente React", "¿quién ganó el mundial?") reciba un rechazo, para ver que el agente tiene un rol acotado.
5. Como jurado, quiero que el rechazo sea siempre el mismo mensaje, para reconocer que el comportamiento es una regla del producto y no una improvisación.
6. Como jurado, quiero que el agente no responda ni una parte del contenido fuera de dominio, para comprobar que la regla se cumple de verdad.
7. Como minera, quiero que una consulta que mezcla un pedido de compras con algo ajeno obtenga respuesta solo a la parte de compras, para que la regla no me quite información útil.
8. Como integrante del equipo, quiero las reglas escritas en un solo lugar del agente, para modificarlas sin tocar código.
9. Como presentador del demo, quiero que el agente no invente datos cuando le falta información, para no improvisar en vivo.
10. Como minera, quiero que el agente nunca confirme una compra sin mi aprobación explícita, para mantener el control de las decisiones.

## Implementation Decisions

- **Las reglas viven en `agent/instructions.md`** (el system prompt del agente eve). Es el único archivo que cambia: el refuerzo es a nivel instrucciones, no hay capa determinística ni tools nuevas.
- **Dominio atendido:**
  - Procurement: stock de insumos y puntos de reorden, faltantes, proveedores verificados, ofertas (precio, unidad, lead time, disponibilidad), recomendaciones de compra y su estado.
  - Meta-consultas del producto: qué es ju-min, qué es la red de proveedores verificados, qué es el trust score, cómo funciona el demo.
  - Saludos y cortesías breves: se aceptan y el agente responde redirigiendo a su función.
- **Rechazo con mensaje fijo:** ante una consulta fuera de dominio, el agente responde siempre el mismo texto, definido literalmente en las instrucciones (copy en español, vocabulario del glosario). El texto se presenta como consultor de compras de insumos de ju-min y declara que no puede responder ese tema. No agrega ejemplos ni contenido variable: la fijeza del mensaje es parte del comportamiento observable.
- **Nada de respuestas parciales:** el agente no responde el contenido fuera de dominio ni siquiera un fragmento, ni "de yapa". Si una consulta mezcla una parte de dominio con otra ajena, responde solo la parte de dominio e ignora el resto.
- **Se conservan las reglas existentes:** español siempre; solo proveedores verificados; justificación con precio + lead time + trust score; ninguna compra sin aprobación humana explícita; si falta un dato lo declara en vez de inventarlo.
- **Glosario:** se agrega a `GLOSSARY.md` el término **consulta fuera de dominio**: consulta que no trata de abastecimiento minero ni del producto ju-min; el agente la rechaza con un mensaje fijo. Se usa en instrucciones, copy y tests.

## Testing Decisions

- **Qué es un buen test:** verifica comportamiento externo por la interfaz pública (la sesión HTTP del agente), nunca el contenido interno del prompt ni la salida exacta del LLM, que es no determinística.
- **Una sola costura, la más alta y más barata que la del browser:** la sesión del agente vía `/eve/v1` — `POST /eve/v1/session` con la consulta y lectura del stream NDJSON. No hace falta Playwright para esta feature: la superficie pública es la respuesta del agente, alcanzable por HTTP directo.
- **Casos del test:** (a) una consulta fuera de dominio produce el mensaje fijo de rechazo (se verifica que la respuesta es el texto fijo definido en instrucciones, no el contenido pedido); (b) una consulta de dominio responde con contenido no vacío y no es el mensaje fijo; (c) una meta-consulta del producto también se responde; (d) una consulta mixta responde la parte de dominio y no trata la ajena.
- Corre contra eve + Gemini reales con la key de `.env.local`; test de desarrollo, no CI. La aserción del mensaje fijo es tolerante al formato (la respuesta contiene el texto fijo, no exige byte-a-byte del stream).
- **Prior art:** el E2E de chat-llm ya ejerce la sesión del agente por browser; acá se baja un nivel al mismo seam por HTTP para no pagar el costo del browser.

## Out of Scope

- Tools del agente contra Supabase (listar proveedores, ofertas, stock, proponer recomendación): spec aparte.
- Refuerzo determinístico de las reglas (filtro pre-modelo, clasificador de dominio): prompt-level alcanza para el demo.
- Cambios en el modelo, la UI del chat, o la página `/panel`.
- Persistencia de consultas/rechazos en base de datos.
- Evals de eve formales.

## Further Notes

- eve está en beta: las docs de `node_modules/eve/docs/` tienen prioridad. El formato de `instructions.md` ya existe en el repo.
- **Trabajo parcial preexistente:** quedaron sin commitear `agent/tools/` y `agent/lib/supabase.ts` de un intento anterior (~460 líneas: listar_insumos, get_stock_minera, listar_ofertas, listar_proveedores, proponer_recomendacion + cliente Supabase). Pertenecen al spec de tools/Supabase, no a este. Se conservan para reutilizar ahí; este spec no las toca ni las requiere.
- El mensaje fijo de rechazo queda definido literalmente en `instructions.md` para que el test pueda afirmarlo.
- Modelo actual: `gemini-3.5-flash` (el 3.8 estaba con alta demanda).
