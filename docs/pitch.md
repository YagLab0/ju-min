# Pitch — ju-min (versión extendida)

**Desafío:** El problema de los proveedores mineros certificados (Hackathon INNOA — Jujuy)

---

## Elevator pitch (30 s)

En la minería, elegir proveedor no es solo precio: hay que verificar
certificaciones ISO, estándares ESG y habilitaciones para alta montaña. Hoy eso
significa horas entre listas estáticas, planillas sueltas y PDFs — y nadie sabe
si el certificado sigue vigente.

**ju-min** es un consultor inteligente de compras para minería: una red de
proveedores verificados con trust score transparente, alertas de stock por
punto de reorden y un agente en lenguaje natural que recomienda qué comprar, a
quién y por qué — siempre con aprobación humana.

---

## Guion del pitch (5 min — versión extendida)

### 1. Gancho + problema (45 s)

> "Imaginen que la planta deja de moler porque faltan bolas de acero. El
> insumo cuesta centavos el kilo. La planta parada cuesta miles por hora."

El responsable de compras de una minera valida cada proveedor a mano. Las
certificaciones viven en PDFs, los listados están desactualizados y nadie sabe
si la certificación está vigente. Comprar mal cuesta caro: en la Puna, un
proveedor sin habilitación para alta montaña es un riesgo de seguridad, no solo
de precio.

*(Transición: "¿Y si la minera supiera, antes de que falte stock, quién puede
venderle y por qué puede confiar en ese quién?")*

### 2. La solución (60 s)

ju-min junta tres piezas que hoy están separadas:

- **Red de proveedores verificados** — 277 proveedores en la red, relevados de
  fuentes públicas reales (directorio CAPMIN + Registro Provincial de Jujuy).
  Cada uno con un **trust score 0–100 con desglose**: identidad, compliance,
  desempeño, ESG y capacidad.
- **Alertas de stock** — la minera carga su stock con punto de reorden por
  insumo; ju-min detecta qué está por faltar y cuántos días de margen quedan.
- **El agente** — un consultor en lenguaje natural, acotado al dominio de
  abastecimiento, que compara ofertas y recomienda con justificación de precio,
  lead time y trust score.

> "La regla de oro: un proveedor solo puede ser recomendado si cumple **todos**
> los requisitos obligatorios de la categoría del insumo — explosivos exigen
> ANMaC, geomembranas exigen GRI-GM13, EPP exige IRAM. La regla vive en la base
> de datos, no en el prompt del agente."

### 3. El demo (90 s)

> "Alerta de stock → consulta → recomendación justificada → aprobación humana."

1. El panel muestra un insumo en alerta (bajo el punto de reorden).
2. La minera le consulta al agente: *"¿quién me entrega respiradores más
   rápido?"* — el agente entiende "rápido" y pondera lead time.
3. El agente responde con la oferta justificada: proveedor, precio, lead time y
   trust score — con datos reales, nunca inventados.
4. La minera aprueba o rechaza en el panel. El agente nunca compra: propone, la
   persona decide.
5. Bonus para el jurado: probarle *"¿cómo está el clima?"* — responde un
   rechazo fijo. Está acotado a su dominio por diseño.

*(Mención opcional: el explorer muestra las fichas con certificaciones y
vencimientos — la evidencia que hoy vive en PDFs, estructurada.)*

### 4. Por qué es defendible (45 s)

- **Datos reales**: 277 proveedores (271 scrapeados de CAPMIN con scraper
  propio), 188 categorías, 58 reglas de requisitos por categoría. Si Supabase
  no responde, la app cae a un seed en memoria — el demo nunca queda en blanco.
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

> "ju-min no reemplaza al comprador: le devuelve las horas que hoy pierde
> verificando PDFs, y deja la decisión en manos humanas. Proveedores reales,
> reglas claras, y cada recomendación se defiende con tres números: precio,
> lead time, trust score."

---

## Stack

Next.js 16 · eve (agente durable de Vercel) con Gemini · Assistant UI ·
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
