-- Vista del explorer de proveedores verificados, función de homologación
-- por categoría y trigger de updated_at (DOCS.md §4.4).

create view proveedores_explorer as
select p.id, p.razon_social, p.cuit, p.provincia, p.lat, p.lng,
       p.estado, p.trust_score, p.registro_jujuy_estado,
       array_agg(distinct c.nombre) as categorias,
       count(distinct pc.certificacion_id)
         filter (where pc.estado = 'verificado'
                 and (pc.fecha_vencimiento is null or pc.fecha_vencimiento > now()))
         as certificaciones_vigentes
from proveedores p
left join proveedor_categorias pk on pk.proveedor_id = p.id
left join categorias c on c.id = pk.categoria_id
left join proveedor_certificaciones pc on pc.proveedor_id = p.id
group by p.id;

-- Regla central del agente: un proveedor solo puede recomendarse para un
-- insumo si cumple los requisitos obligatorios de su categoría.
create or replace function cumple_requisitos(p_proveedor uuid, p_categoria uuid)
returns boolean language sql stable as $$
  select not exists (
    select 1
    from requisitos_categoria rc
    where rc.categoria_id = p_categoria and rc.obligatorio
      and not exists (
        select 1 from proveedor_certificaciones pc
        where pc.proveedor_id = p_proveedor
          and pc.certificacion_id = rc.certificacion_id
          and pc.estado = 'verificado'
          and (pc.fecha_vencimiento is null or pc.fecha_vencimiento > current_date)
      )
  );
$$;

create or replace function tocar_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger proveedores_updated_at before update on proveedores
  for each row execute function tocar_updated_at();
create trigger stock_minera_updated_at before update on stock_minera
  for each row execute function tocar_updated_at();
