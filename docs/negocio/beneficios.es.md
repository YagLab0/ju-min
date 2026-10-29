# Beneficios de ju-min

<!-- Documento fuente en español, preparado para traducción.
     Cada bloque tiene un ID estable entre corchetes; los IDs no se traducen.
     Origen: docs/negocio/propuesta-de-valor.md (códigos D, A, AL, CR = frustraciones, alegrías, aliviadores de frustraciones y creadores de alegrías del canvas). -->

Parte de la documentación de ju-min — índice en [DOCS.md](../DOCS.md).

## Resumen `[benefit.resumen]`

ju-min es un consultor de compras para la minería. Avisa antes de que falte un
insumo. Recomienda solo proveedores que cumplen todos los requisitos vigentes
de cada categoría. Cada recomendación muestra precio, plazo de entrega y nivel
de confianza. Una persona aprueba siempre la compra.

## Beneficios para la minera

| ID | Característica | Ventaja | Beneficio | Canvas | Evidencia |
|---|---|---|---|---|---|
| `benefit.minera.solo-proveedores-habilitados` | 58 reglas de requisitos por categoría en la base de datos | El sistema descarta a los proveedores que no cumplen | La minera reduce el riesgo de comprar a un proveedor no habilitado | D3, AL3 | 58 reglas cargadas en la demo |
| `benefit.minera.certificados-vigentes` | Control de vigencia por fecha | Un certificado vencido saca al proveedor de las recomendaciones | La minera no depende de revisar fechas a mano | D2, AL2 | Función `cumple_requisitos()` |
| `benefit.minera.aviso-antes-del-faltante` | Alerta por punto de reorden | La minera ve qué insumo falta y cuántos días de margen quedan | La minera puede comprar antes de que se detenga la operación | D4, AL4 | Demo con stock simulado |
| `benefit.minera.menos-tiempo-validando` | Red de 277 proveedores ya relevados | La minera no busca proveedores en PDF ni en listas sueltas | El comprador dedica menos horas a validar proveedores | D1, AL1 | Ahorro de horas sin medir (supuesto, H1) |
| `benefit.minera.decision-defendible` | Informe PDF con precio, plazo de entrega, trust score y descartados, con código verificable | La minera lo adjunta a su orden de compra | El aprobador puede explicar cada compra ante una auditoría | D6, AL6, CR5 | Demo: informe PDF con código y verificación |
| `benefit.minera.control-humano` | El agente propone y no compra | La aprobación y la compra siguen en el sistema de la minera | La minera mantiene el control sin cambiar su forma de trabajar | A2, CR1 | Regla del producto |

## Beneficios para el proveedor verificado

| ID | Característica | Ventaja | Beneficio | Canvas | Evidencia |
|---|---|---|---|---|---|
| `benefit.proveedor.recomendado-por-merito` | Recomendación basada en requisitos, precio y plazo de entrega | El tamaño de la empresa no decide la recomendación | Un proveedor regional puede competir con empresas grandes | DP4, CRP1 | Supuesto |
| `benefit.proveedor.verificacion-unica` | Una verificación válida para todas las mineras de la red | Hoy cada minera le pide los mismos papeles para aprobarlo como proveedor | Si ju-min lo verifica una vez, le sirve para todas | DP1, ALP1 | Plan futuro, no disponible hoy |

## Beneficios por tipo

| ID | Tipo | Beneficio |
|---|---|---|
| `benefit.tipo.economico` | Económico | Menos horas de validación manual. Menos riesgo de una parada por falta de insumos. |
| `benefit.tipo.operativo` | Operativo | Stock, proveedores y recomendaciones en un solo lugar. |
| `benefit.tipo.cumplimiento` | Riesgo y cumplimiento | Solo se recomiendan proveedores con certificaciones y habilitaciones vigentes. |
| `benefit.tipo.esg` | ESG y social | El trust score incluye señales ESG. Los proveedores regionales son visibles. |
| `benefit.tipo.estrategico` | Estratégico | Las decisiones de compra quedan registradas y se pueden auditar. |

## Antes y después `[benefit.antes-despues]`

| Antes | Con ju-min |
|---|---|
| La minera valida proveedores en PDF, planillas y directorios. | La minera consulta una red de proveedores ya verificados. |
| Nadie sabe si un certificado sigue vigente. | Un certificado vencido saca al proveedor de las recomendaciones. |
| El faltante se detecta cuando el insumo ya no está. | La alerta llega al cruzar el punto de reorden. |
| La elección del proveedor depende de la memoria del comprador. | Cada recomendación muestra precio, plazo de entrega y trust score. |
| La justificación de la compra no queda escrita. | Cada recomendación queda en un informe PDF verificable. |

## Prueba `[benefit.prueba]`

- La demo usa 271 proveedores reales del directorio CAPMIN.
- La demo incluye 188 categorías y 58 reglas de requisitos.
- Todavía no hay mineras usando ju-min. No hay testimonios.

## Próximo paso `[benefit.cta]`

| ID | Destinatario | Llamado a la acción |
|---|---|---|
| `benefit.cta.minera` | Minera | Solicite un piloto de dos semanas con sus insumos críticos. |
| `benefit.cta.proveedor` | Proveedor verificado | Revise su ficha en el explorer de ju-min. |

<!-- nota-traduccion: "Solicite" usa trato formal. Mantener trato formal en todos los idiomas. -->

## Glosario

| Término | Definición | Traducir |
|---|---|---|
| ju-min | Nombre del producto | No traducir |
| Minera | Empresa minera que usa ju-min | Sí (en: mining company; pt-BR: mineradora) |
| Proveedor verificado | Proveedor que figura en una fuente de verificación | Sí (en: verified supplier; pt-BR: fornecedor verificado) |
| Insumo | Producto que consume una operación minera | Sí (en: supply; pt-BR: insumo) |
| Punto de reorden | Nivel de stock que indica que hay que reponer | Sí (en: reorder point; pt-BR: ponto de pedido) |
| Trust score | Puntaje de confianza de 0 a 100 | No traducir |
| Plazo de entrega | Tiempo entre la compra y la entrega (lead time) | Sí (en: lead time; pt-BR: prazo de entrega) |
| CAPMIN | Cámara Argentina de Proveedores de la Minería | No traducir la sigla; expandir |
| ANMaC | Agencia Nacional de Materiales Controlados (Argentina) | No traducir la sigla; expandir |
| ESG | Criterios ambientales, sociales y de gobernanza | Sí (pt-BR: ASG) |
| ERP | Sistema de gestión empresarial | No traducir |

<!-- nota-traduccion: los números (277, 188, 58, 30 %) se localizan según el idioma; el formato de porcentaje cambia en inglés (30%). -->
