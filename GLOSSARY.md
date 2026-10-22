# ju-min

Consultor inteligente de compras para minería: un agente que ayuda a una minera a reponer insumos eligiendo entre proveedores verificados.

## Actores

**Minera**:
La empresa minera suscripta que usa ju-min para gestionar sus compras de insumos.
_Avoid_: empresa, cliente, usuario, cuenta

**Proveedor verificado**:
Empresa que vende insumos a la industria minera y figura en una fuente de verificación (registro provincial de proveedores mineros, cámaras del sector).
_Avoid_: proveedor de buena fe, vendedor, supplier

**Agente**:
El consultor inteligente que responde consultas de la minera y emite recomendaciones.
_Avoid_: bot, asistente, IA

## Catálogo

**Insumo**:
Producto genérico que consume una operación minera, independiente de quién lo venda (ej. guante de nitrilo, lubricante para motor diésel).
_Avoid_: producto, artículo, ítem

**Oferta**:
Un insumo vendido por un proveedor verificado puntual, con su precio, unidad, lead time y disponibilidad.
_Avoid_: cotización, publicación, listing

**Trust score**:
Puntaje de confianza de un proveedor verificado, derivado de señales como historial de entregas, certificaciones y antigüedad fiscal.
_Avoid_: rating, reputación, calificación

## Stock

**Stock**:
Cantidad disponible de un insumo en la minera.
_Avoid_: inventario, existencias

**Punto de reorden**:
Nivel de stock de un insumo por debajo del cual la minera debe reponerlo.
_Avoid_: mínimo, umbral, stock de seguridad

## Interacción con el agente

**Consulta**:
Pregunta o pedido que la minera le hace al agente. Una consulta puede producir ninguna, una o varias recomendaciones.
_Avoid_: chat, conversación, pregunta, ticket

**Recomendación**:
Propuesta concreta del agente de comprar un insumo a través de una oferta, con su justificación. Es lo que la minera aprueba o rechaza.
_Avoid_: sugerencia, orden de compra, propuesta

**Consulta fuera de dominio**:
Consulta que no trata de abastecimiento minero ni del producto ju-min. El agente la rechaza con un mensaje fijo, siempre el mismo.
_Avoid_: off-topic, consulta inválida, spam
