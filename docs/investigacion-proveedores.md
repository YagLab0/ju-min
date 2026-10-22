# Investigación de proveedores — qué información brindan y de dónde obtenerla

Parte de la documentación de ju-min — índice en [DOCS.md](DOCS.md).


Documento de investigación para **ju-min**: qué información brindan los
proveedores mineros (certificaciones, normas y cumplimientos) para poder
clasificarlos, y de qué fuentes reales obtenerla.

Relacionados: el modelo de clasificación está en
[modelo-clasificacion.md](modelo-clasificacion.md) y el schema de base de
datos en [schema-base-de-datos.md](schema-base-de-datos.md).

---

## 1. Qué información brindan los proveedores

En la industria minera, un proveedor no se "compra": se **homologa**. Antes de
poder ofertar, la minera (o una plataforma intermediaria como Achilles Regic o
la RNCCS de Codelco) le exige un paquete de antecedentes. La información se
agrupa en 10 dimensiones:

### 1.1 Identidad legal y fiscal

Es el piso mínimo — sin esto el proveedor ni siquiera entra a la red.

| Dato | Fuente típica |
|---|---|
| Razón social y nombre de fantasía | Registro provincial, directorios |
| CUIT (Argentina) / RUT (Chile) | Registro provincial, AFIP, cuitonline |
| Condición frente a IVA y antigüedad fiscal | cuitonline, constancia AFIP |
| Domicilio legal y de planta | Directorios, registros |
| Representantes legales / poderes | Escrituras, estatutos |
| Constitución societaria | Registro público de comercio |

**Señal de clasificación:** CUIT validado + antigüedad fiscal alta ⇒ puntos en
el trust score. En Argentina, estar inscripto en el **Registro Provincial de
Proveedores Mineros de Jujuy** (Decreto 290-DEyP-24) es ya una validación
estatal: el registro expone razón social, CUIT, contacto y estado
(aprobado/pendiente).

### 1.2 Situación financiera

- Estados contables / balance (antigüedad 1–3 años)
- Seguros vigentes: responsabilidad civil, ART, caución
- Informes crediticios (tipo D&B, Veraz/Nosis en Argentina)
- Capacidad financiera declarada / facturación anual

**Señal:** seguros vigentes + solvencia verificable. En la demo puede
simplificarse a "informe comercial disponible: sí/no".

### 1.3 Certificaciones de sistema de gestión (empresa)

Son certificaciones **de la empresa**, no del producto. El trío base que piden
casi todas las mineras:

| Norma | Ámbito | Frecuencia de exigencia |
|---|---|---|
| ISO 9001 | Gestión de calidad | Casi siempre obligatoria |
| ISO 14001 | Gestión ambiental | Muy frecuente |
| ISO 45001 | Seguridad y salud ocupacional | Muy frecuente (ex OHSAS 18001) |
| ISO 50001 | Gestión energética | Cada vez más pedida (ESG) |
| ISO 37001 | Antisoborno / compliance | Mineras grandes (Codelco, BHP) |
| ISO 27001 | Seguridad de la información | Proveedores de software/IT |
| ISO 39001 | Seguridad vial | Transporte/logística |
| ISO 22301 | Continuidad de negocio | Ocasional, alto riesgo |

Metadatos que acompañan a cada certificación (críticos para el modelo de
datos): **organismo certificador** (DNV, Bureau Veritas, IRAM, TÜV, SGS),
**número de certificado**, **fecha de emisión y vencimiento**, **alcance**
(texto del certificado), **documento/evidencia** (PDF).

### 1.4 Certificaciones de producto / material

Aplican al **insumo ofrecido**, no a la empresa. Varían por categoría:

| Categoría de insumo | Certificaciones / normas típicas |
|---|---|
| EPP | IRAM, ANSI/ISEA, EN (marcado CE), NIOSH (respiradores), NFPA 2112 (ignífugo) |
| Químicos / reactivos | GHS/CLP + SDS (hoja de seguridad), REACH, **International Cyanide Management Code** (obligatorio para cianuro), ISO 14001 del fabricante |
| Explosivos | Habilitación del organismo estatal (AR: ANMaC/RENAR; CL: SERNAGEOMIN; PE: SUCAMEC), transporte de mercancías peligrosas (clase UN/IMO) |
| Medios de molienda y aceros | Certificado de material **EN 10204 3.1/3.2** (trazabilidad del acero), ASTM, ensayos de laboratorio acreditado ISO/IEC 17025 |
| Equipos eléctricos | IECEx / ATEX (atmósferas explosivas), IEC, UL, grado IP |
| Equipos a presión / mecánicos | ASME Sección VIII, B31 (piping), API, procedimientos de soldadura WPS/PQR |
| Geosintéticos | **GRI-GM13** (geomembranas HDPE para pilas de lixiviación), ensayos de compatibilidad química |
| Combustibles / lubricantes | Especificación del combustible (IRAM/EN 590 para diésel), fichas técnicas |
| Monitoreo ambiental | Laboratorio acreditado ISO/IEC 17025, métodos normalizados EPA/IRAM |

