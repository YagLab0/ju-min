# Cómo funciona ju-min, de punta a punta

Parte de la documentación de ju-min — índice en [DOCS.md](DOCS.md). Versión
para imprimir: [como-funciona.pdf](como-funciona.pdf).

Explicación en lenguaje común de lo que hace hoy la aplicación, paso a paso,
tal como la ve una minera. Al final se separa lo que es real de lo que todavía
es de demostración.

---

## En una frase

ju-min avisa a la minera cuando un insumo está por faltar, le recomienda un
proveedor que cumple todos los requisitos y le entrega un **informe en PDF**
que respalda esa elección. La minera aprueba, compra y paga en su propio
sistema, como siempre.

## Quiénes participan

- **La minera** es la cuenta: paga la suscripción y solo ve sus propios
  datos. Adentro trabajan personas como Julián (Almacenes, repone stock) o la
  gerencia de Abastecimiento, que aprueba las compras en el sistema de la
  minera.
- **Los proveedores** aparecen en ju-min, pero no usan la aplicación. Sus
  datos salen de fuentes públicas (el directorio de CAPMIN y el Registro de
  Proveedores Mineros de Jujuy).
- **El equipo de ju-min** da de alta cada minera y sus usuarios. Nadie puede
  registrarse solo.

---

## El recorrido, paso a paso

### 1. Entrar

La persona entra con su email y su clave. Si intenta abrir el panel sin haber
entrado, la aplicación la manda primero a la pantalla de ingreso.

### 2. El panel: qué hay que reponer

Lo primero que ve es el **panel de la minera**:

- **Alertas de stock.** Cada insumo tiene un "punto de reorden": la cantidad
  mínima antes de pedir más. Si el stock baja de ese número, el insumo aparece
  en alerta, con los **días que le quedan** según lo que se consume por mes.
  Ejemplo: guantes de nitrilo, 45 cajas cuando el mínimo es 60.
- **La tabla de stock** completa, con todos los insumos.
- **El chat con el agente** y el **historial** de consultas anteriores.

### 3. Pedir una recomendación

En la alerta, la persona toca **"Pedir recomendación"**. ju-min revisa todas
las ofertas de ese insumo y aplica sus reglas:

1. **Descarta** a quien no tiene disponibilidad, a quien no está homologado y
   a quien no tiene vigentes los certificados que exige la categoría del
   insumo. Por ejemplo, los explosivos exigen la habilitación de ANMaC.
2. **Ordena** a los que quedan por precio, plazo de entrega y puntaje de
   confianza.
3. **Explica** su elección: por qué ese proveedor, y cuántas ofertas descartó
   y por qué.

La recomendación aparece en la sección **"Recomendaciones"** del panel, con
precio, plazo y confianza a la vista.

### 4. Revisar al proveedor

Cada recomendación tiene un enlace a la **ficha del proveedor**: datos de la
empresa, ubicación, insumos que ofrece con precio y plazo, certificaciones con
sus vencimientos y el desglose de su puntaje de confianza. Desde la ficha se
puede tocar **"Contactar al proveedor"** (en la demo es una simulación: no se
envía nada).

También existe el **explorador de proveedores**, para buscar en toda la red
filtrando por insumo o categoría.

### 5. Descargar el informe

En la recomendación, la persona toca **"Descargar informe (PDF)"**. El
informe trae:

- un **código único**, por ejemplo `JM-MSA8-JVK1-33V1`;
- quién lo generó y cuándo;
- el insumo y cómo está su stock;
- el proveedor recomendado, con precio, plazo, confianza y el porqué;
- las otras ofertas que también cumplían y las descartadas, con su motivo;
- la aclaración de que ju-min no aprueba, no compra ni paga.

ju-min **guarda un registro** de cada informe. Cada recomendación tiene un
solo informe: si se descarga de nuevo, sale el mismo, con el mismo código.
Después de descargarlo, el código queda visible en la recomendación del panel.

### 6. La compra sigue en el sistema de la minera

La persona carga el pedido en el **sistema de compras de la minera** y
adjunta el informe. La gerencia aprueba ahí, el pago lo hace Tesorería y la
recepción la controla Almacenes. ju-min no interviene en nada de eso.

### 7. La auditoría

Meses después, si alguien pregunta por qué se le compró a ese proveedor, el
informe está adjunto a la orden de compra. Para confirmar que es auténtico,
cualquiera puede entrar a la página pública **"Verificar un informe"**
(`/verificar`) y escribir el código:

- Si el informe existe, ju-min muestra sus **datos originales**: minera,
  quién lo generó, insumo, proveedor y oferta. Si el PDF que tiene el auditor
  dice otra cosa, ese PDF fue modificado.
- Cada informe lleva además un **sello** (una huella digital del contenido).
  Si alguien alterara el registro guardado en ju-min, la página lo avisa.
- Si el código no existe, lo dice.

### Además: el chat con el agente

En el panel se puede conversar con el agente en lenguaje natural, por ejemplo
*"¿quién me entrega respiradores más rápido?"*. El agente usa inteligencia
artificial (el modelo DeepSeek) y responde con datos reales de stock, ofertas
y proveedores. Solo habla de compras para minería: si se le pregunta otra
cosa, como el clima, responde con un mensaje fijo de rechazo. Lo que se
conversa en el chat no genera informes: los informes salen del botón "Pedir
recomendación".

---

## De dónde salen los datos

- **Proveedores:** se tomaron de CAPMIN y del registro de Jujuy con un
  programa propio de recolección (scraping) y se guardaron en la base de datos
  de ju-min: unos 270 proveedores y 188 categorías, con 58 reglas de
  requisitos por categoría.
- **Puntaje de confianza (0 a 100):** se calcula solo con datos que ju-min
  puede comprobar: identidad (registro provincial, 25 %), cumplimiento
  (certificados y habilitaciones vigentes, 45 %), ESG (15 %) y capacidad
  (estado de verificación, 15 %). No mide entregas, porque la recepción ocurre
  en el sistema de la minera.
- **Si la base de datos no responde**, la aplicación usa una copia de prueba
  guardada en memoria, para que la demostración nunca quede en blanco.

## Qué no hace ju-min

- No aprueba compras, no compra y no paga.
- No cobra comisiones: el ingreso es solo la suscripción de la minera.
- No reemplaza el sistema de compras de la minera: lo complementa con el
  informe.

## Qué es real y qué es de demostración

| Parte | Hoy |
|---|---|
| Proveedores, categorías y reglas de requisitos | Reales, de fuentes públicas |
| Filtro por requisitos y recomendación con su porqué | Funciona |
| Informe PDF, registro y verificación por código | Funciona |
| Chat con inteligencia artificial | Funciona |
| Stock de la minera | De prueba: cargado a mano, no viene de su sistema |
| Ofertas y precios de los proveedores | De prueba |
| Contacto con el proveedor | Simulado: no envía nada |
| Usuarios | Cuentas de demostración de una minera (Sales de Jujuy) |

## Lo que viene

- Cargar el stock desde el Excel de la minera.
- Exportar el informe al sistema (ERP) de la minera.
- Actualizar cada semana los datos de CAPMIN y del registro de Jujuy.
- Dar de alta mineras por invitación, desde la aplicación.
