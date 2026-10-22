# DOCS — Investigación de proveedores y propuesta de base de datos

Documento de investigación para **ju-min**: qué información brindan los
proveedores mineros (certificaciones, normas y cumplimientos) para poder
clasificarlos, de qué fuentes reales obtenerla, y una propuesta de esquema de
base de datos para Supabase corriendo local con Docker.

> Estado: **propuesta** — nada de esto está implementado todavía.

---

## 1. Qué información brindan los proveedores

En la industria minera, un proveedor no se "compra": se **homologa**. Antes de
poder ofertar, la minera (o una plataforma intermediaria como Achilles Regic o
la RNCCS de Codelco) le exige un paquete de antecedentes. La información se
agrupa en 10 dimensiones:

### 1.1 Identidad legal y fiscal

Es el piso mínimo — sin esto el proveedor ni siquiera entra a la red.

| Dato | Fuente típica |
|---|---|
| Razón social y nombre de fantasía | Registro provincial, directorios |
| CUIT (Argentina) / RUT (Chile) | Registro provincial, AFIP, cuitonline |
| Condición frente a IVA y antigüedad fiscal | cuitonline, constancia AFIP |
| Domicilio legal y de planta | Directorios, registros |
| Representantes legales / poderes | Escrituras, estatutos |
| Constitución societaria | Registro público de comercio |

**Señal de clasificación:** CUIT validado + antigüedad fiscal alta ⇒ puntos en
el trust score. En Argentina, estar inscripto en el **Registro Provincial de
Proveedores Mineros de Jujuy** (Decreto 290-DEyP-24) es ya una validación
estatal: el registro expone razón social, CUIT, contacto y estado
(aprobado/pendiente).

### 1.2 Situación financiera

- Estados contables / balance (antigüedad 1–3 años)
- Seguros vigentes: responsabilidad civil, ART, caución
- Informes crediticios (tipo D&B, Veraz/Nosis en Argentina)
- Capacidad financiera declarada / facturación anual

**Señal:** seguros vigentes + solvencia verificable. En la demo puede
simplificarse a "informe comercial disponible: sí/no".

### 1.3 Certificaciones de sistema de gestión (empresa)

Son certificaciones **de la empresa**, no del producto. El trío base que piden
casi todas las mineras:

| Norma | Ámbito | Frecuencia de exigencia |
|---|---|---|
| ISO 9001 | Gestión de calidad | Casi siempre obligatoria |
| ISO 14001 | Gestión ambiental | Muy frecuente |
| ISO 45001 | Seguridad y salud ocupacional | Muy frecuente (ex OHSAS 18001) |
| ISO 50001 | Gestión energética | Cada vez más pedida (ESG) |
| ISO 37001 | Antisoborno / compliance | Mineras grandes (Codelco, BHP) |
| ISO 27001 | Seguridad de la información | Proveedores de software/IT |
| ISO 39001 | Seguridad vial | Transporte/logística |
| ISO 22301 | Continuidad de negocio | Ocasional, alto riesgo |

Metadatos que acompañan a cada certificación (críticos para el modelo de
datos): **organismo certificador** (DNV, Bureau Veritas, IRAM, TÜV, SGS),
**número de certificado**, **fecha de emisión y vencimiento**, **alcance**
(texto del certificado), **documento/evidencia** (PDF).

### 1.4 Certificaciones de producto / material

Aplican al **insumo ofrecido**, no a la empresa. Varían por categoría:

| Categoría de insumo | Certificaciones / normas típicas |
|---|---|
| EPP | IRAM, ANSI/ISEA, EN (marcado CE), NIOSH (respiradores), NFPA 2112 (ignífugo) |
| Químicos / reactivos | GHS/CLP + SDS (hoja de seguridad), REACH, **International Cyanide Management Code** (obligatorio para cianuro), ISO 14001 del fabricante |
| Explosivos | Habilitación del organismo estatal (AR: ANMaC/RENAR; CL: SERNAGEOMIN; PE: SUCAMEC), transporte de mercancías peligrosas (clase UN/IMO) |
| Medios de molienda y aceros | Certificado de material **EN 10204 3.1/3.2** (trazabilidad del acero), ASTM, ensayos de laboratorio acreditado ISO/IEC 17025 |
| Equipos eléctricos | IECEx / ATEX (atmósferas explosivas), IEC, UL, grado IP |
| Equipos a presión / mecánicos | ASME Sección VIII, B31 (piping), API, procedimientos de soldadura WPS/PQR |
| Geosintéticos | **GRI-GM13** (geomembranas HDPE para pilas de lixiviación), ensayos de compatibilidad química |
| Combustibles / lubricantes | Especificación del combustible (IRAM/EN 590 para diésel), fichas técnicas |
| Monitoreo ambiental | Laboratorio acreditado ISO/IEC 17025, métodos normalizados EPA/IRAM |

