# Value Proposition Canvas — ju-min

> **Regla de oro del modelo**: `ju-min` es un **SaaS B2B de un solo lado (100 % del lado de la minera)** que funciona como **capa de vigilancia de proveedores y respaldo de auditoría sobre el ERP existente** (SAP, Oracle, etc.).
> - **No mete al proveedor como usuario del sistema**: los proveedores no tienen que crearse cuenta ni subir papeles para que `ju-min` funcione.
> - **No compite con el ERP**: el ERP gestiona stock, aprobaciones contables, órdenes de compra y pagos. `ju-min` vigila fuentes públicas por scraping, controla los vencimientos de los certificados que recibe Compras, filtra entre los 277 proveedores de la red según 58 reglas técnicas y el **Decreto Acuerdo Nº 290-DEyP/2024** de Jujuy, y emite un **informe PDF verificable (SHA-256)** para adjuntar a la Orden de Compra en el ERP.

---

## Perfil del Cliente — Operadora Minera en Jujuy / NOA

Dentro de la cuenta cliente (**la operación minera**: en Jujuy hay 3 operaciones industriales en producción —*Sales de Jujuy / Rio Tinto* en Olaroz, *Minera Exar* en Cauchari-Olaroz y *SSR Mining* en Chinchillas/Pirquitas— más los proyectos en construcción y expansión del NOA) intervienen dos roles:
- **Usuario diario**: Comprador operativo / Analista de Abastecimiento y Almacenes.
- **Decisor y pagador**: Gerencia de Supply Chain / Abastecimiento y Compliance.

### Trabajos del cliente (*Customer Jobs*)
1. **T1 — Comprar solo a proveedores con papeles vigentes** *(Funcional)*: Adjudicar compras de insumos y servicios críticos únicamente a proveedores cuyas habilitaciones técnicas (ANMaC, IRAM, ISO 9001/14001/45001) y registro fiscal estén al día al momento de emitir la orden de compra.
2. **T2 — Cumplir y demostrar el 70 % de compre local en Jujuy** *(Funcional / Legal)*: Alcanzar el mínimo del **70 % del monto anual contratado** con proveedores inscriptos en el Registro Provincial (`CerProv` vigente), presentar el **informe anual de compras** (Art. 7 del **Decreto Acuerdo Nº 290-DEyP/2024**) y presentar la **declaración jurada anual de excepciones** cuando un insumo crítico no tiene oferta local que cumpla requisitos técnicos, financieros o de plazo (Art. 8).
3. **T3 — Justificar cada elección ante auditoría interna y Provincia** *(Social / Emocional)*: Dejar constancia objetiva e inalterable de por qué se eligió a un proveedor (y por qué se descartó al resto) en cada orden de compra, sin depender de correos sueltos.
4. **T4 — Reponer insumos críticos antes del quiebre de stock** *(Funcional)*: Detectar a tiempo qué insumo cayó bajo el punto de reorden y encontrar rápidamente un proveedor habilitado con disponibilidad y plazo de entrega compatible.

### Frustraciones (*Pains*)
- **D1 — Validar certificados a mano en PDFs y planillas** *(Severidad: Alta)*: El ERP avisa qué comprar, pero revisar si los proveedores que cotizan cumplen las normas de esa categoría (entre 58 reglas de ANMaC, IRAM, ISO) se hace abriendo PDFs y planillas de Excel a mano.
- **D2 — No saber si el `CerProv` anual o un certificado venció entre compras** *(Severidad: Extrema — por qué es suscripción)*: El certificado oficial del Registro Minero de Jujuy (`CerProv`) **vence al año de su emisión** (Art. 3, Decreto 290/2024) y los certificados ISO/IRAM vencen en distintas fechas del año. Si a un proveedor habitual se le cae el `CerProv` a estado `pendiente` o se le vence una norma y la minera le sigue comprando sin enterarse, esa compra no computa para el 70 % local o queda observada en auditoría.
- **D3 — Padrones públicos dispersos que no cruzan requisitos por insumo** *(Severidad: Media-Alta)*: El Registro Provincial de Jujuy (384 empresas), CAPMIN (232 empresas) y el Registro Federal (Res. SM 84/2022, que declara expresamente que *no fiscaliza ni certifica* cumplimiento técnico ni fiscal) están separados y no indican qué proveedor cumple las normas específicas de un insumo.
- **D4 — Riesgo de multas millonarias y observaciones al defender compras o excepciones** *(Severidad: Extrema)*: Incumplir el Decreto 290/2024 expone a la minera a multas de **hasta 1.000.000 de litros de gasoil grado 3** (~USD 1,1M, Art. 9). Además, para excluir un insumo crítico del cálculo del 70 % (Art. 8), la minera debe demostrar documentalmente que buscó proveedores locales y ninguno cumplía los requisitos técnicos o de plazo.
- **D5 — Faltante de insumo crítico que frena la operación** *(Severidad: Alta — disparador)*: Quedarse sin stock de seguridad de un reactivo, EPP o repuesto mientras se demora la validación documental de un proveedor alternativo.

