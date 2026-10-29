# Propuesta de valor — Value Proposition Canvas

Parte de la documentación de ju-min — índice en [DOCS.md](../DOCS.md).

Método: Value Proposition Canvas de Alex Osterwalder (Strategyzer). Un canvas
por segmento. Relacionados: [business-model-canvas.md](business-model-canvas.md),
[hipotesis.md](hipotesis.md), [beneficios.es.md](beneficios.es.md).

**Convenciones**

- Etiquetas de segmento: `[M]` **Minera**, `[P]` **Proveedor verificado** (términos del [glosario](../../GLOSSARY.md)).
- Fuentes: `[pitch]` [pitch.md](../pitch.md), `[README]`, `[inv]` [investigacion-proveedores.md](../investigacion-proveedores.md),
  `[clasif]` [modelo-clasificacion.md](../modelo-clasificacion.md), `[web]` investigación de competencia (links en el BMC).
- `(supuesto)`: sin evidencia todavía; está en [hipotesis.md](hipotesis.md) si es crítico.
- Nombres de las zonas: título en lenguaje común y, entre paréntesis, el término oficial de la edición en español de Osterwalder. Códigos: `D` frustraciones, `A` alegrías, `AL` aliviadores, `CR` creadores (con `P` en el proveedor).
- Estado del producto: **[hoy]** existe en la demo · **[roadmap]** planificado.

## Segmentos

ju-min es una **plataforma multilateral**: la minera y el proveedor verificado
se encuentran a través del producto. Hoy solo la minera usa ju-min de forma
activa; el lado proveedor está poblado con datos públicos (CAPMIN, registro de
Jujuy) y todavía no interactúa con la plataforma `[inv]`.

| Segmento | Quién decide | Quién usa | ¿Paga? |
|---|---|---|---|
| `[M]` Minera | Gerencia de Supply Chain o de Abastecimiento (aprueba) | Almacenes / Inventarios (pide la reposición) y Compras (compra). En ju-min: cada persona entra con su email, sin roles; la aprobación sigue en el sistema de la minera | Sí: suscripción `[README]` |
| `[P]` Proveedor verificado | Dueño o comercial de la empresa | Comercial, responsable de calidad | No hoy (ver BMC) |

---

## `[M]` Minera

### Perfil del cliente

**Lo que tiene que hacer** (trabajos del cliente, de más a menos importante)

| Tipo | Trabajo |
|---|---|
| Funcional | Reponer insumos antes de que el stock caiga bajo el punto de reorden |
| Funcional | Elegir solo proveedores que cumplan los requisitos obligatorios de cada categoría |
| Funcional | Comparar ofertas por precio, lead time y confianza |
| Funcional | Dejar registro de por qué se eligió cada proveedor |
| Social | Comprador: ser quien previene paradas de planta, no quien las causa (supuesto) |
| Social | Aprobador: poder defender cada compra ante dirección y auditoría (supuesto) |
| Emocional | Tener la tranquilidad de no haber comprado a alguien sin habilitación |

**Lo que le complica** (frustraciones)

| # | Frustración | Fuente |
|---|---|---|
| D1 | Valida cada proveedor a mano entre PDFs, planillas y listas desactualizadas | `[pitch]` |
| D2 | No sabe si un certificado sigue vigente | `[pitch]` |
| D3 | Un proveedor sin habilitación (ANMaC, alta montaña) es riesgo de seguridad y legal | `[pitch]` `[inv]` |
| D4 | Un faltante de insumo crítico puede detener la planta | `[pitch]` — costo por hora sin dato (supuesto) |
| D5 | Cada minera homologa con su propio proceso: trabajo duplicado | `[web]` MineriAR, Loup |
| D6 | Le cuesta justificar la elección ante auditoría | (supuesto) |

No hay dato de cuántas horas lleva hoy validar un proveedor: medirlo es la
hipótesis H1.

**Lo que quiere lograr** (alegrías)

| # | Alegría | Nivel |
|---|---|---|
| A1 | Ver solo proveedores que cumplen los requisitos de la categoría | Requerida |
| A2 | Que una persona apruebe siempre la compra | Requerida |
| A3 | Enterarse antes del faltante, con días de margen | Esperada |
| A4 | Comparar ofertas en un solo lugar | Esperada |
| A5 | Preguntar en lenguaje natural ("¿quién entrega más rápido?") | Deseada |
| A6 | Conectarlo con su ERP | Deseada |
| A7 | Descubrir proveedores locales del NOA | Deseada (supuesto) |
| A8 | Respaldo de cada decisión listo para auditoría | Inesperada |
| A9 | Trust score que explica de dónde sale cada punto | Inesperada |

