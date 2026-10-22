-- Generado por scripts/scrape-capmin.ts — no editar a mano
-- 271 proveedores del directorio CAPMIN

-- Categorías nuevas del directorio (las que no estén ya sembradas)
insert into categorias (nombre, slug, origen)
select 'Abastecimiento', 'abastecimiento', 'capmin'
where not exists (select 1 from categorias where slug = 'abastecimiento' or nombre = 'Abastecimiento');
insert into categorias (nombre, slug, origen)
select 'Accesorios industriales', 'accesorios-industriales', 'capmin'
where not exists (select 1 from categorias where slug = 'accesorios-industriales' or nombre = 'Accesorios industriales');
insert into categorias (nombre, slug, origen)
select 'Aceros inoxidables', 'aceros-inoxidables', 'capmin'
where not exists (select 1 from categorias where slug = 'aceros-inoxidables' or nombre = 'Aceros inoxidables');
insert into categorias (nombre, slug, origen)
select 'agua y geotecnia.', 'agua-y-geotecnia', 'capmin'
where not exists (select 1 from categorias where slug = 'agua-y-geotecnia' or nombre = 'agua y geotecnia.');
insert into categorias (nombre, slug, origen)
select 'Alimentos', 'alimentos', 'capmin'
where not exists (select 1 from categorias where slug = 'alimentos' or nombre = 'Alimentos');
insert into categorias (nombre, slug, origen)
select 'Alquiler de camionetas para minería', 'alquiler-de-camionetas-para-mineria', 'capmin'
where not exists (select 1 from categorias where slug = 'alquiler-de-camionetas-para-mineria' or nombre = 'Alquiler de camionetas para minería');
insert into categorias (nombre, slug, origen)
select 'Alquiler de Equipos', 'alquiler-de-equipos', 'capmin'
where not exists (select 1 from categorias where slug = 'alquiler-de-equipos' or nombre = 'Alquiler de Equipos');
insert into categorias (nombre, slug, origen)
select 'Alquiler de equipos pesados', 'alquiler-de-equipos-pesados', 'capmin'
where not exists (select 1 from categorias where slug = 'alquiler-de-equipos-pesados' or nombre = 'Alquiler de equipos pesados');
insert into categorias (nombre, slug, origen)
select 'Alquiler de Maquinaria', 'alquiler-de-maquinaria', 'capmin'
where not exists (select 1 from categorias where slug = 'alquiler-de-maquinaria' or nombre = 'Alquiler de Maquinaria');
insert into categorias (nombre, slug, origen)
select 'Alquiler y venta de baños y módulos portátiles', 'alquiler-y-venta-de-banos-y-modulos-portatiles', 'capmin'
where not exists (select 1 from categorias where slug = 'alquiler-y-venta-de-banos-y-modulos-portatiles' or nombre = 'Alquiler y venta de baños y módulos portátiles');
insert into categorias (nombre, slug, origen)
select 'ALYC', 'alyc', 'capmin'
where not exists (select 1 from categorias where slug = 'alyc' or nombre = 'ALYC');
insert into categorias (nombre, slug, origen)
select 'Arquitectura', 'arquitectura', 'capmin'
where not exists (select 1 from categorias where slug = 'arquitectura' or nombre = 'Arquitectura');
insert into categorias (nombre, slug, origen)
select 'Asesoria', 'asesoria', 'capmin'
where not exists (select 1 from categorias where slug = 'asesoria' or nombre = 'Asesoria');
insert into categorias (nombre, slug, origen)
select 'big bag.', 'big-bag', 'capmin'
where not exists (select 1 from categorias where slug = 'big-bag' or nombre = 'big bag.');
insert into categorias (nombre, slug, origen)
select 'Bombas', 'bombas', 'capmin'
where not exists (select 1 from categorias where slug = 'bombas' or nombre = 'Bombas');
insert into categorias (nombre, slug, origen)
select 'bombeo de agua', 'bombeo-de-agua', 'capmin'
where not exists (select 1 from categorias where slug = 'bombeo-de-agua' or nombre = 'bombeo de agua');
insert into categorias (nombre, slug, origen)
select 'Caños de acero', 'canos-de-acero', 'capmin'
where not exists (select 1 from categorias where slug = 'canos-de-acero' or nombre = 'Caños de acero');
insert into categorias (nombre, slug, origen)
select 'Capacitaciones', 'capacitaciones', 'capmin'
where not exists (select 1 from categorias where slug = 'capacitaciones' or nombre = 'Capacitaciones');
insert into categorias (nombre, slug, origen)
select 'CArrocerías', 'carrocerias', 'capmin'
where not exists (select 1 from categorias where slug = 'carrocerias' or nombre = 'CArrocerías');
insert into categorias (nombre, slug, origen)
select 'Caucho', 'caucho', 'capmin'
where not exists (select 1 from categorias where slug = 'caucho' or nombre = 'Caucho');
insert into categorias (nombre, slug, origen)
select 'CCTV', 'cctv', 'capmin'
where not exists (select 1 from categorias where slug = 'cctv' or nombre = 'CCTV');
insert into categorias (nombre, slug, origen)
select 'Climatización Industrial', 'climatizacion-industrial', 'capmin'
where not exists (select 1 from categorias where slug = 'climatizacion-industrial' or nombre = 'Climatización Industrial');
insert into categorias (nombre, slug, origen)
select 'CODIN', 'codin', 'capmin'
where not exists (select 1 from categorias where slug = 'codin' or nombre = 'CODIN');
insert into categorias (nombre, slug, origen)
select 'Combustibles', 'combustibles', 'capmin'
where not exists (select 1 from categorias where slug = 'combustibles' or nombre = 'Combustibles');
insert into categorias (nombre, slug, origen)
select 'Comercializacion de maquinarias mineras', 'comercializacion-de-maquinarias-mineras', 'capmin'
where not exists (select 1 from categorias where slug = 'comercializacion-de-maquinarias-mineras' or nombre = 'Comercializacion de maquinarias mineras');
insert into categorias (nombre, slug, origen)
select 'Comercio', 'comercio', 'capmin'
where not exists (select 1 from categorias where slug = 'comercio' or nombre = 'Comercio');
insert into categorias (nombre, slug, origen)
select 'Comercio Exterior', 'comercio-exterior', 'capmin'
where not exists (select 1 from categorias where slug = 'comercio-exterior' or nombre = 'Comercio Exterior');
insert into categorias (nombre, slug, origen)
select 'Conductores Eléctricos', 'conductores-electricos', 'capmin'
where not exists (select 1 from categorias where slug = 'conductores-electricos' or nombre = 'Conductores Eléctricos');
insert into categorias (nombre, slug, origen)
select 'Construcción Modular', 'construccion-modular', 'capmin'
where not exists (select 1 from categorias where slug = 'construccion-modular' or nombre = 'Construcción Modular');
insert into categorias (nombre, slug, origen)
select 'Construcciones', 'construcciones', 'capmin'
where not exists (select 1 from categorias where slug = 'construcciones' or nombre = 'Construcciones');
insert into categorias (nombre, slug, origen)
select 'Construcciones Obras Civiles y Servicio Minero', 'construcciones-obras-civiles-y-servicio-minero', 'capmin'
where not exists (select 1 from categorias where slug = 'construcciones-obras-civiles-y-servicio-minero' or nombre = 'Construcciones Obras Civiles y Servicio Minero');
insert into categorias (nombre, slug, origen)
select 'Construcciones y Montajes', 'construcciones-y-montajes', 'capmin'
where not exists (select 1 from categorias where slug = 'construcciones-y-montajes' or nombre = 'Construcciones y Montajes');
insert into categorias (nombre, slug, origen)
select 'Consultora de RRHH e Higiene & Seguridad', 'consultora-de-rrhh-e-higiene-seguridad', 'capmin'
where not exists (select 1 from categorias where slug = 'consultora-de-rrhh-e-higiene-seguridad' or nombre = 'Consultora de RRHH e Higiene & Seguridad');
insert into categorias (nombre, slug, origen)
select 'Consultoría', 'consultoria', 'capmin'
where not exists (select 1 from categorias where slug = 'consultoria' or nombre = 'Consultoría');
insert into categorias (nombre, slug, origen)
select 'Depósito y Almacenaje', 'deposito-y-almacenaje', 'capmin'
where not exists (select 1 from categorias where slug = 'deposito-y-almacenaje' or nombre = 'Depósito y Almacenaje');
insert into categorias (nombre, slug, origen)
select 'Desmontaje', 'desmontaje', 'capmin'
where not exists (select 1 from categorias where slug = 'desmontaje' or nombre = 'Desmontaje');
insert into categorias (nombre, slug, origen)
select 'Dirección y Gestión Empresarial', 'direccion-y-gestion-empresarial', 'capmin'
where not exists (select 1 from categorias where slug = 'direccion-y-gestion-empresarial' or nombre = 'Dirección y Gestión Empresarial');
insert into categorias (nombre, slug, origen)
select 'Efluentes', 'efluentes', 'capmin'
where not exists (select 1 from categorias where slug = 'efluentes' or nombre = 'Efluentes');
insert into categorias (nombre, slug, origen)
select 'Electricidad', 'electricidad', 'capmin'
where not exists (select 1 from categorias where slug = 'electricidad' or nombre = 'Electricidad');
insert into categorias (nombre, slug, origen)
select 'Electromecánica', 'electromecanica', 'capmin'
where not exists (select 1 from categorias where slug = 'electromecanica' or nombre = 'Electromecánica');
insert into categorias (nombre, slug, origen)
select 'Elementos Protección Personal', 'elementos-proteccion-personal', 'capmin'
where not exists (select 1 from categorias where slug = 'elementos-proteccion-personal' or nombre = 'Elementos Protección Personal');
insert into categorias (nombre, slug, origen)
select 'Energías Renovables', 'energias-renovables', 'capmin'
where not exists (select 1 from categorias where slug = 'energias-renovables' or nombre = 'Energías Renovables');
insert into categorias (nombre, slug, origen)
select 'Energía', 'energy-technology', 'capmin'
where not exists (select 1 from categorias where slug = 'energy-technology' or nombre = 'Energía');
insert into categorias (nombre, slug, origen)
select 'Ensayos no destructivos', 'ensayos-no-destructivos', 'capmin'
where not exists (select 1 from categorias where slug = 'ensayos-no-destructivos' or nombre = 'Ensayos no destructivos');
insert into categorias (nombre, slug, origen)
select 'Entidad Financiera / Bancaria', 'entidad-financiera', 'capmin'
where not exists (select 1 from categorias where slug = 'entidad-financiera' or nombre = 'Entidad Financiera / Bancaria');
insert into categorias (nombre, slug, origen)
select 'Equipamiento médico', 'equipamiento-medico', 'capmin'
where not exists (select 1 from categorias where slug = 'equipamiento-medico' or nombre = 'Equipamiento médico');
insert into categorias (nombre, slug, origen)
select 'equipos e implementos de uso especial N.C.P.', 'equipos-e-implementos-de-uso-especial-n-c-p', 'capmin'
where not exists (select 1 from categorias where slug = 'equipos-e-implementos-de-uso-especial-n-c-p' or nombre = 'equipos e implementos de uso especial N.C.P.');
insert into categorias (nombre, slug, origen)
select 'Equipos Hidráulicos y Neumáticos', 'equipos-hidraulicos-y-neumaticos', 'capmin'
where not exists (select 1 from categorias where slug = 'equipos-hidraulicos-y-neumaticos' or nombre = 'Equipos Hidráulicos y Neumáticos');
insert into categorias (nombre, slug, origen)
select 'Equipos limpieza industrial', 'equipos-limpieza-industrial', 'capmin'
where not exists (select 1 from categorias where slug = 'equipos-limpieza-industrial' or nombre = 'Equipos limpieza industrial');
insert into categorias (nombre, slug, origen)
select 'Equipos Y Maquinaria', 'equipos-y-maquinaria', 'capmin'
where not exists (select 1 from categorias where slug = 'equipos-y-maquinaria' or nombre = 'Equipos Y Maquinaria');
insert into categorias (nombre, slug, origen)
select 'Estructuras Metálicas', 'estructuras-metalicas', 'capmin'
where not exists (select 1 from categorias where slug = 'estructuras-metalicas' or nombre = 'Estructuras Metálicas');
insert into categorias (nombre, slug, origen)
select 'Exploración', 'exploracion', 'capmin'
where not exists (select 1 from categorias where slug = 'exploracion' or nombre = 'Exploración');
insert into categorias (nombre, slug, origen)
select 'Explosivos', 'explosivos', 'capmin'
where not exists (select 1 from categorias where slug = 'explosivos' or nombre = 'Explosivos');
insert into categorias (nombre, slug, origen)
select 'FABRICACION DE CONDUCTORES DE ENERGIA Y DE TELECOMUNICACIONES', 'fabricacion-de-conductores-de-energia-y-de-telecomunicaciones', 'capmin'
where not exists (select 1 from categorias where slug = 'fabricacion-de-conductores-de-energia-y-de-telecomunicaciones' or nombre = 'FABRICACION DE CONDUCTORES DE ENERGIA Y DE TELECOMUNICACIONES');
insert into categorias (nombre, slug, origen)
select 'Fabricación de equipo para industrias', 'fabricacion-de-equipo-para-industrias', 'capmin'
where not exists (select 1 from categorias where slug = 'fabricacion-de-equipo-para-industrias' or nombre = 'Fabricación de equipo para industrias');
insert into categorias (nombre, slug, origen)
select 'Fabricación de motores y generadores', 'fabricacion-de-motores-y-generadores', 'capmin'
where not exists (select 1 from categorias where slug = 'fabricacion-de-motores-y-generadores' or nombre = 'Fabricación de motores y generadores');
insert into categorias (nombre, slug, origen)
select 'Fabricación de productos textiles', 'fabricacion-de-productos-textiles', 'capmin'
where not exists (select 1 from categorias where slug = 'fabricacion-de-productos-textiles' or nombre = 'Fabricación de productos textiles');
insert into categorias (nombre, slug, origen)
select 'Fabricación de transformadores eléctricos', 'fabricacion-de-transformadores-electricos', 'capmin'
where not exists (select 1 from categorias where slug = 'fabricacion-de-transformadores-electricos' or nombre = 'Fabricación de transformadores eléctricos');
insert into categorias (nombre, slug, origen)
select 'Fabricación Productos metálicos', 'fabricacion-productos-metalicos', 'capmin'
where not exists (select 1 from categorias where slug = 'fabricacion-productos-metalicos' or nombre = 'Fabricación Productos metálicos');
insert into categorias (nombre, slug, origen)
select 'Fabricante de Explosivos', 'fabricante-de-explosivos', 'capmin'
where not exists (select 1 from categorias where slug = 'fabricante-de-explosivos' or nombre = 'Fabricante de Explosivos');
insert into categorias (nombre, slug, origen)
select 'Ferreteria Industrial', 'ferreteria-industrial', 'capmin'
where not exists (select 1 from categorias where slug = 'ferreteria-industrial' or nombre = 'Ferreteria Industrial');
insert into categorias (nombre, slug, origen)
select 'Ferretería Industrial', 'ferreteria-industrial-2', 'capmin'
where not exists (select 1 from categorias where slug = 'ferreteria-industrial-2' or nombre = 'Ferretería Industrial');
insert into categorias (nombre, slug, origen)
select 'Fibra óptica', 'fibra-optica', 'capmin'
where not exists (select 1 from categorias where slug = 'fibra-optica' or nombre = 'Fibra óptica');
insert into categorias (nombre, slug, origen)
select 'Filtros', 'filtros', 'capmin'
where not exists (select 1 from categorias where slug = 'filtros' or nombre = 'Filtros');
insert into categorias (nombre, slug, origen)
select 'Finanzas', 'finanzas', 'capmin'
where not exists (select 1 from categorias where slug = 'finanzas' or nombre = 'Finanzas');
insert into categorias (nombre, slug, origen)
select 'Forwarder', 'forwarder', 'capmin'
where not exists (select 1 from categorias where slug = 'forwarder' or nombre = 'Forwarder');
insert into categorias (nombre, slug, origen)
select 'Fundición', 'fundicion', 'capmin'
where not exists (select 1 from categorias where slug = 'fundicion' or nombre = 'Fundición');
insert into categorias (nombre, slug, origen)
select 'Gas', 'gas', 'capmin'
where not exists (select 1 from categorias where slug = 'gas' or nombre = 'Gas');
insert into categorias (nombre, slug, origen)
select 'Gastronomía', 'gastronomia', 'capmin'
where not exists (select 1 from categorias where slug = 'gastronomia' or nombre = 'Gastronomía');
insert into categorias (nombre, slug, origen)
select 'Generadores', 'generadores', 'capmin'
where not exists (select 1 from categorias where slug = 'generadores' or nombre = 'Generadores');
insert into categorias (nombre, slug, origen)
select 'Geomembranas', 'geomembranas', 'capmin'
where not exists (select 1 from categorias where slug = 'geomembranas' or nombre = 'Geomembranas');
insert into categorias (nombre, slug, origen)
select 'Geosintéticos', 'geosinteticos', 'capmin'
where not exists (select 1 from categorias where slug = 'geosinteticos' or nombre = 'Geosintéticos');
insert into categorias (nombre, slug, origen)
select 'Geotextiles', 'geotextiles', 'capmin'
where not exists (select 1 from categorias where slug = 'geotextiles' or nombre = 'Geotextiles');
insert into categorias (nombre, slug, origen)
select 'Gerenciamiento de Riesgo y Seguridad', 'gerenciamiento-de-riesgo-y-seguridad', 'capmin'
where not exists (select 1 from categorias where slug = 'gerenciamiento-de-riesgo-y-seguridad' or nombre = 'Gerenciamiento de Riesgo y Seguridad');
insert into categorias (nombre, slug, origen)
select 'Gestión de Agentes de Transp. Aduanero', 'gestion-de-agentes-de-transp-aduanero', 'capmin'
where not exists (select 1 from categorias where slug = 'gestion-de-agentes-de-transp-aduanero' or nombre = 'Gestión de Agentes de Transp. Aduanero');
insert into categorias (nombre, slug, origen)
select 'grifos y válvulas', 'grifos-y-valvulas', 'capmin'
where not exists (select 1 from categorias where slug = 'grifos-y-valvulas' or nombre = 'grifos y válvulas');
insert into categorias (nombre, slug, origen)
select 'Herramientas manuales', 'herramientas-manuales', 'capmin'
where not exists (select 1 from categorias where slug = 'herramientas-manuales' or nombre = 'Herramientas manuales');
insert into categorias (nombre, slug, origen)
select 'Higiene y seguridad en el trabajo', 'higiene-y-seguridad-en-el-trabajo', 'capmin'
where not exists (select 1 from categorias where slug = 'higiene-y-seguridad-en-el-trabajo' or nombre = 'Higiene y seguridad en el trabajo');
insert into categorias (nombre, slug, origen)
select 'Hotelería', 'hoteleria', 'capmin'
where not exists (select 1 from categorias where slug = 'hoteleria' or nombre = 'Hotelería');
insert into categorias (nombre, slug, origen)
select 'Importadora', 'importadora', 'capmin'
where not exists (select 1 from categorias where slug = 'importadora' or nombre = 'Importadora');
insert into categorias (nombre, slug, origen)
select 'Industria hidráulica y neumática', 'industria-hidraulica-y-neumatica', 'capmin'
where not exists (select 1 from categorias where slug = 'industria-hidraulica-y-neumatica' or nombre = 'Industria hidráulica y neumática');
insert into categorias (nombre, slug, origen)
select 'Industria Minera', 'industria-minera', 'capmin'
where not exists (select 1 from categorias where slug = 'industria-minera' or nombre = 'Industria Minera');
insert into categorias (nombre, slug, origen)
select 'Industrial', 'industrial', 'capmin'
where not exists (select 1 from categorias where slug = 'industrial' or nombre = 'Industrial');
insert into categorias (nombre, slug, origen)
select 'Informática', 'informatica', 'capmin'
where not exists (select 1 from categorias where slug = 'informatica' or nombre = 'Informática');
insert into categorias (nombre, slug, origen)
select 'Informes Laborales', 'informes-laborales', 'capmin'
where not exists (select 1 from categorias where slug = 'informes-laborales' or nombre = 'Informes Laborales');
insert into categorias (nombre, slug, origen)
select 'Infraestructura eléctrica', 'infraestructura-electrica', 'capmin'
where not exists (select 1 from categorias where slug = 'infraestructura-electrica' or nombre = 'Infraestructura eléctrica');
insert into categorias (nombre, slug, origen)
select 'Infraestructura Tecnológica', 'infraestructura-tecnologica', 'capmin'
where not exists (select 1 from categorias where slug = 'infraestructura-tecnologica' or nombre = 'Infraestructura Tecnológica');
insert into categorias (nombre, slug, origen)
select 'Ingeniería', 'ingenieria', 'capmin'
where not exists (select 1 from categorias where slug = 'ingenieria' or nombre = 'Ingeniería');
insert into categorias (nombre, slug, origen)
select 'Ingeniería y construcción de equipos y repuestos para minería', 'ingenieria-y-construccion-de-equipos-y-repuestos-para-mineria', 'capmin'
where not exists (select 1 from categorias where slug = 'ingenieria-y-construccion-de-equipos-y-repuestos-para-mineria' or nombre = 'Ingeniería y construcción de equipos y repuestos para minería');
insert into categorias (nombre, slug, origen)
select 'limpieza', 'limpieza', 'capmin'
where not exists (select 1 from categorias where slug = 'limpieza' or nombre = 'limpieza');
insert into categorias (nombre, slug, origen)
select 'Logistica', 'logistica', 'capmin'
where not exists (select 1 from categorias where slug = 'logistica' or nombre = 'Logistica');
insert into categorias (nombre, slug, origen)
select 'Lubricantes y Selladores', 'lubricantes-y-selladores', 'capmin'
where not exists (select 1 from categorias where slug = 'lubricantes-y-selladores' or nombre = 'Lubricantes y Selladores');
insert into categorias (nombre, slug, origen)
select 'Mangueras', 'mangueras', 'capmin'
where not exists (select 1 from categorias where slug = 'mangueras' or nombre = 'Mangueras');
insert into categorias (nombre, slug, origen)
select 'Mantenimiento', 'mantenimiento', 'capmin'
where not exists (select 1 from categorias where slug = 'mantenimiento' or nombre = 'Mantenimiento');
insert into categorias (nombre, slug, origen)
select 'Maquinaria Agrícola', 'maquinaria-agricola', 'capmin'
where not exists (select 1 from categorias where slug = 'maquinaria-agricola' or nombre = 'Maquinaria Agrícola');
insert into categorias (nombre, slug, origen)
select 'Materiales para construcción', 'materiales-para-construccion', 'capmin'
where not exists (select 1 from categorias where slug = 'materiales-para-construccion' or nombre = 'Materiales para construcción');
insert into categorias (nombre, slug, origen)
select 'Medidores y Equipos Eléctricos', 'medidores-y-equipos-electricos', 'capmin'
where not exists (select 1 from categorias where slug = 'medidores-y-equipos-electricos' or nombre = 'Medidores y Equipos Eléctricos');
insert into categorias (nombre, slug, origen)
select 'Metalmecánica', 'metalmecanica', 'capmin'
where not exists (select 1 from categorias where slug = 'metalmecanica' or nombre = 'Metalmecánica');
insert into categorias (nombre, slug, origen)
select 'Metalúrgica', 'metalurgica', 'capmin'
where not exists (select 1 from categorias where slug = 'metalurgica' or nombre = 'Metalúrgica');
insert into categorias (nombre, slug, origen)
select 'Minería', 'mineria', 'capmin'
where not exists (select 1 from categorias where slug = 'mineria' or nombre = 'Minería');
insert into categorias (nombre, slug, origen)
select 'mineros y ambientales', 'mineros-y-ambientales', 'capmin'
where not exists (select 1 from categorias where slug = 'mineros-y-ambientales' or nombre = 'mineros y ambientales');
insert into categorias (nombre, slug, origen)
select 'Montaje', 'montaje', 'capmin'
where not exists (select 1 from categorias where slug = 'montaje' or nombre = 'Montaje');
insert into categorias (nombre, slug, origen)
select 'Motores', 'motores', 'capmin'
where not exists (select 1 from categorias where slug = 'motores' or nombre = 'Motores');
insert into categorias (nombre, slug, origen)
select 'Obras e infraestructura', 'obras-e-infraestructura', 'capmin'
where not exists (select 1 from categorias where slug = 'obras-e-infraestructura' or nombre = 'Obras e infraestructura');
insert into categorias (nombre, slug, origen)
select 'Oil&Gas', 'oilgas', 'capmin'
where not exists (select 1 from categorias where slug = 'oilgas' or nombre = 'Oil&Gas');
insert into categorias (nombre, slug, origen)
select 'Packaging', 'packaging', 'capmin'
where not exists (select 1 from categorias where slug = 'packaging' or nombre = 'Packaging');
insert into categorias (nombre, slug, origen)
select 'perforaciones', 'perforaciones', 'capmin'
where not exists (select 1 from categorias where slug = 'perforaciones' or nombre = 'perforaciones');
insert into categorias (nombre, slug, origen)
select 'Petróleo', 'petroleo', 'capmin'
where not exists (select 1 from categorias where slug = 'petroleo' or nombre = 'Petróleo');
insert into categorias (nombre, slug, origen)
select 'Petroquímico', 'petroquimico', 'capmin'
where not exists (select 1 from categorias where slug = 'petroquimico' or nombre = 'Petroquímico');
insert into categorias (nombre, slug, origen)
select 'Planes de medicina Prepaga', 'planes-de-medicina-prepaga', 'capmin'
where not exists (select 1 from categorias where slug = 'planes-de-medicina-prepaga' or nombre = 'Planes de medicina Prepaga');
insert into categorias (nombre, slug, origen)
select 'Plásticos', 'plasticos', 'capmin'
where not exists (select 1 from categorias where slug = 'plasticos' or nombre = 'Plásticos');
insert into categorias (nombre, slug, origen)
select 'Procesamiento de datos', 'procesamiento-de-datos', 'capmin'
where not exists (select 1 from categorias where slug = 'procesamiento-de-datos' or nombre = 'Procesamiento de datos');
insert into categorias (nombre, slug, origen)
select 'procesos. Membranas', 'procesos-membranas', 'capmin'
where not exists (select 1 from categorias where slug = 'procesos-membranas' or nombre = 'procesos. Membranas');
insert into categorias (nombre, slug, origen)
select 'Productos y estructuras en PRFV', 'productos-y-estructuras-en-prfv', 'capmin'
where not exists (select 1 from categorias where slug = 'productos-y-estructuras-en-prfv' or nombre = 'Productos y estructuras en PRFV');
insert into categorias (nombre, slug, origen)
select 'Proveedore de equipamiento', 'proveedore-de-equipamiento', 'capmin'
where not exists (select 1 from categorias where slug = 'proveedore-de-equipamiento' or nombre = 'Proveedore de equipamiento');
insert into categorias (nombre, slug, origen)
select 'Provisión Minería', 'provision-mineria', 'capmin'
where not exists (select 1 from categorias where slug = 'provision-mineria' or nombre = 'Provisión Minería');
insert into categorias (nombre, slug, origen)
select 'Provisiones y Consumibles', 'provisiones-y-consumibles', 'capmin'
where not exists (select 1 from categorias where slug = 'provisiones-y-consumibles' or nombre = 'Provisiones y Consumibles');
insert into categorias (nombre, slug, origen)
select 'Puerto', 'puerto', 'capmin'
where not exists (select 1 from categorias where slug = 'puerto' or nombre = 'Puerto');
insert into categorias (nombre, slug, origen)
select 'Reciclables', 'reciclables', 'capmin'
where not exists (select 1 from categorias where slug = 'reciclables' or nombre = 'Reciclables');
insert into categorias (nombre, slug, origen)
select 'Reciclado de metales', 'reciclado-de-metales', 'capmin'
where not exists (select 1 from categorias where slug = 'reciclado-de-metales' or nombre = 'Reciclado de metales');
insert into categorias (nombre, slug, origen)
select 'Rectificación de motores', 'rectificacion-de-motores', 'capmin'
where not exists (select 1 from categorias where slug = 'rectificacion-de-motores' or nombre = 'Rectificación de motores');
insert into categorias (nombre, slug, origen)
select 'Refineria de petróleo', 'refineria-de-petroleo', 'capmin'
where not exists (select 1 from categorias where slug = 'refineria-de-petroleo' or nombre = 'Refineria de petróleo');
insert into categorias (nombre, slug, origen)
select 'Refugios mineros', 'refugios-mineros', 'capmin'
where not exists (select 1 from categorias where slug = 'refugios-mineros' or nombre = 'Refugios mineros');
insert into categorias (nombre, slug, origen)
select 'Rejillas metálicas', 'rejillas-metalicas', 'capmin'
where not exists (select 1 from categorias where slug = 'rejillas-metalicas' or nombre = 'Rejillas metálicas');
insert into categorias (nombre, slug, origen)
select 'Remolques y Semirremolques', 'remolques-y-semirremolques', 'capmin'
where not exists (select 1 from categorias where slug = 'remolques-y-semirremolques' or nombre = 'Remolques y Semirremolques');
insert into categorias (nombre, slug, origen)
select 'Reparación maquinaria', 'reparacion-maquinaria', 'capmin'
where not exists (select 1 from categorias where slug = 'reparacion-maquinaria' or nombre = 'Reparación maquinaria');
insert into categorias (nombre, slug, origen)
select 'Repuestos maquinaria vial', 'repuestos-maquinaria-vial', 'capmin'
where not exists (select 1 from categorias where slug = 'repuestos-maquinaria-vial' or nombre = 'Repuestos maquinaria vial');
insert into categorias (nombre, slug, origen)
select 'Repuestos maquinarias', 'repuestos-maquinarias', 'capmin'
where not exists (select 1 from categorias where slug = 'repuestos-maquinarias' or nombre = 'Repuestos maquinarias');
insert into categorias (nombre, slug, origen)
select 'Repuestos para motores', 'repuestos-para-motores', 'capmin'
where not exists (select 1 from categorias where slug = 'repuestos-para-motores' or nombre = 'Repuestos para motores');
insert into categorias (nombre, slug, origen)
select 'Repuestos y filtros', 'repuestos-y-filtros', 'capmin'
where not exists (select 1 from categorias where slug = 'repuestos-y-filtros' or nombre = 'Repuestos y filtros');
insert into categorias (nombre, slug, origen)
select 'repuestos y servicios de mantenimiento.', 'repuestos-y-servicios-de-mantenimiento', 'capmin'
where not exists (select 1 from categorias where slug = 'repuestos-y-servicios-de-mantenimiento' or nombre = 'repuestos y servicios de mantenimiento.');
insert into categorias (nombre, slug, origen)
select 'RRHH', 'rrhh', 'capmin'
where not exists (select 1 from categorias where slug = 'rrhh' or nombre = 'RRHH');
insert into categorias (nombre, slug, origen)
select 'Salud', 'salud', 'capmin'
where not exists (select 1 from categorias where slug = 'salud' or nombre = 'Salud');
insert into categorias (nombre, slug, origen)
select 'Seguridad', 'seguridad', 'capmin'
where not exists (select 1 from categorias where slug = 'seguridad' or nombre = 'Seguridad');
insert into categorias (nombre, slug, origen)
select 'Seguridad e higiene', 'seguridad-e-higiene', 'capmin'
where not exists (select 1 from categorias where slug = 'seguridad-e-higiene' or nombre = 'Seguridad e higiene');
insert into categorias (nombre, slug, origen)
select 'Seguridad Industrial', 'seguridad-industrial', 'capmin'
where not exists (select 1 from categorias where slug = 'seguridad-industrial' or nombre = 'Seguridad Industrial');
insert into categorias (nombre, slug, origen)
select 'Seguros', 'seguros', 'capmin'
where not exists (select 1 from categorias where slug = 'seguros' or nombre = 'Seguros');
insert into categorias (nombre, slug, origen)
select 'Sellado de Fluidos', 'sellado-de-fluidos', 'capmin'
where not exists (select 1 from categorias where slug = 'sellado-de-fluidos' or nombre = 'Sellado de Fluidos');
insert into categorias (nombre, slug, origen)
select 'Servicio de gruas de gran porte', 'servicio-de-gruas-de-gran-porte', 'capmin'
where not exists (select 1 from categorias where slug = 'servicio-de-gruas-de-gran-porte' or nombre = 'Servicio de gruas de gran porte');
insert into categorias (nombre, slug, origen)
select 'Servicio de limpieza general de edificios', 'servicio-de-limpieza-general-de-edificios', 'capmin'
where not exists (select 1 from categorias where slug = 'servicio-de-limpieza-general-de-edificios' or nombre = 'Servicio de limpieza general de edificios');
insert into categorias (nombre, slug, origen)
select 'Servicios', 'servicios', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios' or nombre = 'Servicios');
insert into categorias (nombre, slug, origen)
select 'Servicios de Comunicaciones', 'servicios-de-comunicaciones', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-de-comunicaciones' or nombre = 'Servicios de Comunicaciones');
insert into categorias (nombre, slug, origen)
select 'Servicios de Consultoria en RRHH', 'servicios-de-consultoria-en-rrhh', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-de-consultoria-en-rrhh' or nombre = 'Servicios de Consultoria en RRHH');
insert into categorias (nombre, slug, origen)
select 'Servicios de dosimetría', 'servicios-de-dosimetria', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-de-dosimetria' or nombre = 'Servicios de dosimetría');
insert into categorias (nombre, slug, origen)
select 'Servicios de Gestion Logistica Nac e Int', 'servicios-de-gestion-logistica-nac-e-int', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-de-gestion-logistica-nac-e-int' or nombre = 'Servicios de Gestion Logistica Nac e Int');
insert into categorias (nombre, slug, origen)
select 'Servicios de Gestión y Logística para el transporte de mercaderías', 'servicios-de-gestion-y-logistica-para-el-transporte-de-mercaderias', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-de-gestion-y-logistica-para-el-transporte-de-mercaderias' or nombre = 'Servicios de Gestión y Logística para el transporte de mercaderías');
insert into categorias (nombre, slug, origen)
select 'Servicios de Ingeniería y Montaje', 'servicios-de-ingenieria-y-montaje', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-de-ingenieria-y-montaje' or nombre = 'Servicios de Ingeniería y Montaje');
insert into categorias (nombre, slug, origen)
select 'Servicios de Salud', 'servicios-de-salud', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-de-salud' or nombre = 'Servicios de Salud');
insert into categorias (nombre, slug, origen)
select 'Servicios Financieros', 'servicios-financieros', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-financieros' or nombre = 'Servicios Financieros');
insert into categorias (nombre, slug, origen)
select 'Servicios Gastronómicos', 'servicios-gastronomicos', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-gastronomicos' or nombre = 'Servicios Gastronómicos');
insert into categorias (nombre, slug, origen)
select 'Servicios industriales', 'servicios-industriales', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-industriales' or nombre = 'Servicios industriales');
insert into categorias (nombre, slug, origen)
select 'Servicios Integrales', 'servicios-integrales', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-integrales' or nombre = 'Servicios Integrales');
insert into categorias (nombre, slug, origen)
select 'Servicios Mineros', 'servicios-mineros', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-mineros' or nombre = 'Servicios Mineros');
insert into categorias (nombre, slug, origen)
select 'Servicios operativos', 'servicios-operativos', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-operativos' or nombre = 'Servicios operativos');
insert into categorias (nombre, slug, origen)
select 'Servicios Petroleros/Mineros', 'servicios-petroleros-mineros', 'capmin'
where not exists (select 1 from categorias where slug = 'servicios-petroleros-mineros' or nombre = 'Servicios Petroleros/Mineros');
insert into categorias (nombre, slug, origen)
select 'Siderúrgica', 'siderurgica', 'capmin'
where not exists (select 1 from categorias where slug = 'siderurgica' or nombre = 'Siderúrgica');
insert into categorias (nombre, slug, origen)
select 'Sistemas de Riego', 'sistemas-de-riego', 'capmin'
where not exists (select 1 from categorias where slug = 'sistemas-de-riego' or nombre = 'Sistemas de Riego');
insert into categorias (nombre, slug, origen)
select 'software y electricidad', 'software-y-electricidad', 'capmin'
where not exists (select 1 from categorias where slug = 'software-y-electricidad' or nombre = 'software y electricidad');
insert into categorias (nombre, slug, origen)
select 'Software y IA', 'software-y-ia', 'capmin'
where not exists (select 1 from categorias where slug = 'software-y-ia' or nombre = 'Software y IA');
insert into categorias (nombre, slug, origen)
select 'Soluciones Ambientales', 'soluciones-ambientales', 'capmin'
where not exists (select 1 from categorias where slug = 'soluciones-ambientales' or nombre = 'Soluciones Ambientales');
insert into categorias (nombre, slug, origen)
select 'Soluciones Logisticas', 'soluciones-logisticas', 'capmin'
where not exists (select 1 from categorias where slug = 'soluciones-logisticas' or nombre = 'Soluciones Logisticas');
insert into categorias (nombre, slug, origen)
select 'Subastas Industriales', 'subastas-industriales', 'capmin'
where not exists (select 1 from categorias where slug = 'subastas-industriales' or nombre = 'Subastas Industriales');
insert into categorias (nombre, slug, origen)
select 'Tecnologia para operaciones industriales', 'tecnologia-para-operaciones-industriales', 'capmin'
where not exists (select 1 from categorias where slug = 'tecnologia-para-operaciones-industriales' or nombre = 'Tecnologia para operaciones industriales');
insert into categorias (nombre, slug, origen)
select 'Telecomunicaciones', 'telecomunicaciones', 'capmin'
where not exists (select 1 from categorias where slug = 'telecomunicaciones' or nombre = 'Telecomunicaciones');
insert into categorias (nombre, slug, origen)
select 'Topografía', 'topografia', 'capmin'
where not exists (select 1 from categorias where slug = 'topografia' or nombre = 'Topografía');
insert into categorias (nombre, slug, origen)
select 'Transporte', 'transporte', 'capmin'
where not exists (select 1 from categorias where slug = 'transporte' or nombre = 'Transporte');
insert into categorias (nombre, slug, origen)
select 'Transporte Aéreo de Carga', 'transporte-aereo-de-carga', 'capmin'
where not exists (select 1 from categorias where slug = 'transporte-aereo-de-carga' or nombre = 'Transporte Aéreo de Carga');
insert into categorias (nombre, slug, origen)
select 'Transporte aereo de pasajeros', 'transporte-aereo-de-pasajeros', 'capmin'
where not exists (select 1 from categorias where slug = 'transporte-aereo-de-pasajeros' or nombre = 'Transporte aereo de pasajeros');
insert into categorias (nombre, slug, origen)
select 'Transporte Automotor de Cargas', 'transporte-automotor-de-cargas', 'capmin'
where not exists (select 1 from categorias where slug = 'transporte-automotor-de-cargas' or nombre = 'Transporte Automotor de Cargas');
insert into categorias (nombre, slug, origen)
select 'Transporte de cargas pesadas', 'transporte-de-cargas-pesadas', 'capmin'
where not exists (select 1 from categorias where slug = 'transporte-de-cargas-pesadas' or nombre = 'Transporte de cargas pesadas');
insert into categorias (nombre, slug, origen)
select 'Transporte de Pasajeros', 'transporte-de-pasajeros', 'capmin'
where not exists (select 1 from categorias where slug = 'transporte-de-pasajeros' or nombre = 'Transporte de Pasajeros');
insert into categorias (nombre, slug, origen)
select 'Transporte Terrestre de Cargas', 'transporte-terrestre-de-cargas', 'capmin'
where not exists (select 1 from categorias where slug = 'transporte-terrestre-de-cargas' or nombre = 'Transporte Terrestre de Cargas');
insert into categorias (nombre, slug, origen)
select 'Transporte y tratamiento de residuos industriales', 'transporte-y-tratamiento-de-residuos-industriales', 'capmin'
where not exists (select 1 from categorias where slug = 'transporte-y-tratamiento-de-residuos-industriales' or nombre = 'Transporte y tratamiento de residuos industriales');
insert into categorias (nombre, slug, origen)
select 'tratamientos de aguas', 'tratamientos-de-aguas', 'capmin'
where not exists (select 1 from categorias where slug = 'tratamientos-de-aguas' or nombre = 'tratamientos de aguas');
insert into categorias (nombre, slug, origen)
select 'Tuberías', 'tuberias', 'capmin'
where not exists (select 1 from categorias where slug = 'tuberias' or nombre = 'Tuberías');
insert into categorias (nombre, slug, origen)
select 'Válvulas', 'valvulas', 'capmin'
where not exists (select 1 from categorias where slug = 'valvulas' or nombre = 'Válvulas');
insert into categorias (nombre, slug, origen)
select 'Venta', 'venta', 'capmin'
where not exists (select 1 from categorias where slug = 'venta' or nombre = 'Venta');
insert into categorias (nombre, slug, origen)
select 'Venta de Bienes de Capital', 'venta-de-bienes-de-capital', 'capmin'
where not exists (select 1 from categorias where slug = 'venta-de-bienes-de-capital' or nombre = 'Venta de Bienes de Capital');
insert into categorias (nombre, slug, origen)
select 'Venta de EPP', 'venta-de-epp', 'capmin'
where not exists (select 1 from categorias where slug = 'venta-de-epp' or nombre = 'Venta de EPP');
insert into categorias (nombre, slug, origen)
select 'Venta de maquinaria industrial', 'venta-de-maquinaria-industrial', 'capmin'
where not exists (select 1 from categorias where slug = 'venta-de-maquinaria-industrial' or nombre = 'Venta de maquinaria industrial');
insert into categorias (nombre, slug, origen)
select 'Venta de Partes y piezas', 'venta-de-partes-y-piezas', 'capmin'
where not exists (select 1 from categorias where slug = 'venta-de-partes-y-piezas' or nombre = 'Venta de Partes y piezas');
insert into categorias (nombre, slug, origen)
select 'Venta y Alquiler de maquinaria', 'venta-y-alquiler-de-maquinaria', 'capmin'
where not exists (select 1 from categorias where slug = 'venta-y-alquiler-de-maquinaria' or nombre = 'Venta y Alquiler de maquinaria');
insert into categorias (nombre, slug, origen)
select 'viales y agrícolas', 'viales-y-agricolas-2', 'capmin'
where not exists (select 1 from categorias where slug = 'viales-y-agricolas-2' or nombre = 'viales y agrícolas');

