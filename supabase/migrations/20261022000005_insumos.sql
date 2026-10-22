-- Insumos y ofertas de proveedores (DOCS.md §4.3)

create table insumos (
  id             uuid primary key default gen_random_uuid(),
  categoria_id   uuid not null references categorias(id) on delete cascade,
  nombre         text not null,
  unidad         text not null,
  especificacion text,
  created_at     timestamptz not null default now()
);

create table ofertas_insumo (
  id             uuid primary key default gen_random_uuid(),
  proveedor_id   uuid not null references proveedores(id) on delete cascade,
  insumo_id      uuid not null references insumos(id) on delete cascade,
  precio         numeric(14,2) not null,
  moneda         text not null default 'ARS',
  lead_time_dias int,
  disponible     boolean not null default true,
  vigente_desde  date default current_date,
  vigente_hasta  date,
  created_at     timestamptz not null default now(),
  unique (proveedor_id, insumo_id)
);

create index ofertas_insumo_idx on ofertas_insumo (insumo_id, disponible);