**Señal clave para el agente:** un insumo puede *requerir* una certificación
concreta (ej. geomembrana ⇒ GRI-GM13) — eso modela como una tabla de requisitos
por categoría de insumo, no como texto libre.

### 1.5 Habilitaciones regulatorias sectoriales

Habilitaciones estatales, distintas de las certificaciones privadas:

- Registro Provincial de Proveedores Mineros (Jujuy: Decreto 290-DEyP-24)
- Habilitaciones de sustancias peligrosas / explosivos (RENAR, ANMaC)
- Transporte de mercancías peligrosas (RID/ADR local)
- Registro en cámaras sectoriales (CAPMIN, CAEM, APRIMIN)
- Habilitaciones municipales/provinciales de planta

### 1.6 Desempeño en HSEC (salud, seguridad, ambiente)

Lo que miden los cuestionarios de precalificación (Achilles, Gold Fields,
Codelco) además de las ISO:

- Políticas HSE documentadas
- Estadísticas de seguridad: tasa de frecuencia de accidentes (LTIFR), índice
  de incidentes, historial de fatalidades
- Exámenes pre-ocupacionales y de **altura geográfica** del personal (faenas a
  3.500–4.500 msnm — en Jujuy/Salta/Catamarca es exigencia real: Sales de
  Jujuy, Minera Exar, Lindero operan en la Puna)
- Planes de emergencia, gestión de residuos, manejo de derrames

### 1.7 ESG / sostenibilidad

Peso creciente en evaluación:

- Huella de carbono reportada (ISO 14064 / GHG Protocol)
- Reporte de sostenibilidad (GRI)
- Políticas de derechos humanos, trabajo infantil, comunidades locales
- Código de conducta de proveedores adherido (ej. Supplier Code of Conduct del
  comprador)
- Marcos sectoriales: **Copper Mark**, IRMA, ResponsibleSteel (más para
  mineras que para proveedores, pero bajan en cascada)
- Codelco aplica due diligence tipo **OECD 5-Step** para cadena de minerales:
  screening de corrupción, lavado, soborno, financiamiento del terrorismo

### 1.8 Cumplimiento legal y reputacional

- Screening de sanciones, PEPs, medios adversos (third-party screening)
- Declaraciones de esclavitud moderna, anticorrupción
- Protección de datos
- Litigios / antecedentes laborales

### 1.9 Capacidad operativa

- Productos/servicios ofrecidos por categoría (CAPMIN usa ~180 categorías;
  CAEM agrupa en productos/servicios/minerales)
- Lead time declarado, stock disponible, capacidad de producción
- Cobertura geográfica (CAEM distingue "ubicación de la empresa" vs.
  "provincias donde opera")
- Flota, planta, personal propio vs. subcontratado

### 1.10 Historial de desempeño

- Entregas a tiempo (OTIF), penalidades, contratos previos con mineras
- Ratings/reviews en directorios (CAPMIN expone rating 0–5 y vistas)
- Referencias comerciales

### Resumen: cuestionario de precalificación tipo Achilles

Achilles Regic (la comunidad minera real de referencia) estructura su
cuestionario en: datos corporativos → productos/servicios → finanzas →
seguros y legal → salud/seguridad/calidad → continuidad de negocio →
sostenibilidad ambiental → ética de negocios → cyber/IT → gestión de riesgo.
Proveedores de mayor riesgo pasan a **auditoría presencial** (tier "Verify")
cuyo informe queda en la plataforma.

---

## 2. Fuentes de datos reales para poblar la demo

### Tier 1 — usar ya

| Fuente | URL | Qué da | Uso en ju-min |
|---|---|---|---|
| **Registro Provincial de Proveedores Mineros de Jujuy** | proveedores.registrominero.jujuy.gob.ar | Razón social, CUIT, contacto, estado (aprobado/pendiente). Registro oficial del gobierno (Decreto 290-DEyP-24) | "Lista de buena fe": verificación estatal. Pitch: proveedores salen del registro provincial |
| **Directorio CAPMIN** | capmin.com.ar/directorio-proveedores-mineros | Nombres reales, direcciones, sitios web, ~180 categorías de insumos/servicios, rating, vistas | Fuente principal del explorer de proveedores |
| **Asociados CAEM** | caem.com.ar/asociados | Mineras reales (Sales de Jujuy, Minera Exar, Litica…), proveedores adherentes, filtros por tipo/mineral/producto/servicio/provincia de operación | La "minera cliente" del demo + enriquecer cobertura geográfica |

### Tier 2 — enriquecer

