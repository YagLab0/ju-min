-- Informes de recomendación (docs/negocio/business-model-canvas.md
-- §Cuentas, usuarios e informes): el PDF que la minera adjunta a su orden
-- de compra. ju-min no aprueba ni compra; registra cada informe para que un
-- auditor pueda verificarlo por su código.
--
-- `contenido` es una copia fija de los datos al generarlo (proveedor,
-- oferta, alternativas, descartados): el informe no cambia aunque después
-- cambien las ofertas o el trust score. `sello` es el SHA-256 del informe
-- en JSON canónico; si el registro se altera, deja de coincidir.
-- El autor se guarda como copia (id, nombre, email) porque la sesión del
-- demo no usa auth.users.

create table informes (
  id                  uuid primary key default gen_random_uuid(),
  codigo              text not null unique,
  minera_id           uuid not null references mineras(id),
  recomendacion_id    uuid unique references recomendaciones(id) on delete set null,
  generado_por_id     text not null,
  generado_por_nombre text not null,
  generado_por_email  text not null,
  contenido           jsonb not null,
  sello               text not null,
  created_at          timestamptz not null default now()
);

create index informes_minera_idx on informes (minera_id);

-- Sin policies: solo el service role (el servidor de la app) lee y escribe.
-- La verificación pública pasa por la app, que muestra solo lo necesario.
alter table informes enable row level security;
