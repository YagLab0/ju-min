# Hipótesis de Negocio y Orden de Validación — ju-min

> Como el modelo es un **SaaS B2B de un solo lado (100 % para la minera)**, el mapa de hipótesis no depende de perseguir a cientos de proveedores gratuitos. La validación se concentra en la **factibilidad técnica del scraping + lectura de PDFs** y en la **deseabilidad y disposición de pago de Supply Chain / Compliance** de las operadoras mineras en Jujuy y el NOA.

---

## Tabla de Hipótesis Críticas (ordenadas por accesibilidad y riesgo)

| # | Hipótesis | Tipo | Experimento (empezando por el más accesible) | Criterio de éxito |
| :--- | :--- | :--- | :--- | :--- |
| **H4** | Se puede mantener actualizado el padrón del Registro de Jujuy (`CerProv`) y CAPMIN por scraping automático y extraer fechas de vencimiento de los PDFs técnicos sin carga manual costosa. | **Factibilidad** | **Semana 1:** correr el scraper sobre los 384 proveedores del Registro de Jujuy + 232 de CAPMIN y probar extracción de fecha de vencimiento sobre 20 PDFs reales de normas ISO/IRAM/ANMaC. | 100 % del padrón público actualizado en `< 10 min` y `≥ 90 %` de fechas extraídas sin error. |
| **H1** | Controlar certificados vigentes y demostrar el 70 % de compre local (**Decreto 290/2024**, Arts. 5, 7 y 8) está en el top 3 de prioridades de Supply Chain / Compliance o Compre Local de las mineras en Jujuy. | **Deseabilidad** | **Semana 1–2:** 5 entrevistas con responsables de Compras, Supply Chain o Compre Local / Relaciones Comunitarias de operadoras en Jujuy/NOA (entrando vía CAEM, CAPMIN o LinkedIn directo). | `≥ 3 de 5` lo ubican en su top 3 de dolores y confirman qué gerencia aprueba el presupuesto. |
| **H6** | El informe PDF con código único (que detalla al proveedor elegido y a los descartados con su motivo técnico) es aceptado por Compras y Auditoría para adjuntar en su ERP y respaldar los Arts. 7 y 8 del Decreto 290. | **Deseabilidad** | **Semana 2:** mostrar en las entrevistas de H1 un informe PDF real emitido por `ju-min` con su verificación pública en `/verificar`. | `≥ 3 de 5` confirman que lo adjuntarían a la Orden de Compra en su ERP (SAP/Oracle). |
| **H5** | El comprador de la minera está dispuesto a compartir un export Excel/CSV de su ERP (insumos críticos o cartera de proveedores actuales) y arrastrar los PDFs que recibe al cotizar, sin requerir integración de TI. | **Factibilidad** | **Semana 2:** pedir en las entrevistas de H1 un listado anonimizado de 20 insumos y proveedores frecuentes para configurar una prueba. | `≥ 1 de 5` entrega un Excel/CSV para correr el piloto sin trabas de Seguridad Informática. |
| **H2** | El equipo de Compras confía en el filtro de 58 reglas y en las alertas de vencimiento de `ju-min` para decidir y respaldar compras reales en su propio ERP. | **Deseabilidad** | **Semana 3–4:** piloto de 2 semanas con 1 operadora minera evaluando sus compras críticas reales y emitiendo los informes PDF. | `≥ 50 %` de las compras evaluadas adjuntan el PDF de `ju-min` en su ERP sin rehacer la validación a mano. |
| **H3** | La operadora minera paga una suscripción mensual B2B de **USD 1.000 a USD 3.000 / mes** (o piloto pago inicial desde USD 350–500/mes) por mantener vigilado su padrón local y respaldar sus auditorías. | **Viabilidad** | **Semana 4:** propuesta comercial o carta de intención al cierre del piloto con precio mensual explícito. | `≥ 1 de 3` operadoras contactadas aprueba el abono mensual. |

---

## Por qué este orden destraba la entrada a las mineras
1. **Semana 1 (bajo tu control total)**: Demostrás `H4` dejando el scraper del Registro de Jujuy + CAPMIN corriendo y un informe PDF real de ejemplo sobre una compra minera en Jujuy.
2. **Puerta de entrada a la entrevista (`H1` y `H6`)**: En lugar de pedir una reunión genérica para "mostrar una app de compras", contactás al responsable de **Compre Local / Proveedores Locales o Supply Chain** de las mineras en Jujuy con un gancho regulatorio concreto: *"Armamos el motor que cruza automáticamente el Registro Provincial del Decreto 290/2024 con las 58 reglas técnicas y genera el PDF de respaldo para la auditoría del Art. 7 y las excepciones del Art. 8"*.
