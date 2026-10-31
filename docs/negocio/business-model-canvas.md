# Business Model Canvas — ju-min

> **Enfoque del modelo**: **SaaS B2B de un solo lado (100 % para la minera)**.
> `ju-min` evita la trampa del marketplace de dos lados: no requiere que los proveedores entren a crear cuentas ni que un equipo humano persiga a cientos de PyMEs gratuitas. Toda la vigilancia del padrón local (`CerProv` del Decreto 290/2024 y CAPMIN) ocurre por **scraping automático de fuentes públicas**, y los certificados técnicos privados que la minera ya pide al cotizar se controlan directamente dentro del legajo de la minera en `ju-min`.

---

## 1. Segmentos de Clientes (*Customer Segments*)

Un **único segmento cliente que usa y paga**: **Operadoras mineras en producción o construcción en Jujuy y el NOA**.
- **Mercado directo en Jujuy**: 3 operaciones industriales activas (*Sales de Jujuy / Rio Tinto* en Olaroz, *Minera Exar* en Cauchari-Olaroz y *SSR Mining* en Chinchillas/Pirquitas) más proyectos de litio y metalíferos en etapa de construcción/exploración avanzada en el NOA (Salta y Catamarca: ~10 a 20 operaciones en total).
- **Roles internos dentro de la minera**:
  - **Usuario operativo**: Analistas de Compras, Abastecimiento y Almacenes (entran con su email para buscar proveedores, verificar requisitos y descargar el informe PDF de respaldo).
  - **Comprador económico (quien aprueba y paga)**: Gerencia de Supply Chain / Abastecimiento o Compliance *(supuesto H1)*, que aprueba las órdenes de compra en el ERP de la minera y responde por el cumplimiento del **Decreto Acuerdo Nº 290-DEyP/2024** (70 % de compre local y auditoría anual).

---

## 2. Propuesta de Valor (*Value Propositions*)

1. **Vigilancia continua sobre su propio ERP**: Verifica qué proveedores cumplen las 58 reglas técnicas por categoría y quiénes tienen su certificado provincial (`CerProv`) en estado `aprobado` hoy.
2. **Respaldo auditable del Decreto 290/2024 de Jujuy (70 % local)**: Emite en cada compra un **informe PDF verificable con sello SHA-256** que deja constancia del proveedor elegido y de los descartados con su motivo exacto, sirviendo como respaldo tanto para el informe anual de compras (**Art. 7**) como para la Declaración Jurada anual de insumos sin oferta local (**Art. 8**).
3. **Control automático de vencimientos sin perseguir proveedores**: Combina **scraping semanal** del Registro Minero de Jujuy y CAPMIN con **lectura automática de vencimientos** sobre los PDFs de certificados técnicos que recibe el comprador, avisándole a la minera 30 días antes de que venza un documento de su cartera.
4. **Cero migración de software**: El informe PDF se adjunta directamente a la Orden de Compra en el ERP actual de la minera (SAP, Oracle, etc.).

---

## 3. Canales (*Channels*)

Embudo B2B consultivo hacia las 10–20 operaciones mineras del NOA:
1. **Puerta de entrada (Descubrimiento y referidos)**: Presentación a través de cámaras mineras (**CAPMIN**, **CAEM**), estudios de auditoría/compliance minero y contacto directo con referentes de Abastecimiento y Relaciones Comunitarias / Compre Local de las operadoras en Jujuy.
2. **Evaluación (Diagnóstico de cumplimiento Decreto 290)**: Demo en vivo mostrando el padrón real de 277 proveedores de Jujuy/CAPMIN cruzado contra una compra crítica de la minera y cómo se genera el informe PDF para el Art. 8 *(supuesto)*.
3. **Compra (Piloto B2B)**: Piloto de 2 semanas sobre compras reales de la operación antes de activar el abono mensual *(supuesto)*.
4. **Entrega y Uso**: Aplicación web (`ju-min`), descarga de informes PDF para adjuntar al ERP y alertas por email al equipo de Compras cuando un proveedor de su cartera está por vencer o cae a estado `pendiente` en el Registro de Jujuy.

---

## 4. Relación con Clientes (*Customer Relationships*)

- **Alta asistida (*White-glove onboarding*)**: El equipo de `ju-min` crea la cuenta de la operación minera, da de alta los emails del equipo de Compras y carga su listado inicial de insumos/proveedores frecuentes desde un Excel del ERP.
- **Uso diario automatizado (*Self-service*)**: Disparo de alerta → filtro por 58 reglas y Registro de Jujuy → consulta al agente IA → descarga de informe PDF para adjuntar al ERP.
- **Co-creación de reglas específicas**: Ajuste de las reglas de certificaciones exigidas según los estándares internos de Higiene, Seguridad y Medio Ambiente (HSE) de cada operadora *(supuesto)*.

---

## 5. Fuentes de Ingresos (*Revenue Streams*)

- **Suscripción mensual B2B (SaaS) por operación minera**:
  - Cubre la vigilancia semanal por scraping, el control de vencimientos de certificados, el agente IA y la emisión ilimitada de informes PDF verificables.
  - **Precio objetivo**: **USD 1.000 a USD 3.000 / mes por operación minera** *(supuesto H3)* (con escalón de entrada / piloto desde USD 350–500/mes para validación inicial).
  - En el mercado del NOA (10 a 20 operaciones activas), representa un potencial de **USD 120.000 a USD 720.000 / año** con un costo marginal casi nulo por cliente adicional.
