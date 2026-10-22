-- ============================ TRUST SCORE ====================================
-- Cálculo determinista (docs/modelo-clasificacion.md §3.2): identidad 20 / compliance 30 /
-- desempeño 30 / ESG 10 / capacidad 10 — base 40 + señales.

update proveedores p set
  trust_score = round(least(98, greatest(10,
      30
    + case when p.registro_jujuy_estado = 'aprobado' then 15
           when p.registro_jujuy_estado = 'pendiente' then 5 else 0 end          -- identidad
    + least(24, (select count(*) * 6
                 from proveedor_certificaciones pc
                 where pc.proveedor_id = p.id and pc.estado = 'verificado'
                   and (pc.fecha_vencimiento is null or pc.fecha_vencimiento > current_date))) -- compliance
    - (select count(*) * 8
       from proveedor_certificaciones pc
       where pc.proveedor_id = p.id and pc.estado in ('vencido','rechazado'))     -- penalización
    + round(20 * coalesce((select avg(case when e.a_tiempo then 1.0 else 0.0 end)
                          from entregas e where e.proveedor_id = p.id), 0.5))     -- desempeño OTIF
    + case when p.estado = 'homologado' then 8
           when p.estado = 'auditado'   then 6
           when p.estado = 'validado'   then 4 else 0 end                          -- capacidad/estado
    + case when exists (select 1 from proveedor_certificaciones pc
                        join certificaciones c on c.id = pc.certificacion_id
                        where pc.proveedor_id = p.id and c.tipo = 'esg'
                          and pc.estado = 'verificado') then 8 else 0 end          -- ESG
  ))::numeric, 1),
  trust_score_detalle = jsonb_build_object(
    'identidad',  case when p.registro_jujuy_estado = 'aprobado' then 15
                       when p.registro_jujuy_estado = 'pendiente' then 5 else 0 end,
    'compliance', (select count(*) from proveedor_certificaciones pc
                   where pc.proveedor_id = p.id and pc.estado = 'verificado'),
    'otif',       coalesce((select round(avg(case when e.a_tiempo then 1.0 else 0.0 end), 2)
                            from entregas e where e.proveedor_id = p.id), 0.5),
    'estado',     p.estado
  );

insert into trust_score_historial (proveedor_id, puntaje, detalle)
select id, trust_score, trust_score_detalle from proveedores where trust_score is not null;
