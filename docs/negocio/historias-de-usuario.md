# Historias de usuario

Parte de la documentación de ju-min — índice en [DOCS.md](../DOCS.md).

Casos de uso contados de punta a punta para entender el producto. Los datos
(Sales de Jujuy, bolas de molienda, cantidades) son los del seed de la demo;
las personas son de ejemplo. Áreas de la minera según
[business-model-canvas.md](business-model-canvas.md) (confirmar en H1).

ju-min es un consultor: avisa, recomienda y entrega un informe que respalda la
decisión. No aprueba, no compra ni paga: eso sigue en el sistema de la minera.

---

## HU1 — Reponer un insumo crítico antes del faltante

### La historia contada

**Lunes, 8 de la mañana.** Julián trabaja en **Almacenes** de Sales de Jujuy,
en el salar de Olaroz, a 4.000 metros. Entra a ju-min y el panel le muestra
una alerta:

> **Bola de acero forjado para molienda 3"**: quedan 8.000 kg. El punto de
> reorden es 12.000 kg. Al consumo actual (15.000 kg por mes), alcanza para
> unos 16 días.

Sin esas bolas, el molino para; si para el molino, para la planta.

Julián toca **"Pedir recomendación"** en la alerta. ju-min revisa la red y
**descarta a los proveedores que no cumplen** (sin el certificado que exige la
categoría, o vencido). Con los que quedan, arma una recomendación así:

> Proveedor X: precio $$, entrega en 10 días, confianza 82/100. La opción más
> barata tarda 25 días y no llega antes del faltante.

Julián toca **"Descargar informe (PDF)"**. El informe trae el insumo, el
proveedor recomendado, precio, plazo y confianza, los proveedores descartados
y por qué, quién lo generó, la fecha y un **código único**. ju-min guarda un
registro de cada informe. Si Julián quiere entender más, puede preguntarle al
agente en el chat.

Julián carga el pedido en el **sistema de compras de la minera**, como
siempre, y adjunta el informe.

**Lunes, 11 de la mañana.** Laura, de la **Gerencia de Abastecimiento**,
aprueba la compra **en el sistema de la minera**. Tiene el informe adjunto: no
necesita entrar a ju-min. El pago y la recepción también siguen allí.

**Tres meses después**, una auditoría pregunta por qué se le compró a ese
proveedor. El informe está adjunto a la orden de compra. Si el auditor duda,
busca el código en ju-min y confirma que el informe es auténtico.

### Formato

> **Como** responsable de reponer stock en una minera,
> **quiero** que ju-min me avise antes de que falte un insumo, me recomiende
> un proveedor que cumpla todos los requisitos y me dé un informe que lo
> respalde,
> **para** reponer a tiempo sin frenar la planta, sin comprarle a alguien no
> habilitado y sin cambiar mi sistema de compras.

### Criterios de aceptación

1. **Dado** que el stock de un insumo bajó del punto de reorden, **cuando**
   entro al panel, **entonces** veo la alerta con los días de stock que quedan.
2. **Dado** que toco "Pedir recomendación" en la alerta, **entonces** solo
   recomienda proveedores con todos los requisitos vigentes de la categoría.
3. Cada recomendación muestra precio, plazo de entrega y trust score, y
   explica por qué eligió ese proveedor y por qué descartó a los otros.
4. **Cuando** descargo el informe, **entonces** el PDF trae esos datos, quién
   lo generó, la fecha y un código único, y ju-min guarda el registro.
5. **Dado** un código de informe, ju-min confirma si el informe existe y
   muestra sus datos originales.
6. ju-min no aprueba, no compra ni paga: eso sigue en el sistema de la minera.

### Estado

| Paso | Estado |
|---|---|
| Alerta por punto de reorden y días de stock | **[hoy]** |
| "Pedir recomendación" con filtro de requisitos | **[hoy]** |
| Recomendación con precio, plazo y trust score | **[hoy]** |
| Informe PDF con código y registro | **[roadmap]** — en desarrollo (reemplaza la cola de Aprobar/Rechazar) |
| Verificar un informe por su código | **[roadmap]** |
| Stock tomado del Excel o del sistema de la minera | **[roadmap]** — ver HU2 |
| Que la minera adjunte el informe a su orden de compra | Hipótesis H7 |

---

## HU2 — Cargar el stock desde un Excel

### La historia contada

Sales de Jujuy lleva el stock en una planilla de Excel que Almacenes actualiza
cada semana (o la exporta de su sistema). El primer día, Julián **sube esa
planilla** a ju-min.

ju-min le muestra una vista previa: reconoció las columnas de insumo, cantidad
actual, punto de reorden y consumo mensual. Dos filas no coinciden con ningún
insumo de la red ("Bolas 3 pulg."); ju-min propone el insumo más parecido
("Bola de acero forjado para molienda 3\"") y Julián confirma.

Al aceptar, el panel se actualiza: aparecen 3 insumos bajo el punto de reorden.
A partir de ahí sigue la HU1. Cada semana, Julián vuelve a subir la planilla
y ju-min recalcula las alertas.

### Formato

> **Como** responsable de Almacenes de una minera,
> **quiero** subir mi planilla de stock a ju-min tal como la uso hoy,
> **para** recibir alertas de reposición sin cargar todo a mano ni cambiar mi
> forma de trabajar.

### Criterios de aceptación

1. Acepta Excel (.xlsx) y CSV.
2. Muestra una vista previa antes de guardar, con las columnas detectadas
   (insumo, cantidad actual, punto de reorden, consumo mensual) y permite
   corregirlas.
3. Las filas que no coinciden con un insumo de la red se marcan y se
   proponen coincidencias; nada se guarda sin confirmación.
4. Al confirmar, el panel recalcula las alertas y los días de stock.
5. Subir una planilla nueva reemplaza el stock anterior de esa minera, y cada
   minera solo ve y modifica el suyo.
6. Si falta una columna obligatoria, explica cuál falta y no carga nada.

### Estado

Todo **[roadmap]**: hoy el stock de la demo está cargado directo en la base de
datos. Depende de la hipótesis H5 (que la minera comparta su stock) y de saber
en qué formato lo lleva (preguntarlo en las entrevistas de H1).

---

## Proveedor

El proveedor se plantea como **pasivo**: sus datos vienen de fuentes públicas
(CAPMIN, registro de Jujuy) y no usa la aplicación. No hay historia de usuario
del proveedor hasta validar H6.