| Fuente | Qué da | Uso |
|---|---|---|
| cuitonline.com | Antigüedad fiscal, domicilio, condición frente a IVA por CUIT | Inputs reales del trust score |
| MercadoLibre / catálogos industriales | Órdenes de magnitud de precios (EPP, lubricantes, filtros) | Sintetizar precios plausibles — no hay precios B2B públicos |
| Nominatim / OpenStreetMap | Geocodificación de direcciones scrapeadas | Mapa en el explorer |

### Tier 3 — pitch solamente

| Fuente | Nota |
|---|---|
| API ChileCompra (api.mercadopublico.cl) | API pública real y gratis (ticket por mail) con licitaciones y OC de 118.000 proveedores. No integrar; nombrar en roadmap |

### Qué NO dan las fuentes públicas (y hay que sintetizar)

- Precios B2B, lead times reales, disponibilidad de stock
- Certificados concretos (número, organismo, vencimiento) — los directorios
  dicen a lo sumo "certificado ISO 9001" en texto libre
- Estadísticas HSE, trust score — se calculan sobre datos simulados con forma
  realista

---

## 3. Modelo de clasificación propuesto

### 3.1 Pipeline de verificación del proveedor

```
registrado → documentado → validado → auditado → homologado
```

| Estado | Significado | Trigger |
|---|---|---|
| `registrado` | Existe en una fuente (CAPMIN, registro Jujuy) | Ingesta automática |
| `documentado` | Cargó identidad fiscal + documentos | CUIT válido, docs subidos |
| `validado` | Documentos verificados contra fuente externa | Check de CUIT/AFIP, registro provincial aprobado |
| `auditado` | Pasó auditoría presencial o remota | Informe de auditoría cargado |
| `homologado` | Apto para recibir propuestas de compra | Todos los requisitos de sus categorías cumplidos |

### 3.2 Trust score — inputs

El README define el trust score como señal calculada. Inputs propuestos,
ponderados:

| Grupo | Señales | Peso sugerido |
|---|---|---|
| Identidad | CUIT validado, antigüedad fiscal, registro provincial aprobado | 20% |
| Compliance | ISOs vigentes (9001/14001/45001), certificaciones de producto requeridas cumplidas, habilitaciones sectoriales | 30% |
| Desempeño | OTIF historial, penalidades, rating directorio | 30% |
| ESG | Huella de carbono reportada, políticas, screening limpio | 10% |
| Capacidad | Lead time vs. categoría, cobertura geográfica, respuesta a consultas | 10% |

### 3.3 Requisitos por categoría de insumo

La regla de negocio central para que el agente "justifique" recomendaciones:

> Un proveedor solo puede recomendarse para un insumo si cumple los requisitos
> (certificaciones + habilitaciones) de la categoría de ese insumo.

Ej.: `Explosivos` requiere `habilitación ANMaC/RENAR` + `ISO 9001` +
`transporte mercancías peligrosas`. `Venta de EPP` requiere `IRAM/EN` por
producto + `ISO 9001` de empresa. `Geomembranas` requiere `GRI-GM13`.

---

## 4. Propuesta de base de datos — Supabase (Postgres)

### 4.1 Decisiones

- **Naming en español** (consistente con el dominio del README: `Proveedor`,
  `OfertaInsumo`, `StockMinera`, `Consulta`) → tablas en `snake_case` español.
- **Catálogos normalizados**: `certificaciones` y `categorias` son catálogos;
  la relación proveedor↔certificación es una tabla puente con metadatos
  (vencimiento, evidencia, estado). Nunca texto libre para algo que se filtra.
- **Certificación vs. insumo vs. proveedor son cosas distintas**: la
  certificación puede acreditar a la empresa (ISO 9001) o a un producto
  (IRAM-EPP). Se modela con `ambito` en el catálogo.
- **Documentos como primera clase**: todo lo verificable referencia un
  documento en Supabase Storage (bucket `documentos`, privado con URLs
  firmadas). Un certificado "declarado" sin PDF ≠ certificado validado.
- **Evidencia de fuente**: campos `fuente` y `fuente_url` en `proveedores`
  para trazar de dónde salió cada registro (CAPMIN, registro Jujuy, manual).
- **RLS**: lectura pública de catálogo de proveedores homologados; escritura
  solo service role. Para la demo puede quedar deshabilitado, pero el esquema
  lo admite.
- **UUIDs** + `timestamptz`, `created_at`/`updated_at` en todo.
- `tsvector`/extensión `pg_trgm` para búsqueda por razón social/categoría.

### 4.2 Diagrama ER

