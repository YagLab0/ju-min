# Pitch — Jumin (versión extendida)

**Desafío:** El problema de los proveedores mineros certificados

---

## Elevator pitch (30 s)

En la minería, elegir proveedor no es solo precio: hay que verificar
certificaciones ISO, estándares ESG y habilitaciones para alta montaña. Hoy eso
significa horas entre listas estáticas, planillas sueltas y PDFs — y nadie sabe
si el certificado sigue vigente.

**Jumin** es un consultor inteligente de compras para minería: una red de
proveedores verificados con trust score transparente, alertas de stock por
punto de reorden y un agente en lenguaje natural que recomienda qué comprar, a
quién y por qué — siempre con aprobación humana.

---

## Guion del pitch (5 min — versión extendida)

### 1. Gancho + problema (45 s)

> "Imaginen que el turno no puede entrar a la mina porque se acabaron los
> respiradores. Cada uno cuesta unos miles de pesos. La mina parada cuesta
> miles de dólares por hora."

El responsable de compras de una minera valida cada proveedor a mano. Las
certificaciones viven en PDFs, los listados están desactualizados y nadie sabe
si la certificación está vigente. Comprar mal cuesta caro: en la Puna, un
proveedor sin habilitación para alta montaña es un riesgo de seguridad, no solo
de precio.

*(Transición: "¿Y si la minera supiera, antes de que falte stock, quién puede
venderle y por qué puede confiar en ese quién?")*

### 2. La solución (60 s)

Jumin junta tres piezas que hoy están separadas:

- **Red de proveedores verificados** — 277 proveedores en la red, relevados de
  fuentes públicas reales (directorio CAPMIN + Registro Provincial de Jujuy).
  Cada uno con un **trust score 0–100 con desglose**: identidad, compliance,
  desempeño, ESG y capacidad.
- **Alertas de stock** — la minera carga su stock con punto de reorden por
  insumo; Jumin detecta qué está por faltar y cuántos días de margen quedan.
- **El agente** — un consultor en lenguaje natural, acotado al dominio de
  abastecimiento, que compara ofertas y recomienda con justificación de precio,
  lead time y trust score.

> "La regla de oro: un proveedor solo puede ser recomendado si cumple **todos**
> los requisitos obligatorios de la categoría del insumo — explosivos exigen
> ANMaC, geomembranas exigen GRI-GM13, EPP exige IRAM. La regla vive en la base
> de datos, no en el prompt del agente."

### 3. Cómo funciona: un caso real (90 s)

Sin demo en vivo: el caso se cuenta sobre la lámina 3 del deck, con datos de la
base.

1. **Detecta:** los respiradores bajan a 30 unidades y el punto de reorden es
   50; salta la alerta.
2. **Compara:** solo entran proveedores verificados que cumplen los requisitos
   de la categoría (ISO 9001 e IRAM-EPP). Quedan BAC Dall ($42.700, 10 días) y
   Seguridad Puna ($45.800, 4 días), los dos con trust score 87.
3. **Recomienda con justificación:** Seguridad Puna. Cuesta un 7 % más, pero
   llega 6 días antes, y con el stock bajo el mínimo el plazo pesa más.
4. **La minera decide:** la recomendación queda pendiente hasta que alguien la
   aprueba o la rechaza. El agente nunca compra.

*(Mención opcional: el agente está acotado a abastecimiento; si le preguntan
por el clima, responde con un rechazo fijo. En la app, el catálogo de insumos
compara las ofertas lado a lado y la ficha del proveedor muestra
certificaciones y vencimientos.)*

### 4. Por qué es defendible (45 s)

- **Datos reales**: 277 proveedores (271 scrapeados de CAPMIN con scraper
  propio), 188 categorías, 58 reglas de requisitos por categoría. Si Supabase
  no responde, la app cae a un seed en memoria, así que nunca queda en blanco.
- **Seguridad real**: RLS en Postgres — el público solo ve la red verificada;
  cada minera ve solo sus datos; roles comprador/aprobador/admin.
- **Auditable**: cada recomendación guarda su justificación; el historial de
  decisiones es consultable.

### 5. Modelo y cierre (45 s)

- **Modelo**: suscripción por minera — el consultor de procurement como
  servicio. Escala a pagos automáticos al detectar falta de stock, con
  aprobación humana configurable.
- **Roadmap**: verificación contra registros públicos (Jujuy, AFIP), APIs de
  compras públicas (ChileCompra), integración con ERPs y facturación
  electrónica.

> "Jumin no reemplaza al comprador: le devuelve las horas que hoy pierde
> verificando PDFs, y deja la decisión en manos humanas. Proveedores reales,
> reglas claras, y cada recomendación se defiende con tres números: precio,
> lead time, trust score."

---

## Stack

Next.js 16 · eve (agente durable de Vercel) con DeepSeek V4.1 Flash vía OpenCode Go · Assistant UI ·
Supabase (Postgres + Auth + RLS + Storage) · TypeScript · Tailwind.
Datos: 271 proveedores CAPMIN con scraper propio + seed curado.

---

## Respuestas rápidas para el jurado

**¿Los datos son reales?**
Sí: 271 proveedores de CAPMIN scrapeados de fuentes públicas; el resto del seed
sigue el mismo esquema. Si Supabase no responde, la app cae al seed en memoria.

**¿El agente inventa?**
No: sus instrucciones le prohíben inventar datos — si no tiene el dato, lo
dice. Solo lee a través del módulo de dominio.

**¿Puede comprar solo?**
No: aprobación humana obligatoria. El agente propone, la minera decide.

**¿Es solo un chatbot?**
No: dominio completo — stock, ofertas, trust score, historial de consultas y
decisiones auditables. El chat es una interfaz más.

**¿Cómo verifican a un proveedor?**
Pipeline de estados: registrado → documentado → validado → auditado →
homologado. Con RLS, el público solo ve la red verificada.

**¿Qué pasa si se vence una certificación?**
`cumple_requisitos()` chequea vigencia por fecha — un certificado vencido saca
al proveedor de las recomendaciones automáticamente.

**¿Sirve para otras regiones/minas?**
Sí: categorías, requisitos y habilitaciones son datos del catálogo, no código —
agregar una jurisdicción es cargar sus reglas.

**¿Y el Registro de Jujuy?**
Próximo paso del roadmap: cruzar `proveedores.cuit` contra el registro
provincial para elevar el estado de verificación automáticamente.
