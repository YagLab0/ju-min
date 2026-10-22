-- Loop del agente: consultas, recomendaciones e historial operativo (docs/schema-base-de-datos.md §4.3)

create table consultas (
  id         uuid primary key default gen_random_uuid(),
  minera_id  uuid references mineras(id),
  mensaje    text not null,
  respuesta  text,
  estado     estado_consulta not null default 'pendiente',
  created_at timestamptz not null default now()
);

create table recomendaciones (
  id            uuid primary key default gen_random_uuid(),
  consulta_id   uuid not null references consultas(id) on delete cascade,
  proveedor_id  uuid references proveedores(id),
  insumo_id     uuid references insumos(id),
  justificacion text,
  puntaje       numeric(5,2),
  created_at    timestamptz not null default now()
);

-- Historial de entregas: alimenta el OTIF del trust score
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

create index entregas_proveedor_idx on entregas (proveedor_id);

create table trust_score_historial (
  id           uuid primary key default gen_random_uuid(),
  proveedor_id uuid not null references proveedores(id) on delete cascade,
  puntaje      numeric(5,2) not null,
  detalle      jsonb,
  created_at   timestamptz not null default now()
);
