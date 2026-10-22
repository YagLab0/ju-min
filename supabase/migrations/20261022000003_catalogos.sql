-- Catálogos: categorías de insumos/servicios, certificaciones y requisitos (DOCS.md §4.3)

create table categorias (
  id               uuid primary key default gen_random_uuid(),
  nombre           text not null unique,
  slug             text not null unique,
  categoria_padre_id uuid references categorias(id),
  origen           text,
  created_at       timestamptz not null default now()
);

create table certificaciones (
  id               uuid primary key default gen_random_uuid(),
  nombre           text not null,
  codigo           text,
  tipo             tipo_certificacion not null,
  ambito           ambito_certificacion not null,
  organismo_tipico text,
  descripcion      text,
  created_at       timestamptz not null default now(),
  unique (codigo, ambito)
);

-- Qué exige cada categoría de insumo (regla de homologación, DOCS.md §3.3)
create table requisitos_categoria (
  id               uuid primary key default gen_random_uuid(),
  categoria_id     uuid not null references categorias(id) on delete cascade,
  certificacion_id uuid not null references certificaciones(id) on delete cascade,
  obligatorio      boolean not null default true,
  unique (categoria_id, certificacion_id)
);