```mermaid
erDiagram
    proveedores ||--o{ proveedor_categorias : "ofrece"
    proveedores ||--o{ proveedor_certificaciones : "acredita"
    proveedores ||--o{ ofertas_insumo : "publica"
    proveedores ||--o{ entregas : "historial"
    proveedores ||--o{ trust_score_historial : "evolución"
    proveedores ||--o{ auditorias : "recibe"
    categorias ||--o{ insumos : "contiene"
    categorias ||--o{ requisitos_categoria : "exige"
    categorias ||--o{ proveedor_categorias : "ofertada en"
    certificaciones ||--o{ proveedor_certificaciones : "instancia de"
    certificaciones ||--o{ requisitos_categoria : "requerida por"
    insumos ||--o{ ofertas_insumo : "ofertado como"
    insumos ||--o{ stock_minera : "trackeado en"
    insumos ||--o{ recomendaciones : "recomendado"
    consultas ||--o{ recomendaciones : "genera"
    recomendaciones ||--o{ recomendacion_items : "detalle"
    documentos ||--o{ proveedor_certificaciones : "evidencia"
```

### 4.3 DDL propuesto

```sql
-- ============================ ENUMS ============================

create type estado_proveedor as enum
  ('registrado', 'documentado', 'validado', 'auditado', 'homologado', 'suspendido');

create type estado_verificacion as enum
  ('declarado', 'en_revision', 'verificado', 'rechazado', 'vencido');

create type ambito_certificacion as enum
  ('empresa', 'producto', 'proceso', 'persona');

create type tipo_certificacion as enum
  ('sistema_gestion', 'producto', 'habilitacion_regulatoria', 'esg', 'registro');

create type estado_consulta as enum
  ('pendiente', 'aprobada', 'rechazada');

create type condicion_iva as enum
  ('responsable_inscripto', 'monotributo', 'exento', 'no_responsable', 'desconocido');

-- ============================ CATÁLOGOS ============================

create table categorias (
  id          uuid primary key default gen_random_uuid(),
  nombre      text not null unique,               -- "Venta de EPP", "Lubricantes", "Explosivos"
  slug        text not null unique,
  categoria_padre_id uuid references categorias(id),  -- jerarquía opcional (CAPMIN tiene ~180 planas; agrupables)
  origen      text,                               -- 'capmin' | 'caem' | 'manual'
  created_at  timestamptz not null default now()
);

create table certificaciones (
  id          uuid primary key default gen_random_uuid(),
  nombre      text not null,                      -- "ISO 9001:2015"
  codigo      text,                               -- "ISO 9001", "GRI-GM13", "IRAM-ISO 14001"
  tipo        tipo_certificacion not null,
  ambito      ambito_certificacion not null,      -- empresa | producto | proceso | persona
  organismo_tipico text,                          -- "IRAM", "DNV", "ANMaC", "Registro Prov. Jujuy"
  descripcion text,
  created_at  timestamptz not null default now(),
  unique (codigo, ambito)
);

-- Qué exige cada categoría de insumo (regla de homologación)
create table requisitos_categoria (
  id              uuid primary key default gen_random_uuid(),
  categoria_id    uuid not null references categorias(id) on delete cascade,
  certificacion_id uuid not null references certificaciones(id),
  obligatorio     boolean not null default true,  -- false = suma puntos pero no bloquea
  unique (categoria_id, certificacion_id)
);

-- ============================ PROVEEDORES ============================

create table proveedores (
  id                  uuid primary key default gen_random_uuid(),
  razon_social        text not null,
  nombre_fantasia     text,
  cuit                text unique,                  -- "30-12345678-9"
  condicion_iva       condicion_iva default 'desconocido',
  fecha_constitucion  date,                         -- antigüedad fiscal (cuitonline)
  domicilio           text,
  localidad           text,
  provincia           text,
  pais                text not null default 'AR',
  lat                 double precision,
  lng                 double precision,             -- geocodificado (Nominatim)
  sitio_web           text,
  email               text,
  telefono            text,
  provincias_operacion text[],                      -- CAEM: "provincias donde opera"
  estado              estado_proveedor not null default 'registrado',
  registro_jujuy_estado text,                       -- 'aprobado' | 'pendiente' | null
  fuente              text not null default 'manual', -- 'capmin' | 'caem' | 'registro_jujuy' | 'manual'
  fuente_url          text,
  trust_score         numeric(5,2),                 -- 0-100, calculado
  trust_score_detalle jsonb,                        -- desglose por grupo de señales
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);
create index on proveedores using gin (razon_social gin_trgm_ops);

create table contactos_proveedor (
  id           uuid primary key default gen_random_uuid(),
  proveedor_id uuid not null references proveedores(id) on delete cascade,
  nombre       text not null,
  rol          text,
  email        text,
  telefono     text
);

create table proveedor_categorias (
  proveedor_id uuid not null references proveedores(id) on delete cascade,
  categoria_id uuid not null references categorias(id) on delete cascade,
  primary key (proveedor_id, categoria_id)
);

-- Documentos: certificados, seguros, constancias. El archivo vive en Storage.
create table documentos (
  id           uuid primary key default gen_random_uuid(),
  proveedor_id uuid not null references proveedores(id) on delete cascade,
  tipo         text not null,            -- 'certificado' | 'seguro' | 'constancia_fiscal' | 'auditoria' | 'otro'
  storage_path text not null,            -- path en bucket 'documentos'
  nombre_archivo text,
  created_at   timestamptz not null default now()
);

-- Instancia: este proveedor tiene esta certificación, con evidencia y vigencia
create table proveedor_certificaciones (
  id               uuid primary key default gen_random_uuid(),
  proveedor_id     uuid not null references proveedores(id) on delete cascade,
  certificacion_id uuid not null references certificaciones(id),
  numero_certificado text,
  organismo        text,                  -- quien la emitió realmente
  fecha_emision    date,
  fecha_vencimiento date,
  alcance          text,                  -- texto del alcance del certificado
  estado           estado_verificacion not null default 'declarado',
  documento_id     uuid references documentos(id),
  created_at       timestamptz not null default now(),
  unique (proveedor_id, certificacion_id, numero_certificado)
);

create table auditorias (
  id           uuid primary key default gen_random_uuid(),
  proveedor_id uuid not null references proveedores(id) on delete cascade,
  fecha        date not null,
  tipo         text,                      -- 'presencial' | 'remota'
  auditor      text,                      -- organismo o interno
  puntaje      numeric(5,2),
  informe_documento_id uuid references documentos(id),
  resultado    text,                      -- 'aprobado' | 'con_observaciones' | 'rechazado'
  created_at   timestamptz not null default now()
);

-- ============================ INSUMOS Y OFERTAS ============================

create table insumos (
  id           uuid primary key default gen_random_uuid(),
  categoria_id uuid not null references categorias(id),
  nombre       text not null,             -- "Bola de acero forjado 3\""
  unidad       text not null,             -- 'kg', 'unidad', 'litro', 'm2'
  especificacion text,                    -- spec técnica opcional
  created_at   timestamptz not null default now()
);

create table ofertas_insumo (
  id            uuid primary key default gen_random_uuid(),
  proveedor_id  uuid not null references proveedores(id) on delete cascade,
  insumo_id     uuid not null references insumos(id) on delete cascade,
  precio        numeric(14,2) not null,
  moneda        text not null default 'ARS',
  lead_time_dias int,
  disponible    boolean not null default true,
  vigente_desde date default current_date,
  vigente_hasta date,
  created_at    timestamptz not null default now(),
  unique (proveedor_id, insumo_id)
);

-- ============================ MINERA / STOCK ============================

create table mineras (
  id        uuid primary key default gen_random_uuid(),
  nombre    text not null,                -- "Sales de Jujuy"
  ubicacion text,
  created_at timestamptz not null default now()
);

create table stock_minera (
  id                uuid primary key default gen_random_uuid(),
  minera_id         uuid not null references mineras(id) on delete cascade,
  insumo_id         uuid not null references insumos(id) on delete cascade,
  cantidad_actual   numeric(14,3) not null,
  punto_reorden     numeric(14,3) not null,
  consumo_mensual   numeric(14,3),
  updated_at        timestamptz not null default now(),
  unique (minera_id, insumo_id)
);

-- ============================ AGENTE: CONSULTAS Y RECOMENDACIONES ============================

create table consultas (
  id            uuid primary key default gen_random_uuid(),
  minera_id     uuid references mineras(id),
  mensaje       text not null,            -- input del usuario
  respuesta     text,                     -- output del agente
  estado        estado_consulta not null default 'pendiente',
  created_at    timestamptz not null default now()
);

create table recomendaciones (
  id              uuid primary key default gen_random_uuid(),
  consulta_id     uuid not null references consultas(id) on delete cascade,
  proveedor_id    uuid references proveedores(id),
  insumo_id       uuid references insumos(id),
  justificacion   text,                   -- por qué lo recomendó (precio, lead time, trust score, certs)
  puntaje         numeric(5,2),
  created_at      timestamptz not null default now()
);

-- Historial para el trust score: entregas reales o simuladas
create table entregas (
  id               uuid primary key default gen_random_uuid(),
  proveedor_id     uuid not null references proveedores(id) on delete cascade,
  insumo_id        uuid references insumos(id),
  fecha_compromiso date,
  fecha_entrega    date,
  a_tiempo         boolean generated always as (fecha_entrega <= fecha_compromiso) stored,
  conforme         boolean,
  created_at       timestamptz not null default now()
);

create table trust_score_historial (
  id           uuid primary key default gen_random_uuid(),
  proveedor_id uuid not null references proveedores(id) on delete cascade,
  puntaje      numeric(5,2) not null,
  detalle      jsonb,                      -- snapshot del desglose
  created_at   timestamptz not null default now()
);
```