### Alegrías (*Gains*)
- **A1 — Saber a quién comprar en minutos** *(Esperada)*: Obtener al instante una terna de proveedores locales que cumplen todos los requisitos del insumo, ordenados por precio, plazo y puntaje de confianza.
- **A2 — Una elección que se defiende sola** *(Requerida)*: Contar con el desglose transparente de por qué ganó el proveedor recomendado y el motivo exacto por el que fueron descartadas las demás ofertas.
- **A3 — Un respaldo que auditoría y Provincia acepten sin fricción** *(Requerida)*: Archivar un comprobante con código único y sello criptográfico que cualquier auditor pueda verificar en segundos, respaldando tanto la compra local (Art. 7) como la excepción por falta de oferta local (Art. 8).
- **A4 — No cambiar ni tocar su sistema de compras (ERP)** *(Requerida)*: Seguir aprobando órdenes y pagando en SAP/Oracle como siempre, sumando únicamente el PDF de respaldo a la orden de compra.
- **A5 — Visibilidad continua del 70 % de compre local** *(Deseada)*: Conocer mes a mes el estado del padrón local sin sorpresas a fin de año.

---

## Mapa de Valor — Lo que ofrece `ju-min`

### Productos y Servicios
- **P1 — Recomendación de proveedor con filtro de 58 reglas y agente IA `[hoy]`**: Cruza el insumo requerido contra 277 proveedores de Jujuy/CAPMIN, 188 categorías y 58 reglas de certificaciones obligatorias.
- **P2 — Informe PDF verificable con sello SHA-256 `[hoy]`**: Documento con código único (`JM-XXXX-...`), proveedor recomendado, alternativas válidas, proveedores descartados con su motivo y verificación pública en `/verificar`.
- **P3 — Vigilancia continua por scraping programado + control de vencimientos `[roadmap]`**:
  1. **Scraping semanal automático** sobre el Registro Provincial de Proveedores Mineros de Jujuy (`CerProv` `aprobado`/`pendiente`), CAPMIN y estado fiscal de CUIT (ARCA), sin depender de que el proveedor entre al sistema.
  2. **Control de vencimientos del legajo de Compras**: cuando Compras recibe un certificado técnico (ISO, IRAM, ANMaC) de un proveedor y lo guarda en `ju-min`, el sistema lee su fecha de vencimiento y alerta al comprador 30 días antes de que venza.
- **P4 — Panel de alertas de reposición y exportación desde ERP `[hoy / roadmap]`**: Disparador por punto de reorden y días de margen (hoy con datos de demo; en `[roadmap]` mediante importación de Excel/CSV del ERP).

### Aliviadores de Frustraciones (*Pain Relievers*)
- **AL1 → alivia D1**: Descarta automáticamente a los proveedores que no cumplen las certificaciones obligatorias de la categoría o no tienen disponibilidad, sin revisar PDFs a mano.
- **AL2 → alivia D2**: Controla vencimientos todas las semanas combinando **scraping programado** del Registro de Jujuy (`CerProv`) y alertas automáticas sobre las fechas de vencimiento cargadas en el legajo de la minera.
- **AL3 → alivia D3**: Unifica en un solo buscador los 277 proveedores de CAPMIN y del Registro Minero de Jujuy con sus categorías y reglas técnicas asociadas.
- **AL4 → alivia D4**: Genera el informe PDF inmutable que documenta tanto al proveedor elegido como a los descartados con su causa exacta (prueba documental directa para los Arts. 7 y 8 del Decreto 290/2024).
- **AL5 → alivia D5**: Alerta qué insumo cayó bajo el stock mínimo y entrega en segundos las alternativas habilitadas con su plazo de entrega en días.

### Creadores de Alegrías (*Gain Creators*)
- **CR1 → crea A1**: Recomendación en un clic con explicación redactada y comparativa inmediata.
- **CR2 → crea A2**: Tabla comparativa con precio unitario, plazo de entrega, estado en el Registro de Jujuy y puntaje de confianza desglosado.
- **CR3 → crea A3**: Código único por informe y verificador público sin login (`/verificar`) que comprueba el hash SHA-256 del documento.
- **CR4 → crea A4**: Informe PDF listo para adjuntar a la solicitud u Orden de Compra en el ERP actual de la minera, sin integración invasiva de TI.
- **CR5 → crea A5**: Trazabilidad acumulada de informes emitidos y estado `aprobado`/`pendiente` en el Registro de Jujuy para preparar el reporte anual del Art. 7 (`[roadmap]`).

---

## Encaje (*Fit*) y Declaración de Propuesta de Valor

> **`ju-min`** ayuda a las gerencias de **Abastecimiento y Compliance de las mineras en Jujuy y el NOA** a **comprar solo a proveedores con papeles vigentes y demostrar el cumplimiento del 70 % de compre local (Decreto 290-DEyP/2024)**, sumándose **como capa sobre su propio ERP** con vigilancia continua por scraping, control de vencimientos e **informes PDF verificables en cada compra**, a diferencia de los registros públicos que no cruzan requisitos por insumo o de las planillas manuales que quedan desactualizadas mes a mes.
