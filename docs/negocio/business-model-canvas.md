# Modelo de negocio — Business Model Canvas

Parte de la documentación de ju-min — índice en [DOCS.md](../DOCS.md).

Método: Business Model Canvas de Alex Osterwalder (Strategyzer). Segmentos y
propuestas de valor vienen de [propuesta-de-valor.md](propuesta-de-valor.md);
las hipótesis riesgosas están en [hipotesis.md](hipotesis.md).

Etiquetas: `[M]` **Minera**, `[P]` **Proveedor verificado**. Mismas fuentes y
convenciones que la propuesta de valor; **[hoy]** / **[roadmap]** indican si
existe en la demo.

## Canvas

| Bloque | Contenido |
|---|---|
| **1. Segmentos de clientes** | Plataforma multilateral.<br>`[M]` Mineras en operación en la Puna (Jujuy, Salta, Catamarca); primer objetivo: asociadas a CAEM con operación en Jujuy (Sales de Jujuy, Minera Exar) `[inv]`.<br>`[P]` Proveedores mineros de CAPMIN y del Registro Provincial de Jujuy; 277 en la red `[pitch]`.<br>Paga: `[M]`.<br>Dentro de la minera: **Almacenes / Inventarios** controla el stock y pide la reposición; **Compras / Abastecimiento** elige proveedor y compra; ambos suelen depender de la **Gerencia de Supply Chain o de Abastecimiento**, que aprueba (conocimiento general del rubro; confirmar en H1). |
| **2. Propuesta de valor** | `[M]` Reponer insumos críticos sin riesgo: alerta antes del faltante + solo proveedores que cumplen todos los requisitos vigentes + informe que respalda la decisión.<br>`[M]` Recomendación defendible con tres números: precio, lead time, trust score.<br>`[P]` Ser recomendado por cumplimiento y desempeño, no por tamaño ni contactos.<br>`[P]` Verificarse una vez para toda la red **[roadmap]**. |
| **3. Canales** | Conocimiento: hackathon INNOA, Seminario Internacional del Litio (Jujuy), CAEM y CAPMIN `[web]`.<br>Evaluación: demo y piloto con una minera (supuesto).<br>Compra: venta directa a la Gerencia de Supply Chain o de Abastecimiento.<br>Entrega: aplicación web (panel, explorer, agente).<br>Posventa: onboarding asistido.<br>`[P]` Explorer público y ficha del proveedor **[hoy]**; invitación vía cámaras **[roadmap]**. |
| **4. Relación con clientes** | `[M]` Alta asistida: ju-min crea la cuenta de la minera y su primer usuario; ese usuario suma a su equipo (cada uno con su email, sin roles).<br>`[M]` Luego, servicio automatizado: alerta → recomendación → informe PDF. ju-min no reemplaza el sistema de compras de la minera.<br>`[M]` Co-creación de reglas de requisitos con cada minera (supuesto).<br>`[P]` Autoservicio: ficha y certificados **[roadmap]**. |
| **5. Fuentes de ingreso** | `[M]` **Suscripción mensual por minera** `[README]`. Monto sin dato: hipótesis inicial USD 1.000–3.000 por operación, según cantidad de insumos monitoreados (supuesto, H3).<br>**Única fuente de ingreso.** ju-min no cobra comisión por compra ni procesa pagos.<br>`[P]` **Gratis.** El proveedor no paga, así el trust score y las recomendaciones no dependen de quién paga. |
| **6. Recursos clave** | Red de proveedores: 277 proveedores, 188 categorías `[pitch]`.<br>Base de 58 reglas de requisitos por categoría `[pitch]`.<br>Trust score con datos verificables (sin desempeño hasta tener datos reales) y pipeline de verificación `[clasif]`.<br>Agente (eve + DeepSeek V4.1 Flash vía OpenCode Zen) y aplicación (Next.js + Supabase con RLS).<br>Scraper de CAPMIN `[inv]`.<br>Equipo con conocimiento del dominio minero del NOA. |
| **7. Actividades clave** | Mantener la red: scraping semanal (CAPMIN, registro de Jujuy) **[roadmap]**, validación de CUIT, control de vigencia.<br>Mantener las reglas regulatorias por categoría y jurisdicción.<br>Desarrollar el producto y el agente.<br>Venta consultiva y onboarding de mineras.<br>Sumar proveedores al pipeline de verificación **[roadmap]**. |
| **8. Socios clave** | Fuentes de datos: CAPMIN, Registro Provincial de Proveedores Mineros de Jujuy (Decreto 290-DEyP-24), CAEM, ARCA (ex AFIP) `[inv]`.<br>Certificadoras: IRAM, DNV, Bureau Veritas, SGS (validar certificados) `[inv]`.<br>Achilles: certificadora con convenio con CAPMIN; **socio potencial** (consumir su auditoría como señal del trust score) o competidor `[web]`.<br>Tecnología: OpenCode Zen (modelo DeepSeek V4.1 Flash, cambiable), Supabase, Vercel.<br>ERPs de las mineras (SAP u otros) **[roadmap]**. |
| **9. Estructura de costos** | Impulsado por **valor**, no por costo.<br>Fijos: equipo de desarrollo, hosting (Vercel, Supabase), mantenimiento de reglas, venta B2B con ciclo largo.<br>Variables: **verificación por proveedor** (revisar documentos, consultar registros) — el costo variable principal (supuesto, H4); tokens del modelo por consulta (bajo, supuesto); auditorías vía socios.<br>Economía de alcance: un proveedor verificado sirve a todas las mineras. |