### 4.4 Extensiones y extras de Supabase

```sql
create extension if not exists pg_trgm;      -- búsqueda difusa por nombre
create extension if not exists postgis;      -- opcional: si el mapa filtra por distancia
```

- **Bucket `documentos`** (privado): certificados, seguros, informes de
  auditoría. Se accede con signed URLs.
- **Vista útil para el explorer**:

```sql
create view proveedores_explorer as
select p.id, p.razon_social, p.cuit, p.provincia, p.lat, p.lng,
       p.estado, p.trust_score, p.registro_jujuy_estado,
       array_agg(distinct c.nombre) as categorias,
       count(distinct pc.certificacion_id)
         filter (where pc.estado = 'verificado'
                 and (pc.fecha_vencimiento is null or pc.fecha_vencimiento > now()))
         as certificaciones_vigentes
from proveedores p
left join proveedor_categorias pk on pk.proveedor_id = p.id
left join categorias c on c.id = pk.categoria_id
left join proveedor_certificaciones pc on pc.proveedor_id = p.id
group by p.id;
```

- **Chequeo de homologación** (regla del agente) como función:

```sql
create or replace function cumple_requisitos(p_proveedor uuid, p_categoria uuid)
returns boolean language sql stable as $$
  select not exists (
    select 1
    from requisitos_categoria rc
    where rc.categoria_id = p_categoria and rc.obligatorio
      and not exists (
        select 1 from proveedor_certificaciones pc
        where pc.proveedor_id = p_proveedor
          and pc.certificacion_id = rc.certificacion_id
          and pc.estado = 'verificado'
          and (pc.fecha_vencimiento is null or pc.fecha_vencimiento > current_date)
      )
  );
$$;
```

