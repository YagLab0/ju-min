-- Enums del dominio (docs/schema-base-de-datos.md §4.3)

create type estado_proveedor as enum
  ('registrado', 'documentado', 'validado', 'auditado', 'homologado', 'suspendido');

create type estado_verificacion as enum
  ('declarado', 'en_revision', 'verificado', 'rechazado', 'vencido');

create type ambito_certificacion as enum
  ('empresa', 'producto', 'proceso', 'persona');

create type tipo_certificacion as enum
  ('sistema_gestion', 'producto', 'habilitacion_regulatoria', 'esg', 'registro');

create type estado_consulta as enum
  ('pendiente', 'aprobada', 'rechazada');

create type condicion_iva as enum
  ('responsable_inscripto', 'monotributo', 'exento', 'no_responsable', 'desconocido');
