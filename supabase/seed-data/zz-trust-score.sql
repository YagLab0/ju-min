-- ============================ TRUST SCORE ====================================
-- Cálculo determinista (docs/modelo-clasificacion.md §3.2), solo con datos que
-- ju-min puede verificar: identidad 25 / compliance 45 / ESG 15 / capacidad 15.
-- Sin desempeño: la recepción de la mercadería ocurre en el sistema de la
-- minera y ju-min no ve las entregas (docs/negocio/business-model-canvas.md).

with senales as (
  select
    p.id,
    case when p.registro_jujuy_estado = 'aprobado' then 25
         when p.registro_jujuy_estado = 'pendiente' then 10 else 0 end      as identidad,
    greatest(0, least(45,
        (select count(*) * 9
         from proveedor_certificaciones pc
         where pc.proveedor_id = p.id and pc.estado = 'verificado'
           and (pc.fecha_vencimiento is null or pc.fecha_vencimiento > current_date))
      - (select count(*) * 8
         from proveedor_certificaciones pc
         where pc.proveedor_id = p.id and pc.estado in ('vencido', 'rechazado'))
    ))                                                                       as compliance,
    case when exists (select 1 from proveedor_certificaciones pc
                      join certificaciones c on c.id = pc.certificacion_id
                      where pc.proveedor_id = p.id and c.tipo = 'esg'
                        and pc.estado = 'verificado') then 15 else 0 end    as esg,
    case when p.estado = 'homologado' then 15
         when p.estado = 'auditado'   then 11
         when p.estado = 'validado'   then 8 else 0 end                       as capacidad
  from proveedores p
)
update proveedores p set
  trust_score = s.identidad + s.compliance + s.esg + s.capacidad,
  trust_score_detalle = jsonb_build_object(
    'identidad',  s.identidad,
    'compliance', s.compliance,
    'esg',        s.esg,
    'capacidad',  s.capacidad
  )
from senales s
where s.id = p.id;

insert into trust_score_historial (proveedor_id, puntaje, detalle)
select id, trust_score, trust_score_detalle from proveedores where trust_score is not null;
