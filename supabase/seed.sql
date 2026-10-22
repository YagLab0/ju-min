-- ============================================================================
-- seed.sql — pobla la BD local con datos de demo (docs/plan-implementacion.md — Fase 2)
-- Corre automáticamente con `pnpm supabase db reset` o `pnpm supabase start`.
-- Proveedores marcados fuente='capmin' son reales del directorio CAPMIN;
-- los 'manual' son sintéticos para cubrir categorías sin datos públicos.
-- ============================================================================

-- ============================ CERTIFICACIONES ================================
-- Catálogo de normas (docs/investigacion-proveedores.md §1.3 y §1.4)

insert into certificaciones (nombre, codigo, tipo, ambito, organismo_tipico, descripcion) values
  -- Sistema de gestión (empresa)
  ('Sistema de Gestión de Calidad ISO 9001:2015', 'ISO 9001', 'sistema_gestion', 'empresa', 'IRAM / DNV / Bureau Veritas', 'Trío base de homologación — casi siempre obligatorio'),
  ('Sistema de Gestión Ambiental ISO 14001:2015', 'ISO 14001', 'sistema_gestion', 'empresa', 'IRAM / DNV / SGS', 'Gestión ambiental, manejo de residuos'),
  ('Seguridad y Salud Ocupacional ISO 45001:2018', 'ISO 45001', 'sistema_gestion', 'empresa', 'IRAM / Bureau Veritas', 'Ex OHSAS 18001 — seguridad del personal'),
  ('Gestión de la Energía ISO 50001', 'ISO 50001', 'sistema_gestion', 'empresa', 'DNV', 'Cada vez más exigida por criterio ESG'),
  ('Sistemas Antisoborno ISO 37001', 'ISO 37001', 'sistema_gestion', 'empresa', 'DNV / SGS', 'Compliance — mineras grandes'),
  ('Seguridad de la Información ISO 27001', 'ISO 27001', 'sistema_gestion', 'empresa', 'Bureau Veritas', 'Proveedores de software/IT'),
  ('Seguridad Vial ISO 39001', 'ISO 39001', 'sistema_gestion', 'empresa', 'IRAM', 'Transporte y logística'),
  ('Laboratorios de ensayo ISO/IEC 17025', 'ISO 17025', 'sistema_gestion', 'proceso', 'OAA / ANAB', 'Acreditación de laboratorios de ensayo y calibración'),

  -- Producto
  ('Certificación de producto EPP IRAM/EN', 'IRAM-EPP', 'producto', 'producto', 'IRAM', 'EPP certificado según normas IRAM o EN (marcado CE)'),
  ('Respiradores NIOSH', 'NIOSH-42CFR84', 'producto', 'producto', 'NIOSH', 'Aprobación de respiradores/purificadores de aire'),
  ('Ropa ignífuga NFPA 2112', 'NFPA 2112', 'producto', 'producto', 'UL / laboratorio acreditado', 'Prendas resistentes a fuego repentino'),
  ('Certificado de material EN 10204 3.1', 'EN 10204-3.1', 'producto', 'producto', 'Laboratorio metalúrgico', 'Trazabilidad del acero — medios de molienda, estructuras'),
  ('Atmósferas explosivas IECEx', 'IECEx', 'producto', 'producto', 'IECEx / UL', 'Equipos eléctricos para zonas con atmósfera explosiva'),
  ('Geomembranas HDPE GRI-GM13', 'GRI-GM13', 'producto', 'producto', 'GSI / laboratorio geosintéticos', 'Spec estándar para pilas de lixiviación y relaves'),
  ('Fichas de seguridad GHS/CLP + SDS', 'GHS-SDS', 'producto', 'producto', 'Fabricante', 'Hoja de datos de seguridad normalizada para químicos'),
  ('International Cyanide Management Code', 'ICMC', 'producto', 'proceso', 'ICMI', 'Obligatorio para producción/transporte de cianuro'),
  ('Recipientes a presión ASME VIII', 'ASME VIII', 'producto', 'producto', 'Inspector autorizado ASME', 'Calderas, estanques, piping B31'),

  -- Habilitaciones regulatorias
  ('Habilitación ANMaC/RENAR para explosivos', 'ANMAC-EXP', 'habilitacion_regulatoria', 'empresa', 'ANMaC', 'Fabricación, almacenamiento y comercio de explosivos'),
  ('Transporte de mercancías peligrosas', 'TMD', 'habilitacion_regulatoria', 'empresa', 'CNRT', 'Habilitación de transporte de carga peligrosa'),
  ('Registro Provincial de Proveedores Mineros de Jujuy', 'REG-JUJUY', 'registro', 'empresa', 'Gobierno de Jujuy', 'Decreto 290-DEyP-24 — registro oficial provincial'),

  -- ESG
  ('Huella de carbono ISO 14064', 'ISO 14064', 'esg', 'empresa', 'DNV / SGS', 'Inventario de gases de efecto invernadero'),
  ('Reporte de sostenibilidad GRI', 'GRI', 'esg', 'empresa', 'Auto-reportado / verificado', 'Memoria de sostenibilidad bajo estándares GRI'),
  ('Copper Mark', 'COPPER-MARK', 'esg', 'empresa', 'The Copper Mark', 'Marco de producción responsable de cobre'),
  ('Exámenes ocupacionales de altura geográfica', 'ALT-GEO', 'habilitacion_regulatoria', 'persona', 'Servicio médico laboral', 'Aptitud del personal para faenas +3.500 msnm');