**Señal clave para el agente:** un insumo puede *requerir* una certificación
concreta (ej. geomembrana ⇒ GRI-GM13) — eso modela como una tabla de requisitos
por categoría de insumo, no como texto libre.

### 1.5 Habilitaciones regulatorias sectoriales

Habilitaciones estatales, distintas de las certificaciones privadas:

- Registro Provincial de Proveedores Mineros (Jujuy: Decreto 290-DEyP-24)
- Habilitaciones de sustancias peligrosas / explosivos (RENAR, ANMaC)
- Transporte de mercancías peligrosas (RID/ADR local)
- Registro en cámaras sectoriales (CAPMIN, CAEM, APRIMIN)
- Habilitaciones municipales/provinciales de planta

### 1.6 Desempeño en HSEC (salud, seguridad, ambiente)

Lo que miden los cuestionarios de precalificación (Achilles, Gold Fields,
Codelco) además de las ISO:

- Políticas HSE documentadas
- Estadísticas de seguridad: tasa de frecuencia de accidentes (LTIFR), índice
  de incidentes, historial de fatalidades
- Exámenes pre-ocupacionales y de **altura geográfica** del personal (faenas a
  3.500–4.500 msnm — en Jujuy/Salta/Catamarca es exigencia real: Sales de
  Jujuy, Minera Exar, Lindero operan en la Puna)
- Planes de emergencia, gestión de residuos, manejo de derrames

### 1.7 ESG / sostenibilidad

Peso creciente en evaluación:

- Huella de carbono reportada (ISO 14064 / GHG Protocol)
- Reporte de sostenibilidad (GRI)
- Políticas de derechos humanos, trabajo infantil, comunidades locales
- Código de conducta de proveedores adherido (ej. Supplier Code of Conduct del
  comprador)
- Marcos sectoriales: **Copper Mark**, IRMA, ResponsibleSteel (más para
  mineras que para proveedores, pero bajan en cascada)
- Codelco aplica due diligence tipo **OECD 5-Step** para cadena de minerales:
  screening de corrupción, lavado, soborno, financiamiento del terrorismo

### 1.8 Cumplimiento legal y reputacional

- Screening de sanciones, PEPs, medios adversos (third-party screening)
- Declaraciones de esclavitud moderna, anticorrupción
- Protección de datos
- Litigios / antecedentes laborales

### 1.9 Capacidad operativa

- Productos/servicios ofrecidos por categoría (CAPMIN usa ~180 categorías;
  CAEM agrupa en productos/servicios/minerales)
- Lead time declarado, stock disponible, capacidad de producción
- Cobertura geográfica (CAEM distingue "ubicación de la empresa" vs.
  "provincias donde opera")
- Flota, planta, personal propio vs. subcontratado

### 1.10 Historial de desempeño

- Entregas a tiempo (OTIF), penalidades, contratos previos con mineras
- Ratings/reviews en directorios (CAPMIN expone rating 0–5 y vistas)
- Referencias comerciales

### Resumen: cuestionario de precalificación tipo Achilles

Achilles Regic (la comunidad minera real de referencia) estructura su
cuestionario en: datos corporativos → productos/servicios → finanzas →
seguros y legal → salud/seguridad/calidad → continuidad de negocio →
sostenibilidad ambiental → ética de negocios → cyber/IT → gestión de riesgo.
Proveedores de mayor riesgo pasan a **auditoría presencial** (tier "Verify")
cuyo informe queda en la plataforma.

---

## 2. Fuentes de datos reales para poblar la demo

### Tier 1 — usar ya

| Fuente | URL | Qué da | Uso en ju-min |
|---|---|---|---|
| **Registro Provincial de Proveedores Mineros de Jujuy** | proveedores.registrominero.jujuy.gob.ar | Razón social, CUIT, contacto, estado (aprobado/pendiente). Registro oficial del gobierno (Decreto 290-DEyP-24) | "Lista de buena fe": verificación estatal. Pitch: proveedores salen del registro provincial |
| **Directorio CAPMIN** | capmin.com.ar/directorio-proveedores-mineros | Nombres reales, direcciones, sitios web, ~180 categorías de insumos/servicios, rating, vistas | Fuente principal del explorer de proveedores |
| **Asociados CAEM** | caem.com.ar/asociados | Mineras reales (Sales de Jujuy, Minera Exar, Litica…), proveedores adherentes, filtros por tipo/mineral/producto/servicio/provincia de operación | La "minera cliente" del demo + enriquecer cobertura geográfica |

