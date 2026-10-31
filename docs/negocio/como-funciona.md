# Cómo funciona ju-min (y por qué es una suscripción B2B)

**ju-min** es una capa de vigilancia de proveedores y respaldo de auditoría que se apoya sobre el **ERP que la minera ya usa** (SAP, Oracle, etc.). Su objetivo es simple: **comprar solo a proveedores que tienen los papeles en regla hoy y poder demostrarlo en un clic ante gerencia, auditoría interna y la Provincia**, sin meter al proveedor como usuario ni cambiar la forma de comprar de la minera.

---

## Qué hace ju-min y qué hace el ERP de la minera

ju-min **no reemplaza** al sistema de compras de la minera:

| Qué hace el ERP de la minera (SAP, Oracle…) | Qué le suma ju-min (capa de cumplimiento) |
|---|---|
| Lleva el inventario, el punto de reorden y las solicitudes de pedido | **Cruza 58 reglas de requisitos obligatorios** por categoría de insumo sobre 277 proveedores de Jujuy y CAPMIN |
| Tiene el flujo de aprobación por monto y gerencia | **Mantiene el padrón al día por scraping:** estado `aprobado`/`pendiente` en el Registro Minero de Jujuy (`CerProv`) y rubros de CAPMIN |
| Emite la orden de compra, registra la factura y ejecuta el pago | **Genera un informe PDF verificable** (con la opción tomada y las descartadas con su motivo) que **Reposición** le envía a **Compras** para adjuntar al pedido |

---

## Por qué es una suscripción mensual (y no una consulta de una sola vez)

1. **La obligación legal en Jujuy es continua y auditada cada año:** el **Decreto Acuerdo Nº 290-DEyP/2024** (Boletín Oficial de Jujuy Nº 27, 06/03/2024) obliga a las productoras mineras a contratar **al menos el 70 %** del monto anual con proveedores inscriptos en el Registro Provincial (Art. 5), presentar un **informe anual de compras** (Art. 7) y una **declaración jurada anual** de insumos críticos sin oferta local (Art. 8), con multas de hasta **1.000.000 de litros de gasoil grado 3** por incumplimiento (Art. 9).
2. **El padrón del Registro Minero cambia todos los meses:** la inscripción provincial (**CerProv**) dura 1 año (Art. 3) y los proveedores pasan de `aprobado` a `pendiente` o se suman nuevos. Un listado estático queda desactualizado rápido.
3. **100 % con información pública actualizada por scraping (sin cargar papeles a mano):** ju-min actualiza automáticamente los datos del Registro Minero de Jujuy y CAPMIN, y genera el informe PDF verificable en cada reposición del mes.

---

## Quiénes participan adentro de la minera

- **1. Reposición / Almacenes (quien detecta el faltante y consulta):** cuando el sistema avisa que falta stock de un insumo, le consulta al agente de ju-min a quién comprarle y por qué, elige la opción y **descarga el informe PDF**.
- **2. Compras / Supply Chain (quien hace el pedido y aprueba el presupuesto):** recibe el informe PDF de Reposición, **hace el pedido por fuera de ju-min (en su propio ERP)** y guarda ese PDF adjunto a la orden para defender la compra local (Art. 7) o justificar por qué compró afuera si ningún proveedor del Registro cumplía (Art. 8).
- **El motor de ju-min:** corre el scraping periódico de los registros públicos (Registro Minero de Jujuy y CAPMIN), aplica las 58 reglas por rubro y sella cada informe con SHA-256.

---

## El recorrido, paso a paso (sobre su propio ERP)

### 1. Vigilancia continua del padrón y del legajo
Antes de que ocurra cualquier compra, ju-min mantiene al día la base de **277 proveedores reales** (CAPMIN + Registro Minero de Jujuy) mediante scraping programado del estado `CerProv` (`aprobado`/`pendiente`) y controla las fechas de vencimiento de los certificados técnicos cargados en el legajo de la minera.

### 2. El disparador: qué hay que reponer
Al entrar con su email y clave, el comprador ve el **panel de la minera**:
- **Alertas de stock (disparador):** cada insumo tiene un punto de reorden. Si el stock cae por debajo, aparece en alerta con los **días de margen** según el consumo mensual (en producción se alimenta desde un export Excel/CSV del ERP).
- **La tabla de stock**, el **chat con el agente IA** y el **historial** de informes emitidos.

### 3. Pedir una recomendación con filtro de 58 reglas
En la alerta (o desde el chat con el agente IA), la persona toca **"Pedir recomendación"**. ju-min revisa todas las ofertas de ese insumo y aplica sus reglas:
1. **Descarta** a quien no tiene disponibilidad, a quien no está homologado y a quien tiene vencidos los certificados obligatorios de la categoría (por ejemplo, ANMaC en explosivos o norma IRAM/EN en elementos de protección).
2. **Ordena** a los que cumplen por precio, plazo de entrega y puntaje de confianza, mostrando su estado `aprobado`/`pendiente` en el Registro de Jujuy.
3. **Explica** la decisión: por qué recomienda a ese proveedor y cuántas ofertas descartó con su motivo exacto (respaldo directo para el Art. 8 del Decreto 290).

### 4. Revisar la ficha del proveedor
Cada recomendación enlaza a la **ficha del proveedor**: razón social, CUIT, estado en el Registro de Jujuy, insumos que ofrece, certificaciones con sus fechas de vencimiento y el desglose del puntaje de confianza.

### 5. Descargar el informe PDF verificable
En la recomendación, la persona toca **"Descargar informe (PDF)"**. El PDF incluye:
- un **código único** (por ejemplo `JM-MSA8-JVK1-33V1`);
- quién lo generó y en qué fecha;
- el insumo y el proveedor recomendado con precio, plazo, puntaje y el porqué;
- las alternativas que cumplían y las descartadas con su motivo;
- la aclaración expresa de que ju-min no aprueba, no compra ni paga.

ju-min guarda un registro inmutable de cada informe con un **sello criptográfico SHA-256**.

### 6. La compra sigue en el ERP de la minera
La persona carga la orden en el **ERP de la minera** y adjunta el PDF de ju-min. La Gerencia de Supply Chain aprueba ahí mismo, Tesorería paga y Almacenes recibe la mercadería.

### 7. La auditoría interna o provincial
Meses después, ante una auditoría interna o la fiscalización anual del Decreto 290 (Arts. 7 y 8), cualquiera entra sin sesión a `/verificar`, escribe el código del informe y comprueba los datos originales y la integridad del sello SHA-256.

---

## Qué es real hoy y qué es roadmap

| Parte | Estado |
|---|---|
| 277 proveedores, 188 categorías y 58 reglas de fuentes públicas (Jujuy + CAPMIN) | **[hoy]** Real |
| Filtro por requisitos y vigencia, con elegidos y descartados | **[hoy]** Funciona |
| Informe PDF, sello SHA-256 y verificación pública en `/verificar` | **[hoy]** Funciona |
| Chat con inteligencia artificial sobre compras mineras | **[hoy]** Funciona |
| Stock y precios de ofertas en la demo | **[hoy]** Datos de prueba (Sales de Jujuy) |
| Cron semanal de scraping + lectura y alertas de vencimiento al comprador | **[roadmap]** |
| Carga de stock/compras desde export Excel/CSV del ERP y reporte anual Art. 7 | **[roadmap]** |