-- Proveedores (dedup por razón social)

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select '3D ELECTRO SAN JUAN', 'Barrio La Superiora, Sector 1', 'Rawson',
       'San Juan', 'https://3delectrosanjuan.com/%20',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['cctv','fibra-optica','infraestructura-electrica','telecomunicaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/3d-electro-san-juan/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('3D ELECTRO SAN JUAN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('3D ELECTRO SAN JUAN')
  and c.slug = any(array['cctv','fibra-optica','infraestructura-electrica','telecomunicaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('3D ELECTRO SAN JUAN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select '9AMAS', null, 'Cerro San Martín 250',
       'Salta', 'http://www.9amas.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['capacitaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/9amas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('9AMAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('9AMAS')
  and c.slug = any(array['capacitaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('9AMAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ABANS CONSTRUCCIÓN', 'Av. Cabildo 2779', 'Piso 2º',
       'CABA', 'https://grupoabans.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-consultoria-en-rrhh']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/abans-construccion/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ABANS CONSTRUCCIÓN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ABANS CONSTRUCCIÓN')
  and c.slug = any(array['servicios-de-consultoria-en-rrhh']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ABANS CONSTRUCCIÓN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ACERIAS 4C SA', 'Juan Domingo Perón N°465, Area Industrial', 'Las Parejas',
       'Santa Fe', 'http://www.acerias4c.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['fundicion']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/acerias-4c-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ACERIAS 4C SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ACERIAS 4C SA')
  and c.slug = any(array['fundicion']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ACERIAS 4C SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ACONCAGUA SERVICIOS MINEROS SRL', null, 'Av. Rawson 811 Norte',
       'San Juan', 'http://www.aconcagua-trans.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['transporte-automotor-de-cargas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/aconcagua-servicios-mineros-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ACONCAGUA SERVICIOS MINEROS SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ACONCAGUA SERVICIOS MINEROS SRL')
  and c.slug = any(array['transporte-automotor-de-cargas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ACONCAGUA SERVICIOS MINEROS SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ADECCO ARGENTINA SA', 'Carlos Pellegrini855', 'Piso 2',
       'CABA', 'http://www.adecco.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-consultoria-en-rrhh']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/adecco-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ADECCO ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ADECCO ARGENTINA SA')
  and c.slug = any(array['servicios-de-consultoria-en-rrhh']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ADECCO ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ADRIAN MERCADO', 'Av. Alicia Moreau de Justo 740, Piso 4', 'Of. 19',
       'CABA', 'http://www.adrianmercado.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['subastas-industriales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/adrian-mercado/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ADRIAN MERCADO')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ADRIAN MERCADO')
  and c.slug = any(array['subastas-industriales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ADRIAN MERCADO')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'AESA', 'Torre YPF, 515, Macacha Güemes, Puerto Madero, Buenos Aires, Comuna 1, Ciudad Autónoma de Buenos Aires, C1107CDA, Argentina', null,
       null, 'http://www.aesa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/aesa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('AESA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('AESA')
  and c.slug = any(array['servicios']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('AESA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'AGUARTEC', 'Diagonal 74 Nº2649', 'La Plata',
       'Buenos Aires', 'http://www.aguartec.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['abastecimiento','bombas','tuberias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/aguartec/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('AGUARTEC')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('AGUARTEC')
  and c.slug = any(array['abastecimiento','bombas','tuberias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('AGUARTEC')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'AIES SA', 'Av. Hipólito Irigoyen 51', 'Avellaneda',
       'Buenos Aires', 'https://www.aies.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['reparacion-maquinaria','seguridad-e-higiene']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/aies-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('AIES SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('AIES SA')
  and c.slug = any(array['reparacion-maquinaria','seguridad-e-higiene']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('AIES SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ALGIERI SA', null, 'Virrey Loreto 2851',
       'CABA', 'http://www.algierisa.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/algieri-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ALGIERI SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ALGIERI SA')
  and c.slug = any(array['construcciones-y-montajes']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ALGIERI SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ALL SHIP LOGISTICS', null, 'Uriburu 1711 Piso 1',
       'CABA', 'http://www.allshiplog.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['forwarder']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/all-ship-logistics/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ALL SHIP LOGISTICS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ALL SHIP LOGISTICS')
  and c.slug = any(array['forwarder']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ALL SHIP LOGISTICS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ALLARIA', '25 de Mayo 359', 'Piso 12',
       'CABA', 'http://www.allaria.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['alyc']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/allaria-ledesma-cia/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ALLARIA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ALLARIA')
  and c.slug = any(array['alyc']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ALLARIA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ALPARDATA SAS', 'Comodoro Rivadavia 1575', 'Dorrego',
       'Mendoza', 'http://www.alpardata.com.ar/mining',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['informatica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/alpardata-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ALPARDATA SAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ALPARDATA SAS')
  and c.slug = any(array['informatica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ALPARDATA SAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ANDEMIRA SA', null, 'Av. Leandro N. Alem 690 Piso 8',
       'CABA', 'http://www.andemira.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/andemira-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ANDEMIRA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ANDEMIRA SA')
  and c.slug = any(array['servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ANDEMIRA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ANDREA APAZA DDP', null, 'Necochea 273',
       'Salta', 'http://www.andreapaza.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['rrhh']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/andrea-apaza-ddp/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ANDREA APAZA DDP')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ANDREA APAZA DDP')
  and c.slug = any(array['rrhh']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ANDREA APAZA DDP')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ANDREANI LOGÍSTICA SA', 'Av. Pte. Perón 4749', 'Benavidez',
       'Buenos Aires', 'http://www.andreani.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['transporte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/andreani-logistica-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ANDREANI LOGÍSTICA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ANDREANI LOGÍSTICA SA')
  and c.slug = any(array['transporte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ANDREANI LOGÍSTICA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ASG CONSULTORA', 'Lavalleja 1870, Córdoba, Argentina', null,
       null, 'https://asgconsultora.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/asg-consultora/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ASG CONSULTORA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ASG CONSULTORA')
  and c.slug = any(array['consultoria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ASG CONSULTORA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'AT INVERSIONES', 'Marcelo T. de Alveaar 934', 'Piso 6 Dpto. 26',
       'CABA', 'http://www.atinversiones.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['finanzas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/at-inversiones/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('AT INVERSIONES')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('AT INVERSIONES')
  and c.slug = any(array['finanzas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('AT INVERSIONES')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'AUSTIN POWDER', 'Luis Maggi 770', 'Rafaela',
       'Santa Fe', 'http://www.austinpowder.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['fabricante-de-explosivos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/austin-powder/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('AUSTIN POWDER')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('AUSTIN POWDER')
  and c.slug = any(array['fabricante-de-explosivos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('AUSTIN POWDER')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'AVINCO CONSTRUCCIONES S.A.', null, 'Santo Domingo 2373',
       'CABA', 'http://www.avinco.com.ar/sitio/index.html',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones','ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/avinco-construcciones-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('AVINCO CONSTRUCCIONES S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('AVINCO CONSTRUCCIONES S.A.')
  and c.slug = any(array['construcciones','ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('AVINCO CONSTRUCCIONES S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BAC DALL ARGENTINA SA', null, 'Coronel Esteban Bonorino 1236',
       'CABA', 'https://www.bac-dall.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['elementos-proteccion-personal']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/bac-dall-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BAC DALL ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BAC DALL ARGENTINA SA')
  and c.slug = any(array['elementos-proteccion-personal']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BAC DALL ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BALANZ', 'Av. Corrientes 316, Piso 3', 'Of. 962',
       'CABA', 'https://balanz.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['finanzas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/balanz/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BALANZ')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BALANZ')
  and c.slug = any(array['finanzas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BALANZ')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BANCO COMAFI', null, 'Av. Roque Saenz Peña 660 Piso 3',
       'CABA', 'http://www.comafi.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['entidad-financiera']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/banco-comafi/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BANCO COMAFI')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BANCO COMAFI')
  and c.slug = any(array['entidad-financiera']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BANCO COMAFI')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BANCO GALICIA', null, 'Tte. Gral. Juan Domingo Perón 430',
       'CABA', 'http://www.galicia.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['entidad-financiera']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/banco-galicia/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BANCO GALICIA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BANCO GALICIA')
  and c.slug = any(array['entidad-financiera']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BANCO GALICIA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BANCO MACRO', null, 'Av. Eduardo Madero 1180',
       'CABA', 'http://www.macro.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['entidad-financiera']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/banco-macro/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BANCO MACRO')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BANCO MACRO')
  and c.slug = any(array['entidad-financiera']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BANCO MACRO')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BANCO SAN JUAN', null, 'Av. Ignacio de la Roza Oeste 85',
       'San Juan', 'http://www.bancosanjuan.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['entidad-financiera']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/banco-san-juan/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BANCO SAN JUAN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BANCO SAN JUAN')
  and c.slug = any(array['entidad-financiera']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BANCO SAN JUAN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BANCO SUPERVIELLE', null, 'Reconquista 330',
       'CABA', 'http://www.supervielle.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['entidad-financiera']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/banco-supervielle/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BANCO SUPERVIELLE')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BANCO SUPERVIELLE')
  and c.slug = any(array['entidad-financiera']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BANCO SUPERVIELLE')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BASANI S.A.', 'Camino de Cintura 7024', 'Aldo Bonsi',
       'Buenos Aires', 'http://www.basani.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['alquiler-y-venta-de-banos-y-modulos-portatiles']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/basani-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BASANI S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BASANI S.A.')
  and c.slug = any(array['alquiler-y-venta-de-banos-y-modulos-portatiles']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BASANI S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BAUZA INGENIERIA SRL', 'Florencio Sanchez 2640', 'Laguna Paiva',
       'Santa Fe', 'http://www.bauzaingenieria.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/bauza-ingenieria-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BAUZA INGENIERIA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BAUZA INGENIERIA SRL')
  and c.slug = any(array['ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BAUZA INGENIERIA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BAYTON SA', 'Monseñor Larrumbe 3234', 'Martínez',
       'Buenos Aires', 'http://www.bayton.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-operativos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/bayton-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BAYTON SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BAYTON SA')
  and c.slug = any(array['servicios-operativos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BAYTON SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BENMONZ SA', null, 'Paraná 749 Piso 3 B',
       'CABA', 'http://www.benmonzenergie.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-petroleros-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/benmonz-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BENMONZ SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BENMONZ SA')
  and c.slug = any(array['servicios-petroleros-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BENMONZ SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BIG 6 ADVISORS', null, 'Espinosa 871',
       'CABA', 'https://big6.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/big-6-advisors/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BIG 6 ADVISORS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BIG 6 ADVISORS')
  and c.slug = any(array['consultoria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BIG 6 ADVISORS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BMI SA', null, 'Av. Juventud 11',
       'Salta', 'http://www.bmi.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/bmi-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BMI SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BMI SA')
  and c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BMI SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BRALBOL SA', 'Blvd. Drago 1065, B2700 Pergamino, Provincia de Buenos Aires', null,
       null, 'http://www.bralbol.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['big-bag','fabricacion-de-productos-textiles']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/bralbol-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BRALBOL SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BRALBOL SA')
  and c.slug = any(array['big-bag','fabricacion-de-productos-textiles']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BRALBOL SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BRIGHTSIDE IT CONSULTING SA', 'Santos Dumont 3429, Piso 3', 'Dpto. C',
       'CABA', 'http://www.brightside.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/brightside-it-consulting-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BRIGHTSIDE IT CONSULTING SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BRIGHTSIDE IT CONSULTING SA')
  and c.slug = any(array['consultoria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BRIGHTSIDE IT CONSULTING SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BROKER AIR SA', 'Ruta 202 y Balcarce', 'San Fernando',
       'Buenos Aires', 'http://www.brokerair.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['transporte-aereo-de-carga','transporte-aereo-de-pasajeros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/broker-air-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BROKER AIR SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BROKER AIR SA')
  and c.slug = any(array['transporte-aereo-de-carga','transporte-aereo-de-pasajeros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BROKER AIR SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BROMUS SOFTWARE SAS', 'Calle 14 Nro. 787, Piso 1, CP 1900, La Plata', null,
       null, 'http://www.bromus.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['software-y-ia','tecnologia-para-operaciones-industriales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/bromus-software-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BROMUS SOFTWARE SAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BROMUS SOFTWARE SAS')
  and c.slug = any(array['software-y-ia','tecnologia-para-operaciones-industriales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BROMUS SOFTWARE SAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'BULONERA BELGRANO SRL', null, 'Av. Belgrano 1534',
       'Tucumán', 'http://www.buloneriabelgrano.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ferreteria-industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/bulonera-belgrano-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('BULONERA BELGRANO SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('BULONERA BELGRANO SRL')
  and c.slug = any(array['ferreteria-industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('BULONERA BELGRANO SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CAEFE SA', 'Sucre 931', 'Rosario',
       'Santa Fe', 'http://www.caefe.com.aar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ensayos-no-destructivos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/caefe-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CAEFE SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CAEFE SA')
  and c.slug = any(array['ensayos-no-destructivos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CAEFE SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CETEC SUDAMERICANA SA', 'Wright 151 (Ex Aragón)', 'Lavallol',
       'Buenos Aires', 'http://www.cetecsudamericana.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['energy-technology','venta-y-alquiler-de-maquinaria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/cetec-sudamericana-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CETEC SUDAMERICANA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CETEC SUDAMERICANA SA')
  and c.slug = any(array['energy-technology','venta-y-alquiler-de-maquinaria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CETEC SUDAMERICANA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CHIAZA SERVICIOS INDUSTRIALES SRL', 'Ramón Saavedra 298', 'San Lorenzo',
       'Santa Fe', 'http://www.chiaza.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/chiaza-servicios-industriales-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CHIAZA SERVICIOS INDUSTRIALES SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CHIAZA SERVICIOS INDUSTRIALES SRL')
  and c.slug = any(array['montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CHIAZA SERVICIOS INDUSTRIALES SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CIMET SA', null, 'COMBET 8029',
       'Buenos Aires', 'http://www.cimet.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['energy-technology','fabricacion-de-conductores-de-energia-y-de-telecomunicaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/cimet-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CIMET SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CIMET SA')
  and c.slug = any(array['energy-technology','fabricacion-de-conductores-de-energia-y-de-telecomunicaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CIMET SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CINTER SRL', 'Parque Industrial Sauce Viejo', 'Sauce Viejo',
       'Santa Fe', 'http://www.cinter.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['estructuras-metalicas','montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/cinter-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CINTER SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CINTER SRL')
  and c.slug = any(array['estructuras-metalicas','montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CINTER SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CLAFIL SA', null, 'San Pedrito 491 1°Piso',
       'CABA', 'http://www.clafil.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['equipos-limpieza-industrial','filtros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/clafil-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CLAFIL SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CLAFIL SA')
  and c.slug = any(array['equipos-limpieza-industrial','filtros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CLAFIL SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CME ARGENTINA', 'José Hernández 370', 'Garín',
       'Buenos Aires', 'http://www.cmeargentina.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['productos-y-estructuras-en-prfv']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/cme-argentina/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CME ARGENTINA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CME ARGENTINA')
  and c.slug = any(array['productos-y-estructuras-en-prfv']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CME ARGENTINA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'COARDEL SACIFIA', null, 'Av. Nicolás Milazzo 3251',
       'Buenos Aires', 'http://www.coardel.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/coardel-sacifia/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('COARDEL SACIFIA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('COARDEL SACIFIA')
  and c.slug = any(array['ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('COARDEL SACIFIA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'COMAR', 'Panamericana KM 35.7', 'Tortuguitas',
       'Buenos Aires', 'https://www.comar.net.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['carrocerias','remolques-y-semirremolques']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/comar/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('COMAR')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('COMAR')
  and c.slug = any(array['carrocerias','remolques-y-semirremolques']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('COMAR')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'COMBE POWER', 'Dr. Ferrari 1555, B1648 BME, Provincia de Buenos Aires', null,
       null, 'http://www.combepower.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['fabricacion-de-motores-y-generadores','fabricacion-de-transformadores-electricos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/combe-power/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('COMBE POWER')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('COMBE POWER')
  and c.slug = any(array['fabricacion-de-motores-y-generadores','fabricacion-de-transformadores-electricos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('COMBE POWER')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'COMUNICAR SEGURIDAD SRL', 'LAGUNA 2928 • CABA (FISCAL)', null,
       null, 'http://WWW.COMUNICARSEGURIDAD.COM.AR%20',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['higiene-y-seguridad-en-el-trabajo','servicios-integrales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/comunicar-seguridad-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('COMUNICAR SEGURIDAD SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('COMUNICAR SEGURIDAD SRL')
  and c.slug = any(array['higiene-y-seguridad-en-el-trabajo','servicios-integrales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('COMUNICAR SEGURIDAD SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONEXTUBE SA', 'José Mazzini Nº3695', 'William Moorris',
       'Buenos Aires', 'https://www.conextube.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['abastecimiento','electricidad']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/conextube-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONEXTUBE SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONEXTUBE SA')
  and c.slug = any(array['abastecimiento','electricidad']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONEXTUBE SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONIRRAD', 'H. Yrigoyen 3228, Piso 3  Florida Oeste (B1604DIO) | Vicente López | Buenos Aires', null,
       null, 'https://www.conirrad.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-dosimetria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/conirrad/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONIRRAD')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONIRRAD')
  and c.slug = any(array['servicios-de-dosimetria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONIRRAD')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONNET SRL', 'Mendoza 1171, San Miguel de Tucumán', null,
       null, 'http://www.connetsrl.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['software-y-electricidad','telecomunicaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/connet-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONNET SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONNET SRL')
  and c.slug = any(array['software-y-electricidad','telecomunicaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONNET SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONOSUR DRILLING SA', 'Las Camelias 3324, Piso 2 Oficina 216', 'Manuel Alberti',
       'Buenos Aires', 'http://www.conosurdrilling.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['agua-y-geotecnia','industria-minera']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/conosur-drilling-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONOSUR DRILLING SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONOSUR DRILLING SA')
  and c.slug = any(array['agua-y-geotecnia','industria-minera']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONOSUR DRILLING SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONSTRUCTORA SUDAMERICANA', 'Leandro N. Alem 986', 'Piso 7',
       'CABA', 'https://www.cosud.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/constructora-sudamericana/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONSTRUCTORA SUDAMERICANA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONSTRUCTORA SUDAMERICANA')
  and c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONSTRUCTORA SUDAMERICANA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONSTRUMET', 'Genaro Roldán y AU 01', 'San Lorenzo',
       'Santa Fe', 'http://www.construmet.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/construmet/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONSTRUMET')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONSTRUMET')
  and c.slug = any(array['construcciones-y-montajes']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONSTRUMET')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONSULAR CONSULTORES ARGENTINOS ASOCIADOS SA', 'Av. Julio A. Roca 610', 'Piso 6',
       'CABA', 'http://www.consularsa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria','topografia']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/consular-consultores-argentinos-asociados-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONSULAR CONSULTORES ARGENTINOS ASOCIADOS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONSULAR CONSULTORES ARGENTINOS ASOCIADOS SA')
  and c.slug = any(array['ingenieria','topografia']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONSULAR CONSULTORES ARGENTINOS ASOCIADOS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONSULTORA GOLDEMBERG RRHH', 'Guillermo Marconi 2413', 'Olivos',
       'Buenos Aires', 'http://www.sergiogoldemberg.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultora-de-rrhh-e-higiene-seguridad']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/consultora-goldemberg-rrhh/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONSULTORA GOLDEMBERG RRHH')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONSULTORA GOLDEMBERG RRHH')
  and c.slug = any(array['consultora-de-rrhh-e-higiene-seguridad']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONSULTORA GOLDEMBERG RRHH')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONSULTRUCKS', 'O''Gorman 3284, C1437 Villa Soldati, Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.consultrucks.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/consultrucks/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONSULTRUCKS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONSULTRUCKS')
  and c.slug = any(array['logistica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONSULTRUCKS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONTROL ANDINA', 'Lobo de la Vega 1248, Oficina 5', 'Yerba Buena',
       'Tucumán', 'http://www.citcontrol.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica','rrhh']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/cit-control-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONTROL ANDINA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONTROL ANDINA')
  and c.slug = any(array['logistica','rrhh']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONTROL ANDINA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CONTROL UNION NORTE SA', 'Anzorena 80', 'Yerba Buena',
       'Tucumán', 'http://www.argentina.controlunion.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['deposito-y-almacenaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/control-union-norte-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CONTROL UNION NORTE SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CONTROL UNION NORTE SA')
  and c.slug = any(array['deposito-y-almacenaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CONTROL UNION NORTE SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'COOKINS', 'Salvador Debenedetti 2830', 'Olivos',
       'Buenos Aires', 'http://www.cookins.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['alimentos','limpieza']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/cookins/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('COOKINS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('COOKINS')
  and c.slug = any(array['alimentos','limpieza']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('COOKINS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CRUZ DEL SUR', 'Autopista Ricchieri y Boulogne Sur Mer, Mercado Central, Nave D3', 'Tapiales',
       'Buenos Aires', 'http://www.cruzdelsur.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica','transporte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/cruz-del-sur/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CRUZ DEL SUR')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CRUZ DEL SUR')
  and c.slug = any(array['logistica','transporte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CRUZ DEL SUR')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CSM', null, 'Arias 3751',
       'CABA', 'http://www.csmsa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array[]::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/csm/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CSM')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CSM')
  and c.slug = any(array[]::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CSM')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'CYSAR', 'Colectora Este Ramal Escobar Nº142', 'Escobar',
       'Buenos Aires', 'http://www.cysar.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['comercio-exterior']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/cysar/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('CYSAR')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('CYSAR')
  and c.slug = any(array['comercio-exterior']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('CYSAR')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DACHSER ARGENTINA SA', null, 'Lima 555',
       'CABA', 'http://www.dachser.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica','servicios-de-gestion-logistica-nac-e-int']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/dachser-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DACHSER ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DACHSER ARGENTINA SA')
  and c.slug = any(array['logistica','servicios-de-gestion-logistica-nac-e-int']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DACHSER ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DEISA', 'Juan López Caula 2875', 'Rafaela',
       'Santa Fe', 'http://www.desarrolloosindustriales.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/deisa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DEISA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DEISA')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DEISA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DESLER SA', 'Agüero 97, C1171 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.desleronline.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['transporte-y-tratamiento-de-residuos-industriales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/desler-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DESLER SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DESLER SA')
  and c.slug = any(array['transporte-y-tratamiento-de-residuos-industriales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DESLER SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DGR LOGISTICA', null, 'Av. San Juan 2479',
       'CABA', 'http://www.dgrlogistica.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica','transporte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/dgr-logistica/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DGR LOGISTICA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DGR LOGISTICA')
  and c.slug = any(array['logistica','transporte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DGR LOGISTICA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DISTRIZAN', 'Cnel. Antonio Susini 2238, C1414 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.distrizan.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['venta-de-bienes-de-capital']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/a-louzan-e-hijos-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DISTRIZAN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DISTRIZAN')
  and c.slug = any(array['venta-de-bienes-de-capital']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DISTRIZAN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DO BETTER', 'Ing. Enrique Butty 240, Piso 5 A', 'CABA',
       'Buenos Aires', 'https://dobetter.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/do-better/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DO BETTER')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DO BETTER')
  and c.slug = any(array['logistica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DO BETTER')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DORADO EXPLORACIONES y SERVICIOS', 'Esquiú 487-Galeria Firenze 3° piso, San Fdo. del Valle de Catamarca CP. 4700', null,
       null, 'http://www.doradoeys.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/dorado-exploraciones-y-servicios/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DORADO EXPLORACIONES y SERVICIOS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DORADO EXPLORACIONES y SERVICIOS')
  and c.slug = any(array['servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DORADO EXPLORACIONES y SERVICIOS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DREICON S.A.', 'Edificio WO Leaf Av. Ortiz de Ocampo 3220/3250 Pb. Of 4. Buenos Aires, Argentina', null,
       null, 'http://www.dreiconsa.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria','energy-technology']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/dreicon-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DREICON S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DREICON S.A.')
  and c.slug = any(array['consultoria','energy-technology']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DREICON S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DUPONT', 'Av. del Libertador 498, C1001 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.dupont.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['importadora']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/dupont/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DUPONT')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DUPONT')
  and c.slug = any(array['importadora']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DUPONT')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DURATOMIC SA', 'Pje. Carabelas 1046, B1768 Villa Madero, Provincia de Buenos Aires, Argentina', null,
       null, 'http://www.duratomic.net',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['industria-hidraulica-y-neumatica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/duratomic-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DURATOMIC SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DURATOMIC SA')
  and c.slug = any(array['industria-hidraulica-y-neumatica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DURATOMIC SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'DYNAMIS', 'Ruta 34 KM 3,5 Rosario, Sta Fe.', null,
       null, 'http://www.dynamisargentina.com.ar%20',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['alquiler-de-maquinaria','mantenimiento','reparacion-maquinaria','venta-de-maquinaria-industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/dynamis/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('DYNAMIS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('DYNAMIS')
  and c.slug = any(array['alquiler-de-maquinaria','mantenimiento','reparacion-maquinaria','venta-de-maquinaria-industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('DYNAMIS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'EBINOX MINING SRL', 'Camino Antiguo a Soldini3480', 'Rosario',
       'Santa Fe', 'http://www.ebinox.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['aceros-inoxidables']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ebinox-mining-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('EBINOX MINING SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('EBINOX MINING SRL')
  and c.slug = any(array['aceros-inoxidables']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('EBINOX MINING SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ECO DRILLING ARGENTINA SRL', 'Virgilio García 1590', 'San Lorenzo',
       'Salta', 'http://www.ecodrilling.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['perforaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/eco-drilling-argentina-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ECO DRILLING ARGENTINA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ECO DRILLING ARGENTINA SRL')
  and c.slug = any(array['perforaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ECO DRILLING ARGENTINA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ECONOVO AGROVIAL SRL', 'Autopista Córdoba-Rosario Km 629', '5986 Oncativo',
       'Córdoba', 'http://www.econovoagrovial.com.ar%20',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['comercializacion-de-maquinarias-mineras','viales-y-agricolas-2']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/econovo-agrovial-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ECONOVO AGROVIAL SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ECONOVO AGROVIAL SRL')
  and c.slug = any(array['comercializacion-de-maquinarias-mineras','viales-y-agricolas-2']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ECONOVO AGROVIAL SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ECOSAN SA', 'Buschiazzo 227', 'Don Torcuato',
       'Buenos Aires', 'http://www.ecosan.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['estructuras-metalicas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ecosan-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ECOSAN SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ECOSAN SA')
  and c.slug = any(array['estructuras-metalicas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ECOSAN SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ECOSUR BAHIA S.A.', 'Haití 227 - CP B8001DOE', null,
       null, 'http://www.ecosurbahia.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ecosur-bahia-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ECOSUR BAHIA S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ECOSUR BAHIA S.A.')
  and c.slug = any(array['construcciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ECOSUR BAHIA S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ELECTROMAC SA', 'Malabia 581, Carradilla', 'Luján de Cuyo',
       'Mendoza', 'http://www.electromacsa.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes','electromecanica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/electromac-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ELECTROMAC SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ELECTROMAC SA')
  and c.slug = any(array['construcciones-y-montajes','electromecanica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ELECTROMAC SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ELECTRORENTAL', 'Av. del Libertador 8142, CP 1429', null,
       null, 'http://www.electrorental.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['venta-y-alquiler-de-maquinaria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/electrorental/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ELECTRORENTAL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ELECTRORENTAL')
  and c.slug = any(array['venta-y-alquiler-de-maquinaria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ELECTRORENTAL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ELIZALDE TALENTO SRL', 'Figueroa Alcorta Pte. Av. 3501 Piso 3 Dpto B - CABA', null,
       null, 'https://delizalde.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['asesoria','direccion-y-gestion-empresarial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/elizalde-talento-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ELIZALDE TALENTO SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ELIZALDE TALENTO SRL')
  and c.slug = any(array['asesoria','direccion-y-gestion-empresarial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ELIZALDE TALENTO SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'EMERGENCIAS', null, 'Av. Melian 2752',
       'CABA', 'http://www.emergencias.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-salud']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/emergencias/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('EMERGENCIAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('EMERGENCIAS')
  and c.slug = any(array['servicios-de-salud']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('EMERGENCIAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'EMPRENDIMIENTOS MEC S.A.', 'Godoy Cruz 562, San José', 'Guaymallén',
       'Mendoza', 'http://www.mecsa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['climatizacion-industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/emprendimientos-mec-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('EMPRENDIMIENTOS MEC S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('EMPRENDIMIENTOS MEC S.A.')
  and c.slug = any(array['climatizacion-industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('EMPRENDIMIENTOS MEC S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ENAEX ARGENTINA SRL', null, 'LIBERTADOR DEL AV. 7270 Piso:4 1429',
       'CABA', 'http://www.enaex.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['explosivos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/enaex-argentina-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ENAEX ARGENTINA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ENAEX ARGENTINA SRL')
  and c.slug = any(array['explosivos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ENAEX ARGENTINA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ENERGREEN', null, null,
       null, 'http://www.energreen.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['venta-de-partes-y-piezas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/energreen/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ENERGREEN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ENERGREEN')
  and c.slug = any(array['venta-de-partes-y-piezas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ENERGREEN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'EPIROC ARGENTINA SA', null, 'Estados Unidos 5335',
       'CABA', 'http://www.epiroc.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/epiroc-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('EPIROC ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('EPIROC ARGENTINA SA')
  and c.slug = any(array['servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('EPIROC ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'EQUIPMENT SA', 'Benjamín Saenz Valiente 2615', 'Martínez',
       'Buenos Aires', 'http://www.equipmentsa.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['provision-mineria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/equipment-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('EQUIPMENT SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('EQUIPMENT SA')
  and c.slug = any(array['provision-mineria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('EQUIPMENT SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'EQUIPO RH', null, 'Guatemala 2036 Sur',
       'San Juan', 'http://www.equiporh.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultora-de-rrhh-e-higiene-seguridad']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/equipo-rh/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('EQUIPO RH')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('EQUIPO RH')
  and c.slug = any(array['consultora-de-rrhh-e-higiene-seguridad']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('EQUIPO RH')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'EQUIVIAL SUDAMERICANA SA', null, 'Av Olivera 294',
       'CABA', 'http://www.equivial.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['repuestos-maquinaria-vial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/equivial-sudamericana-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('EQUIVIAL SUDAMERICANA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('EQUIVIAL SUDAMERICANA SA')
  and c.slug = any(array['repuestos-maquinaria-vial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('EQUIVIAL SUDAMERICANA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ERGY', null, 'Manzana 22 - Lote 1 San Lorenzo Chico',
       'Salta', 'https://ergy.net/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['energias-renovables']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ergy/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ERGY')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ERGY')
  and c.slug = any(array['energias-renovables']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ERGY')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FAMIQ SRL', null, 'Av. San Martín 4743 (1417)',
       'CABA', 'http://www.famiq.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['aceros-inoxidables']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/famiq-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FAMIQ SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FAMIQ SRL')
  and c.slug = any(array['aceros-inoxidables']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FAMIQ SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FERMA SA', 'Kreder 2388', 'Esperanza',
       'Santa Fe', 'http://www.ferma.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['estructuras-metalicas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ferma-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FERMA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FERMA SA')
  and c.slug = any(array['estructuras-metalicas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FERMA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FERNANDEZ & CIA SRL', 'Gregorio Mayo 830', 'Trelew',
       'Chubut', 'http://www.fernandezciaconsul.wixsite.com/ingenieria',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes','consultoria','ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/fernandez-cia-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FERNANDEZ & CIA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FERNANDEZ & CIA SRL')
  and c.slug = any(array['construcciones-y-montajes','consultoria','ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FERNANDEZ & CIA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FINNING SOLUCIONES MINERAS SA', 'San Martín 140', 'Piso 2',
       'CABA', 'http://www.finning.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/finning-soluciones-mineras-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FINNING SOLUCIONES MINERAS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FINNING SOLUCIONES MINERAS SA')
  and c.slug = any(array['servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FINNING SOLUCIONES MINERAS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FJA', 'Av. Leandro N. Alem 896', 'Piso 9',
       'CABA', 'http://www.fja.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['arquitectura','ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/fja/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FJA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FJA')
  and c.slug = any(array['arquitectura','ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FJA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FLASHBOX', 'Tapalque 7251', 'Cp 1440',
       'CABA', 'http://www.flashboxlogistica.com%20',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/flashbox/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FLASHBOX')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FLASHBOX')
  and c.slug = any(array['logistica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FLASHBOX')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FLEXSEAL', 'Luis Sullivan 2991', 'Tortuguitas',
       'Buenos Aires', 'https://fseal.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['sellado-de-fluidos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/flexseal/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FLEXSEAL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FLEXSEAL')
  and c.slug = any(array['sellado-de-fluidos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FLEXSEAL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FORESTAL PICO', 'Ruta 1 y Calle 104', 'General Pico',
       'La Pampa', 'https://www.forestalpico.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['siderurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/forestal-pico/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FORESTAL PICO')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FORESTAL PICO')
  and c.slug = any(array['siderurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FORESTAL PICO')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'FUNDICION SAN CAYETANO', 'Melian 2080', 'Burzaco',
       'Buenos Aires', 'http://www.fscnet.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/fundicion-san-cayetano/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('FUNDICION SAN CAYETANO')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('FUNDICION SAN CAYETANO')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('FUNDICION SAN CAYETANO')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GASATEX SA', 'Capdevilla 4945', 'Villa Ballester',
       'Buenos Aires', 'http://www.gasatex.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['filtros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/gasatex-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GASATEX SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GASATEX SA')
  and c.slug = any(array['filtros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GASATEX SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GE21 ARGENTINA SA', 'A. Callao 1769', 'Piso 8',
       'CABA', 'https://ge21ar.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['mineria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ge21-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GE21 ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GE21 ARGENTINA SA')
  and c.slug = any(array['mineria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GE21 ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GEOMINING ARGENTINA SAS', 'Sguazzini 841', 'Las Heras',
       'Mendoza', 'https://geominingargentina.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/geomining-argentina-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GEOMINING ARGENTINA SAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GEOMINING ARGENTINA SAS')
  and c.slug = any(array['servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GEOMINING ARGENTINA SAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GEOSK SRL', 'Av. Independencia 1316 Crespo, Entre Rios, Argentina', null,
       null, 'http://www.geoskservice.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['mineros-y-ambientales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/geosk-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GEOSK SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GEOSK SRL')
  and c.slug = any(array['mineros-y-ambientales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GEOSK SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GEOTUB SA', 'Acc . Este Lat. Norte 8958', 'Rodeo de la Cruz',
       'Mendoza', 'http://www.geotub.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/geotub-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GEOTUB SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GEOTUB SA')
  and c.slug = any(array['industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GEOTUB SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GHERADI E HIJO S.A.', 'RN33 741', 'S2170 Casilda',
       'Santa Fe', 'http://www.gherardi.com.ar%20',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['herramientas-manuales','maquinaria-agricola']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/gheradi-e-hijo-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GHERADI E HIJO S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GHERADI E HIJO S.A.')
  and c.slug = any(array['herramientas-manuales','maquinaria-agricola']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GHERADI E HIJO S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GMKT', null, 'CUBA 53',
       'CABA', 'http://WWW.GMKT.COM.AR',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['comercio']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/gmkt/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GMKT')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GMKT')
  and c.slug = any(array['comercio']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GMKT')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GROUP PIPE', 'Calle 108 y 6 . Parque Industrial Sur . San Luis', null,
       null, 'http://www.grouppipe.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['tuberias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/group-pipe/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GROUP PIPE')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GROUP PIPE')
  and c.slug = any(array['tuberias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GROUP PIPE')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUAS MARTIN SA', null, 'De las Artesanías 4250',
       'Córdoba', 'http://www.gruasmartin.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicio-de-gruas-de-gran-porte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/gruas-martin-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUAS MARTIN SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUAS MARTIN SA')
  and c.slug = any(array['servicio-de-gruas-de-gran-porte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUAS MARTIN SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUAS SAN BLAS', 'Colectora Este 27.333', 'Don Torcuato',
       'Buenos Aires', 'http://gsb.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['venta-y-alquiler-de-maquinaria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/gruas-san-blas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUAS SAN BLAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUAS SAN BLAS')
  and c.slug = any(array['venta-y-alquiler-de-maquinaria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUAS SAN BLAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUPO CARTELLONE', 'Carril Rodríguez Peña 4447, M5522CKW, Maipú, Mendoza, Argentina', null,
       null, 'http://www.cartellone.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/grupo-cartellone/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUPO CARTELLONE')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUPO CARTELLONE')
  and c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUPO CARTELLONE')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUPO CETA', 'Vuelta de obligado 1878, Salta, Argentina', null,
       null, 'http://www.grupoceta.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['limpieza','logistica','servicios-de-consultoria-en-rrhh']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/grupo-ceta/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUPO CETA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUPO CETA')
  and c.slug = any(array['limpieza','logistica','servicios-de-consultoria-en-rrhh']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUPO CETA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUPO ENG SA', 'Venus 1844, 9 de Abril, Esteban Echeverria', null,
       null, 'http://www.grupoeng.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['estructuras-metalicas','montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/grupo-eng-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUPO ENG SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUPO ENG SA')
  and c.slug = any(array['estructuras-metalicas','montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUPO ENG SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUPO EUROAMERICA', 'Int. Moro 1079, B2804 Campana, Provincia de Buenos Aires, Argentina', null,
       null, 'http://www.euromerica.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica','puerto']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/grupo-euroamerica/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUPO EUROAMERICA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUPO EUROAMERICA')
  and c.slug = any(array['logistica','puerto']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUPO EUROAMERICA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUPO GENTILI', 'TERRADA 457 MAIPU MENDOZA', null,
       null, 'https://www.grupo-gentili.com.ar/grupogentili/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/grupo-gentili/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUPO GENTILI')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUPO GENTILI')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUPO GENTILI')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUPO HIMAN', 'Palmira, Jardín Bancario "6 de Noviembre", Distrito Dorrego, Departamento Guaymallén, Mendoza, M5503, Argentina', null,
       null, 'https://himan.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['aceros-inoxidables','materiales-para-construccion','reciclables']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/grupo-himan/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUPO HIMAN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUPO HIMAN')
  and c.slug = any(array['aceros-inoxidables','materiales-para-construccion','reciclables']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUPO HIMAN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUPO ROGGIO Y CONTROLADA HAUG S.A.', null, 'Av. Leandro N. Alem 1050 Piso 9',
       'CABA', 'http://www.haug.com.pe/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalmecanica','montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/factoria-metalurgica-haug-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUPO ROGGIO Y CONTROLADA HAUG S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUPO ROGGIO Y CONTROLADA HAUG S.A.')
  and c.slug = any(array['metalmecanica','montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUPO ROGGIO Y CONTROLADA HAUG S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'GRUPO ROISA', 'Reconquista 1016, C1001 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.gruporoisa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-salud']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/grupo-roisa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('GRUPO ROISA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('GRUPO ROISA')
  and c.slug = any(array['servicios-de-salud']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('GRUPO ROISA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'HAZMAT ARGENTINA', null, 'Somellera 4957',
       'CABA', 'http://www.hazmatargentina.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array[]::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/hazmat-argentina/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('HAZMAT ARGENTINA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('HAZMAT ARGENTINA')
  and c.slug = any(array[]::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('HAZMAT ARGENTINA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'HELP AGENCIA MKT', 'La Tablada ME C4', 'Gral. Güemes',
       'Salta', 'http://www.helpagencia.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/help-agencia-mkt/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('HELP AGENCIA MKT')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('HELP AGENCIA MKT')
  and c.slug = any(array['servicios']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('HELP AGENCIA MKT')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'HG PERFORACIONES', 'Calle San Rafael 1604 Oeste, Capital. San Juan, Argentina', null,
       null, 'http://www.hgperforaciones.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['perforaciones','servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/hg-perforaciones/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('HG PERFORACIONES')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('HG PERFORACIONES')
  and c.slug = any(array['perforaciones','servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('HG PERFORACIONES')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'HIDRO-MECANICA ARGENTINA SA', 'Curupaytí 3151 (B1644GDM) - Victoria - Provincia de Bs.As. - Argentina', null,
       null, 'http://www.hidromecanica.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['bombas','repuestos-y-servicios-de-mantenimiento']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/hidro-mecanica-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('HIDRO-MECANICA ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('HIDRO-MECANICA ARGENTINA SA')
  and c.slug = any(array['bombas','repuestos-y-servicios-de-mantenimiento']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('HIDRO-MECANICA ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'HIDROAR SA', 'Calle 67 No 1474', 'La Plata',
       'Buenos Aires', 'http://www.hidroar.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/hidroar-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('HIDROAR SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('HIDROAR SA')
  and c.slug = any(array['consultoria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('HIDROAR SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'HIDROMEC HIDRÁULICA', 'Velez Sarsfield 1321', 'Lanús',
       'Buenos Aires', 'http://www.hidromec-hidraulica.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['equipos-hidraulicos-y-neumaticos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/hidromec-hidraulica/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('HIDROMEC HIDRÁULICA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('HIDROMEC HIDRÁULICA')
  and c.slug = any(array['equipos-hidraulicos-y-neumaticos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('HIDROMEC HIDRÁULICA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'HIDRORIEGO', 'Zatti 1411', 'Viedma',
       'Río Negro', 'https://hidroriego.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['bombeo-de-agua','sistemas-de-riego']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/hidroriego/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('HIDRORIEGO')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('HIDRORIEGO')
  and c.slug = any(array['bombeo-de-agua','sistemas-de-riego']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('HIDRORIEGO')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'HOTWORK INTERNATIONAL SOUTH AMERICA', 'Maipú 15', 'San Nicolás',
       'Buenos Aires', 'http://www.hotwork.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-industriales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/hotwork-international-south-america/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('HOTWORK INTERNATIONAL SOUTH AMERICA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('HOTWORK INTERNATIONAL SOUTH AMERICA')
  and c.slug = any(array['servicios-industriales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('HOTWORK INTERNATIONAL SOUTH AMERICA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'IMSA SA', 'Av. Pres. Juan Domingo Perón 26399, B1722 Merlo, Provincia de Buenos Aires, Argentina', null,
       null, 'http://www.imsa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['conductores-electricos','metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/imsa-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('IMSA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('IMSA SA')
  and c.slug = any(array['conductores-electricos','metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('IMSA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INBELT SRL', 'Juan XXIII (Ex Biedma) 7257', 'Rosario',
       'Santa Fe', 'http://www.inbelt.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria-y-construccion-de-equipos-y-repuestos-para-mineria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/inbelt-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INBELT SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INBELT SRL')
  and c.slug = any(array['ingenieria-y-construccion-de-equipos-y-repuestos-para-mineria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INBELT SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INDAPCO ARGENTINA S.A', 'Sivori 1481, Campana, Provincia de Buenos Aires', null,
       null, 'http://www.indapco.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['desmontaje','fabricacion-productos-metalicos','montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/indapco-argentina-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INDAPCO ARGENTINA S.A')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INDAPCO ARGENTINA S.A')
  and c.slug = any(array['desmontaje','fabricacion-productos-metalicos','montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INDAPCO ARGENTINA S.A')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INDUMIX SA', 'Av. Las Malvinas 450 – X5125AXJ – Monte Cristo – Córdoba – Argentina', null,
       null, 'http://www.indumix.net',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalmecanica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/indumix-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INDUMIX SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INDUMIX SA')
  and c.slug = any(array['metalmecanica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INDUMIX SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INDUSTRIAL BELGRANO S.A.', 'Á. Condarco 1481 - CABA', null,
       null, 'https://ibsa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ferreteria-industrial-2','mineria','oilgas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/industrial-belgrano-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INDUSTRIAL BELGRANO S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INDUSTRIAL BELGRANO S.A.')
  and c.slug = any(array['ferreteria-industrial-2','mineria','oilgas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INDUSTRIAL BELGRANO S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INDUSTRIAS ELECTROMAGNÉTICAS VOLTHOM SA', 'Acceso Oeste, Colectora Sur KM 54, 1', 'Gral. Rodríguez',
       'Buenos Aires', 'http://www.voltohm.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/industrias-electromagneticas-volthom-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INDUSTRIAS ELECTROMAGNÉTICAS VOLTHOM SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INDUSTRIAS ELECTROMAGNÉTICAS VOLTHOM SA')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INDUSTRIAS ELECTROMAGNÉTICAS VOLTHOM SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INDUSTRIAS JUAN SECCO SA', 'Juan Pablo II 5665 (Colectora Av Circunvalación y Uriburu) Rosario', 'CP. S2010JAP',
       'Santa Fe', 'http://www.jfs.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['energy-technology','industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/industrias-juan-secco-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INDUSTRIAS JUAN SECCO SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INDUSTRIAS JUAN SECCO SA')
  and c.slug = any(array['energy-technology','industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INDUSTRIAS JUAN SECCO SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INGAV', 'Felix Frías 344, Piso 1', 'Of 3',
       'Córdoba', 'http://www.ingavconstructora.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ingav/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INGAV')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INGAV')
  and c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INGAV')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INGEAP SAS', null, 'Ituzaingó 2277',
       'Santa Fe', 'http://www.ingeap.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria','ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ingeap-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INGEAP SAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INGEAP SAS')
  and c.slug = any(array['consultoria','ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INGEAP SAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INGENIERÍA AMBIENTAL', 'Av. Monteverde 2500', 'San Francisco Solano',
       'Buenos Aires', 'http://www.ing-ambiental.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['reciclado-de-metales','refineria-de-petroleo']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ingenieria-ambiental/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INGENIERÍA AMBIENTAL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INGENIERÍA AMBIENTAL')
  and c.slug = any(array['reciclado-de-metales','refineria-de-petroleo']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INGENIERÍA AMBIENTAL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INQUINAT SA', 'Guido Spano 5792, San Martin', null,
       null, 'http://www.inquinat.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['efluentes','procesos-membranas','tratamientos-de-aguas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/inquinat-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INQUINAT SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INQUINAT SA')
  and c.slug = any(array['efluentes','procesos-membranas','tratamientos-de-aguas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INQUINAT SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INTER AMERICAN CARGO GROUP SA', null, 'Adolfo Alsina 424 Piso 8',
       'CABA', 'http://www.interamerican.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['comercio-exterior']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/inter-american-cargo-group-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INTER AMERICAN CARGO GROUP SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INTER AMERICAN CARGO GROUP SA')
  and c.slug = any(array['comercio-exterior']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INTER AMERICAN CARGO GROUP SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'INTERCONNECT S.A.', 'Av. Caseros 3563, C1437 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.ix.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['infraestructura-tecnologica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/interconnect-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('INTERCONNECT S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('INTERCONNECT S.A.')
  and c.slug = any(array['infraestructura-tecnologica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('INTERCONNECT S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ITAL VINIL SAN LUIS SAIC', null, 'Calle 106 e/ 2 y 4',
       'San Luis', 'http://www.italvinil.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['geomembranas','tuberias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ital-vinil-san-luis-saic/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ITAL VINIL SAN LUIS SAIC')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ITAL VINIL SAN LUIS SAIC')
  and c.slug = any(array['geomembranas','tuberias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ITAL VINIL SAN LUIS SAIC')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ITT BORNEMANN-GOULDS PUMPS SRL', 'Mariano Moreno 4380', 'Munro',
       'Buenos Aires', 'https://www.bornemann-ar.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['bombas','industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/itt-bornemann-goulds-pumps-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ITT BORNEMANN-GOULDS PUMPS SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ITT BORNEMANN-GOULDS PUMPS SRL')
  and c.slug = any(array['bombas','industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ITT BORNEMANN-GOULDS PUMPS SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'JS NORTE INGENIERÍA SRL', 'Pje. Manuel Quintana 524', 'San Fernando del Valle de Catamarca',
       'Catamarca', 'http://www.jsnorte.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/js-norte-ingenieria-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('JS NORTE INGENIERÍA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('JS NORTE INGENIERÍA SRL')
  and c.slug = any(array['montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('JS NORTE INGENIERÍA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'KRK LATINOAMERICANA SA', 'Blanco Encalada 1868, C1428 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.krk.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria','metalmecanica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/krk-latinoamericana-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('KRK LATINOAMERICANA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('KRK LATINOAMERICANA SA')
  and c.slug = any(array['ingenieria','metalmecanica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('KRK LATINOAMERICANA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'KURU', 'Pasaje Carabelas 235 Piso 8, CABA, Argentina', null,
       null, 'http://www.kuru.la',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/kuru/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('KURU')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('KURU')
  and c.slug = any(array['servicios']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('KURU')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'LADMILL ARGENTINA S.A.', 'Lavalle (7) Nº 3956 – CP 1884 Berazategui – Bs. As. – Argentina', null,
       null, 'http://www.ladmill.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ladmill-argentina-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('LADMILL ARGENTINA S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('LADMILL ARGENTINA S.A.')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('LADMILL ARGENTINA S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'LATIN MATERIALS', 'Av. Raymond Poincare 7026, Córdoba, Argentina', null,
       null, 'https://www.latinmaterials.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['lubricantes-y-selladores']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/latin-materials/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('LATIN MATERIALS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('LATIN MATERIALS')
  and c.slug = any(array['lubricantes-y-selladores']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('LATIN MATERIALS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'LINSER', 'Reconquista N°575, C.A.B.A.', null,
       null, 'https://www.linser.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicio-de-limpieza-general-de-edificios']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/linser/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('LINSER')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('LINSER')
  and c.slug = any(array['servicio-de-limpieza-general-de-edificios']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('LINSER')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'LISERAR SA', 'Achával Rodríguez 133, B1714PHF Ituzaingó, Provincia de Buenos Aires, Argentina', null,
       null, 'http://www.liserarsa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-gastronomicos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/liserar-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('LISERAR SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('LISERAR SA')
  and c.slug = any(array['servicios-gastronomicos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('LISERAR SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'LOGINTER SA', null, 'Av. Ramón Castillo 750',
       'CABA', 'http://www.loginter.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica','puerto']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/loginter-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('LOGINTER SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('LOGINTER SA')
  and c.slug = any(array['logistica','puerto']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('LOGINTER SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'LOGISPACK', 'Corrientes AV. 1464 Piso:20 Dpto:03 T:2 - Barrio : San Nicolas 1042- Ciudad Autonoma de Buenos Aires', null,
       null, 'https://www.enviopack.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-gestion-y-logistica-para-el-transporte-de-mercaderias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/logispack/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('LOGISPACK')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('LOGISPACK')
  and c.slug = any(array['servicios-de-gestion-y-logistica-para-el-transporte-de-mercaderias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('LOGISPACK')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'LOGÍSTICA INTERNACIONAL DIEB SA', 'Huergo 953 piso 4, C1107AOW', null,
       null, 'http://www.logisticadieb.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['forwarder','logistica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/logistica-internacional-dieb-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('LOGÍSTICA INTERNACIONAL DIEB SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('LOGÍSTICA INTERNACIONAL DIEB SA')
  and c.slug = any(array['forwarder','logistica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('LOGÍSTICA INTERNACIONAL DIEB SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'LOTUSPACK', 'KM76, RN7, B6712 Cortínez, Provincia de Buenos Aires, Argentina', null,
       null, 'https://www.lotuspack.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['packaging']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/lotus-pack/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('LOTUSPACK')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('LOTUSPACK')
  and c.slug = any(array['packaging']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('LOTUSPACK')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'M3 ARGENTINA SRL', 'Av. Cabildo 642', 'Piso 1',
       'CABA', 'http://www.m3eng.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/m3-argentina-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('M3 ARGENTINA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('M3 ARGENTINA SRL')
  and c.slug = any(array['ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('M3 ARGENTINA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MACS SA', 'Carlos Calvo 590, La Lonja', 'Pilar',
       'Buenos Aires', 'http://www.macs-sa.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['efluentes','energy-technology','tratamientos-de-aguas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/macs-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MACS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MACS SA')
  and c.slug = any(array['efluentes','energy-technology','tratamientos-de-aguas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MACS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MADE SRL', null, 'Av. del Bicentenario 1024',
       'Salta', 'https://madesrl.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/made-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MADE SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MADE SRL')
  and c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MADE SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MAFISSA', 'Av. 44 Nº4450 esq. 184, Lisandro Olmos', 'La Plata',
       'Buenos Aires', 'https://www.mafissa.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['geosinteticos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/mafissa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MAFISSA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MAFISSA')
  and c.slug = any(array['geosinteticos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MAFISSA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MAGNALIFE SA', 'Reconquista 672', 'Piso 10',
       'CABA', 'http://www.magnalife.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['seguros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/magnalife-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MAGNALIFE SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MAGNALIFE SA')
  and c.slug = any(array['seguros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MAGNALIFE SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MANPOWER GROUP ARGENTINA', null, 'Corrientes 800 Piso 31',
       'CABA', 'http://www.manpowergroup.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['rrhh']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/manpower-group-argentina/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MANPOWER GROUP ARGENTINA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MANPOWER GROUP ARGENTINA')
  and c.slug = any(array['rrhh']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MANPOWER GROUP ARGENTINA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MANUEL BENITEZ ABOGADOS', null, 'Av. Callao 1769 Piso 8',
       'CABA', 'http://www.mbenitezabogados.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/manuel-benitez-abogados/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MANUEL BENITEZ ABOGADOS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MANUEL BENITEZ ABOGADOS')
  and c.slug = any(array['consultoria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MANUEL BENITEZ ABOGADOS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MARLEW SA', 'José María Freire 34, B1868AXB Piñeyro, Provincia de Buenos Aires, Argentina', null,
       null, 'http://www.marlew.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['conductores-electricos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/marlew-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MARLEW SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MARLEW SA')
  and c.slug = any(array['conductores-electricos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MARLEW SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MARSH SA', null, 'Florida 234 Piso 2',
       'CABA', 'http://www.marsh.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['seguros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/marsh-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MARSH SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MARSH SA')
  and c.slug = any(array['seguros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MARSH SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MECA INGENIERIA SAS', 'Yerba Buena, Tucumán, Argentina CP 4000', null,
       null, 'http://mecaingenieria.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-ingenieria-y-montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/meca-ingenieria-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MECA INGENIERIA SAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MECA INGENIERIA SAS')
  and c.slug = any(array['servicios-de-ingenieria-y-montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MECA INGENIERIA SAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MEFA SRL', 'Fournier 940, S2200 San Lorenzo, Santa Fe, Argentina', null,
       null, 'https://www.linkedin.com/company/mefa-ingenier%C3%ADa',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes','estructuras-metalicas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/mefa-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MEFA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MEFA SRL')
  and c.slug = any(array['construcciones-y-montajes','estructuras-metalicas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MEFA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MEIP INGENIERIA SRL', 'Planta 1: Hipolito Vieytes 859 - Villa Martelli - Buenos Aires - Argentina', null,
       null, 'http://www.meip.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['gas','ingenieria','petroleo']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/meip-ingenieria-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MEIP INGENIERIA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MEIP INGENIERIA SRL')
  and c.slug = any(array['gas','ingenieria','petroleo']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MEIP INGENIERIA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MERCOMAR SA', 'Arias 1639, C1429 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.robinsongroup.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['soluciones-logisticas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/mercomar-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MERCOMAR SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MERCOMAR SA')
  and c.slug = any(array['soluciones-logisticas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MERCOMAR SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'METALAR SA', 'Oficina Central y Planta de Mecanizado - Diego de Villaroel 177, San Miguel de Tucumán Tucumán, 4000, Argentina', null,
       null, 'http://www.metalarsa.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria','metalurgica','montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/metalar-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('METALAR SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('METALAR SA')
  and c.slug = any(array['ingenieria','metalurgica','montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('METALAR SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'METALURGICA ALBACE SA', 'Alberdi 846, E3285 Colón, Entre Ríos, Argentina', null,
       null, 'http://www.metalurgicaalbace.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/metalurgica-albace-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('METALURGICA ALBACE SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('METALURGICA ALBACE SA')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('METALURGICA ALBACE SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'METALÚRGICA SARMIENTO SRL', 'Soler 1165', 'Esperanza',
       'Santa Fe', 'http://www.metalurgicasarmiento.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/metalurgica-sarmiento-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('METALÚRGICA SARMIENTO SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('METALÚRGICA SARMIENTO SRL')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('METALÚRGICA SARMIENTO SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'METIRIVANT', 'Suipacha 2233, X5004EKA Córdoba, Argentina', null,
       null, 'http://www.metirivant.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['capacitaciones','topografia']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/metirivant/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('METIRIVANT')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('METIRIVANT')
  and c.slug = any(array['capacitaciones','topografia']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('METIRIVANT')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MFP ASOCIADOS', 'Intendente Becco 2380, Dpto 17, Beccar', 'San Isidro',
       'Buenos Aires', 'http://S/WEB',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/mfp-asociados/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MFP ASOCIADOS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MFP ASOCIADOS')
  and c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MFP ASOCIADOS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MIKULAN', 'Mendoza 3157, San Andrés. Buenos Aires, Argentina. CP 1651', null,
       null, 'http://www.mikulan.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['mangueras','tuberias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/mikulan/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MIKULAN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MIKULAN')
  and c.slug = any(array['mangueras','tuberias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MIKULAN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MILICIC SA', 'Milicic, 8110, Avenida Presidente Perón, Distrito Industrial Presidente Perón, Godoy, Distrito Oeste, Rosario, Municipio de Rosario, Gran Rosario, Departamento Rosario, Santa Fe, S2010ACS, Argentina', null,
       null, 'http://www.milicic.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/milicic-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MILICIC SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MILICIC SA')
  and c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MILICIC SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MINERAR', 'Bouchard 547, C1001 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.minerar.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/minerar/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MINERAR')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MINERAR')
  and c.slug = any(array['servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MINERAR')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MINETECH SRL', 'Ruta 40, 56 norte, Barrio Buenos Aires', 'Departamento Chimbas',
       'San Juan', 'http://www.minetech.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-comunicaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/minetech-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MINETECH SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MINETECH SRL')
  and c.slug = any(array['servicios-de-comunicaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MINETECH SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MINEXUS S.A.', 'Av. Libertador Gral. San Martín 1890, J5400 San Juan, Argentina', null,
       null, 'http://www.minexus.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['codin']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/minexus-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MINEXUS S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MINEXUS S.A.')
  and c.slug = any(array['codin']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MINEXUS S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MOVILMED ELECTUS', 'Martín Miguel de Güemes 250', 'Godoy Cruz',
       'Mendoza', 'https://movilmed.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['salud']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/movilmed-electus/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MOVILMED ELECTUS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MOVILMED ELECTUS')
  and c.slug = any(array['salud']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MOVILMED ELECTUS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MR. GARDEN', 'Domingo F. Sarmiento 151, X5000 EYC, Córdoba, Argentina', null,
       null, 'https://www.mrgarden.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['electromecanica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/mr-garden/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MR. GARDEN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MR. GARDEN')
  and c.slug = any(array['electromecanica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MR. GARDEN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MTO SERVICIOS HVAC', 'Domingo Faustino Sarmiento 2473, B1636AIC Olivos, Provincia de Buenos Aires, Argentina', null,
       null, 'http://www.mtoservicioshvac.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array[]::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/mto-servicios-hvac/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MTO SERVICIOS HVAC')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MTO SERVICIOS HVAC')
  and c.slug = any(array[]::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MTO SERVICIOS HVAC')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MULTIPOL SERVICIOS INDUSTRIALES', 'Bernardo de Irigoyen 864, Zárate Buenos Aires', null,
       null, 'https://multipol.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-industriales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/multipol-servicios-industriales/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MULTIPOL SERVICIOS INDUSTRIALES')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MULTIPOL SERVICIOS INDUSTRIALES')
  and c.slug = any(array['servicios-industriales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MULTIPOL SERVICIOS INDUSTRIALES')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MULTISERVICIOS JUJUY', 'Calle Keller 125 B° Crnel Arias – San Salvador de Jujuy', null,
       null, null,
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['bombas','estructuras-metalicas','repuestos-maquinarias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/multiservicios-jujuy/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MULTISERVICIOS JUJUY')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MULTISERVICIOS JUJUY')
  and c.slug = any(array['bombas','estructuras-metalicas','repuestos-maquinarias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MULTISERVICIOS JUJUY')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MUNI WORK', '870, Gurruchaga, Villa Crespo, Buenos Aires, Comuna 15, Ciudad Autónoma de Buenos Aires, C1414AWO, Argentina', null,
       null, 'https://muniwork.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['venta-de-epp']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/muni-work/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MUNI WORK')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MUNI WORK')
  and c.slug = any(array['venta-de-epp']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MUNI WORK')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'MYEEL', 'Los Patos 2645, C1437JAA Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.myeel.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['medidores-y-equipos-electricos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/myeel-medidores-y-equipos-electricos-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('MYEEL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('MYEEL')
  and c.slug = any(array['medidores-y-equipos-electricos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('MYEEL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'NEXSAT S.A.', 'Marcos Sastre 1088 (B1629), EL Talar de Pacheco, Buenos Aires, Argentina', null,
       null, 'http://nexsatsa.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['gerenciamiento-de-riesgo-y-seguridad']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/nexsat-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('NEXSAT S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('NEXSAT S.A.')
  and c.slug = any(array['gerenciamiento-de-riesgo-y-seguridad']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('NEXSAT S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'NOATUM LOGISTICS ARGENTINA INC SRL', 'Av. Córdoba 673 Piso 2 - Oficina B - Capital Federal CP 1054 Buenos Aires Argentina', null,
       null, 'http://www.noatumlogistics.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/noatum-logistics-argentina-inc-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('NOATUM LOGISTICS ARGENTINA INC SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('NOATUM LOGISTICS ARGENTINA INC SRL')
  and c.slug = any(array['logistica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('NOATUM LOGISTICS ARGENTINA INC SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'OMINT', null, 'Carlos pellegrini 1363 Piso 6',
       'CABA', 'http://www.omint.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['planes-de-medicina-prepaga']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/omint/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('OMINT')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('OMINT')
  and c.slug = any(array['planes-de-medicina-prepaga']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('OMINT')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ORICA ARGENTINA SAIC', null, '25 de mayo 749 Piso 1 Dpto 3',
       'CABA', 'http://www.oricaminingservices.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/orica-argentina-saic/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ORICA ARGENTINA SAIC')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ORICA ARGENTINA SAIC')
  and c.slug = any(array['servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ORICA ARGENTINA SAIC')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PALMERO SAN LUIS SA', 'Ruta Panamericana KM 35.5', 'Grand Bourg',
       'Buenos Aires', 'http://www.palmero.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['proveedore-de-equipamiento']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/palmero-san-luis-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PALMERO SAN LUIS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PALMERO SAN LUIS SA')
  and c.slug = any(array['proveedore-de-equipamiento']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PALMERO SAN LUIS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'Pamela Alvarez', 'Gervasio Méndez 5040', 'Moreno',
       'Buenos Aires', null,
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['asesoria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/pamela-alvarez/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('Pamela Alvarez')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('Pamela Alvarez')
  and c.slug = any(array['asesoria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('Pamela Alvarez')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PEOPLE &#038; IMPACT', 'Buenos Aires 135, 3er piso', 'Of. 308',
       'Salta', null,
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria','servicios-de-consultoria-en-rrhh']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/people-impact/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PEOPLE &#038; IMPACT')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PEOPLE &#038; IMPACT')
  and c.slug = any(array['consultoria','servicios-de-consultoria-en-rrhh']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PEOPLE &#038; IMPACT')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PIRCA', 'Frank Lloyd Wright 2474, El Triangulo', 'Malvinas Argentinas',
       'Buenos Aires', 'http://www.Pirca-Safety.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['refugios-mineros','seguridad']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/pirca/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PIRCA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PIRCA')
  and c.slug = any(array['refugios-mineros','seguridad']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PIRCA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PLASTICOS UNIVERSAL SAS', 'RN9 km 464,5, X2594 Leones, Córdoba, Argentina', null,
       null, 'https://www.plasticouniversal.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['efluentes','plasticos','tratamientos-de-aguas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/plasticos-universal-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PLASTICOS UNIVERSAL SAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PLASTICOS UNIVERSAL SAS')
  and c.slug = any(array['efluentes','plasticos','tratamientos-de-aguas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PLASTICOS UNIVERSAL SAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PLASTIFERRO TUBOS SA', 'Av. Gral. Paz 8950, C1408 Cdad. Autónoma de Buenos Aires, Argentina', null,
       null, 'http://www.plastiferro.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['tuberias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/plastiferro-tubos-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PLASTIFERRO TUBOS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PLASTIFERRO TUBOS SA')
  and c.slug = any(array['tuberias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PLASTIFERRO TUBOS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PRELAST SRL', 'Coronel Lorenzo Barcala 5048, S2000 Rosario, Santa Fe, Argentina', null,
       null, 'http://www.prelast.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['caucho','construcciones-y-montajes']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/prelast-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PRELAST SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PRELAST SRL')
  and c.slug = any(array['caucho','construcciones-y-montajes']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PRELAST SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PRENTEX', 'Av. Rep. del Libano 4174', 'Villa Lynch',
       'Buenos Aires', 'http://www.prentex.net',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['seguridad-industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/prentex/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PRENTEX')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PRENTEX')
  and c.slug = any(array['seguridad-industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PRENTEX')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PROION', 'Brown 460 (B8000LQJ) Bahía Blanca, Argentina', null,
       null, 'http://www.proion.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/proion/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PROION')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PROION')
  and c.slug = any(array['ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PROION')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PROSEIND SA', '1053, 26 de Agosto, La Florida, Celedonio Escalada, Distrito Norte, Rosario, Municipio de Rosario, Gran Rosario, Departamento Rosario, Santa Fe, S2005, Argentina', null,
       null, 'http://www.proseind.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['seguridad-industrial','venta']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/proseind-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PROSEIND SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PROSEIND SA')
  and c.slug = any(array['seguridad-industrial','venta']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PROSEIND SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PROVEMET', 'Av. J M de Rosas 1230', 'Lomas del Mirador',
       'Buenos Aires', 'http://www.grupoprovemet.com.aar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['canos-de-acero','tuberias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/provemet/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PROVEMET')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PROVEMET')
  and c.slug = any(array['canos-de-acero','tuberias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PROVEMET')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PUENTE HNOS SA', 'Edificio República', 'Tucumán 1 Piso 14',
       'CABA', 'https://www.puentenet.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-financieros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/puente-hnos-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PUENTE HNOS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PUENTE HNOS SA')
  and c.slug = any(array['servicios-financieros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PUENTE HNOS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PUERTAS SRL', 'Av. Pres. Néstor Kirchner 3489, T4000 San Miguel de Tucumán, Tucumán, Argentina', null,
       null, 'http://www.puertassrl.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes','electromecanica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/puertas-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PUERTAS SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PUERTAS SRL')
  and c.slug = any(array['construcciones-y-montajes','electromecanica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PUERTAS SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PUNA DE ATACAMA SRL', 'Av. Intersindical esq. Av. 9 de Julio', 'San Salvador de Jujuy',
       'Jujuy', null,
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['transporte-de-pasajeros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/puna-de-atacama-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PUNA DE ATACAMA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PUNA DE ATACAMA SRL')
  and c.slug = any(array['transporte-de-pasajeros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PUNA DE ATACAMA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'PYAT SA', '2560, Carlos Calvo, San Cristóbal, Buenos Aires, Comuna 3, Autonomous City of Buenos Aires, 1219, Argentina', null,
       null, 'http://www.pyatargentina.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['comercio']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/pyat-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('PYAT SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('PYAT SA')
  and c.slug = any(array['comercio']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('PYAT SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'QG SAFETY', 'Av. de los Lagos 6855', 'Rincón de Milberg',
       'Buenos Aires', 'http://qgsafety.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['seguridad','seguridad-e-higiene']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/qg-safety/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('QG SAFETY')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('QG SAFETY')
  and c.slug = any(array['seguridad','seguridad-e-higiene']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('QG SAFETY')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'RECTIFICACIONES MACÍAS', '3846, Avenida Carlos Pellegrini, Echesortu, Distrito Centro, Rosario, Municipio de Rosario, Gran Rosario, Departamento Rosario, S2002, Argentina', null,
       null, 'http://www.rectificadoramacias.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['rectificacion-de-motores','repuestos-para-motores']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/rectificaciones-macias/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('RECTIFICACIONES MACÍAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('RECTIFICACIONES MACÍAS')
  and c.slug = any(array['rectificacion-de-motores','repuestos-para-motores']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('RECTIFICACIONES MACÍAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'RF COMERCIO EXTERIOR SRL', 'Deán Funes 380 - Planta Baja, Oficina B4 Ciudad de Salta Capital - CP 4400 - Argentina', null,
       null, 'https://www.rfcomex.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['gestion-de-agentes-de-transp-aduanero','transporte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/rf-comercio-exterior-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('RF COMERCIO EXTERIOR SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('RF COMERCIO EXTERIOR SRL')
  and c.slug = any(array['gestion-de-agentes-de-transp-aduanero','transporte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('RF COMERCIO EXTERIOR SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'RIO CHICO SA', 'Av. M. T. Alvear 4266, Ciudadela', null,
       null, 'http://www.ipesa.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['fabricacion-de-conductores-de-energia-y-de-telecomunicaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/rio-chico-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('RIO CHICO SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('RIO CHICO SA')
  and c.slug = any(array['fabricacion-de-conductores-de-energia-y-de-telecomunicaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('RIO CHICO SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'RUCA PANEL SRL', 'Cafferatta 3229, Parque Industrial', 'Burzaco',
       'Buenos Aires', 'http://www.rucapanel.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construccion-modular']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ruca-panel-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('RUCA PANEL SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('RUCA PANEL SRL')
  and c.slug = any(array['construccion-modular']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('RUCA PANEL SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'RUHRPUMPEN ARGENTINA SA', null, 'Le Corbusier 240',
       'Buenos Aires', 'http://www.ruhrpumpen.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['bombas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ruhrpumpen-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('RUHRPUMPEN ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('RUHRPUMPEN ARGENTINA SA')
  and c.slug = any(array['bombas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('RUHRPUMPEN ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SAFRAN PUNA', 'José Hernández S/N', 'Valle Viejo',
       'Catamarca', null,
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['gastronomia','hoteleria','limpieza']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/safran-puna/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SAFRAN PUNA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SAFRAN PUNA')
  and c.slug = any(array['gastronomia','hoteleria','limpieza']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SAFRAN PUNA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SALPARK SRL', 'Piedras 614, C1070AAN Cdad. Autónoma de Buenos Aires', null,
       null, 'http://www.salpark.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['bombas','generadores','motores']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/salpark-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SALPARK SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SALPARK SRL')
  and c.slug = any(array['bombas','generadores','motores']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SALPARK SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SAN MARTIN GROUP', 'Martín Fierro 4935, Ituzaingó, Partido de Ituzaingó, Buenos Aires, Argentina', null,
       null, 'http://transpsanmartin.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-de-gestion-logistica-nac-e-int','transporte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/san-martin-group/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SAN MARTIN GROUP')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SAN MARTIN GROUP')
  and c.slug = any(array['servicios-de-gestion-logistica-nac-e-int','transporte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SAN MARTIN GROUP')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SANDVIK MINING AND CONSTRUCTION ARGENTINA S.A.', 'Rincon 3198', 'San Justo',
       'Buenos Aires', 'http://www.rocktechnology.sandvik',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['equipos-e-implementos-de-uso-especial-n-c-p']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/sandvik-mining-and-construction-argentina-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SANDVIK MINING AND CONSTRUCTION ARGENTINA S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SANDVIK MINING AND CONSTRUCTION ARGENTINA S.A.')
  and c.slug = any(array['equipos-e-implementos-de-uso-especial-n-c-p']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SANDVIK MINING AND CONSTRUCTION ARGENTINA S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SAXUM INGENIERÍA', null, 'Marcial Imbaud 35 y Yerba Buena',
       'Tucumán', 'http://www.saxuming.net',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/saxum-ingenieria/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SAXUM INGENIERÍA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SAXUM INGENIERÍA')
  and c.slug = any(array['ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SAXUM INGENIERÍA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SEGUFER', 'Toll 2875, C.A.B.A.', null,
       null, 'http://www.segufer.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ferreteria-industrial','seguridad-industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/segufer/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SEGUFER')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SEGUFER')
  and c.slug = any(array['ferreteria-industrial','seguridad-industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SEGUFER')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SERMICAT SRL', '1236, Fray Mamerto Esquiú, El Altillo, Santa María, Municipio de Santa María, Departamento Santa María, Catamarca, K4139, Argentina', null,
       null, 'http://www.sermicat.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes','servicios-industriales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/sermicat-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SERMICAT SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SERMICAT SRL')
  and c.slug = any(array['construcciones-y-montajes','servicios-industriales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SERMICAT SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SERVELEC SRL', null, 'Roma 1358',
       'Córdoba', 'https://www.servelec.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['energy-technology']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/servelec-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SERVELEC SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SERVELEC SRL')
  and c.slug = any(array['energy-technology']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SERVELEC SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SERVICIOS  GOL', 'Ruta 42, km 36', 'Monterrico',
       'Jujuy', 'https://serviciosgol.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['alquiler-de-camionetas-para-mineria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/servicios-gol/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SERVICIOS  GOL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SERVICIOS  GOL')
  and c.slug = any(array['alquiler-de-camionetas-para-mineria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SERVICIOS  GOL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SERVICIOS ARM SA', 'Cuyo 2636, (B1640GIN), Martinez, Buenos Aires, Argentina', null,
       null, 'http://www.serviciosarm.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['equipamiento-medico','servicios-de-salud']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/servicios-arm-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SERVICIOS ARM SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SERVICIOS ARM SA')
  and c.slug = any(array['equipamiento-medico','servicios-de-salud']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SERVICIOS ARM SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SERVICIOS SAN JOSÉ', 'Alberro 730, San Salvador de Jujuy', null,
       null, null,
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['alquiler-de-equipos-pesados']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/servicios-san-jose/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SERVICIOS SAN JOSÉ')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SERVICIOS SAN JOSÉ')
  and c.slug = any(array['alquiler-de-equipos-pesados']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SERVICIOS SAN JOSÉ')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SERVICIOS VIALES DE SANTA FE', null, 'Rosa Carmen All 1551',
       'Santa Fe', 'https://sv.com.ar/servicios/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['alquiler-de-equipos','repuestos-y-filtros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/servicios-viales-de-santa-fe/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SERVICIOS VIALES DE SANTA FE')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SERVICIOS VIALES DE SANTA FE')
  and c.slug = any(array['alquiler-de-equipos','repuestos-y-filtros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SERVICIOS VIALES DE SANTA FE')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SERVIGRUAS SA', 'Av. República de Siria 2141 - San Miguel de Tucumán', null,
       null, 'http://www.servigruas.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array[]::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/servigruas-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SERVIGRUAS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SERVIGRUAS SA')
  and c.slug = any(array[]::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SERVIGRUAS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SGS ARGENTINA SA', 'Tronador 4890 - Piso 3° ,  C1430DNN,  Ciudad Autónoma de Buenos Aires,  Argentina', null,
       null, 'http://www.sgsgroup.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/sgs-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SGS ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SGS ARGENTINA SA')
  and c.slug = any(array['servicios']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SGS ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SICA METALURGICA ARGENTINA SA', 'Rvdo, Kreder 3746', 'S3080 Esperanza',
       'Santa Fe', 'http://www.sica.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/sica-metalurgica-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SICA METALURGICA ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SICA METALURGICA ARGENTINA SA')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SICA METALURGICA ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SICLONET S.A.', 'Manuel Belzu 1939', 'Olivos',
       'Buenos Aires', 'http://www.siclonet.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['accesorios-industriales','valvulas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/siclonet-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SICLONET S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SICLONET S.A.')
  and c.slug = any(array['accesorios-industriales','valvulas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SICLONET S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SIDERSA SA', 'Madres de Plaza 25 de Mayo 3020, Piso 15', 'Rosario',
       'Santa Fe', 'http://www.sidersa.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/sidersa-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SIDERSA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SIDERSA SA')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SIDERSA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SIMCYA SRL', 'Mitre 870', 'piso 6 oficina 8',
       'Mendoza', 'http://WWW.SIMCYA.COM.AR',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['repuestos-y-servicios-de-mantenimiento']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/simcya-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SIMCYA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SIMCYA SRL')
  and c.slug = any(array['repuestos-y-servicios-de-mantenimiento']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SIMCYA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SINAR EQUIPMENT SAS', null, 'Rivadavia 1750 5ºM',
       'Salta', 'http://No%20tiene',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['alquiler-de-maquinaria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/sinar-equipment-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SINAR EQUIPMENT SAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SINAR EQUIPMENT SAS')
  and c.slug = any(array['alquiler-de-maquinaria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SINAR EQUIPMENT SAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SNAP ENVIRO SCIENCE SRL', 'Valentín Gómez 151', 'Haedo',
       'Buenos Aires', 'http://www.snapenviro.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['soluciones-ambientales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/snap-enviro-science-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SNAP ENVIRO SCIENCE SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SNAP ENVIRO SCIENCE SRL')
  and c.slug = any(array['soluciones-ambientales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SNAP ENVIRO SCIENCE SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SOLAER INGENIERÍA ARGENTINA SA', 'Calle 31 N° 1905', 'La Plata',
       'Buenos Aires', 'https://solaeringenieria.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/solaer-ingenieria-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SOLAER INGENIERÍA ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SOLAER INGENIERÍA ARGENTINA SA')
  and c.slug = any(array['ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SOLAER INGENIERÍA ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SOLUCIONES GEOESPACIALES', 'Junín 1140 b, C1113AAH Cdad. Autónoma de Buenos Aires', null,
       null, 'http://www.soluciones-geoespaciales.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['exploracion','procesamiento-de-datos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/soluciones-geoespaciales/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SOLUCIONES GEOESPACIALES')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SOLUCIONES GEOESPACIALES')
  and c.slug = any(array['exploracion','procesamiento-de-datos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SOLUCIONES GEOESPACIALES')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SOUTHCROSS LOGISTICS SA', null, 'Av. Libertador 213 Piso 13',
       'CABA', 'http://www.southcrosslog.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/southcross-logistics-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SOUTHCROSS LOGISTICS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SOUTHCROSS LOGISTICS SA')
  and c.slug = any(array['logistica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SOUTHCROSS LOGISTICS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SPEED TRANSPORT ARGENTINA SA', null, 'Esmeralda 740 Piso 4 Of. 413/414',
       'CABA', 'http://www.speedargentina.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica','servicios-de-gestion-logistica-nac-e-int']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/speed-transport-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SPEED TRANSPORT ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SPEED TRANSPORT ARGENTINA SA')
  and c.slug = any(array['logistica','servicios-de-gestion-logistica-nac-e-int']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SPEED TRANSPORT ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SPIRAX SARCO SA', 'Colectora Este Panemaricana 24951', 'Don Torcuato',
       'Buenos Aires', 'http://www.spiraxsarco.com/global/es-ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['grifos-y-valvulas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/spirax-sarco-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SPIRAX SARCO SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SPIRAX SARCO SA')
  and c.slug = any(array['grifos-y-valvulas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SPIRAX SARCO SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'STALER SAS', '9 de Julio 891', 'Godoy Cruz',
       'Mendoza', 'http://www.stalersas.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['electricidad']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/staler-sas/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('STALER SAS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('STALER SAS')
  and c.slug = any(array['electricidad']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('STALER SAS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'STRADA SA', 'Av. Filippini 1421 V. G. G. - Santa Fe - Argentina', null,
       null, 'http://www.strada.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['industrial','plasticos']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/strada-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('STRADA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('STRADA SA')
  and c.slug = any(array['industrial','plasticos']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('STRADA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'Suarez & Asociados', 'Santa María, Catamarca, Argentina', null,
       null, 'http://www.suarezyasociados.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['capacitaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/capacitartehoy/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('Suarez & Asociados')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('Suarez & Asociados')
  and c.slug = any(array['capacitaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('Suarez & Asociados')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SUPERCEMENTO SAIC', '3 de Febrero 2750', 'Piso 2',
       'CABA', 'http://www.superdyop.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/supercemento-saic/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SUPERCEMENTO SAIC')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SUPERCEMENTO SAIC')
  and c.slug = any(array['construcciones-y-montajes']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SUPERCEMENTO SAIC')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'SURTECNICA', '25 de Mayo 2085', 'Guaymallén',
       'Mendoza', 'https://surtecnica.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['metalurgica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/surtecnica/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('SURTECNICA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('SURTECNICA')
  and c.slug = any(array['metalurgica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('SURTECNICA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TDL SA', 'Marcos Sastre 54, San Miguel B1663KZB, Buenos Aires Argentina', null,
       null, 'http://www.rejillasmetalicas.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['rejillas-metalicas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/tdl-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TDL SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TDL SA')
  and c.slug = any(array['rejillas-metalicas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TDL SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TECHAARG SRL', 'Juan XXIII 7567', 'Rosario',
       'Santa Fe', 'http://www.techaarg.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria','montaje']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/techaarg-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TECHAARG SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TECHAARG SRL')
  and c.slug = any(array['ingenieria','montaje']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TECHAARG SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TECIN MINERIA SRL', 'Gobernador Castro 3393/99 | (B1606DXK) Villa Adelina', null,
       null, 'http://www.tecin-mineria.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/tecin-mineria-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TECIN MINERIA SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TECIN MINERIA SRL')
  and c.slug = any(array['servicios-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TECIN MINERIA SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TECMEC SRL', 'Colón 631', 'M5501 Godoy Cruz',
       'Mendoza', 'https://tecmecsrl.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['provisiones-y-consumibles']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/tecmec-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TECMEC SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TECMEC SRL')
  and c.slug = any(array['provisiones-y-consumibles']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TECMEC SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TECNODINAMIA FUNDAL SA', 'Dorrego 3493 - San Andrés -  San Martin - C.P. 1651 - Bs As - Argentina', null,
       null, 'http://www.fundaltransmisiones.com.ar%20',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['fabricacion-de-equipo-para-industrias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/tecnodinamia-fundal-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TECNODINAMIA FUNDAL SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TECNODINAMIA FUNDAL SA')
  and c.slug = any(array['fabricacion-de-equipo-para-industrias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TECNODINAMIA FUNDAL SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TECNON', 'Martina Céspedes 2869 (Bl607CRM) Villa Adelina Prov. de Buenos Aires', null,
       null, 'http://www.tecnongroup.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['servicios-industriales']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/tecnon/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TECNON')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TECNON')
  and c.slug = any(array['servicios-industriales']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TECNON')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TERMINAL ZARATE SA', 'Félix Pagola 2671 Zárate - Bs. As. - Argentina', null,
       null, 'http://www.terminalzarate.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['puerto']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/terminal-zarate-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TERMINAL ZARATE SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TERMINAL ZARATE SA')
  and c.slug = any(array['puerto']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TERMINAL ZARATE SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'THERMODYNE VIAL S.A.', 'Coronel Salvadores 1191', 'PB',
       'CABA', 'http://www.thermodynevial.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['equipos-y-maquinaria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/thermodyne-vial-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('THERMODYNE VIAL S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('THERMODYNE VIAL S.A.')
  and c.slug = any(array['equipos-y-maquinaria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('THERMODYNE VIAL S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'THOR Tecnología en Minería S.A.', '25 DE MAYO 432 Piso:15 - CABA', null,
       null, 'http://www.thor-sa.com%20',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['mineria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/thor-tecnologia-en-mineria-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('THOR Tecnología en Minería S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('THOR Tecnología en Minería S.A.')
  and c.slug = any(array['mineria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('THOR Tecnología en Minería S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TIBA ARGENTINA SA', null, '25 de Mayo 81',
       'CABA', 'http://www.tibagroup.com/es/agentes-carga-buenos-aires',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/tiba-argentina-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TIBA ARGENTINA SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TIBA ARGENTINA SA')
  and c.slug = any(array['logistica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TIBA ARGENTINA SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TRANSMINING SA', 'Ejército de los Andes 271, A4400 Salta', null,
       null, 'http://www.transmining.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array[]::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/transmining-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TRANSMINING SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TRANSMINING SA')
  and c.slug = any(array[]::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TRANSMINING SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TRANSPORTE ALFRECAR SA', 'Fournier 1988 Piso 1. Gregorio Laferrere. Buenos Aires (1757)', null,
       null, 'https://www.alfrecar.com.ar/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['transporte-terrestre-de-cargas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/transporte-alfrecar-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TRANSPORTE ALFRECAR SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TRANSPORTE ALFRECAR SA')
  and c.slug = any(array['transporte-terrestre-de-cargas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TRANSPORTE ALFRECAR SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TRANSPORTE ECHAZÚ', 'Ex estación de servicios AGSA', 'Famaillá',
       'Tucumán', 'http://www.echazugroup.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['transporte-de-cargas-pesadas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/transporte-echazu/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TRANSPORTE ECHAZÚ')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TRANSPORTE ECHAZÚ')
  and c.slug = any(array['transporte-de-cargas-pesadas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TRANSPORTE ECHAZÚ')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TREKO', 'Juana M. Gorriti 2503, Dpto. 08, Villa San Lorenzo, Salta (4401)', null,
       null, 'http://www.trekoservicios.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica','obras-e-infraestructura','transporte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/treko/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TREKO')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TREKO')
  and c.slug = any(array['logistica','obras-e-infraestructura','transporte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TREKO')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TRIUNFO COOPERATIVA DE SEGUROS LTDA.', 'San Martín 1092', 'Piso 4',
       'Mendoza', 'http://www.triunfoseguros.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['seguros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/triunfo-cooperativa-de-seguros-ltda/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TRIUNFO COOPERATIVA DE SEGUROS LTDA.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TRIUNFO COOPERATIVA DE SEGUROS LTDA.')
  and c.slug = any(array['seguros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TRIUNFO COOPERATIVA DE SEGUROS LTDA.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TSS GROUP', 'Colectora Norte Acceso Oeste Km 47,3, B1748 Gral. Rodríguez, Provincia de Buenos Aires', null,
       null, 'http://www.tss.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['informes-laborales','rrhh','seguridad']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/tss-group/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TSS GROUP')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TSS GROUP')
  and c.slug = any(array['informes-laborales','rrhh','seguridad']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TSS GROUP')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'TUBOMARKET SA', 'Av. Boulogne Sur Mer 1876', 'Don Torcuato',
       'Buenos Aires', 'http://www.tubomarket.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['tuberias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/tubomarket-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('TUBOMARKET SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('TUBOMARKET SA')
  and c.slug = any(array['tuberias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('TUBOMARKET SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ULOG', 'Edificio CHACOFI, 555, 25 de Mayo, Microcentro, San Nicolás, Buenos Aires, Comuna 1, Ciudad Autónoma de Buenos Aires, C1043AAC, Argentina', null,
       null, 'http://www.amisa.com/ulog/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['transporte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/ulog/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ULOG')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ULOG')
  and c.slug = any(array['transporte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ULOG')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'UMPY S.R.L.', 'Km 560, Ruta Nacional 38, Santa Rosa, Departamento Valle Viejo, Catamarca, 4707, Argentina', null,
       null, null,
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['combustibles','transporte']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/umpy-s-r-l/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('UMPY S.R.L.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('UMPY S.R.L.')
  and c.slug = any(array['combustibles','transporte']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('UMPY S.R.L.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'UNIPAR INDUPA SAIC', 'Juana Manso 555, Piso 7', 'Of. D',
       'CABA', 'http://www.unipar.com/es',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['petroquimico']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/unipar-indupa-saic/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('UNIPAR INDUPA SAIC')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('UNIPAR INDUPA SAIC')
  and c.slug = any(array['petroquimico']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('UNIPAR INDUPA SAIC')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'URBANO EXPRESS ARGENTINA S.A.', '1764, Esteban Echeverría, Florida Oeste, Partido de Vicente López, Buenos Aires, B1604, Argentina', null,
       null, 'http://WWW.URBANO.COM.AR',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['logistica']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/urbano-express-argentina-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('URBANO EXPRESS ARGENTINA S.A.')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('URBANO EXPRESS ARGENTINA S.A.')
  and c.slug = any(array['logistica']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('URBANO EXPRESS ARGENTINA S.A.')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'URBETRACK', 'Av. Rivadavia 4260', 'Piso 11',
       'CABA', 'http://www.urbetrack.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-y-montajes','consultoria','logistica','servicios-petroleros-mineros']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/urbetrack/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('URBETRACK')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('URBETRACK')
  and c.slug = any(array['construcciones-y-montajes','consultoria','logistica','servicios-petroleros-mineros']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('URBETRACK')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'VEGEO', '334, Santiago del Estero, Monserrat, Buenos Aires, Comuna 1, Ciudad Autónoma de Buenos Aires, C1091ABA, Argentina', null,
       null, null,
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['consultoria','energias-renovables']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/vegeo/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('VEGEO')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('VEGEO')
  and c.slug = any(array['consultoria','energias-renovables']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('VEGEO')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'VILLANUEVA SERVICIOS MINEROS SA', 'Cnel. Puch 638', 'San Salvador de Jujuy',
       'Jujuy', 'http://www.villanuevaehijos.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/villanueva-servicios-mineros-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('VILLANUEVA SERVICIOS MINEROS SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('VILLANUEVA SERVICIOS MINEROS SA')
  and c.slug = any(array['construcciones-obras-civiles-y-servicio-minero']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('VILLANUEVA SERVICIOS MINEROS SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'WAVIN', 'Av. Benito Pérez Galdós 8760, B1687AIL Pablo Podesta, Provincia de Buenos Aires', null,
       null, 'https://wavin.com/ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['geotextiles','tuberias']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/wavin/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('WAVIN')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('WAVIN')
  and c.slug = any(array['geotextiles','tuberias']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('WAVIN')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'WICHI TOLEDO', null, 'Av. Paraguay Nº2797',
       'Salta', 'http://www.wichitoledo.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['perforaciones']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/wichi-toledo/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('WICHI TOLEDO')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('WICHI TOLEDO')
  and c.slug = any(array['perforaciones']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('WICHI TOLEDO')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'WILO ARGENTINA', 'José Aarón Salmún Feijóo 334, C1295ABI Cdad. Autónoma de Buenos Aires', null,
       null, 'http://www.wilo.com/ar/es/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['bombas','tratamientos-de-aguas']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/wilo-argentina/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('WILO ARGENTINA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('WILO ARGENTINA')
  and c.slug = any(array['bombas','tratamientos-de-aguas']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('WILO ARGENTINA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'WIN WATER SA', 'Acc. Este  Lat. Norte 9162', 'Rodeo de la Cruz',
       'Mendoza', 'http://www.winwater.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/win-water-sa/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('WIN WATER SA')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('WIN WATER SA')
  and c.slug = any(array['industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('WIN WATER SA')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'WORLEY', 'Juana Manso 999', 'Piso 2',
       'CABA', 'https://www.worley.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['ingenieria']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/worley/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('WORLEY')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('WORLEY')
  and c.slug = any(array['ingenieria']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('WORLEY')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'XARE HOLDING S.A', 'Esmeralda 391', 'Temperley',
       'Buenos Aires', 'http://www.xareholding.com',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array[]::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/xare-holding-s-a/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('XARE HOLDING S.A')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('XARE HOLDING S.A')
  and c.slug = any(array[]::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('XARE HOLDING S.A')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ZEUS SEGURIDAD &#038; SERVICIOS', '1763, Avenida San Martín, Papa Francisco, Puerto San Julián, Magallanes, Santa Cruz, 9310, Argentina', null,
       null, 'https://seguridad-zeus.com/',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['seguridad']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/zeus-seguridad-servicios/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ZEUS SEGURIDAD &#038; SERVICIOS')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ZEUS SEGURIDAD &#038; SERVICIOS')
  and c.slug = any(array['seguridad']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ZEUS SEGURIDAD &#038; SERVICIOS')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );

insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select 'ZIGMA INDUSTRIAL SRL', 'Av. Callao 232 Piso 8 Dto 16, CABA, Argentina', null,
       null, 'http://www.zigma.com.ar',
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array['industrial']::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', 'https://www.capmin.com.ar/Proveedores-mineros/zigma-industrial-srl/'
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper('ZIGMA INDUSTRIAL SRL')
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper('ZIGMA INDUSTRIAL SRL')
  and c.slug = any(array['industrial']::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper('ZIGMA INDUSTRIAL SRL')
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );
