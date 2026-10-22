-- RLS desde el inicio: la red verificada (proveedores validado y
-- homologado) es de lectura pública; todo lo demás va por service role.
-- El estado del proveedor es también un mecanismo de seguridad.

alter table proveedores enable row level security;
create policy proveedores_red_verificada on proveedores
  for select to anon
  using (estado in ('validado', 'homologado'));

alter table proveedor_categorias enable row level security;
create policy proveedor_categorias_red on proveedor_categorias
  for select to anon
  using (exists (
    select 1 from proveedores p
    where p.id = proveedor_id and p.estado in ('validado', 'homologado')
  ));

alter table proveedor_certificaciones enable row level security;
create policy proveedor_certificaciones_red on proveedor_certificaciones
  for select to anon
  using (exists (
    select 1 from proveedores p
    where p.id = proveedor_id and p.estado in ('validado', 'homologado')
  ));

alter table ofertas_insumo enable row level security;
create policy ofertas_red on ofertas_insumo
  for select to anon
  using (exists (
    select 1 from proveedores p
    where p.id = proveedor_id and p.estado in ('validado', 'homologado')
  ));

alter table categorias enable row level security;
create policy categorias_lectura on categorias for select to anon using (true);

alter table certificaciones enable row level security;
create policy certificaciones_lectura on certificaciones for select to anon using (true);

alter table insumos enable row level security;
create policy insumos_lectura on insumos for select to anon using (true);

-- Datos internos (stock, consultas, auditorías, entregas, documentos,
-- contactos, historial): solo service role, sin acceso anon.
alter table mineras enable row level security;
alter table stock_minera enable row level security;
alter table consultas enable row level security;
alter table recomendaciones enable row level security;
alter table entregas enable row level security;
alter table trust_score_historial enable row level security;
alter table auditorias enable row level security;
alter table documentos enable row level security;
alter table contactos_proveedor enable row level security;
alter table requisitos_categoria enable row level security;