---

## 5. Supabase local con Docker Compose

### Opción A (recomendada): Supabase CLI

La CLI de Supabase levanta el stack completo local **vía Docker Compose por
debajo** (Postgres + PostgREST + GoTrue auth + Realtime + Storage + Studio +
Inbucket para mail). Es la forma oficial y la que menos fricción da:

```bash
pnpm add supabase --save-dev --allow-build=supabase   # pnpm ≥10 requiere el flag
pnpm supabase init          # crea supabase/config.toml
pnpm supabase start         # levanta el stack (requiere Docker corriendo)
pnpm supabase status        # muestra URL, anon key, service key, Studio
```

Resultado:

| Servicio | Puerto |
|---|---|
| API (PostgREST/Kong) | `http://localhost:54321` |
| Postgres directo | `postgresql://postgres:postgres@localhost:54322/postgres` |
| Studio (dashboard) | `http://localhost:54323` |
| Inbucket (mail mock) | `http://localhost:54324` |

Las migraciones viven en `supabase/migrations/*.sql` (el DDL de §4.3 se parte
en migraciones), y `supabase/seed.sql` puebla la demo con datos de las fuentes
Tier 1. El schema versionado es lo que luego se despliega idéntico a Supabase
cloud.

En Next.js:

```bash
pnpm add @supabase/supabase-js
```

```env
# .env.local
NEXT_PUBLIC_SUPABASE_URL=http://localhost:54321
NEXT_PUBLIC_SUPABASE_ANON_KEY=<anon key de `supabase status`>
SUPABASE_SERVICE_ROLE_KEY=<service key, solo server-side>
DATABASE_URL=postgresql://postgres:postgres@localhost:54322/postgres
```

### Opción B: docker-compose mínimo (solo Postgres)

Si para la demo alcanza con Postgres pelado (sin Auth/Realtime/Studio), un
`docker-compose.yml` chico con la imagen oficial de Supabase:

```yaml
# docker-compose.yml — propuesta, no implementado
services:
  db:
    image: supabase/postgres:17.4.1.043
    container_name: ju-min-db
    restart: unless-stopped
    ports:
      - "54322:5432"
    environment:
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: postgres
    volumes:
      - db-data:/var/lib/postgresql/data
      - ./supabase/migrations:/docker-entrypoint-initdb.d/migrations:ro
      - ./supabase/seed.sql:/docker-entrypoint-initdb.d/z-seed.sql:ro
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres"]
      interval: 5s
      timeout: 5s
      retries: 10

volumes:
  db-data:
```

