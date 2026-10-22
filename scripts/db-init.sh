#!/bin/sh
# Init de la base de la Opción B (docker-compose.yml). Corre una sola vez,
# en el primer arranque del volumen, después del migrate.sh interno de la
# imagen supabase/postgres (alfabético: zz-* va último en initdb.d).
#
# Aplica, en orden:
#   1. supabase/migrations/*.sql   (schema versionado)
#   2. supabase/seed.sql + seed-data/*.sql  (mismo orden que
#      supabase/config.toml → [db.seed] sql_paths)
#
# Como supabase_admin (superuser) porque algunas migraciones pisan el
# usuario postgres (demote) o tocan schemas internos (auth, storage).
set -e

# La imagen trae el schema auth/storage que sale de sus init-scripts; el
# resto lo migran los servicios (GoTrue, Storage-API) al arrancar — y acá no
# hay servicios. Se completa a mano lo que las migraciones y el seed esperan:
#   - storage.buckets/objects: los crea la Storage-API (migración 09).
#   - auth.users.email_confirmed_at/email_change_token_new y auth.identities:
#     los agregan las migraciones de GoTrue (seed.sql, sección usuarios).
psql -v ON_ERROR_STOP=1 --no-psqlrc -U supabase_admin -d "$POSTGRES_DB" <<'SQL'
alter table auth.users add column if not exists email_confirmed_at timestamptz;
alter table auth.users add column if not exists email_change_token_new varchar(255) default '';
create table if not exists auth.identities (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid not null references auth.users(id) on delete cascade,
  provider_id     text not null,
  identity_data   jsonb not null,
  provider        text not null,
  last_sign_in_at timestamptz,
  created_at      timestamptz,
  updated_at      timestamptz
);
create table if not exists storage.buckets (
  id         text primary key,
  name       text not null unique,
  public     boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists storage.objects (
  id         uuid primary key default gen_random_uuid(),
  bucket_id  text not null references storage.buckets(id) on delete cascade,
  name       text,
  owner      uuid,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table storage.objects enable row level security;
SQL

for f in /ju-min/migrations/*.sql; do
  echo "ju-min init: $f"
  psql -v ON_ERROR_STOP=1 --no-psqlrc -U supabase_admin -d "$POSTGRES_DB" -f "$f"
done

for f in /ju-min/seed.sql /ju-min/seed-data/*.sql; do
  echo "ju-min init: $f"
  psql -v ON_ERROR_STOP=1 --no-psqlrc -U supabase_admin -d "$POSTGRES_DB" -f "$f"
done
