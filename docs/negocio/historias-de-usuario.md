# Historias de Usuario — ju-min

> Todas las historias de usuario corresponden al **único cliente del sistema: la operadora minera** (Compras Operativas / Almacenes como usuario diario y Gerencia de Supply Chain / Compliance / Auditoría como aprobador y verificador).

---

## HU1 — Comprar un insumo crítico con papeles vigentes y respaldo para el ERP `[hoy]`

> **Como** responsable de Compras o Supply Chain en una operadora minera en Jujuy,
> **quiero** que ante cada compra el sistema me recomiende solo proveedores con certificaciones técnicas y registro local (`CerProv`) vigentes y me entregue un informe PDF verificable con el proveedor elegido y los descartados,
> **para** adjuntarlo a la Orden de Compra en nuestro ERP y defender la decisión ante gerencia, auditoría interna y la Provincia (Decreto 290/2024, Arts. 7 y 8).

### Línea de tiempo del caso de uso (ejemplo con datos de la demo: Sales de Jujuy)

1. **Lunes · 08:00 — Disparador de reposición (`AL5`)**
   - **Quién**: Julián (Analista de Compras / Almacenes).
   - **Qué pasa**: El panel de `ju-min` muestra en alerta que quedan **45 cajas de guantes de nitrilo** (debajo del punto de reorden de 60 cajas, con pocos días de margen). Julián hace clic en **"Pedir recomendación"**.
2. **Lunes · 08:05 — Filtro de 58 reglas y descarga del informe PDF (`AL1`, `AL2`, `AL4`, `CR1`, `CR2`)**
   - **Quién**: Julián (Compras / Almacenes).
   - **Qué pasa**: `ju-min` evalúa todos los proveedores del rubro, **descarta automáticamente** a quienes tienen certificados obligatorios vencidos (p. ej. norma IRAM/EN para EPP) o no tienen disponibilidad, verifica el estado `aprobado`/`pendiente` en el **Registro Minero de Jujuy** y ordena a los que cumplen por precio, plazo de entrega y puntaje de confianza.
   - Julián descarga el **informe PDF** con código único (`JM-XXXX-...`), que incluye al proveedor recomendado, las alternativas válidas y la lista de proveedores descartados con el motivo exacto de cada descarte.
3. **Lunes · 08:20 — Aprobación y compra en el ERP de la minera (`CR4`)**
   - **Quién**: Julián y la Gerencia de Supply Chain.
   - **Qué pasa**: Julián carga la solicitud / Orden de Compra **en el ERP de la minera (SAP)** y adjunta el PDF de `ju-min`. La Gerencia de Supply Chain ve en una sola página que el proveedor tiene papeles al día y aprueba la orden en el ERP; Tesorería paga y Almacenes recibe la mercadería como siempre.
4. **6 meses después — Auditoría interna y fiscalización del Decreto 290 (`AL4`, `CR3`)**
   - **Quién**: Auditora interna / Inspector del Ministerio de Desarrollo Económico y Producción de Jujuy.
   - **Qué pasa**: Durante la revisión del informe anual del **Art. 7** (o de la Declaración Jurada de excepciones del **Art. 8**), la auditora toma el código del informe adjunto en el ERP, entra sin usuario a `/verificar` y comprueba al instante que el informe es auténtico (sello SHA-256 íntegro) y que en la fecha de la compra se verificaron las habilitaciones y los descartes.

---

## HU2 — Vigilar vencimientos del Registro de Jujuy y del legajo sin perseguir proveedores `[roadmap]`

> **Como** Gerente de Supply Chain / Compliance de la minera,
> **quiero** que `ju-min` actualice automáticamente por scraping el estado de los proveedores en el Registro Minero de Jujuy (`CerProv`) y me alerte 30 días antes de que venza cualquier certificado técnico de los proveedores de mi cartera,
> **para** no adjudicar órdenes de compra a proveedores con papeles caídos que dejen de computar para el 70 % de compre local (Art. 5 del Decreto 290/2024).

### Flujo
1. **Scraping semanal automático**: Un proceso programado consulta el padrón público del Registro Provincial de Proveedores Mineros de Jujuy (`proveedores.registrominero.jujuy.gob.ar`), CAPMIN y el estado fiscal de CUIT, actualizando si cada proveedor figura `aprobado` o `pendiente` sin requerir ninguna acción del proveedor.
2. **Lectura de vencimientos en el legajo de Compras**: Cuando el comprador recibe un certificado privado (ISO 9001/14001/45001, IRAM, ANMaC) al pedir cotización y lo sube al legajo del proveedor en `ju-min`, el sistema lee la fecha de vencimiento del PDF y la agenda.
3. **Alerta a la minera y bloqueo preventivo**: 30 días antes del vencimiento (o apenas un proveedor cae a `pendiente` en el Registro de Jujuy), `ju-min` alerta al equipo de Compras y lo marca como inhabilitado en las nuevas recomendaciones hasta que presente su renovación.

---

## HU3 — Alimentar el disparador de compras desde un export del ERP `[roadmap]`

> **Como** Analista de Compras / Almacenes,
> **quiero** subir un archivo Excel o CSV exportado de nuestro ERP con el stock actual o las solicitudes de pedido abiertas,
> **para** disparar la evaluación de proveedores y descargar los informes PDF de respaldo sin tipear insumos uno por uno ni pedirle integraciones complejas al área de TI.