`docker compose up -d` y `DATABASE_URL=postgresql://postgres:postgres@localhost:54322/postgres`.
En este caso el acceso desde Next.js sería vía `postgres.js`/`drizzle`/`prisma`
en vez del cliente Supabase — **trade-off**: menos servicios, pero se pierde
Storage para los documentos y Studio para inspección visual.

### Recomendación

**Opción A**. Storage resuelve el requisito de evidencia documental (§4.1),
Studio da un admin gratis para cargar datos durante el hackathon, y el mismo
`supabase/migrations` sirve después contra Supabase cloud. La Opción B queda
documentada como fallback por si Docker tiene pocos recursos.

---

## 6. Mapeo: mocks del README → tablas

| Mock actual | Tabla(s) |
|---|---|
| `Proveedor` (nombre, CUIT, ubicación, certificaciones, trust score, contacto) | `proveedores` + `contactos_proveedor` + `proveedor_certificaciones` |
| `OfertaInsumo` (insumo, precio, unidad, lead time, disponibilidad) | `insumos` + `ofertas_insumo` |
| `StockMinera` (cantidad, punto de reorden, consumo mensual) | `stock_minera` + `mineras` |
| `Consulta` (mensaje, respuesta, recomendaciones, estado, timestamp) | `consultas` + `recomendaciones` |
| "red verificada" / trust score | `proveedores.estado` + `trust_score` + `trust_score_historial` + `auditorias` |

---

## 7. Plan de implementación

### Fase 0 — Setup del stack local

| # | Tarea | Artefacto | Criterio de aceptación |
|---|---|---|---|
| 0.1 | Instalar CLI: `pnpm add supabase --save-dev --allow-build=supabase` | `package.json` | `pnpm supabase --version` responde |
| 0.2 | `pnpm supabase init` | `supabase/config.toml` | Directorio `supabase/` creado |
| 0.3 | `pnpm supabase start` (requiere Docker) | stack corriendo | `pnpm supabase status` muestra API/DB/Studio en 54321–54323 |
| 0.4 | Instalar cliente: `pnpm add @supabase/supabase-js` | `package.json` | — |
| 0.5 | Crear `.env.local` con URL + anon/service keys + DATABASE_URL (copiar a `.env.example` sin valores) | `.env.local`, `.env.example` | vars disponibles en `next dev` |
| 0.6 | Agregar `.env.local` a `.gitignore` si no está | `.gitignore` | secrets no commiteados |

**Decisión tomada:** el mapa del explorer solo muestra marcadores y filtra por
provincia — **no se usa postgis**. `lat`/`lng` + filtro por `provincia` /
`provincias_operacion` alcanza para el demo.

### Fase 1 — Migraciones (DDL de §4.3)

Orden de migraciones, una por archivo en `supabase/migrations/`:

| # | Migración | Contenido | Depende de |
|---|---|---|---|
| 1.1 | `00001_extensions` | `pg_trgm` | — |
| 1.2 | `00002_enums` | los 6 `create type` | — |
| 1.3 | `00003_catalogos` | `categorias`, `certificaciones`, `requisitos_categoria` | 1.2 |
| 1.4 | `00004_proveedores` | `proveedores`, `contactos_proveedor`, `proveedor_categorias`, `documentos`, `proveedor_certificaciones`, `auditorias` + índice trgm | 1.3 |
| 1.5 | `00005_insumos` | `insumos`, `ofertas_insumo` | 1.4 |
| 1.6 | `00006_minera_stock` | `mineras`, `stock_minera` | 1.5 |
| 1.7 | `00007_agente` | `consultas`, `recomendaciones`, `entregas`, `trust_score_historial` | 1.4–1.6 |
| 1.8 | `00008_vistas_funciones` | vista `proveedores_explorer`, función `cumple_requisitos()`, trigger `updated_at` | todas |
| 1.9 | `00009_storage` | bucket `documentos` (privado) + policies | — |
| 1.10 | `00010_rls` | habilitar RLS: lectura pública (anon) de proveedores `homologado`/`validado`, escritura solo service role | todas |

Verificación: `pnpm supabase db reset` corre todo limpio; chequear en Studio
(localhost:54323) que las tablas existen.

### Fase 2 — Datos semilla (`supabase/seed.sql` + script opcional)

**Catálogos (curados a mano, ~1 hora):**

| Dataset | Volumen | Fuente |
|---|---|---|
| `certificaciones` | ~25 filas | Tablas §1.3 y §1.4 de este doc |
| `categorias` | ~30 principales (EPP, Lubricantes, Explosivos, Bolas de Molino, Filtros, Bombas, Geomembranas, Estructuras Metálicas, Transporte, Higiene y Seguridad…) | Listado real CAPMIN (~180 → subset) |
| `requisitos_categoria` | ~40 relaciones | Mapeo §3.3 |

