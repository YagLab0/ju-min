# Beneficios — ju-min (ES)

> Fuente traducible de beneficios de negocio para la **operadora minera** (único cliente que usa y paga la plataforma). Cada beneficio está trazado a un código del Value Proposition Canvas ([propuesta-de-valor.md](file:///home/mauri081/projects/ju-min/docs/negocio/propuesta-de-valor.md)).

---

## 1. Para Gerencia de Supply Chain y Compliance (quien aprueba y paga)

- **`BEN-M1` — Cada compra queda blindada ante auditoría interna y Provincia (`D4 · AL4`)**
  Cada recomendación emite un **informe PDF con código único y sello SHA-256** que deja constancia del proveedor elegido y de los descartados con su motivo exacto. Respalda directamente el **informe anual de compras (Art. 7)** y la **Declaración Jurada anual de insumos sin oferta local (Art. 8)** del **Decreto Acuerdo Nº 290-DEyP/2024** de Jujuy, protegiendo a la operación frente a multas de hasta **1.000.000 de litros de gasoil grado 3** (Art. 9).

- **`BEN-M2` — Vigilancia continua de vencimientos sin perseguir proveedores (`D2 · AL2`)**
  El certificado oficial del Registro Minero de Jujuy (`CerProv`) vence al año (Art. 3) y las normas técnicas (ISO, IRAM, ANMaC) vencen en distintas fechas. `ju-min` monitorea por **scraping programado** el padrón oficial de Jujuy y CAPMIN y controla las fechas de vencimiento de los certificados cargados en el legajo de la minera, avisando 30 días antes de cada vencimiento (`[roadmap]`) y bloqueando de las recomendaciones a quien tenga papeles vencidos.

- **`BEN-M3` — Se suma al ERP actual sin migración ni proyectos de TI (`A4 · CR4`)**
  La minera no cambia SAP ni su circuito de aprobaciones. El comprador simplemente adjunta el PDF verificable de `ju-min` a la Orden de Compra en su propio ERP, y cualquier auditor interno o provincial puede comprobar su autenticidad en `/verificar` sin necesitar usuario (`A3 · CR3`).

---

## 2. Para Compras Operativas y Almacenes (quien lo usa todos los días)

- **`BEN-C1` — Filtrar quién cumple en segundos, sin abrir PDFs a mano (`D1 · AL1`)**
  Ante una necesidad de compra, `ju-min` cruza las **58 reglas de certificaciones obligatorias** por categoría (ANMaC, IRAM, ISO 9001/14001/45001) y el estado en el Registro de Jujuy sobre **277 proveedores reales** (`D3 · AL3`), descartando automáticamente a quien no cumple *(supuesto: horas operativas ahorradas por compra)*.

- **`BEN-C2` — Comparar precio, plazo y puntaje sobre proveedores ya filtrados (`A1 · CR1` / `A2 · CR2`)**
  En lugar de perder días pidiendo papeles para recién después descubrir que un proveedor no estaba habilitado, el comprador compara precio unitario, plazo de entrega en días y puntaje de confianza únicamente entre proveedores aptos.

- **`BEN-C3` — Anticipar reposiciones críticas antes del quiebre de stock (`D5 · AL5`)**
  El panel muestra qué insumos cayeron por debajo del punto de reorden y cuántos días de margen quedan según el consumo mensual, disparando la búsqueda de proveedor habilitado en un clic.

---

## 3. Antes y Después (conviviendo con el ERP de la minera)

| Situación cotidiana en Compras | Antes (solo con ERP + Excel/PDFs) | Con `ju-min` (capa sobre el ERP) |
| :--- | :--- | :--- |
| **Detectar faltante y buscar quién cumple** | El ERP avisa el faltante, pero el comprador revisa PDFs y planillas a mano para ver quién cumple las normas del rubro. | `ju-min` aplica las 58 reglas antes de recomendar y descarta automáticamente a quien tiene papeles vencidos. |
| **Vigilar el `CerProv` anual y las normas ISO/IRAM** | Un certificado o el `CerProv` vence a mitad de año sin que nadie avise; la compra deja de sumar al 70 % local. | Scraping semanal del Registro de Jujuy + alerta automática al comprador 30 días antes de que venza un certificado de su cartera (`[roadmap]`). |
| **Justificar por qué se compró afuera de Jujuy (Art. 8 Dec. 290)** | Hay que reconstruir a fin de año correos y cotizaciones viejas para demostrar que ningún proveedor local cumplía. | El informe PDF verificable de esa compra ya dejó documentados los proveedores locales evaluados y el motivo técnico por el que fueron descartados. |
| **Pasar la auditoría interna o provincial (Art. 7 Dec. 290)** | Carpetas dispersas y capturas de pantalla difíciles de auditar. | Código único en la Orden de Compra del ERP que cualquiera comprueba en `/verificar` con sello criptográfico SHA-256. |

---

## Glosario breve
- **`CerProv`**: Certificado de inscripción en el Registro Provincial de Proveedores Locales de Productores Mineros de Jujuy (vigencia: 1 año, Art. 3 del Decreto Acuerdo Nº 290-DEyP/2024).
- **Decreto Acuerdo Nº 290-DEyP/2024**: Normativa de Jujuy (B.O. Nº 27, 06/03/2024) que exige contratar ≥ 70 % anual con proveedores locales inscriptos (Art. 5), presentar auditoría anual (Art. 7) y DDJJ de excepciones (Art. 8), con multas de hasta 1.000.000 L de gasoil (Art. 9).
- **Sello SHA-256**: Huella criptográfica única del informe PDF que garantiza que ninguna cifra, fecha ni motivo de descarte fue alterado después de su emisión.