-- ============================ CATEGORÍAS =====================================
-- Subset de las ~180 categorías reales de CAPMIN (docs/investigacion-proveedores.md §2)

insert into categorias (nombre, slug, origen) values
  ('Elementos Protección Personal',       'epp',                    'capmin'),
  ('Lubricantes y Selladores',            'lubricantes',            'capmin'),
  ('Explosivos',                          'explosivos',             'capmin'),
  ('Fabricante de Explosivos',            'fabricante-explosivos',  'capmin'),
  ('Bolas de Molino',                     'bolas-molino',           'capmin'),
  ('Molienda',                            'molienda',               'capmin'),
  ('Filtros',                             'filtros',                'capmin'),
  ('Bombas',                              'bombas',                 'capmin'),
  ('Válvulas',                            'valvulas',               'capmin'),
  ('Geomembranas',                        'geomembranas',           'capmin'),
  ('Geosintéticos',                       'geosinteticos',          'capmin'),
  ('Estructuras Metálicas',               'estructuras-metalicas',  'capmin'),
  ('Metalmecánica',                       'metalmecanica',          'capmin'),
  ('Transporte',                          'transporte',             'capmin'),
  ('Transporte de cargas pesadas',        'transporte-pesado',      'capmin'),
  ('Higiene y seguridad en el trabajo',   'higiene-seguridad',      'capmin'),
  ('Ferretería Industrial',               'ferreteria-industrial',  'capmin'),
  ('Repuestos maquinarias',               'repuestos-maquinarias',  'capmin'),
  ('Combustibles',                        'combustibles',           'capmin'),
  ('Informática',                         'informatica',            'capmin'),
  ('Capacitaciones',                      'capacitaciones',         'capmin'),
  ('Construcciones',                      'construcciones',         'capmin'),
  ('Ingeniería',                          'ingenieria',             'capmin'),
  ('Servicios Mineros',                   'servicios-mineros',      'capmin'),
  ('Laboratorio de análisis ambientales y ocupacionales', 'laboratorio-ambiental', 'capmin'),
  ('Motores y generadores',               'motores-generadores',    'capmin'),
  ('Mangueras',                           'mangueras',              'capmin'),
  ('Industria química',                   'industria-quimica',      'caem'),
  ('big bag',                             'big-bag',                'capmin'),
  ('Infraestructura eléctrica',           'infraestructura-electrica','capmin'),
  ('CCTV',                                'cctv',                   'capmin'),
  ('Telecomunicaciones',                  'telecomunicaciones',     'capmin'),
  ('Consultoría',                         'consultoria',            'capmin'),
  ('RRHH',                                'rrhh',                   'capmin'),
  ('Obras y Servicios',                   'obras-servicios',        'capmin'),
  ('Alquiler y venta de baños y módulos portátiles', 'modulos-portatiles', 'capmin'),
  ('Servicios operativos',                'servicios-operativos',   'capmin');

-- ============================ REQUISITOS POR CATEGORÍA =======================
-- Regla de homologación (docs/modelo-clasificacion.md §3.3): certificaciones obligatorias/optativas

insert into requisitos_categoria (categoria_id, certificacion_id, obligatorio)
select c.id, cert.id, req.obligatorio
from (values
  -- categoría, código certificación, obligatorio?
  ('epp',                       'ISO 9001',      true),
  ('epp',                       'IRAM-EPP',      true),
  ('epp',                       'NIOSH-42CFR84', false),
  ('epp',                       'NFPA 2112',     false),
  ('lubricantes',               'ISO 9001',      true),
  ('lubricantes',               'GHS-SDS',       true),
  ('lubricantes',               'ISO 14001',     false),
  ('explosivos',                'ANMAC-EXP',     true),
  ('explosivos',                'TMD',           true),
  ('explosivos',                'ISO 9001',      true),
  ('fabricante-explosivos',     'ANMAC-EXP',     true),
  ('fabricante-explosivos',     'ISO 9001',      true),
  ('fabricante-explosivos',     'ISO 14001',     false),
  ('bolas-molino',              'ISO 9001',      true),
  ('bolas-molino',              'EN 10204-3.1',  true),
  ('molienda',                  'ISO 9001',      true),
  ('molienda',                  'EN 10204-3.1',  false),
  ('geomembranas',              'GRI-GM13',      true),
  ('geomembranas',              'ISO 9001',      true),
  ('geosinteticos',             'GRI-GM13',      false),
  ('geosinteticos',             'ISO 9001',      true),
  ('bombas',                    'ISO 9001',      true),
  ('valvulas',                  'ISO 9001',      true),
  ('valvulas',                  'ASME VIII',     false),
  ('estructuras-metalicas',     'ISO 9001',      true),
  ('estructuras-metalicas',     'EN 10204-3.1',  true),
  ('metalmecanica',             'ISO 9001',      true),
  ('transporte',                'ISO 39001',     false),
  ('transporte',                'ISO 9001',      false),
  ('transporte-pesado',         'ISO 39001',     true),
  ('transporte-pesado',         'TMD',           false),
  ('higiene-seguridad',         'ISO 45001',     true),
  ('laboratorio-ambiental',     'ISO 17025',     true),
  ('laboratorio-ambiental',     'ISO 14001',     false),
  ('servicios-mineros',         'ISO 9001',      true),
  ('servicios-mineros',         'ISO 14001',     true),
  ('servicios-mineros',         'ISO 45001',     true),
  ('servicios-mineros',         'ALT-GEO',       false),
  ('informatica',               'ISO 27001',     false),
  ('informatica',               'ISO 9001',      false),
  ('infraestructura-electrica', 'ISO 9001',      true),
  ('infraestructura-electrica', 'IECEx',         false),
  ('motores-generadores',       'ISO 9001',      true),
  ('motores-generadores',       'IECEx',         false),
  ('filtros',                   'ISO 9001',      true),
  ('repuestos-maquinarias',     'ISO 9001',      false),
  ('ferreteria-industrial',     'ISO 9001',      false),
  ('industria-quimica',         'GHS-SDS',       true),
  ('industria-quimica',         'ISO 14001',     true),
  ('industria-quimica',         'ICMC',          false),
  ('combustibles',              'ISO 9001',      true),
  ('combustibles',              'TMD',           true),
  ('construcciones',            'ISO 9001',      false),
  ('ingenieria',                'ISO 9001',      false),
  ('capacitaciones',            'ISO 45001',     false),
  ('big-bag',                   'ISO 9001',      false),
  ('cctv',                      'ISO 9001',      false),
  ('telecomunicaciones',        'ISO 9001',      false)
) as req(cat_slug, cert_codigo, obligatorio)
join categorias c on c.slug = req.cat_slug
join certificaciones cert on cert.codigo = req.cert_codigo;