## Patrones

- **Plataforma multilateral.** El valor para la minera crece con la cantidad de
  proveedores verificados; el valor para el proveedor crece con la cantidad de
  mineras. ju-min resolvió el "huevo o la gallina" del lado de la oferta
  cargando datos públicos (CAPMIN, registro de Jujuy): la minera ve una red
  útil desde el primer día. El reto pendiente es el lado de la demanda.
- **Gratis para un lado.** El proveedor no paga; la minera financia la
  plataforma. Esto sostiene la neutralidad del trust score.
- **Consultor, no sistema de compras.** ju-min detecta el faltante,
  recomienda y entrega un **informe PDF** con código único que la minera
  adjunta en su sistema. La aprobación, la compra, el pago y la recepción
  siguen allí (orden de compra, factura, Tesorería). Pedirle a una minera que
  mueva su proceso de compras a una startup es una barrera de adopción;
  mover dinero además no nos diferencia de SAP Ariba o Coupa y suma riesgo
  regulatorio. Uso mínimo: una persona, tres clics.

## Cuentas, usuarios e informes

- **La minera es la cuenta**: paga la suscripción y ve solo sus datos.
- **Alta**: la crea el equipo de ju-min al firmar, con un primer usuario; ese
  usuario suma a su equipo. Cada persona entra con su email, **sin roles**:
  todos pueden pedir recomendaciones e informes. Un solo login compartido no
  sirve para auditar (no dice quién generó cada informe).
- **Registro abierto**: hoy la configuración de Supabase permite registrarse
  eligiendo minera y rol. Riesgo a cerrar: el alta solo por invitación.
- **Informes**: cada PDF queda registrado (fecha, quién, insumo, proveedor,
  descartados y por qué, precio, plazo, trust score) con un código único. Un
  auditor puede verificar en ju-min que un informe es auténtico.
- **Trust score**: solo datos verificables por ju-min (registro de Jujuy,
  certificados y habilitaciones vigentes, ESG, estado de verificación). El
  desempeño (entregas a tiempo) sale del cálculo porque la recepción ocurre en
  el sistema de la minera; vuelve si hay datos reales (pregunta opcional al
  pedir un nuevo informe, o export del ERP).

## Proveedores: cómo sumarlos por etapas

Hoy el proveedor es pasivo: sus datos vienen del scraping (CAPMIN, registro de
Jujuy) y no usa la aplicación. Plan para sumarlo sin cobrarle:

1. **Reclamá tu ficha** **[roadmap]**: el proveedor corrige sus datos y sube
   sus certificados; pasa de "relevado" a "documentado" en el pipeline.
2. **Aviso de oportunidad** **[roadmap]**: se le avisa cuando una minera lo
   contacta o cuando aparece en una recomendación. Es el gancho para que entre.
3. **Qué te falta** **[roadmap]**: ve qué certificación le falta para calificar
   en una categoría.

Para la hackathon: "hoy servimos a la minera; los proveedores entran en la
etapa 2". Se valida con H6.

## Competencia y alternativas

**Directa**: resuelve el mismo problema (encontrar proveedores mineros
calificados). **Indirecta**: resuelve una parte, o es lo que la minera usa en
lugar de ju-min.

| Tipo | Alternativa | Qué cubre | Qué no cubre |
|---|---|---|---|
| Directa | [MineriAR](https://mineriar.com/proveedores-mineria-argentina) | Directorio argentino con calificación AAA–C | Requisitos obligatorios, stock, agente |
| Directa | [ProveMiner](https://www.proveminer.com/quienes-somos-para-ia) | Marketplace LATAM; cobra al proveedor | Foco en Chile y Perú; Argentina "por demanda" |
| Directa | SICEP (Chile) | Registro y calificación de proveedores mineros | Argentina, stock, agente |
| Indirecta | [Achilles](https://www.achilles.com/industry-insights/capmin-and-achilles-sign-collaboration-agreement) | Certificación de proveedores con auditoría; convenio con CAPMIN | Stock y recomendación de compra |
| Indirecta | SAP Ariba, Coupa | Compras corporativas de punta a punta, incluido el pago | Contexto regulatorio local (ANMaC, IRAM, alta montaña) |
| Indirecta | ERP de la minera (p. ej. SAP) | Stock y alerta por punto de reorden | Qué proveedor local cumple los requisitos |
| Indirecta | Listados de CAPMIN y del registro de Jujuy | Quién existe | Vigencia, comparación, recomendación |
| Indirecta | Excel, PDFs y portal propio de cada minera | Lo que se usa hoy | Vigencia, reglas por categoría, alertas |

**Diferencial:** la alerta de stock sola no nos distingue (un ERP ya la tiene).
Lo que nos distingue es recomendar solo proveedores que cumplen los requisitos
locales vigentes, con una justificación que se puede defender.

## Checklist de coherencia

- [x] Cada segmento tiene su VPC y al menos una propuesta de valor.
- [x] Cada propuesta de valor responde a frustraciones o alegrías del VPC.
- [x] Cada fuente de ingreso dice quién paga, por qué y cuánto (monto como supuesto).
- [x] Actividades y recursos sirven a alguna propuesta de valor.
- [x] Los costos cubren actividades y recursos.
- [x] Mismos nombres de segmentos que el glosario y el VPC.