**Datos de dominio:**

| Dataset | Volumen | Origen |
|---|---|---|
| `proveedores` | 15–25 | CAPMIN (nombres/direcciones/webs/categorías reales) + marcar 3–5 con `registro_jujuy_estado='aprobado'` |
| `proveedor_certificaciones` | 2–4 por proveedor | Sintético pero plausible (ISO 9001+14001+45001 comunes; especializadas según categoría). Mezclar estados: mayoría `verificado`, algunos `declarado`/`vencido` para mostrar el filtro |
| `auditorias` | 3–5 | Sintético |
| `insumos` | 10–15 | Por categoría (bola de molienda, guante nitrilo, geomembrana HDPE, filtro, lubricante, emulsión explosiva…) |
| `ofertas_insumo` | 1–3 por insumo | Precios sintéticos con magnitud de referencia MercadoLibre |
| `mineras` | 1–2 | Sales de Jujuy / Minera Exar (CAEM) |
| `stock_minera` | 5–8 | Uno deliberadamente bajo punto de reorden → dispara el flujo del demo |
| `entregas` | ~30 | Sintético, para alimentar OTIF del trust score |
| `consultas`/`recomendaciones` | 2–3 | Historial de ejemplo |
| `trust_score` | calculado | Ver Fase 3.4 |

**Extracción de datos reales (decisión tomada: script de scraping):**
- CAPMIN: listado HTML paginado scrapeable (campos: nombre, dirección, web,
  categorías, rating). **Script Node one-shot** (`scripts/scrape-capmin.ts`)
  que vuelca a `supabase/seed-data/capmin.csv` → `seed.sql` hace `COPY`/`insert`
  desde ahí. Reproducible y el dataset crece gratis.
- Registro Jujuy: el sitio es una app JS — el fetch directo no devuelve tabla.
  Evaluar si tiene API interna (inspeccionar network) o tomar muestra manual.
- Geocodificación: Nominatim sobre las direcciones extraídas (respetar
  1 req/seg).

### Fase 3 — Integración en la app

| # | Tarea | Detalle |
|---|---|---|
| 3.1 | `src/lib/supabase/client.ts` + `server.ts` | Cliente browser (anon key) y server (service key) — patrón estándar App Router |
| 3.2 | Generar tipos: `pnpm supabase gen types typescript --local > src/lib/database.types.ts` | Script en `package.json`: `"db:types"` |
| 3.3 | Función de trust score | `src/lib/trust-score.ts`: lee señales (certs vigentes, OTIF de `entregas`, registro Jujuy, antigüedad CUIT) → puntaje 0–100 con desglose JSONB. Job one-shot en seed + recálculo al cambiar datos |
| 3.4 | Reemplazar mocks | Crear mocks en `src/data/` primero con la forma exacta de las tablas (puente), luego queries reales |
| 3.5 | `/` dashboard | `stock_minera` bajo punto de reorden → alerta; cola de `consultas` |
| 3.6 | `/proveedores` | Vista `proveedores_explorer`, filtros por categoría/provincia/estado, mapa (opcional, lat/lng ya están) |
| 3.7 | `/proveedores/[id]` | Ficha: ofertas, certificaciones con estado y vencimiento, desglose de trust score, historial de entregas |
| 3.8 | Loop del agente | Al consultar: candidatos por `ofertas_insumo` del insumo → filtro `cumple_requisitos()` → ranking por precio/lead_time/trust_score → `recomendaciones` con `justificacion` generada |

### Fase 4 — Verificación y demo

- `pnpm build && pnpm lint` limpio
- Recorrido del demo (README §"Flujo del demo") end-to-end contra la DB local
- `pnpm supabase db reset` + `seed.sql` reproduce el escenario completo
- README actualizado con `pnpm supabase start` en instrucciones de desarrollo

### Decisiones tomadas

1. **Schema completo** — incluye `auditorias`, `trust_score_historial` y
   `documentos`/Storage. Refuerza la narrativa "evidencia verificable" y el
   costo extra es bajo.
2. **Datos CAPMIN vía script de scraping** — `scripts/scrape-capmin.ts` →
   CSV en `supabase/seed-data/` → `seed.sql`. Reproducible.
3. **Sin postgis** — el mapa muestra marcadores y filtra por provincia;
   no hay filtro por distancia.
4. **RLS desde el inicio** — policies reales desde el día 1: lectura anon
   solo de proveedores `homologado`/`validado` (la "red verificada"), todo lo
   demás por service role. El estado del proveedor pasa a ser también un
   mecanismo de seguridad, no solo una etiqueta.