### Mapa de valor

**Lo que ofrecemos** (productos y servicios)

- Panel de stock con alertas por punto de reorden **[hoy]**
- Explorer de proveedores verificados: fichas, certificaciones, vencimientos **[hoy]**
- Agente: consultas → recomendaciones justificadas **[hoy]**
- Informe de recomendación en PDF, con código único, registrado en ju-min y verificable en `/verificar` **[hoy]**
- Cuenta por minera; cada persona con su email; cada minera ve solo sus datos (RLS) **[hoy]**
- Integración con ERP y facturación electrónica **[roadmap]**
- Carga del stock desde Excel o CSV **[roadmap]** (hoy el stock de la demo se carga directo en la base de datos)
- Exportar el informe al ERP de la minera **[roadmap]**

ju-min es un **consultor**: recomienda y entrega el informe. La aprobación, la
compra, el pago y la recepción siguen en el sistema de la minera.

**Cómo se lo resolvemos** (aliviadores de frustraciones)

| # | Aliviador | Frustración |
|---|---|---|
| AL1 | Red ya cargada: 277 proveedores, 188 categorías `[pitch]` | D1 |
| AL2 | `cumple_requisitos()` controla la vigencia por fecha; un certificado vencido saca al proveedor de las recomendaciones `[pitch]` | D2 |
| AL3 | 58 reglas de requisitos por categoría en la base de datos, no en el prompt `[pitch]` | D3 |
| AL4 | Alerta cuando el stock cruza el punto de reorden, con días de margen `[pitch]` | D4 |
| AL5 | Verificación hecha una vez y reutilizada en cada consulta | D1, D5 |
| AL6 | Cada recomendación guarda su justificación `[pitch]` | D6 |

**Cómo lo ayudamos a lograrlo** (creadores de alegrías)

| # | Creador | Alegría |
|---|---|---|
| CR1 | El agente nunca compra: propone, y la persona decide en su propio sistema `[pitch]` | A2 |
| CR2 | Recomendación con tres números: precio, lead time, trust score `[pitch]` | A4 |
| CR3 | Consultas en lenguaje natural, acotadas al dominio `[pitch]` | A5 |
| CR4 | Trust score 0–100 con desglose, solo con datos verificables (registro, certificados, habilitaciones, ESG, estado de verificación) | A9 |
| CR5 | Informe PDF con código verificable; cada informe queda registrado `[hoy]` | A8 |
| CR6 | Filtro por ubicación y fuente (registro de Jujuy) en el explorer | A7 |

### Encaje

| Frustración / alegría | Importancia | Aliviador / creador | Producto | Evidencia |
|---|---|---|---|---|
| D1 Validación manual | Alta | AL1, AL5 | Explorer | Demo con datos reales de CAPMIN |
| D2 Vigencia | Alta | AL2 | Explorer + agente | Función en la base de datos |
| D3 No habilitados | Alta | AL3 | Agente | 58 reglas cargadas |
| D4 Faltantes | Alta | AL4 | Panel | Demo con stock simulado |
| D5 Homologación duplicada | Media | AL5 | Explorer | Parcial: un proveedor sigue homologándose con cada minera |
| D6 Justificar | Media | AL6, CR5 | Informe PDF | Demo: informe con código y sello |
| A1 Solo los que cumplen | Requerida | AL3 | Agente | 58 reglas |
| A2 Aprobación humana | Requerida | CR1 | Sistema de la minera | Regla del producto |
| A3 Enterarse antes del faltante | Esperada | AL4 | Panel | Demo con stock simulado |
| A6 ERP | Deseada | — | **[roadmap]** | **Hueco** |
| A7 Proveedores locales | Deseada | CR6 | Explorer | Parcial |

**Huecos:** A6 (integración con ERP) no tiene respuesta hoy. D5 se alivia solo
del lado de la minera: el proveedor todavía no puede "homologarse una vez para
todas".

---

## `[P]` Proveedor verificado

### Perfil del cliente

**Lo que tiene que hacer** (trabajos del cliente)

| Tipo | Trabajo |
|---|---|
| Funcional | Vender insumos a mineras |
| Funcional | Pasar la homologación de cada minera |
| Funcional | Mantener certificaciones y documentos al día |
| Funcional | Aparecer en la categoría correcta cuando una minera busca |
| Social | Ser visto como proveedor confiable de la gran minería |
| Emocional | Sentir que compite por mérito y no por contactos (supuesto) |