### Tier 2 — enriquecer

| Fuente | Qué da | Uso |
|---|---|---|
| cuitonline.com | Antigüedad fiscal, domicilio, condición frente a IVA por CUIT | Inputs reales del trust score |
| MercadoLibre / catálogos industriales | Órdenes de magnitud de precios (EPP, lubricantes, filtros) | Sintetizar precios plausibles — no hay precios B2B públicos |
| Nominatim / OpenStreetMap | Geocodificación de direcciones scrapeadas | Mapa en el explorer |

### Tier 3 — pitch solamente

| Fuente | Nota |
|---|---|
| API ChileCompra (api.mercadopublico.cl) | API pública real y gratis (ticket por mail) con licitaciones y OC de 118.000 proveedores. No integrar; nombrar en roadmap |

### Qué NO dan las fuentes públicas (y hay que sintetizar)

- Precios B2B, lead times reales, disponibilidad de stock
- Certificados concretos (número, organismo, vencimiento) — los directorios
  dicen a lo sumo "certificado ISO 9001" en texto libre
- Estadísticas HSE, trust score — se calculan sobre datos simulados con forma
  realista

### Proveedores incluidos en el seed

Listado de los proveedores que pueblan `supabase/seed.sql`. Los de
`fuente='capmin'` son reales del directorio CAPMIN (nombre, dirección y
categorías verificados contra el sitio); los `fuente='manual'` son sintéticos
creados para cubrir categorías sin proveedor real disponible.

| Razón social | Fuente | Provincia | Categorías | Estado seed | Registro Jujuy |
|---|---|---|---|---|---|
| ACERIAS 4C SA | capmin | Santa Fe | Bolas de Molino, Molienda | homologado | — |
| AUSTIN POWDER | capmin | Santa Fe | Fabricante de Explosivos, Explosivos | homologado | aprobado |
| BAC DALL ARGENTINA SA | capmin | CABA | Elementos Protección Personal | homologado | aprobado |
| ANDREANI LOGÍSTICA SA | capmin | Buenos Aires | Transporte, Transporte de cargas pesadas | validado | — |
| 3D ELECTRO SAN JUAN | capmin | San Juan | CCTV, Infraestructura eléctrica, Telecomunicaciones | validado | — |
| BMI SA | capmin | Salta | Construcciones, Servicios Mineros, Obras y Servicios | validado | pendiente |
| ANDEMIRA SA | capmin | CABA | Servicios Mineros | auditado | aprobado |
| AVINCO CONSTRUCCIONES S.A. | capmin | CABA | Construcciones, Ingeniería | registrado | — |
| BRALBOL SA | capmin | Buenos Aires | big bag | documentado | — |
| ALPARDATA SAS | capmin | Mendoza | Informática | validado | — |
| ACONCAGUA SERVICIOS MINEROS SRL | capmin | San Juan | Servicios Mineros, Transporte | registrado | — |
| 9AMAS | capmin | Salta | Capacitaciones | validado | pendiente |
| ASG CONSULTORA | capmin | Córdoba | Consultoría, Higiene y seguridad | validado | — |
| BAYTON SA | capmin | Buenos Aires | Servicios operativos | documentado | — |
| LUBRIANDES SA | manual | Córdoba | Lubricantes, Combustibles | homologado | — |
| FILTROPUNA SRL | manual | Jujuy | Filtros, Repuestos, Ferretería Industrial | homologado | aprobado |
| GEOMEMBRANAS DEL NOA SA | manual | Salta | Geomembranas, Geosintéticos | homologado | aprobado |
| QUIMIPLANT SRL | manual | Mendoza | Industria química, Laboratorio ambiental | validado | — |
| SEGURIDAD PUNA SRL | manual | Jujuy | Higiene y seguridad, EPP | homologado | aprobado |
| TRANSANDINA LOGÍSTICA SA | manual | Salta | Transporte de cargas pesadas, Transporte | homologado | aprobado |

**Otras razones sociales reales** presentes en el directorio CAPMIN (página 1
del listado) disponibles para ampliar el seed en el futuro: ADECCO ARGENTINA
SA, ADRIAN MERCADO, AESA, AGUARTEC, AIES SA, ALGIERI SA, ALL SHIP LOGISTICS,
ALLARIA, AT INVERSIONES, BASANI S.A., BAUZA INGENIERIA SRL, BENMONZ SA, BIG 6
ADVISORS, BRIGHTSIDE IT CONSULTING SA, ABANS CONSTRUCCIÓN, ADRIAN MERCADO y
entidades financieras (Balanz, Banco Comafi, Banco Galicia, Banco Macro, Banco
San Juan, Banco Supervielle).

---

