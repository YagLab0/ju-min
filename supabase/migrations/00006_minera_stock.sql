-- La minera suscripta y el stock de sus insumos, con punto de reorden
-- y consumo mensual.

create table mineras (
  id        uuid primary key default gen_random_uuid(),
  nombre    text not null,
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
