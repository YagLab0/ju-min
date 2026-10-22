-- Bucket privado `documentos`: certificados, seguros e informes de
-- auditoría. Se accede con URLs firmadas; escritura solo service role.

insert into storage.buckets (id, name, public)
values ('documentos', 'documentos', false)
on conflict (id) do nothing;

create policy documentos_lectura_autenticada on storage.objects
  for select to authenticated
  using (bucket_id = 'documentos');

create policy documentos_escritura_service on storage.objects
  for insert to service_role
  with check (bucket_id = 'documentos');

create policy documentos_actualizacion_service on storage.objects
  for update to service_role
  using (bucket_id = 'documentos');

create policy documentos_borrado_service on storage.objects
  for delete to service_role
  using (bucket_id = 'documentos');