- **Sin comisión por transacción y sin cobro al proveedor**: `ju-min` no procesa pagos ni le cobra a los proveedores por figurar, garantizando **neutralidad absoluta** ante las auditorías de Compliance y de la Provincia.

---

## 6. Recursos Clave (*Key Resources*)

- **Base unificada de 277 proveedores reales y 188 categorías** (`CAPMIN` + `Registro Provincial de Proveedores Mineros de Jujuy`).
- **Motor normativo con 58 reglas de certificaciones obligatorias** por rubro (ANMaC, IRAM, ISO 9001/14001/45001, habilitaciones provinciales).
- **Sistema de informes inmutables con hash SHA-256** y verificador público en `/verificar`.
- **Scraper propio de fuentes públicas** (`scripts/scrape-capmin.mjs` y conector al Registro Minero de Jujuy).
- **Agente IA especializado en compras mineras** (basado en `eve` con acceso controlado de solo lectura al módulo de dominio).

---

## 7. Actividades Clave (*Key Activities*)

1. **Ejecutar y mantener el scraping programado** sobre el Registro Minero de Jujuy (`proveedores.registrominero.jujuy.gob.ar`), CAPMIN y estado fiscal de CUIT (`[roadmap]`).
2. **Extraer y monitorear fechas de vencimiento** de los certificados técnicos cargados por el comprador de la minera, enviando alertas automáticas 30 días antes del vencimiento (`[roadmap]`).
3. **Mantener actualizado el catálogo de 58 reglas técnicas** y los requisitos del Decreto Acuerdo Nº 290-DEyP/2024 (y normativas equivalentes de Salta y Catamarca).
4. **Venta consultiva B2B y soporte de onboarding** a los equipos de Supply Chain y Compliance de las operadoras mineras.

---

## 8. Socios Clave (*Key Partners*)

- **Fuentes públicas de datos**: Registro Provincial de Proveedores Locales de Productores Mineros de Jujuy (Secretaría de Minería e Hidrocarburos / Ministerio de Desarrollo Económico y Producción) y **CAPMIN** (Cámara de Proveedores de Empresas Mineras).
- **Cámaras empresarias del sector**: **CAEM** (Cámara Argentina de Empresas Mineras) y cámaras provinciales como canal institucional de llegada a las operadoras.
- **Organismos emisores de normas y registros**: **IRAM**, **ANMaC**, **ARCA (ex AFIP)** para validación de vigencia de matrículas y CUIT.
- **ERPs corporativos de las mineras (SAP, Oracle, Coupa)**: convivencia complementaria mediante adjunto de PDF hoy e importación de reportes Excel/CSV en `[roadmap]`.

---

## 9. Estructura de Costos (*Cost Structure*)

Modelo **impulsado por valor (*Value-driven*) con estructura de costos SaaS pura (margen bruto > 85 %)**:
- **Sin costo operativo de perseguir proveedores**: al no requerir que cientos de proveedores gratuitos suban documentos ni auditarlos manualmente uno por uno, el costo variable por proveedor tiende a cero.
- **Costos fijos mensuales acotados**:
  - Infraestructura cloud (hosting Next.js, base de datos Supabase, ejecución de crons de scraping).
  - Consumo de inferencia de IA (consultas al agente y lectura de fechas de vencimiento en PDFs).
  - Equipo fundador / comercial B2B en Jujuy.

---

## Competencia y Alternativas Actuales

| Tipo | Alternativa | Qué cubre hoy | Qué NO cubre (diferencial de `ju-min`) |
| :--- | :--- | :--- | :--- |
| **Directa** | **MineriAR** | Directorio argentino de proveedores con calificación documental AAA–C | No cruza las 58 reglas obligatorias por insumo, no vigila el estado en el Registro de Jujuy (Dec. 290) ni emite un informe PDF auditable por cada compra |
| **Directa** | **ProveMiner** | Marketplace minero LATAM; cobra membresía al proveedor | Foco en Chile/Perú; al cobrarle al proveedor pierde neutralidad para justificar descartes ante auditoría |
| **Directa** | **SICEP (Chile)** | Sistema compartido de calificación de proveedores mineros en Chile | Opera en Chile; no cubre el Decreto 290 de Jujuy ni emite el informe por Orden de Compra con los descartados |
| **Indirecta** | **Achilles** | Precalificación corporativa (convenio con CAPMIN); cobra al proveedor | No filtra por insumo al momento de comprar ni genera el respaldo del Art. 8 (motivo de descarte de oferta local) por cada orden |
| **Indirecta** | **SAP Ariba / Coupa** | Gestión corporativa de compras de punta a punta y pagos | No trae precargados los 277 proveedores de Jujuy/CAPMIN ni las 58 reglas locales (ANMaC, IRAM, `CerProv`) |
| **Indirecta** | **ERP de la minera (SAP)** | **Stock, punto de reorden, aprobación y pago** *(convivimos con él)* | No hace scraping externo del Registro de Jujuy ni genera el certificado SHA-256 de elegidos y descartados |
| **Indirecta** | **Registros públicos** (Jujuy, CAPMIN, RFPM Res. 84/22) | Padrón público de quién existe (el RFPM declara que no fiscaliza ni certifica) | No cruzan requisitos técnicos por insumo, no alertan vencimientos a la minera ni emiten informes auditables |
| **Indirecta** | **Excel y carpetas internas** | Lo que usa hoy Compras sin costo directo de licencia | Revisión manual en cada compra, certificados que vencen sin aviso y alto riesgo ante la auditoría anual del Decreto 290 |
