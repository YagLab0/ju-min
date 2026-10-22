# 01: Reglas del agente: dominio acotado y rechazo fijo

**What to build:** el agente solo atiende consultas de abastecimiento minero (stock e insumos, proveedores verificados, ofertas, recomendaciones de compra), meta-consultas del producto (qué es ju-min, la red verificada, el trust score) y saludos breves que redirige a su función. Ante una consulta fuera de dominio responde siempre el mismo mensaje fijo, definido literalmente en sus instrucciones, sin responder ni un fragmento del contenido pedido; en consultas mixtas responde solo la parte de dominio. Las reglas viven enteras en `agent/instructions.md`; el término "consulta fuera de dominio" se agrega a `GLOSSARY.md`. No hay tools ni capa determinística.

Spec: `.scratch/reglas-agente/spec.md`. Vocabulario: `GLOSSARY.md`. Leer las docs de eve en `node_modules/eve/docs/` antes de escribir código. Ojo: `agent/tools/` y `agent/lib/` tienen trabajo parcial sin commitear de otro spec; no tocarlo.

**Blocked by:** None (can start immediately)

**Status:** ready-for-agent

- [x] Una consulta fuera de dominio (clima, chit-chat, código, conocimiento general) produce el mensaje fijo de rechazo y nada del contenido pedido
- [x] El mensaje fijo está definido literalmente en `instructions.md`, en español y con vocabulario del glosario; se repite igual ante distintas consultas ajenas
- [x] Una consulta de dominio responde con contenido (no el mensaje fijo)
- [x] Una meta-consulta del producto (qué es ju-min, trust score, red verificada) responde con contenido
- [x] Un saludo breve se acepta y redirige a la función del agente
- [x] Una consulta mixta (dominio + ajena) responde solo la parte de dominio
- [x] Se conservan las reglas existentes: español, solo proveedores verificados, justificación precio + lead time + trust score, ninguna compra sin aprobación, nunca inventar datos
- [x] `GLOSSARY.md` incluye el término "consulta fuera de dominio"
- [x] Tests de la sesión por HTTP (`/eve/v1` + stream): off-topic → texto fijo; dominio → contenido; meta → contenido; mixta → solo parte de dominio. Test de dev, no CI
- [x] `pnpm lint` y `pnpm exec tsc --noEmit` pasan

## Comments

Implementado: instructions.md reescrito con dominio acotado + mensaje fijo literal, término en GLOSSARY.md, test `e2e/agente-reglas.spec.ts` (5 casos por seam HTTP `/eve/v1`). **Verificación en vivo pendiente**: la cuota free-tier de Google se agotó durante el desarrollo (20 req/día, 429); los tests quedan listos para correr con key nueva/reset.
