-- El estado de la recomendación (pendiente → aprobada | rechazada) vive en la
-- propia recomendación, no en la consulta (docs/schema-base-de-datos.md §4.3).
-- Sin esta columna el adaptador no puede insertar ni decidir recomendaciones.

create type estado_recomendacion as enum
  ('pendiente', 'aprobada', 'rechazada');

alter table recomendaciones
  add column estado estado_recomendacion not null default 'pendiente';
