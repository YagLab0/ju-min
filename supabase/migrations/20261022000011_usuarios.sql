-- Usuarios: perfiles de dominio sobre auth.users de Supabase.
-- El login email/password lo maneja GoTrue (auth.users); esta tabla agrega
-- rol, nombre y la minera a la que pertenece el usuario.

create type rol_usuario as enum ('admin', 'comprador', 'aprobador');

create table usuarios (
  id         uuid primary key references auth.users(id) on delete cascade,
  minera_id  uuid references mineras(id),
  nombre     text,
  rol        rol_usuario not null default 'comprador',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger usuarios_updated_at
  before update on usuarios
  for each row execute function set_updated_at();

-- Perfil automático al registrarse: toma nombre/rol/minera_id de
-- raw_user_meta_data (se pueden pasar en supabase.auth.signUp({ options: { data } }))
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.usuarios (id, nombre, rol, minera_id)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'nombre', split_part(new.email, '@', 1)),
    coalesce(new.raw_user_meta_data ->> 'rol', 'comprador')::rol_usuario,
    nullif(new.raw_user_meta_data ->> 'minera_id', '')::uuid
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Helpers para policies (security definer evita recursión RLS sobre usuarios)
create or replace function public.auth_minera_id()
returns uuid
language sql stable security definer
set search_path = public
as $$
  select minera_id from usuarios where id = auth.uid();
$$;

create or replace function public.auth_rol()
returns rol_usuario
language sql stable security definer
set search_path = public
as $$
  select rol from usuarios where id = auth.uid();
$$;

-- ============================ RLS ============================================
-- La anon key sigue viendo solo la "red verificada" (migración 00010).
-- Los usuarios autenticados además ven la data de SU minera.

alter table usuarios enable row level security;

-- Un usuario ve su propio perfil y el de sus compañeros de minera
create policy "usuarios_propios_y_de_minera" on usuarios
  for select using (
    id = auth.uid()
    or minera_id = public.auth_minera_id()
  );

-- Solo puede editar su propio perfil (nombre); rol/minera quedan a cargo del service role
create policy "usuarios_update_propio" on usuarios
  for update using (id = auth.uid())
  with check (id = auth.uid());

-- Minera: visible solo si es la del usuario
create policy "mineras_propia" on mineras
  for select using (id = public.auth_minera_id());

-- Stock: solo de la minera del usuario
create policy "stock_minera_propia" on stock_minera
  for select using (minera_id = public.auth_minera_id());

-- Consultas: leer y crear las de su minera; aprobar/rechazar solo admin/aprobador
create policy "consultas_lectura_minera" on consultas
  for select using (minera_id = public.auth_minera_id());

create policy "consultas_insert_minera" on consultas
  for insert with check (minera_id = public.auth_minera_id());

create policy "consultas_update_aprobadores" on consultas
  for update using (
    minera_id = public.auth_minera_id()
    and public.auth_rol() in ('admin', 'aprobador')
  );

-- Recomendaciones: lectura si la consulta es de su minera
create policy "recomendaciones_lectura_minera" on recomendaciones
  for select using (
    exists (
      select 1 from consultas c
      where c.id = consulta_id
        and c.minera_id = public.auth_minera_id()
    )
  );
