-- RLS (decisión DOCS.md §7): lectura anon solo de la "red verificada"
-- (proveedores validado/auditado/homologado y catálogos públicos).
-- Sin policies de escritura → solo service role escribe (bypass RLS).

alter table categorias enable row level security;
alter table certificaciones enable row level security;
alter table requisitos_categoria enable row level security;
alter table proveedores enable row level security;
alter table contactos_proveedor enable row level security;
alter table proveedor_categorias enable row level security;
alter table documentos enable row level security;
alter table proveedor_certificaciones enable row level security;
alter table auditorias enable row level security;
alter table insumos enable row level security;
alter table ofertas_insumo enable row level security;
alter table mineras enable row level security;
alter table stock_minera enable row level security;
alter table consultas enable row level security;
alter table recomendaciones enable row level security;
alter table entregas enable row level security;
alter table trust_score_historial enable row level security;

-- Catálogos: lectura pública
create policy "catalogo_lectura_publica" on categorias
  for select using (true);
create policy "catalogo_lectura_publica" on certificaciones
  for select using (true);
create policy "catalogo_lectura_publica" on requisitos_categoria
  for select using (true);
create policy "catalogo_lectura_publica" on insumos
  for select using (true);
create policy "catalogo_lectura_publica" on ofertas_insumo
  for select using (true);

-- Proveedores: solo la red verificada es visible con la anon key
create policy "proveedores_red_verificada" on proveedores
  for select using (estado in ('validado', 'auditado', 'homologado'));

-- Tablas hijas: visibles si el proveedor padre es visible
create policy "hijo_de_proveedor_visible" on contactos_proveedor
  for select using (
    exists (select 1 from proveedores p
            where p.id = proveedor_id
              and p.estado in ('validado', 'auditado', 'homologado'))
  );
create policy "hijo_de_proveedor_visible" on proveedor_categorias
  for select using (
    exists (select 1 from proveedores p
            where p.id = proveedor_id
              and p.estado in ('validado', 'auditado', 'homologado'))
  );
create policy "hijo_de_proveedor_visible" on proveedor_certificaciones
  for select using (
    exists (select 1 from proveedores p
            where p.id = proveedor_id
              and p.estado in ('validado', 'auditado', 'homologado'))
  );
create policy "hijo_de_proveedor_visible" on auditorias
  for select using (
    exists (select 1 from proveedores p
            where p.id = proveedor_id
              and p.estado in ('validado', 'auditado', 'homologado'))
  );
create policy "hijo_de_proveedor_visible" on entregas
  for select using (
    exists (select 1 from proveedores p
            where p.id = proveedor_id
              and p.estado in ('validado', 'auditado', 'homologado'))
  );
create policy "hijo_de_proveedor_visible" on trust_score_historial
  for select using (
    exists (select 1 from proveedores p
            where p.id = proveedor_id
              and p.estado in ('validado', 'auditado', 'homologado'))
  );

-- documentos (metadata): no se exponen al anon — el archivo se sirve
-- via signed URL generada con service role.
-- mineras, stock_minera, consultas, recomendaciones: sin policy → solo service role.
