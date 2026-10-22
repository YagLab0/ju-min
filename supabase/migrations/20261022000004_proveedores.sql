-- Proveedores y su evidencia de compliance (DOCS.md §4.3)

create table proveedores (
  id                   uuid primary key default gen_random_uuid(),
  razon_social         text not null,
  nombre_fantasia      text,
  cuit                 text unique,
  condicion_iva        condicion_iva not null default 'desconocido',
  fecha_constitucion   date,
  domicilio            text,
  localidad            text,
  provincia            text,
  pais                 text not null default 'AR',
  lat                  double precision,
  lng                  double precision,
  sitio_web            text,
  email                text,
  telefono             text,
  provincias_operacion text[],
  estado               estado_proveedor not null default 'registrado',
  registro_jujuy_estado text,
  fuente               text not null default 'manual',
  fuente_url           text,
  trust_score          numeric(5,2),
  trust_score_detalle  jsonb,
  created_at           timestamptz not null default now(),
  updated_at           timestamptz not null default now()
);

create index proveedores_razon_social_trgm on proveedores using gin (razon_social gin_trgm_ops);
create index proveedores_estado_idx on proveedores (estado);

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
  id             uuid primary key default gen_random_uuid(),
  proveedor_id   uuid not null references proveedores(id) on delete cascade,
  tipo           text not null,
  storage_path   text not null,
  nombre_archivo text,
  created_at     timestamptz not null default now()
);

-- Instancia: este proveedor tiene esta certificación, con evidencia y vigencia
create table proveedor_certificaciones (
  id                 uuid primary key default gen_random_uuid(),
  proveedor_id       uuid not null references proveedores(id) on delete cascade,
  certificacion_id   uuid not null references certificaciones(id) on delete cascade,
  numero_certificado text,
  organismo          text,
  fecha_emision      date,
  fecha_vencimiento  date,
  alcance            text,
  estado             estado_verificacion not null default 'declarado',
  documento_id       uuid references documentos(id),
  created_at         timestamptz not null default now(),
  unique (proveedor_id, certificacion_id, numero_certificado)
);

create index prov_certs_proveedor_idx on proveedor_certificaciones (proveedor_id);

create table auditorias (
  id                   uuid primary key default gen_random_uuid(),
  proveedor_id         uuid not null references proveedores(id) on delete cascade,
  fecha                date not null,
  tipo                 text,
  auditor              text,
  puntaje              numeric(5,2),
  informe_documento_id uuid references documentos(id),
  resultado            text,
  created_at           timestamptz not null default now()
);
