-- Bucket privado para evidencia documental (certificados, seguros, informes)

insert into storage.buckets (id, name, public)
values ('documentos', 'documentos', false)
on conflict (id) do nothing;

-- Lectura: solo service role (el backend genera signed URLs). Escritura: service role.
create policy "documentos_lectura_service"
  on storage.objects for select
  using (bucket_id = 'documentos' and auth.role() = 'service_role');

create policy "documentos_escritura_service"
  on storage.objects for insert
  with check (bucket_id = 'documentos' and auth.role() = 'service_role');