**Lo que le complica** (frustraciones)

| # | Frustración | Fuente |
|---|---|---|
| DP1 | Cada minera exige su propio proceso de homologación | `[web]` MineriAR |
| DP2 | Repite los mismos papeles para cada minera | (supuesto, derivado de DP1) |
| DP3 | No sabe qué certificación le falta para una categoría | (supuesto) |
| DP4 | Las PyMEs locales son poco visibles frente a proveedores grandes | (supuesto) |
| DP5 | Los directorios quedan desactualizados | `[pitch]` |

**Lo que quiere lograr** (alegrías)

| # | Alegría | Nivel |
|---|---|---|
| AP1 | Llegar a mineras de la Puna | Requerida |
| AP2 | Demostrar cumplimiento una vez y que valga para varias mineras | Deseada |
| AP3 | Saber qué le falta para calificar en una categoría | Deseada |
| AP4 | Que el buen desempeño (entregas a tiempo) sume puntos | Inesperada |

### Mapa de valor

**Lo que ofrecemos** (productos y servicios)

- Ficha pública en el explorer, alimentada desde CAPMIN y el registro de Jujuy **[hoy]**
- Pipeline de verificación: registrado → documentado → validado → auditado → homologado `[clasif]` **[hoy, en datos]**
- Contacto desde la ficha **[hoy, simulado]**
- Autogestión de la ficha y carga de certificados **[roadmap]**
- Validación automática contra el registro de Jujuy y ARCA (ex AFIP) **[roadmap]**

**Cómo se lo resolvemos** (aliviadores de frustraciones)

| # | Aliviador | Frustración |
|---|---|---|
| ALP1 | La verificación de ju-min sirve para todas las mineras de la red | DP1, DP2 (**[roadmap]**: hoy no hay autogestión) |
| ALP2 | Requisitos por categoría visibles | DP3 |
| ALP3 | Datos tomados de fuentes oficiales y cámaras | DP5 |

**Cómo lo ayudamos a lograrlo** (creadores de alegrías)

| # | Creador | Alegría |
|---|---|---|
| CRP1 | Recomendación por cumplimiento, precio y lead time, no por tamaño | AP1, DP4 |
| CRP2 | — (el desempeño salió del trust score: ju-min no ve las entregas) | AP4 |
| CRP3 | Estado del pipeline visible | AP3 |

### Encaje

| Frustración / alegría | Importancia | Aliviador / creador | Producto | Evidencia |
|---|---|---|---|---|
| DP1 Homologación por minera | Alta | ALP1 | **[roadmap]** | Ninguna todavía |
| AP2 Cumplimiento una vez para varias mineras | Deseada | ALP1 | **[roadmap]** | Ninguna todavía |
| DP4 Visibilidad PyME | Media | CRP1 | Agente | (supuesto) |
| AP1 Llegar a mineras | Requerida | CRP1 | Explorer + agente | Depende de tener mineras en la red |
| AP3 Qué me falta | Deseada | ALP2, CRP3 | **[roadmap]** | Ninguna |

**Huecos:** AP4 (que el buen desempeño sume) no tiene respuesta: la recepción
ocurre en el sistema de la minera. Más adelante, una pregunta opcional de un
clic ("¿cómo te fue con este proveedor?") al pedir un nuevo informe. Además,
hoy el proveedor recibe valor solo de forma pasiva (aparecer en
recomendaciones). Casi todo lo que le resuelve frustraciones es roadmap.

---

## Nivel de encaje

| Nivel (Osterwalder) | `[M]` Minera | `[P]` Proveedor |
|---|---|---|
| Problema–solución | **En papel.** Problema descrito en el pitch; no hay entrevistas documentadas | En papel |
| Producto–mercado | No alcanzado: no hay mineras usando la demo | No alcanzado |
| Modelo de negocio | No alcanzado | No alcanzado |

## Declaraciones de propuesta de valor

**`[M]` Minera.** ju-min ayuda a la minera que necesita reponer insumos
críticos sin riesgo, avisándole antes del faltante y recomendándole solo
proveedores que cumplen todos los requisitos vigentes de la categoría, a
diferencia de validar a mano entre PDFs, planillas y directorios.

**`[P]` Proveedor verificado.** ju-min ayuda al proveedor que quiere venderle a
la minería del NOA a ser recomendado por lo que cumple y entrega, a diferencia
de repetir la homologación con cada minera y depender de directorios
desactualizados.