-- ============================ PROVEEDORES ====================================
-- fuente='capmin': datos reales del directorio CAPMIN (nombre, dirección, web,
-- categorías). CUITs y resto son sintéticos plausibles.

insert into proveedores
  (razon_social, cuit, condicion_iva, fecha_constitucion, domicilio, localidad,
   provincia, lat, lng, sitio_web, provincias_operacion, estado,
   registro_jujuy_estado, fuente, fuente_url) values
  -- ---- CAPMIN reales ----
  ('ACERIAS 4C SA', '30-70892544-1', 'responsable_inscripto', '1994-06-02',
   'Juan Domingo Perón N°465, Area Industrial', 'Las Parejas', 'Santa Fe',
   -32.4766, -61.5242, 'https://www.acerias4c.com.ar', '{Santa Fe,Córdoba,San Juan,Jujuy,Salta}',
   'homologado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('AUSTIN POWDER', '30-50371268-7', 'responsable_inscripto', '1978-11-20',
   'Luis Maggi 770', 'Rafaela', 'Santa Fe',
   -31.2526, -61.4924, 'https://www.austinpowder.com', '{Santa Fe,San Juan,Jujuy,Salta,Catamarca}',
   'homologado', 'aprobado', 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('BAC DALL ARGENTINA SA', '30-68549123-5', 'responsable_inscripto', '1988-04-11',
   'Coronel Esteban Bonorino 1236', 'CABA', 'CABA',
   -34.6331, -58.4468, 'https://www.bac-dall.com.ar', '{CABA,Buenos Aires,Jujuy,Salta,Santa Cruz}',
   'homologado', 'aprobado', 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('ANDREANI LOGÍSTICA SA', '30-51126789-3', 'responsable_inscripto', '1945-02-08',
   'Av. Pte. Perón 4749, Benavidez', 'Tigre', 'Buenos Aires',
   -34.4167, -58.6947, 'https://www.andreani.com', '{Buenos Aires,CABA,Córdoba,Mendoza,Salta,Jujuy}',
   'validado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('3D ELECTRO SAN JUAN', '20-35128967-4', 'responsable_inscripto', '2011-09-14',
   'Barrio La Superiora, Sector 1', 'Rawson', 'San Juan',
   -31.5831, -68.5386, 'https://3delectrosanjuan.com', '{San Juan,Mendoza,La Rioja}',
   'validado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('BMI SA', '30-70712398-2', 'responsable_inscripto', '1997-07-30',
   'Av. Juventud 11', 'Salta', 'Salta',
   -24.7893, -65.4106, 'https://www.bmi.com.ar', '{Salta,Jujuy,Tucumán,Catamarca}',
   'validado', 'pendiente', 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('ANDEMIRA SA', '30-61234455-8', 'responsable_inscripto', '1982-03-19',
   'Av. Leandro N. Alem 690 Piso 8', 'CABA', 'CABA',
   -34.6012, -58.3697, 'https://www.andemira.com.ar', '{CABA,San Juan,Jujuy,Salta,Catamarca}',
   'auditado', 'aprobado', 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('AVINCO CONSTRUCCIONES S.A.', '30-99887766-1', 'responsable_inscripto', '2005-05-05',
   'Santo Domingo 2373', 'CABA', 'CABA',
   -34.6079, -58.4022, 'http://www.avinco.com.ar', '{CABA,Buenos Aires}',
   'registrado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('BRALBOL SA', '30-69881234-9', 'responsable_inscripto', '1992-10-01',
   'Blvd. Drago 1065', 'Pergamino', 'Buenos Aires',
   -33.8940, -60.5736, 'https://www.bralbol.com.ar', '{Buenos Aires,Santa Fe,Córdoba}',
   'documentado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('ALPARDATA SAS', '30-71634521-6', 'responsable_inscripto', '2016-01-22',
   'Comodoro Rivadavia 1575, Dorrego', 'Mendoza', 'Mendoza',
   -32.8894, -68.8458, 'https://www.alpardata.com.ar/mining', '{Mendoza,San Juan,Neuquén}',
   'validado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('ACONCAGUA SERVICIOS MINEROS SRL', '30-70445566-3', 'responsable_inscripto', '2008-12-03',
   'Av. Rawson 811 Norte', 'San Juan', 'San Juan',
   -31.5310, -68.5250, 'https://www.aconcagua-trans.com.ar', '{San Juan,La Rioja,Mendoza}',
   'registrado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('9AMAS', '30-71889900-7', 'responsable_inscripto', '2018-04-17',
   'Cerro San Martín 250', 'Salta', 'Salta',
   -24.8000, -65.4200, 'https://www.9amas.com', '{Salta,Jujuy,Tucumán}',
   'validado', 'pendiente', 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('ASG CONSULTORA', '30-69912345-4', 'responsable_inscripto', '2003-08-27',
   'Lavalleja 1870', 'Córdoba', 'Córdoba',
   -31.4201, -64.1888, 'https://asgconsultora.com', '{Córdoba,San Juan,Mendoza,Salta}',
   'validado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),
  ('BAYTON SA', '30-65223344-0', 'responsable_inscripto', '1985-06-15',
   'Monseñor Larrumbe 3234', 'Martínez', 'Buenos Aires',
   -34.4887, -58.5051, 'https://www.bayton.com', '{Buenos Aires,CABA}',
   'documentado', null, 'capmin', 'https://www.capmin.com.ar/directorio-proveedores-mineros/'),

  -- ---- Sintéticos (fuente='manual') para categorías sin proveedor real en el fetch ----
  ('LUBRIANDES SA', '30-71662288-2', 'responsable_inscripto', '2001-02-12',
   'Ruta 9 Km 12, Parque Industrial', 'Córdoba', 'Córdoba',
   -31.3950, -64.2100, null, '{Córdoba,San Juan,Mendoza,Jujuy,Salta}',
   'homologado', null, 'manual', null),
  ('FILTROPUNA SRL', '30-71773344-8', 'responsable_inscripto', '2014-05-30',
   'Av. Ex Combatientes 1450', 'San Salvador de Jujuy', 'Jujuy',
   -24.1858, -65.2995, null, '{Jujuy,Salta,Tucumán}',
   'homologado', 'aprobado', 'manual', null),
  ('GEOMEMBRANAS DEL NOA SA', '30-71001122-9', 'responsable_inscripto', '2009-09-09',
   'Parque Industrial Lote 14', 'Salta', 'Salta',
   -24.8450, -65.4380, null, '{Salta,Jujuy,Catamarca,San Juan}',
   'homologado', 'aprobado', 'manual', null),
  ('QUIMIPLANT SRL', '30-70998877-6', 'responsable_inscripto', '2010-11-11',
   'Carril Rodríguez Peña 3200', 'Guaymallén', 'Mendoza',
   -32.9150, -68.7850, null, '{Mendoza,San Juan,San Luis}',
   'validado', null, 'manual', null),
  ('SEGURIDAD PUNA SRL', '30-71775566-1', 'responsable_inscripto', '2019-03-21',
   'Av. Senador Pérez 950', 'San Salvador de Jujuy', 'Jujuy',
   -24.1790, -65.2910, null, '{Jujuy,Salta}',
   'homologado', 'aprobado', 'manual', null),
  ('TRANSANDINA LOGÍSTICA SA', '30-71335577-5', 'responsable_inscripto', '2006-07-19',
   'Ruta Nacional 34 Km 1498', 'General Güemes', 'Salta',
   -24.6720, -65.0440, null, '{Salta,Jujuy,Tucumán,Formosa}',
   'homologado', 'aprobado', 'manual', null);

-- ---- proveedor ↔ categorías ----

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id from proveedores p, categorias c where
  (p.razon_social = 'ACERIAS 4C SA'                and c.slug in ('bolas-molino','molienda')) or
  (p.razon_social = 'AUSTIN POWDER'                and c.slug in ('fabricante-explosivos','explosivos')) or
  (p.razon_social = 'BAC DALL ARGENTINA SA'        and c.slug in ('epp')) or
  (p.razon_social = 'ANDREANI LOGÍSTICA SA'        and c.slug in ('transporte','transporte-pesado')) or
  (p.razon_social = '3D ELECTRO SAN JUAN'          and c.slug in ('cctv','infraestructura-electrica','telecomunicaciones')) or
  (p.razon_social = 'BMI SA'                       and c.slug in ('construcciones','servicios-mineros','obras-servicios')) or
  (p.razon_social = 'ANDEMIRA SA'                  and c.slug in ('servicios-mineros')) or
  (p.razon_social = 'AVINCO CONSTRUCCIONES S.A.'   and c.slug in ('construcciones','ingenieria')) or
  (p.razon_social = 'BRALBOL SA'                   and c.slug in ('big-bag')) or
  (p.razon_social = 'ALPARDATA SAS'                and c.slug in ('informatica')) or
  (p.razon_social = 'ACONCAGUA SERVICIOS MINEROS SRL' and c.slug in ('servicios-mineros','transporte')) or
  (p.razon_social = '9AMAS'                        and c.slug in ('capacitaciones')) or
  (p.razon_social = 'ASG CONSULTORA'               and c.slug in ('consultoria','higiene-seguridad')) or
  (p.razon_social = 'BAYTON SA'                    and c.slug in ('servicios-operativos')) or
  (p.razon_social = 'LUBRIANDES SA'                and c.slug in ('lubricantes','combustibles')) or
  (p.razon_social = 'FILTROPUNA SRL'               and c.slug in ('filtros','repuestos-maquinarias','ferreteria-industrial')) or
  (p.razon_social = 'GEOMEMBRANAS DEL NOA SA'      and c.slug in ('geomembranas','geosinteticos')) or
  (p.razon_social = 'QUIMIPLANT SRL'               and c.slug in ('industria-quimica','laboratorio-ambiental')) or
  (p.razon_social = 'SEGURIDAD PUNA SRL'           and c.slug in ('higiene-seguridad','epp')) or
  (p.razon_social = 'TRANSANDINA LOGÍSTICA SA'     and c.slug in ('transporte-pesado','transporte'));

-- ---- contactos ----

insert into contactos_proveedor (proveedor_id, nombre, rol, email, telefono)
select p.id, c.nombre, c.rol, c.email, c.telefono
from proveedores p
join (values
  ('ACERIAS 4C SA',         'Mariana Sosa',      'Comercial',        'ventas@acerias4c.com.ar',        '+54 3471 45-2210'),
  ('AUSTIN POWDER',         'Pablo Ferreyra',    'Cuentas Mining',   'pferreyra@austinpowder.com',     '+54 3492 42-8800'),
  ('BAC DALL ARGENTINA SA', 'Laura Bianchi',     'Ventas B2B',       'lbianchi@bac-dall.com.ar',       '+54 11 4554-3300'),
  ('ANDREANI LOGÍSTICA SA', 'Diego Morales',     'Logística Minería','dmorales@andreani.com',          '+54 11 4865-1200'),
  ('FILTROPUNA SRL',        'Sandra Quispe',     'Dueña / Comercial','ventas@filtropuna.com.ar',       '+54 388 425-9912'),
  ('GEOMEMBRANAS DEL NOA SA','Martín Arias',     'Director Técnico', 'marias@geonoa.com.ar',           '+54 387 432-7710'),
  ('SEGURIDAD PUNA SRL',    'Verónica Tolaba',   'Gerente',          'vtolaba@seguridadpuna.com.ar',   '+54 388 422-1145'),
  ('TRANSANDINA LOGÍSTICA SA','Héctor Luna',     'Operaciones',      'hluna@transandina.com.ar',       '+54 387 491-2200'),
  ('LUBRIANDES SA',         'Federico Ríos',     'Ventas Industria', 'frios@lubriandes.com.ar',        '+54 351 488-7755')
) as c(prov, nombre, rol, email, telefono) on p.razon_social = c.prov;

-- ---- documentos de evidencia (paths ficticios en bucket 'documentos') ----

insert into documentos (proveedor_id, tipo, storage_path, nombre_archivo)
select p.id, 'certificado', p.id || '/iso-9001.pdf', 'iso-9001.pdf'
from proveedores p where p.estado in ('validado','auditado','homologado');

-- ============================ PROVEEDOR_CERTIFICACIONES ======================

-- ISO 9001 verificado para la mayoría de la red verificada
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, numero_certificado, organismo, fecha_emision, fecha_vencimiento, estado)
select p.id, c.id, 'AR-9001-' || (row_number() over ()) * 137 + 1000, 'IRAM',
       date '2024-03-15', date '2027-03-15', 'verificado'
from proveedores p cross join certificaciones c
where c.codigo = 'ISO 9001'
  and p.razon_social in
    ('ACERIAS 4C SA','AUSTIN POWDER','BAC DALL ARGENTINA SA','ANDREANI LOGÍSTICA SA',
     '3D ELECTRO SAN JUAN','BMI SA','ANDEMIRA SA','9AMAS','ASG CONSULTORA',
     'LUBRIANDES SA','FILTROPUNA SRL','GEOMEMBRANAS DEL NOA SA','QUIMIPLANT SRL',
     'SEGURIDAD PUNA SRL','TRANSANDINA LOGÍSTICA SA');

-- Trío HSE (14001+45001) para los homologados/auditados
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, numero_certificado, organismo, fecha_emision, fecha_vencimiento, estado)
select p.id, c.id, 'AR-' || replace(c.codigo,' ','') || '-' || (row_number() over ()) * 211 + 500,
       'Bureau Veritas', date '2024-06-01', date '2027-06-01', 'verificado'
from proveedores p cross join certificaciones c
where c.codigo in ('ISO 14001','ISO 45001')
  and p.razon_social in
    ('AUSTIN POWDER','BAC DALL ARGENTINA SA','ANDEMIRA SA','LUBRIANDES SA',
     'GEOMEMBRANAS DEL NOA SA','SEGURIDAD PUNA SRL','TRANSANDINA LOGÍSTICA SA','BMI SA','ANDREANI LOGÍSTICA SA');

-- Certificaciones de producto / habilitaciones específicas por proveedor
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, numero_certificado, organismo, fecha_emision, fecha_vencimiento, estado)
select p.id, c.id, pc.num, pc.org, pc.emision::date, pc.vence::date, pc.estado::estado_verificacion
from (values
  ('AUSTIN POWDER',         'ANMAC-EXP',    'RENAR-EXP-0412', 'ANMaC',                '2023-08-10', '2027-08-10', 'verificado'),
  ('AUSTIN POWDER',         'TMD',          'CNRT-TMD-88213', 'CNRT',                 '2024-01-20', '2027-01-20', 'verificado'),
  ('AUSTIN POWDER',         'ALT-GEO',      'ALT-0933',       'Servicio Médico NOA',  '2025-05-12', '2027-05-12', 'verificado'),
  ('BAC DALL ARGENTINA SA', 'IRAM-EPP',     'IRAM-3620-114',  'IRAM',                 '2024-02-01', '2027-02-01', 'verificado'),
  ('BAC DALL ARGENTINA SA', 'NIOSH-42CFR84','TC-84A-9321',    'NIOSH',                '2023-11-01', null,         'verificado'),
  ('ACERIAS 4C SA',         'EN 10204-3.1', 'EN4C-2025-0788', 'Lab. Metalúrgico 4C',  '2025-04-22', null,         'verificado'),
  ('GEOMEMBRANAS DEL NOA SA','GRI-GM13',    'GRI-GM13-AR-017','GSI Labs',             '2025-01-30', '2027-01-30', 'verificado'),
  ('SEGURIDAD PUNA SRL',    'IRAM-EPP',     'IRAM-3620-287',  'IRAM',                 '2024-09-15', '2027-09-15', 'verificado'),
  ('SEGURIDAD PUNA SRL',    'ALT-GEO',      'ALT-2210',       'Servicio Médico NOA',  '2025-06-02', '2027-06-02', 'verificado'),
  ('LUBRIANDES SA',         'GHS-SDS',      'SDS-LUB-2025',   'Lubriandes',           '2025-03-01', null,         'verificado'),
  ('LUBRIANDES SA',         'TMD',          'CNRT-TMD-91204', 'CNRT',                 '2024-10-10', '2027-10-10', 'verificado'),
  ('QUIMIPLANT SRL',        'GHS-SDS',      'SDS-QP-2025',    'Quimiplant',           '2025-02-14', null,         'verificado'),
  ('QUIMIPLANT SRL',        'ISO 17025',    'OAA-LE-4412',    'OAA',                  '2024-05-20', '2028-05-20', 'verificado'),
  ('TRANSANDINA LOGÍSTICA SA','ISO 39001',  'IRAM-39001-031', 'IRAM',                 '2024-04-05', '2027-04-05', 'verificado'),
  ('TRANSANDINA LOGÍSTICA SA','TMD',        'CNRT-TMD-77451', 'CNRT',                 '2023-12-01', '2026-12-01', 'verificado'),
  ('ANDEMIRA SA',           'ALT-GEO',      'ALT-1877',       'Servicio Médico NOA',  '2025-01-15', '2027-01-15', 'verificado'),
  ('ALPARDATA SAS',         'ISO 27001',    'BV-27001-2215',  'Bureau Veritas',       '2024-08-08', '2027-08-08', 'verificado'),
  -- un caso con certificado vencido → debe fallar cumple_requisitos
  ('FILTROPUNA SRL',        'ISO 14001',    'AR-14001-5521',  'IRAM',                 '2021-03-15', '2024-03-15', 'vencido'),
  -- y uno solo declarado (sin verificar todavía)
  ('FILTROPUNA SRL',        'GRI-GM13',     null,             null,                   null,         null,         'declarado'),
  ('9AMAS',                 'ISO 45001',    'AR-45001-2034',  'IRAM',                 '2023-10-10', '2027-10-10', 'verificado'),
  ('BMI SA',                'ISO 14001',    'AR-14001-8102',  'DNV',                  '2023-05-18', '2027-05-18', 'verificado'),
  ('BMI SA',                'ISO 45001',    'AR-45001-8103',  'DNV',                  '2023-05-18', '2027-05-18', 'verificado'),
  ('AUSTIN POWDER',         'ISO 14064',    'DNV-14064-881',  'DNV',                  '2025-02-10', '2027-02-10', 'verificado'),
  ('ANDEMIRA SA',           'ISO 37001',    'BV-37001-0912',  'Bureau Veritas',       '2024-11-02', '2027-11-02', 'verificado')
) as pc(prov, cod, num, org, emision, vence, estado)
join proveedores p on p.razon_social = pc.prov
join certificaciones c on c.codigo = pc.cod;

-- ============================ AUDITORÍAS =====================================

insert into auditorias (proveedor_id, fecha, tipo, auditor, puntaje, resultado)
select p.id, a.fecha::date, a.tipo, a.auditor, a.puntaje, a.resultado
from proveedores p
join (values
  ('ANDEMIRA SA',            '2025-04-12', 'presencial', 'Auditor interno red ju-min', 91.5, 'aprobado'),
  ('AUSTIN POWDER',          '2025-02-20', 'presencial', 'DNV',                         88.0, 'aprobado'),
  ('BAC DALL ARGENTINA SA',  '2025-06-03', 'remota',     'Auditor interno red ju-min',  84.5, 'aprobado'),
  ('BMI SA',                 '2024-11-15', 'presencial', 'Auditor interno red ju-min',  72.0, 'con_observaciones')
) as a(prov, fecha, tipo, auditor, puntaje, resultado) on p.razon_social = a.prov;

-- ============================ INSUMOS Y OFERTAS ==============================

insert into insumos (categoria_id, nombre, unidad, especificacion)
select c.id, i.nombre, i.unidad, i.spec
from (values
  ('bolas-molino',  'Bola de acero forjado para molienda 3"',       'kg',     'Dureza 60-65 HRC, certificado EN 10204 3.1'),
  ('geomembranas',  'Geomembrana HDPE lisa 1.5 mm',                 'm2',     'Cumple GRI-GM13, rollo 7x140 m'),
  ('epp',           'Guante de nitrilo industrial (caja x100)',     'caja',   'Nitrilo 0.28 mm, talle 8-10'),
  ('epp',           'Casco de seguridad con barbiquejo',            'unidad', 'IRAM 3620 / ANSI Z89.1'),
  ('epp',           'Respirador media cara con filtros P100',       'unidad', 'Aprobación NIOSH 42 CFR 84'),
  ('lubricantes',   'Aceite hidráulico ISO 46 (tambor 208 L)',      'tambor', 'Anti-wear, HLP'),
  ('lubricantes',   'Grasa multipropósito litio EP2 (balde 18 kg)', 'balde',  'NLGI 2, drop point 190°C'),
  ('explosivos',    'Emulsión explosiva encartuchada',              'kg',     'Ø 3", para voladura en banco'),
  ('explosivos',    'Detonador electrónico programable',            'unidad', 'Precisión 1 ms'),
  ('filtros',       'Filtro de aire para motor diésel CAT C15',     'unidad', 'Equivalente OEM'),
  ('bombas',        'Bomba centrífuga horizontal 4x3',              'unidad', 'Impulsor cerrado, acero inox'),
  ('big-bag',       'Big bag 1.5 t con liner',                      'unidad', '4 asas, factor seguridad 5:1')
) as i(cat, nombre, unidad, spec)
join categorias c on c.slug = i.cat;

insert into ofertas_insumo (proveedor_id, insumo_id, precio, moneda, lead_time_dias, disponible)
select p.id, i.id, o.precio, 'ARS', o.lead, o.disp
from (values
  ('ACERIAS 4C SA',           'Bola de acero forjado para molienda 3"',      2350.00, 21, true),
  ('GEOMEMBRANAS DEL NOA SA', 'Geomembrana HDPE lisa 1.5 mm',                9800.00, 30, true),
  ('BAC DALL ARGENTINA SA',   'Guante de nitrilo industrial (caja x100)',    18900.00, 7,  true),
  ('SEGURIDAD PUNA SRL',      'Guante de nitrilo industrial (caja x100)',    21500.00, 3,  true),
  ('BAC DALL ARGENTINA SA',   'Casco de seguridad con barbiquejo',           15200.00, 7,  true),
  ('SEGURIDAD PUNA SRL',      'Casco de seguridad con barbiquejo',           13900.00, 5,  true),
  ('BAC DALL ARGENTINA SA',   'Respirador media cara con filtros P100',      42700.00, 10, true),
  ('LUBRIANDES SA',           'Aceite hidráulico ISO 46 (tambor 208 L)',     312000.00,14, true),
  ('LUBRIANDES SA',           'Grasa multipropósito litio EP2 (balde 18 kg)', 98500.00, 14, true),
  ('AUSTIN POWDER',           'Emulsión explosiva encartuchada',             3200.00, 25, true),
  ('AUSTIN POWDER',           'Detonador electrónico programable',           17500.00, 25, true),
  ('FILTROPUNA SRL',          'Filtro de aire para motor diésel CAT C15',    89500.00, 5,  true),
  ('BAYTON SA',               'Bomba centrífuga horizontal 4x3',            1850000.00,45, false),
  ('BRALBOL SA',              'Big bag 1.5 t con liner',                     9200.00, 12, true),
  ('SEGURIDAD PUNA SRL',      'Respirador media cara con filtros P100',      45800.00, 4,  true)
) as o(prov, ins, precio, lead, disp)
join proveedores p on p.razon_social = o.prov
join insumos i on i.nombre = o.ins;

-- ============================ MINERAS Y STOCK ================================

insert into mineras (nombre, ubicacion) values
  ('Sales de Jujuy S.A.', 'Salar de Olaroz, Jujuy (4.000 msnm)'),
  ('Minera Exar S.A.',    'Cauchari-Olaroz, Jujuy (4.000 msnm)');

insert into stock_minera (minera_id, insumo_id, cantidad_actual, punto_reorden, consumo_mensual)
select m.id, i.id, s.actual, s.reorden, s.consumo
from mineras m
cross join (values
  ('Bola de acero forjado para molienda 3"',        8000, 12000, 15000),  -- BAJO REORDEN → alerta
  ('Geomembrana HDPE lisa 1.5 mm',                    500,   400,   200),
  ('Guante de nitrilo industrial (caja x100)',         45,    60,    35),  -- BAJO REORDEN
  ('Casco de seguridad con barbiquejo',                80,    30,    12),
  ('Respirador media cara con filtros P100',           30,    50,    20),  -- BAJO REORDEN
  ('Aceite hidráulico ISO 46 (tambor 208 L)',           3,     2,     2),
  ('Grasa multipropósito litio EP2 (balde 18 kg)',      6,     4,     3),
  ('Filtro de aire para motor diésel CAT C15',         12,    10,     8)
) as s(ins, actual, reorden, consumo)
join insumos i on i.nombre = s.ins
where m.nombre = 'Sales de Jujuy S.A.';

-- ============================ USUARIOS (auth) ================================
-- Usuarios de prueba con login email/password. El trigger handle_new_user()
-- crea su perfil en public.usuarios tomando nombre/rol/minera_id de
-- raw_user_meta_data. Password de todos: "ju-min-demo"

insert into auth.users (
  instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
  raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
  confirmation_token, recovery_token, email_change_token_new, email_change
)
select
  '00000000-0000-0000-0000-000000000000',
  gen_random_uuid(),
  'authenticated', 'authenticated',
  u.email,
  extensions.crypt('ju-min-demo', extensions.gen_salt('bf')),
  now(),
  '{"provider":"email","providers":["email"]}',
  jsonb_build_object('nombre', u.nombre, 'rol', u.rol, 'minera_id', m.id::text),
  now(), now(), '', '', '', ''
from (values
  ('admin@salesdejujuy.ju-min.local',     'Marina Cabrera',  'admin'),
  ('comprador@salesdejujuy.ju-min.local', 'Julián Paredes',  'comprador'),
  ('aprobador@salesdejujuy.ju-min.local', 'Carla Giménez',   'aprobador')
) as u(email, nombre, rol)
join mineras m on m.nombre = 'Sales de Jujuy S.A.';

insert into auth.identities (id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
select gen_random_uuid(), u.id, u.id::text,
       jsonb_build_object('sub', u.id::text, 'email', u.email),
       'email', now(), now(), now()
from auth.users u;

-- ============================ ENTREGAS (OTIF) ================================

insert into entregas (proveedor_id, insumo_id, fecha_compromiso, fecha_entrega, conforme)
select p.id,
       (select id from insumos order by random() limit 1),
       e.compromiso::date, e.entrega::date, e.conforme
from proveedores p
cross join lateral (
  select *
  from (values
    (date '2025-08-04', date '2025-08-03', true),
    (date '2025-09-01', date '2025-09-01', true),
    (date '2025-10-06', date '2025-10-09', true)   -- tarde
  ) v(compromiso, entrega, conforme)
  order by random() limit 2
) e
where p.razon_social in
  ('ACERIAS 4C SA','AUSTIN POWDER','BAC DALL ARGENTINA SA','ANDREANI LOGÍSTICA SA',
   'LUBRIANDES SA','FILTROPUNA SRL','GEOMEMBRANAS DEL NOA SA','SEGURIDAD PUNA SRL',
   'TRANSANDINA LOGÍSTICA SA','QUIMIPLANT SRL','BMI SA','3D ELECTRO SAN JUAN');

-- ============================ CONSULTAS / RECOMENDACIONES ====================

insert into consultas (minera_id, mensaje, respuesta, estado)
select m.id, q.mensaje, q.respuesta, q.estado::estado_consulta
from mineras m
join (values
  ('El stock de bolas de molienda quedó bajo el punto de reorden. ¿Qué sugerís?',
   'Detecté 8.000 kg contra un punto de reorden de 12.000 kg. Recomiendo ACERIAS 4C SA: es el único oferente homologado para "Bolas de Molino" (ISO 9001 + EN 10204 3.1 verificados), lead time 21 días, precio $2.350/kg.',
   'aprobada'),
  ('Necesito reponer guantes de nitrilo, ¿quién conviene?',
   'Hay 2 oferentes homologados: SEGURIDAD PUNA SRL ($21.500/caja, lead time 3 días, Jujuy) y BAC DALL ($18.900/caja, 7 días, CABA). Si la urgencia es alta conviene SEGURIDAD PUNA; si podés esperar, BAC DALL es ~12% más barato.',
   'pendiente')
) as q(mensaje, respuesta, estado) on m.nombre = 'Sales de Jujuy S.A.';

insert into recomendaciones (consulta_id, proveedor_id, insumo_id, justificacion, puntaje)
select c.id, p.id, i.id, r.jus, r.puntaje
from (values
  ('ACERIAS 4C SA',  'Bola de acero forjado para molienda 3"',       'Único homologado en Bolas de Molino; EN 10204 3.1 verificado; trust score alto', 92.0),
  ('SEGURIDAD PUNA SRL','Guante de nitrilo industrial (caja x100)',  'Lead time 3 días, local (Jujuy), registro provincial aprobado',                 88.0),
  ('BAC DALL ARGENTINA SA','Guante de nitrilo industrial (caja x100)','Precio ~12% menor, EPP certificado IRAM/NIOSH verificado',                    90.5)
) as r(prov, ins, jus, puntaje)
join proveedores p on p.razon_social = r.prov
join insumos i on i.nombre = r.ins
join consultas c on
     (c.mensaje ilike '%bolas%'   and r.prov = 'ACERIAS 4C SA')
  or (c.mensaje ilike '%guantes%' and r.prov in ('SEGURIDAD PUNA SRL','BAC DALL ARGENTINA SA'));

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
