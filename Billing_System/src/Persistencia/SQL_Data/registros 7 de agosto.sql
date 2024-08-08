v-- Tabla alumno

INSERT INTO alumno (matricula, nombrePila, primerApellido, segApellido, edad, fechaNac, dirCalle, dirNumero, dirColonia, category, password) VALUES
    ('0', 'Admin', '-', '', 0, '2000-01-01', '', '', '', 'admin', 'CAFCATSINC'),
    ('000001', 'Luis', 'García', 'Hernández', 5, '2019-03-10', 'Av. Reforma', '123', 'Centro', 'user', 'Luis123'),
    ('000002', 'Ana', 'Martínez', 'López', 5, '2019-06-15', 'Calle del Sol', '456', 'Santa María','user', 'BlossomForth'),
    ('000003', 'Diego', 'Rodríguez', 'Gómez', 5, '2019-02-28', 'Calle Luna', '789', 'La Colina','user', 'God_Diego_Go'),
    ('000004', 'María', 'López', 'Martínez', 5, '2019-04-22', 'Boulevard del Norte', '321', 'Las Palmas', 'user', 'CONTRASEÑACUENTA'),
    ('000005', 'Javier', 'Hernández', 'Pérez', 5, '2019-08-03', 'Avenida Central', '654', 'El Prado','user', 'JavierEscuela'),
    ('000006', 'Carlos', 'Gómez', 'García', 10, '2014-01-05', 'Calle de la Luna', '987', 'El Molino', 'user', 'karl'),
    ('000007', 'Laura', 'Díaz', 'Rodríguez', 9, '2015-05-12', 'Avenida de los Robles', '432', 'San José', 'user', 'CalleLaureles'),
    ('000008', 'Juan', 'Martínez', 'Sánchez', 11, '2013-11-20', 'Calle del Bosque', '876', 'La Loma', 'user', 'qwerty'),
    ('000009', 'Sofía', 'Pérez', 'Gómez', 10, '2014-08-17', 'Calle de la Primavera', '543', 'Los Pinos', 'user', 'THE_FIRST'),
    ('000010', 'Pedro', 'González', 'López', 9, '2015-02-28', 'Calle del Sol', '456', 'Santa María', 'user', 'CRIMSON'),
    ('000011', 'Ana', 'Hernández', 'González', 14, '2010-09-08', 'Av. Reforma', '144', 'Centro', 'user', 'UHML166'),
    ('000012', 'Diego', 'Martínez', 'Rodríguez', 13, '2011-12-15', 'Calle Revolucion', '789', 'La Colina','user', 'diegui :3'),
    ('000013', 'María', 'López', 'Sánchez', 15, '2009-08-22', 'Boulevard del Norte', '321', 'Las Palmas', 'user', 'ElPresidenteMarsopaEstaPerdido'),
    ('000014', 'Javier', 'Pérez', 'Martínez', 14, '2010-11-10', 'Avenida Central', '654', 'El Prado', 'user', 'Greenflower123'),
    ('000015', 'Laura', 'García', 'Gómez', 13, '2012-04-30', 'Calle de la Primavera', '543', 'Los Pinos', 'user', 'URLaura');

-- Tabla periodo ///// AUTO_INCREMENT
INSERT INTO periodo (numero, nombre, añoInicio, añoFin) VALUES
    (null, 'CICLO 2021-2022','2021-09-01', '2022-08-30'),
    (null, 'CICLO 2022-2023','2022-09-01', '2023-08-30'),
    (null, 'CICLO 2023-2024','2023-09-01', '2024-08-30'),
    (null, 'CICLO 2024-2025','2024-09-01', '2025-08-30');

UPDATE periodo  
set añoInicio = '2023-09-01', añoFin = '2024-08-30'
WHERE numero = 3;

-- Tabla evento (poner costo)
INSERT INTO evento (numero, nombre, fecha, costo) VALUES 
    (null, 'Fiesta de Bienvenida', '2021-09-01', 50.00),
    (null, 'Día de Juegos y Diversión', '2021-10-15', 20.00),
    (null, 'Festival de Otoño Infantil', '2021-11-25', 25.00),
    (null, 'Fiesta Navideña Infantil', '2021-12-15', 30.00),
    (null, 'Desfile de Primavera', '2022-03-15', 20.00),
    (null, 'Ceremonía de Graduación', '2022-06-10', 100.00),

    (null, 'Campamento de Verano Escolar', '2022-07-25', 300.00),
    (null, 'Día de la Familia en la Escuela', '2022-09-30', 40.00),
    (null, 'Feria de Ciencias Primaria', '2022-11-10', 15.00),
    (null, 'Concurso de Lectura y Escritura', '2023-01-20', 25.00),
    (null, 'Festival de Navidad Escolar', '2023-12-10', 50.00),
    (null, 'Fiesta de Fin de Año Escolar', '2023-06-15', 120.00),

    (null, 'Taller de Orientación Vocacional', '2023-09-10', 60.00),
    (null, 'Concurso de Ciencia y Tecnología', '2023-11-05', 40.00),
    (null, 'Competencia Deportiva Interescolar', '2024-02-15', 50.00),
    (null, 'Semana Cultural y de Innovación', '2024-03-20', 30.00),
    (null, 'Festival de Música y Arte Juvenil', '2024-04-25', 35.00),
    (null, 'Ceremonia de Graduación de Secundaria', '2024-06-05', 150.00),

    (null, 'Kermes de regreso a clases', '2024-07-02', 200.00),
    (null, 'Fiesta independencia de Mexico', '2024-09-16', 75.00),
    (null, 'Fiesta navidad', '2024-12-17', 100.00),
    (null, 'Fiesta semana santa', '2024-04-13', 65.00),
    (null, 'Dia del Niño', '2025-06-30', 70.00);

-- Tabla mantenimiento
INSERT INTO mantenimiento (codigo, descripcion, precio) VALUES
    ('MNT_TECH', 'Reparación de techos', 1200.00),
    ('MNT_AULA', 'Limpieza profunda de aulas', 500.00),
    ('MNT_SIST', 'Mantenimiento de sistemas eléctricos', 800.00),
    ('MNT_TUB', 'Reparación de tuberías y fontanería', 600.00),
    ('MNT_JAR', 'Servicio de jardinería y paisajismo', 300.00),
    ('MNT_CLIM', 'Revisión de sistemas de climatización', 400.00),
    ('MNT_EQ', 'Mantenimiento de equipos tecnológicos', 1000.00),
    ('MNT_PINT', 'Pintura de aulas y oficinas', 1500.00),
    ('MNT_PLAG', 'Control de plagas', 250.00),
    ('MNT_MOBI', 'Reparación de mobiliario', 700.00),
    ('MNT_SANI', 'Sanitización de baños y áreas comunes', 350.00),
    ('MNT_CANCH', 'Reparación de canchas deportivas', 800.00),
    ('MNT_SEGU', 'Mantenimiento de sistemas de seguridad', 500.00),
    ('MNT_REMOD', 'Remodelación de salas de profesores', 1200.00),
    ('MNT_EMERG', 'Reemplazo de extintores y equipos de emergencia', 300.00);

-- Tabla nivel_educativo
INSERT INTO nivel_educativo (codigo, nombre) VALUES
    ('KIND', 'Kinder'),
    ('PRIM', 'Primaria'),
    ('SECU', 'Secundaria');
    -- Tabla grado
INSERT INTO grado (numero, nombre, nivel_educativo) VALUES
    -- PERIODO 1
    (null, 'Primero de Kinder', 'KIND'), -- 1
    (null, 'Segundo de Kinder', 'KIND'), -- 2
    (null, 'Tercero de Kinder', 'KIND'), -- 3
    -- PERIODO 1
    (null, 'Primero de Primaria', 'PRIM'), -- 4
    (null, 'Segundo de Primaria', 'PRIM'), -- 5
    (null, 'Tercero de Primaria', 'PRIM'), -- 6
    (null, 'Cuarto de Primaria', 'PRIM'), -- 7
    (null, 'Quinto de Primaria', 'PRIM'), -- 8
    (null, 'Sexto de Primaria', 'PRIM'), -- 9
    -- PERIODO 1
    (null, 'Primero de Secundaria', 'SECU'), -- 10
    (null, 'Segundo de Secundaria', 'SECU'), -- 11
    (null, 'Tercero de Secundaria', 'SECU'); -- 12

-- Tabla tipo_de_mensualidad
INSERT INTO tipo_de_mensualidad (codigo, nombre) VALUES
    ('REG', 'Regular'),
    ('VAC', 'Vacacional');

-- Tabla genero
INSERT INTO genero (codigo, nombre) VALUES
    ('M', 'Masculino'),
    ('F', 'Femenino');
    INSERT INTO paquete_de_material (codigo, nombre, precio, grado, tipo) VALUES
    ('LIBBAS_KIND1', 'Libros Básicos 1ro de Kinder', 250.00, 1, 'libro'),
    ('LIBBAS_KIND2', 'Libros Básicos 2do de Kinder', 250.00, 2, 'libro'),
    ('LIBBAS_KIND3', 'Libros Básicos 3ro de Kinder', 250.00, 3, 'libro'),
    ('LIBBAS_PRIM1', 'Libros Básicos 1ro de Primaria', 250.00, 4, 'libro'),
    ('LIBBAS_PRIM2', 'Libros Básicos 2do de Primaria', 250.00, 5, 'libro'),
    ('LIBBAS_PRIM3', 'Libros Básicos 3ro de Primaria', 250.00, 6, 'libro'),
    ('LIBBAS_PRIM4', 'Libros Básicos 4to de Primaria', 250.00, 7, 'libro'),
    ('LIBBAS_PRIM5', 'Libros Básicos 5to de Primaria', 250.00, 8, 'libro'),
    ('LIBBAS_PRIM6', 'Libros Básicos 6to de Primaria', 250.00, 9, 'libro'),
    ('LIBBAS_SECU1', 'Libros Básicos 1ro de Secundaria', 250.00, 10, 'libro'),
    ('LIBBAS_SECU2', 'Libros Básicos 2do de Secundaria', 250.00, 11, 'libro'),
    ('LIBBAS_SECU3', 'Libros Básicos 3ro de Secundaria', 250.00, 12, 'libro'),

    ('MATART_KIND1', 'Material de Arte 1ro de Kinder', 150.00, 1, 'arte'),
    ('MATART_KIND2', 'Material de Arte 2do de Kinder', 150.00, 2, 'arte'),
    ('MATART_KIND3', 'Material de Arte 3ro de Kinder', 150.00, 3, 'arte'),
    ('MATART_PRIM1', 'Material de Arte 1ro de Primaria', 150.00, 4, 'arte'),
    ('MATART_PRIM2', 'Material de Arte 2do de Primaria', 150.00, 5, 'arte'),
    ('MATART_PRIM3', 'Material de Arte 3ro de Primaria', 150.00, 6, 'arte'),
    ('MATART_PRIM4', 'Material de Arte 4to de Primaria', 150.00, 7, 'arte'),
    ('MATART_PRIM5', 'Material de Arte 5to de Primaria', 150.00, 8, 'arte'),
    ('MATART_PRIM6', 'Material de Arte 6to de Primaria', 150.00, 9, 'arte'),
    ('MATART_SECU1', 'Material de Arte 1ro de Secundaria', 150.00, 10, 'arte'),
    ('MATART_SECU2', 'Material de Arte 2do de Secundaria', 150.00, 11, 'arte'),
    ('MATART_SECU3', 'Material de Arte 3ro de Secundaria', 150.00, 12, 'arte'),

    ('PAQLAB_KIND1', 'Paquete de Laboratorio 1ro de Kinder', 300.75, 1, 'laboratorio'),
    ('PAQLAB_KIND2', 'Paquete de Laboratorio 2do de Kinder', 300.75, 2, 'laboratorio'),
    ('PAQLAB_KIND3', 'Paquete de Laboratorio 3ro de Kinder', 300.75, 3, 'laboratorio'),
    ('PAQLAB_PRIM1', 'Paquete de Laboratorio 1ro de Primaria', 300.75, 4, 'laboratorio'),
    ('PAQLAB_PRIM2', 'Paquete de Laboratorio 2do de Primaria', 300.75, 5, 'laboratorio'),
    ('PAQLAB_PRIM3', 'Paquete de Laboratorio 3ro de Primaria', 300.75, 6, 'laboratorio'),
    ('PAQLAB_PRIM4', 'Paquete de Laboratorio 4to de Primaria', 300.75, 7, 'laboratorio'),
    ('PAQLAB_PRIM5', 'Paquete de Laboratorio 5to de Primaria', 300.75, 8, 'laboratorio'),
    ('PAQLAB_PRIM6', 'Paquete de Laboratorio 6to de Primaria', 300.75, 9, 'laboratorio'),
    ('PAQLAB_SECU1', 'Paquete de Laboratorio 1ro de Secundaria', 300.75, 10, 'laboratorio'),
    ('PAQLAB_SECU2', 'Paquete de Laboratorio 2do de Secundaria', 300.75, 11, 'laboratorio'),
    ('PAQLAB_SECU3', 'Paquete de Laboratorio 3ro de Secundaria', 300.75, 12, 'laboratorio'),

    ('PAQDEP_KIND1', 'Paquete de Deportes 1ro de Kinder', 120.00, 1, 'deporte'),
    ('PAQDEP_KIND2', 'Paquete de Deportes 2do de Kinder', 120.00, 2, 'deporte'),
    ('PAQDEP_KIND3', 'Paquete de Deportes 3ro de Kinder', 120.00, 3, 'deporte'),
    ('PAQDEP_PRIM1', 'Paquete de Deportes 1ro de Primaria', 120.00, 4, 'deporte'),
    ('PAQDEP_PRIM2', 'Paquete de Deportes 2do de Primaria', 120.00, 5, 'deporte'),
    ('PAQDEP_PRIM3', 'Paquete de Deportes 3ro de Primaria', 120.00, 6, 'deporte'),
    ('PAQDEP_PRIM4', 'Paquete de Deportes 4to de Primaria', 120.00, 7, 'deporte'),
    ('PAQDEP_PRIM5', 'Paquete de Deportes 5to de Primaria', 120.00, 8, 'deporte'),
    ('PAQDEP_PRIM6', 'Paquete de Deportes 6to de Primaria', 120.00, 9, 'deporte'),
    ('PAQDEP_SECU1', 'Paquete de Deportes 1ro de Secundaria', 120.00, 10, 'deporte'),
    ('PAQDEP_SECU2', 'Paquete de Deportes 2do de Secundaria', 120.00, 11, 'deporte'),
    ('PAQDEP_SECU3', 'Paquete de Deportes 3ro de Secundaria', 120.00, 12, 'deporte'),

    ('PAQMAT_KIND1', 'Paquete de Material Escolar 1ro de Kinder', 120.00, 1, 'material'),
    ('PAQMAT_KIND2', 'Paquete de Material Escolar 2do de Kinder', 120.00, 2, 'material'),
    ('PAQMAT_KIND3', 'Paquete de Material Escolar 3ro de Kinder', 120.00, 3, 'material'),
    ('PAQMAT_PRIM1', 'Paquete de Material Escolar 1ro de Primaria', 120.00, 4, 'material'),
    ('PAQMAT_PRIM2', 'Paquete de Material Escolar 2do de Primaria', 120.00, 5, 'material'),
    ('PAQMAT_PRIM3', 'Paquete de Material Escolar 3ro de Primaria', 120.00, 6, 'material'),
    ('PAQMAT_PRIM4', 'Paquete de Material Escolar 4to de Primaria', 120.00, 7, 'material'),
    ('PAQMAT_PRIM5', 'Paquete de Material Escolar 5to de Primaria', 120.00, 8, 'material'),
    ('PAQMAT_PRIM6', 'Paquete de Material Escolar 6to de Primaria', 120.00, 9, 'material'),
    ('PAQMAT_SECU1', 'Paquete de Material Escolar 1ro de Secundaria', 120.00, 10, 'material'),
    ('PAQMAT_SECU2', 'Paquete de Material Escolar 2do de Secundaria', 120.00, 11, 'material'),
    ('PAQMAT_SECU3', 'Paquete de Material Escolar 3ro de Secundaria', 120.00, 12, 'material'),

    ('MATCOM_KIND1', 'Material de Computación 1ro de Kinder', 200.00, 1, 'computacion'),
    ('MATCOM_KIND2', 'Material de Computación 2do de Kinder', 200.00, 2, 'computacion'),
    ('MATCOM_KIND3', 'Material de Computación 3ro de Kinder', 200.00, 3, 'computacion'),
    ('MATCOM_PRIM1', 'Material de Computación 1ro de Primaria', 200.00, 4, 'computacion'),
    ('MATCOM_PRIM2', 'Material de Computación 2do de Primaria', 200.00, 5, 'computacion'),
    ('MATCOM_PRIM3', 'Material de Computación 3ro de Primaria', 200.00, 6, 'computacion'),
    ('MATCOM_PRIM4', 'Material de Computación 4to de Primaria', 200.00, 7, 'computacion'),
    ('MATCOM_PRIM5', 'Material de Computación 5to de Primaria', 200.00, 8, 'computacion'),
    ('MATCOM_PRIM6', 'Material de Computación 6to de Primaria', 200.00, 9, 'computacion'),
    ('MATCOM_SECU1', 'Material de Computación 1ro de Secundaria', 200.00, 10, 'computacion'),
    ('MATCOM_SECU2', 'Material de Computación 2do de Secundaria', 200.00, 11, 'computacion'),
    ('MATCOM_SECU3', 'Material de Computación 3ro de Secundaria', 200.00, 12, 'computacion'),

    ('PAQLAP_KIND1', 'Paquete de Lápices (6 piezas)', 50.00, 1, 'papeleria'),
    ('PAQLAP_KIND2', 'Paquete de Lápices (6 piezas)', 50.00, 2, 'papeleria'),
    ('PAQLAP_KIND3', 'Paquete de Lápices (6 piezas)', 50.00, 3, 'papeleria'),
    ('PAQLAP_PRIM1', 'Paquete de Lápices (6 piezas)', 50.00, 4, 'papeleria'),
    ('PAQLAP_PRIM2', 'Paquete de Lápices (6 piezas)', 50.00, 5, 'papeleria'),
    ('PAQLAP_PRIM3', 'Paquete de Lápices (6 piezas)', 50.00, 6, 'papeleria'),
    ('PAQLAP_PRIM4', 'Paquete de Lápices (6 piezas)', 50.00, 7, 'papeleria'),
    ('PAQLAP_PRIM5', 'Paquete de Lápices (6 piezas)', 50.00, 8, 'papeleria'),
    ('PAQLAP_PRIM6', 'Paquete de Lápices (6 piezas)', 50.00, 9, 'papeleria'),
    ('PAQLAP_SECU1', 'Paquete de Lápices (6 piezas)', 50.00, 10, 'papeleria'),
    ('PAQLAP_SECU2', 'Paquete de Lápices (6 piezas)', 50.00, 11, 'papeleria'),
    ('PAQLAP_SECU3', 'Paquete de Lápices (6 piezas)', 50.00, 12, 'papeleria'),

    ('PAQCUA_KIND1', 'Paquete de Cuadernos (5 piezas)', 200.00, 1, 'papeleria'),
    ('PAQCUA_KIND2', 'Paquete de Cuadernos (5 piezas)', 200.00, 2, 'papeleria'),
    ('PAQCUA_KIND3', 'Paquete de Cuadernos (5 piezas)', 200.00, 3, 'papeleria'),
    ('PAQCUA_PRIM1', 'Paquete de Cuadernos (5 piezas)', 200.00, 4, 'papeleria'),
    ('PAQCUA_PRIM2', 'Paquete de Cuadernos (5 piezas)', 200.00, 5, 'papeleria'),
    ('PAQCUA_PRIM3', 'Paquete de Cuadernos (5 piezas)', 200.00, 6, 'papeleria'),
    ('PAQCUA_PRIM4', 'Paquete de Cuadernos (5 piezas)', 200.00, 7, 'papeleria'),
    ('PAQCUA_PRIM5', 'Paquete de Cuadernos (5 piezas)', 200.00, 8, 'papeleria'),
    ('PAQCUA_PRIM6', 'Paquete de Cuadernos (5 piezas)', 200.00, 9, 'papeleria'),
    ('PAQCUA_SECU1', 'Paquete de Cuadernos (5 piezas)', 200.00, 10, 'papeleria'),
    ('PAQCUA_SECU2', 'Paquete de Cuadernos (5 piezas)', 200.00, 11, 'papeleria'),
    ('PAQCUA_SECU3', 'Paquete de Cuadernos (5 piezas)', 200.00, 12, 'papeleria'),

    ('PAQCOL_KIND1', 'Paquete de Colores (24 piezas)', 30.00, 1, 'papeleria'),
    ('PAQCOL_KIND2', 'Paquete de Colores (24 piezas)', 30.00, 2, 'papeleria'),
    ('PAQCOL_KIND3', 'Paquete de Colores (24 piezas)', 30.00, 3, 'papeleria'),
    ('PAQCOL_PRIM1', 'Paquete de Colores (24 piezas)', 30.00, 4, 'papeleria'),
    ('PAQCOL_PRIM2', 'Paquete de Colores (24 piezas)', 30.00, 5, 'papeleria'),
    ('PAQCOL_PRIM3', 'Paquete de Colores (24 piezas)', 30.00, 6, 'papeleria'),
    ('PAQCOL_PRIM4', 'Paquete de Colores (24 piezas)', 30.00, 7, 'papeleria'),
    ('PAQCOL_PRIM5', 'Paquete de Colores (24 piezas)', 30.00, 8, 'papeleria'),
    ('PAQCOL_PRIM6', 'Paquete de Colores (24 piezas)', 30.00, 9, 'papeleria'),
    ('PAQCOL_SECU1', 'Paquete de Colores (24 piezas)', 30.00, 10, 'papeleria'),
    ('PAQCOL_SECU2', 'Paquete de Colores (24 piezas)', 30.00, 11, 'papeleria'),
    ('PAQCOL_SECU3', 'Paquete de Colores (24 piezas)', 30.00, 12, 'papeleria'),

    ('PAQREG_KIND1', 'Paquete de Reglas (3 piezas)', 10.00, 1, 'papeleria'),
    ('PAQREG_KIND2', 'Paquete de Reglas (3 piezas)', 10.00, 2, 'papeleria'),
    ('PAQREG_KIND3', 'Paquete de Reglas (3 piezas)', 10.00, 3, 'papeleria'),
    ('PAQREG_PRIM1', 'Paquete de Reglas (3 piezas)', 10.00, 4, 'papeleria'),
    ('PAQREG_PRIM2', 'Paquete de Reglas (3 piezas)', 10.00, 5, 'papeleria'),
    ('PAQREG_PRIM3', 'Paquete de Reglas (3 piezas)', 10.00, 6, 'papeleria'),
    ('PAQREG_PRIM4', 'Paquete de Reglas (3 piezas)', 10.00, 7, 'papeleria'),
    ('PAQREG_PRIM5', 'Paquete de Reglas (3 piezas)', 10.00, 8, 'papeleria'),
    ('PAQREG_PRIM6', 'Paquete de Reglas (3 piezas)', 10.00, 9, 'papeleria'),
    ('PAQREG_SECU1', 'Paquete de Reglas (3 piezas)', 10.00, 10, 'papeleria'),
    ('PAQREG_SECU2', 'Paquete de Reglas (3 piezas)', 10.00, 11, 'papeleria'),
    ('PAQREG_SECU3', 'Paquete de Reglas (3 piezas)', 10.00, 12, 'papeleria'),

    ('PAQBOR_KIND1', 'Paquete de Borradores (3 piezas)', 10.00, 1, 'papeleria'),
    ('PAQBOR_KIND2', 'Paquete de Borradores (3 piezas)', 10.00, 2, 'papeleria'),
    ('PAQBOR_KIND3', 'Paquete de Borradores (3 piezas)', 10.00, 3, 'papeleria'),
    ('PAQBOR_PRIM1', 'Paquete de Borradores (3 piezas)', 10.00, 4, 'papeleria'),
    ('PAQBOR_PRIM2', 'Paquete de Borradores (3 piezas)', 10.00, 5, 'papeleria'),
    ('PAQBOR_PRIM3', 'Paquete de Borradores (3 piezas)', 10.00, 6, 'papeleria'),
    ('PAQBOR_PRIM4', 'Paquete de Borradores (3 piezas)', 10.00, 7, 'papeleria'),
    ('PAQBOR_PRIM5', 'Paquete de Borradores (3 piezas)', 10.00, 8, 'papeleria'),
    ('PAQBOR_PRIM6', 'Paquete de Borradores (3 piezas)', 10.00, 9, 'papeleria'),
    ('PAQBOR_SECU1', 'Paquete de Borradores (3 piezas)', 10.00, 10, 'papeleria'),
    ('PAQBOR_SECU2', 'Paquete de Borradores (3 piezas)', 10.00, 11, 'papeleria'),
    ('PAQBOR_SECU3', 'Paquete de Borradores (3 piezas)', 10.00, 12, 'papeleria'),

    ('PAQTIJ_KIND1', 'Paquete de Tijeras (1 pieza)', 8.00, 1, 'papeleria'),
    ('PAQTIJ_KIND2', 'Paquete de Tijeras (1 pieza)', 8.00, 2, 'papeleria'),
    ('PAQTIJ_KIND3', 'Paquete de Tijeras (1 pieza)', 8.00, 3, 'papeleria'),
    ('PAQTIJ_PRIM1', 'Paquete de Tijeras (1 pieza)', 8.00, 4, 'papeleria'),
    ('PAQTIJ_PRIM2', 'Paquete de Tijeras (1 pieza)', 8.00, 5, 'papeleria'),
    ('PAQTIJ_PRIM3', 'Paquete de Tijeras (1 pieza)', 8.00, 6, 'papeleria'),
    ('PAQTIJ_PRIM4', 'Paquete de Tijeras (1 pieza)', 8.00, 7, 'papeleria'),
    ('PAQTIJ_PRIM5', 'Paquete de Tijeras (1 pieza)', 8.00, 8, 'papeleria'),
    ('PAQTIJ_PRIM6', 'Paquete de Tijeras (1 pieza)', 8.00, 9, 'papeleria'),
    ('PAQTIJ_SECU1', 'Paquete de Tijeras (1 pieza)', 8.00, 10, 'papeleria'),
    ('PAQTIJ_SECU2', 'Paquete de Tijeras (1 pieza)', 8.00, 11, 'papeleria'),
    ('PAQTIJ_SECU3', 'Paquete de Tijeras (1 pieza)', 8.00, 12, 'papeleria'),

    ('PAQHOJ_KIND1', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 1, 'papeleria'),
    ('PAQHOJ_KIND2', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 2, 'papeleria'),
    ('PAQHOJ_KIND3', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 3, 'papeleria'),
    ('PAQHOJ_PRIM1', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 4, 'papeleria'),
    ('PAQHOJ_PRIM2', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 5, 'papeleria'),
    ('PAQHOJ_PRIM3', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 6, 'papeleria'),
    ('PAQHOJ_PRIM4', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 7, 'papeleria'),
    ('PAQHOJ_PRIM5', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 8, 'papeleria'),
    ('PAQHOJ_PRIM6', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 9, 'papeleria'),
    ('PAQHOJ_SECU1', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 10, 'papeleria'),
    ('PAQHOJ_SECU2', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 11, 'papeleria'),
    ('PAQHOJ_SECU3', 'Paquete de Hojas Sueltas (100 piezas)', 50.00, 12, 'papeleria');

-- Tabla tipo_de_uniforme /// AUTO_INCREMENT
INSERT INTO tipo_de_uniforme (numero, descripcion, precio, nivel_educativo) VALUES
    (null, 'Uniforme regular M', 150.00, 'KIND'),
    (null, 'Uniforme de invierno M', 125.25, 'KIND'),
    (null, 'Uniforme deportivo', 200.50, 'KIND'),
    (null, 'Uniforme regular F', 150.00, 'KIND'),
    (null, 'Uniforme de invierno F', 120.25, 'KIND'),

    (null, 'Uniforme regular M', 150.00, 'PRIM'),
    (null, 'Uniforme de invierno M', 125.25, 'PRIM'),
    (null, 'Uniforme deportivo', 200.50, 'PRIM'),
    (null, 'Uniforme regular F', 150.00, 'PRIM'),
    (null, 'Uniforme de invierno F', 120.25, 'PRIM'),

    (null, 'Uniforme regular M', 150.00, 'SECU'),
    (null, 'Uniforme de invierno M', 125.25, 'SECU'),
    (null, 'Uniforme deportivo', 200.50, 'SECU'),
    (null, 'Uniforme regular F', 150.00, 'SECU'),
    (null, 'Uniforme de invierno F', 120.25, 'SECU');

-- Tabla tipo_de_examen
INSERT INTO tipo_de_examen (codigo, nombre) VALUES
    ('PAR', 'Parcial'),
    ('REM', 'Remedial'),
    ('EXT', 'Extraordinario'),
    ('DIAG', 'Diagnostico'),
    ('ING', 'Ingles');
 
-- Tabla pago /// AUTO_INCREMENT
INSERT INTO pago (numero, referencia, fechaPago, monto, nivel_educativo, periodo, alumno, estado) VALUES
    -- CICLO 2021-2022
    (null, '2021061501', '2021-06-16', 600.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2021061502', '2021-06-11', 600.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2021061503', '2021-06-18', 600.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2021061504', '2021-06-19', 600.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2021061505', '2021-06-20', 600.00, 'KIND', 1, '000005', 'confirmado'),
    -- 6 y 7
    (null, '2021061508', '2021-06-21', 750.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '2021061509', '2021-06-18', 750.00, 'PRIM', 1, '000007', 'confirmado'),
    -- 11 y 12
    (null, '2021061506', '2021-06-14', 750.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '2021061507', '2021-06-13', 750.00, 'PRIM', 1, '000012', 'confirmado'),

    -- CICLO 2022-2023
    
    (null, '2022071501', '2022-06-14', 650.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022071502', '2022-06-11', 650.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022071503', '2022-06-10', 700.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022071504', '2022-06-09', 650.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022071505', '2022-06-11', 650.00, 'PRIM', 2, '000010', 'confirmado'),
    -- 1 y 2
    (null, '8149598522', '2022-06-13', 650.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '1845184552', '2022-06-14', 650.00, 'PRIM', 2, '000002', 'confirmado'),
    -- 11 y 12
    (null, '2021061506', '2022-06-21', 650.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '2021061507', '2022-06-08', 650.00, 'SECU', 2, '000012', 'confirmado'),

    -- CICLO 2023-2024
    
    (null, '2023061501', '2023-06-14', 700.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023061502', '2023-06-15', 700.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023061503', '2023-06-11', 750.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023061504', '2023-06-10', 700.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023061505', '2023-06-14', 700.00, 'SECU', 3, '000015', 'confirmado'),
    -- 1 y 2
    (null, '8149598522', '2023-06-13', 700.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '1845184552', '2023-06-18', 700.00, 'PRIM', 3, '000002', 'confirmado'),
    -- 6 y 7
    (null, '2021061508', '2023-06-08', 700.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '2021061509', '2023-06-09', 700.00, 'PRIM', 3, '000007', 'confirmado'), 


    -- PERIODO 1

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000001
    (null, '2022011511', '2021-09-15', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022021511', '2021-10-16', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022031511', '2021-11-17', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022041511', '2021-12-18', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022051511', '2022-01-19', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022061511', '2022-02-20', 200.00, 'KIND', 1, '000001', 'confirmado'),

    (null, '2022071511', '2022-03-03', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022081511', '2022-04-05', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022091511', '2022-05-08', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022101511', '2022-06-09', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022111511', '2022-07-08', 200.00, 'KIND', 1, '000001', 'confirmado'),
    (null, '2022121511', '2022-08-07', 200.00, 'KIND', 1, '000001', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000002
    (null, '2022011512', '2021-09-14', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022021512', '2021-10-15', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022031512', '2021-11-18', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022041512', '2021-12-20', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022051512', '2022-01-01', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022061512', '2022-02-05', 200.00, 'KIND', 1, '000002', 'confirmado'),

    (null, '2022071512', '2022-03-06', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022081512', '2022-04-06', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022091512', '2022-05-07', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022101512', '2022-06-01', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022111512', '2022-07-05', 200.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022121512', '2022-08-06', 200.00, 'KIND', 1, '000002', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000003
    (null, '2022011513', '2021-09-01', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022021513', '2021-10-02', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022031513', '2021-11-01', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022041513', '2021-12-10', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022051513', '2022-01-18', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022061513', '2022-02-20', 200.00, 'KIND', 1, '000003', 'confirmado'),

    (null, '2022071513', '2022-03-15', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022081513', '2022-04-16', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022091513', '2022-05-01', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022101513', '2022-06-08', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022111513', '2022-07-09', 200.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022121513', '2022-08-10', 200.00, 'KIND', 1, '000003', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000004
    (null, '2022011514', '2021-09-08', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022021514', '2021-10-09', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022031514', '2021-11-25', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022041514', '2021-12-21', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022051514', '2022-01-09', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022061514', '2022-02-12', 200.00, 'KIND', 1, '000004', 'confirmado'),

    (null, '2022071514', '2022-03-15', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022081514', '2022-04-15', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022091514', '2022-05-14', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022101514', '2022-06-08', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022111514', '2022-07-17', 200.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022121514', '2022-08-05', 200.00, 'KIND', 1, '000004', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000005
    (null, '2022011515', '2021-09-05', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022021515', '2021-10-08', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022031515', '2021-11-09', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022041515', '2021-12-10', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022051515', '2022-01-12', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022061515', '2022-02-14', 200.00, 'KIND', 1, '000005', 'confirmado'),

    (null, '2022071515', '2022-03-08', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022081515', '2022-04-09', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022091515', '2022-05-10', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022101515', '2022-06-14', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022111515', '2022-07-11', 200.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022121515', '2022-08-05', 200.00, 'KIND', 1, '000005', 'confirmado'),

    -- ALUMNO 06
    (null, '6961442926', '2021-09-02', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '1995094454', '2021-10-01', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '4825249529', '2021-11-08', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '2482448524', '2021-12-09', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '2452485284', '2022-01-10', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '9576956755', '2022-02-10', 200.00, 'PRIM', 1, '000006', 'confirmado'),

    (null, '9294828944', '2022-03-09', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '2498249824', '2022-04-15', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '2898957575', '2022-05-14', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '5876786787', '2022-06-11', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '5758687572', '2022-07-10', 200.00, 'PRIM', 1, '000006', 'confirmado'),
    (null, '6877854242', '2022-08-09', 200.00, 'PRIM', 1, '000006', 'confirmado'),

    -- ALUMNO 07
    (null, '7867686784', '2021-09-21', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '2427387387', '2021-10-19', 200.00, 'PRIM', 1, '000007', 'confirmado'), -- 101
    (null, '3873786787', '2021-11-18', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '8125847643', '2021-12-14', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '1258472127', '2022-01-15', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '1258472423', '2022-02-16', 200.00, 'PRIM', 1, '000007', 'confirmado'),

    (null, '2218452784', '2022-03-01', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '2184524752', '2022-04-04', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '4282894798', '2022-05-08', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '2845824524', '2022-06-05', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '2418425992', '2022-07-08', 200.00, 'PRIM', 1, '000007', 'confirmado'),
    (null, '3294814814', '2022-08-10', 200.00, 'PRIM', 1, '000007', 'confirmado'),

    -- ALUMNO 11
    (null, '3785786787', '2021-09-08', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '7847824824', '2021-10-09', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '7149882942', '2021-11-11', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '2481747272', '2021-12-14', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '4284918494', '2022-01-15', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '2482548524', '2022-02-18', 200.00, 'PRIM', 1, '000011', 'confirmado'),

    (null, '8294829482', '2022-03-16', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '8768767876', '2022-04-08', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '6876435424', '2022-05-09', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '9678745457', '2022-06-12', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '6876889698', '2022-07-14', 200.00, 'PRIM', 1, '000011', 'confirmado'),
    (null, '6786786858', '2022-08-16', 200.00, 'PRIM', 1, '000011', 'confirmado'),

    -- ALUMNO 12
    (null, '8224875474', '2021-09-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '2184154852', '2021-10-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '5839286965', '2021-11-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '3927575757', '2021-12-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '5783279271', '2022-01-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '5795757575', '2022-02-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),

    (null, '2548254852', '2022-03-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '5248528452', '2022-04-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '6783597865', '2022-05-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '2798578557', '2022-06-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '5728572427', '2022-07-15', 200.00, 'PRIM', 1, '000012', 'confirmado'),
    (null, '5795752952', '2022-08-15', 200.00, 'PRIM', 1, '000012', 'confirmado'), -- 135

    -- PERIODO 2
-- PAGOS POR MENSUALIDAD DEL ALUMNO 000006
    (null, '2022011516', '2022-09-08', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022021516', '2022-10-09', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022031516', '2022-11-12', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022041516', '2022-12-11', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022051516', '2023-01-10', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022061516', '2023-02-11', 200.00, 'PRIM', 2, '000006', 'confirmado'),

    (null, '2022071516', '2023-03-14', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022081516', '2023-04-13', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022091516', '2023-05-12', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022101516', '2023-06-11', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022111516', '2023-07-08', 200.00, 'PRIM', 2, '000006', 'confirmado'),
    (null, '2022121516', '2023-08-05', 200.00, 'PRIM', 2, '000006', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000007
    (null, '2022011517', '2022-09-08', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022021517', '2022-10-05', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022031517', '2022-11-11', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022041517', '2022-12-15', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022051517', '2023-01-12', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022061517', '2023-02-14', 200.00, 'PRIM', 2, '000007', 'confirmado'),

    (null, '2022071517', '2023-03-15', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022081517', '2023-04-18', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022091517', '2023-05-20', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022101517', '2023-06-05', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022111517', '2023-07-06', 200.00, 'PRIM', 2, '000007', 'confirmado'),
    (null, '2022121517', '2023-08-08', 200.00, 'PRIM', 2, '000007', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000008
    (null, '2022011518', '2022-09-05', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022021518', '2022-10-08', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022031518', '2022-11-09', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022041518', '2022-12-10', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022051518', '2023-01-12', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022061518', '2023-02-15', 200.00, 'PRIM', 2, '000008', 'confirmado'),

    (null, '2022071518', '2023-03-09', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022081518', '2023-04-10', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022091518', '2023-05-07', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022101518', '2023-06-14', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022111518', '2023-07-09', 200.00, 'PRIM', 2, '000008', 'confirmado'),
    (null, '2022121518', '2023-08-12', 200.00, 'PRIM', 2, '000008', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000009
    (null, '2022011519', '2022-09-09', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022021519', '2022-10-10', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022031519', '2022-11-10', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022041519', '2022-12-12', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022051519', '2023-01-13', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022061519', '2023-02-14', 200.00, 'PRIM', 2, '000009', 'confirmado'),

    (null, '2022071519', '2023-03-15', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022081519', '2023-04-16', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022091519', '2023-05-17', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022101519', '2023-06-18', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022111519', '2023-07-19', 200.00, 'PRIM', 2, '000009', 'confirmado'),
    (null, '2022121519', '2023-08-05', 200.00, 'PRIM', 2, '000009', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000010
    (null, '2022011520', '2022-09-05', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022021520', '2022-10-06', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022031520', '2022-11-19', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022041520', '2022-12-04', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022051520', '2023-01-08', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022061520', '2023-02-09', 200.00, 'PRIM', 2, '000010', 'confirmado'),

    (null, '2022071520', '2023-03-10', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022081520', '2023-04-11', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022091520', '2023-05-09', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022101520', '2023-06-08', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022111520', '2023-07-07', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    (null, '2022121520', '2023-08-06', 200.00, 'PRIM', 2, '000010', 'confirmado'),
    
    -- ALUMNO 01
    -- SEGUNDO PERIODO
    (null, '5421541214', '2022-09-10', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '8928549824', '2022-10-08', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '1542512441', '2022-11-07', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '2452145214', '2022-12-13', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '8928549245', '2023-01-10', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '1798519857', '2023-02-04', 200.00, 'PRIM', 2, '000001', 'confirmado'), -- 201

    (null, '6514268244', '2023-03-08', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '8254294524', '2023-04-10', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '6876925477', '2023-05-19', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '8742166984', '2023-06-13', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '8978322120', '2023-07-14', 200.00, 'PRIM', 2, '000001', 'confirmado'),
    (null, '1102684123', '2023-08-07', 200.00, 'PRIM', 2, '000001', 'confirmado'),

    -- ALUMNO 02
    -- SEGUNDO PERIODO
    (null, '2023189484', '2022-09-08', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '2026489787', '2022-10-10', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '0215964879', '2022-11-06', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '0151774789', '2022-12-10', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '2087985130', '2023-01-17', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '2015948797', '2023-02-15', 200.00, 'PRIM', 2, '000002', 'confirmado'),

    (null, '0265198789', '2023-03-16', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '2064897981', '2023-04-18', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '0022189498', '2023-05-08', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '1549820201', '2023-06-06', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '1564981300', '2023-07-05', 200.00, 'PRIM', 2, '000002', 'confirmado'),
    (null, '0548913021', '2023-08-15', 200.00, 'PRIM', 2, '000002', 'confirmado'),

    -- ALUMNO 11
    (null, '2514215245', '2022-09-08', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '3957697857', '2022-10-09', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '3965796474', '2022-11-10', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '2515857475', '2022-12-03', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '3297657577', '2023-01-08', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '1287548747', '2023-02-04', 200.00, 'SECU', 2, '000011', 'confirmado'),

    (null, '2558533187', '2023-03-08', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '2548793132', '2023-04-09', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '2135014044', '2023-05-10', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '0123489752', '2023-06-14', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '0126875318', '2023-07-11', 200.00, 'SECU', 2, '000011', 'confirmado'),
    (null, '0121351120', '2023-08-12', 200.00, 'SECU', 2, '000011', 'confirmado'),

    -- ALUMNO 12
    (null, '2514215246', '2022-09-05', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '2514215248', '2022-10-15', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '2514215249', '2022-11-08', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '2514215210', '2022-12-16', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '2254215245', '2023-01-09', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '8084015245', '2023-02-17', 200.00, 'SECU', 2, '000012', 'confirmado'),

    (null, '8154524242', '2023-03-08', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '5978752722', '2023-04-19', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '3587658517', '2023-05-15', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '8974721712', '2023-06-08', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '7958295824', '2023-07-09', 200.00, 'SECU', 2, '000012', 'confirmado'),
    (null, '8294829482', '2023-08-10', 200.00, 'SECU', 2, '000012', 'confirmado'),

    -- PERIODO 3
-- PAGOS POR MENSUALIDAD DEL ALUMNO 000011
    (null, '2023011521', '2023-09-11', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023021521', '2023-10-12', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023031521', '2023-11-08', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023041521', '2023-12-09', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023051521', '2024-01-10', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023061521', '2024-02-08', 250.00, 'SECU', 3, '000011', 'confirmado'),
    
    (null, '2023071521', '2024-03-15', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023081521', '2024-04-11', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023091521', '2024-05-10', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023101521', '2024-06-09', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023111521', '2024-07-12', 250.00, 'SECU', 3, '000011', 'confirmado'),
    (null, '2023121521', '2024-08-11', 250.00, 'SECU', 3, '000011', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000012
    (null, '2023011522', '2023-09-05', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023021522', '2023-10-06', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023031522', '2023-11-08', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023041522', '2023-12-10', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023051522', '2024-01-14', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023061522', '2024-02-12', 250.00, 'SECU', 3, '000012', 'confirmado'),

    (null, '2023071522', '2024-03-11', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023081522', '2024-04-10', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023091522', '2024-05-14', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023101522', '2024-06-11', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023111522', '2024-07-13', 250.00, 'SECU', 3, '000012', 'confirmado'),
    (null, '2023121522', '2024-08-08', 250.00, 'SECU', 3, '000012', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000013
    (null, '2023011523', '2023-09-13', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023021523', '2023-10-11', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023031523', '2023-11-08', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023041523', '2023-12-09', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023051523', '2023-01-15', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023061523', '2023-02-13', 250.00, 'SECU', 3, '000013', 'confirmado'),

    (null, '2023071523', '2023-03-11', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023081523', '2023-04-09', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023091523', '2023-05-07', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023101523', '2023-06-08', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023111523', '2023-07-13', 250.00, 'SECU', 3, '000013', 'confirmado'),
    (null, '2023121523', '2023-08-10', 250.00, 'SECU', 3, '000013', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000014
    (null, '2023011524', '2023-09-14', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023021524', '2023-10-13', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023031524', '2023-11-12', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023041524', '2023-12-11', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023051524', '2024-01-10', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023061524', '2024-02-09', 250.00, 'SECU', 3, '000014', 'confirmado'),

    (null, '2023071524', '2024-03-09', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023081524', '2024-04-10', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023091524', '2024-05-14', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023101524', '2024-06-13', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023111524', '2024-07-11', 250.00, 'SECU', 3, '000014', 'confirmado'),
    (null, '2023121524', '2024-08-12', 250.00, 'SECU', 3, '000014', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000015
    (null, '2023011525', '2023-09-09', 250.00, 'SECU', 3, '000015', 'confirmado'),
    (null, '2023021525', '2023-10-10', 250.00, 'SECU', 3, '000015', 'confirmado'),
    (null, '2023031525', '2023-11-14', 250.00, 'SECU', 3, '000015', 'confirmado'),
    (null, '2023041525', '2023-12-08', 250.00, 'SECU', 3, '000015', 'confirmado'),
    (null, '2023051525', '2024-01-07', 250.00, 'SECU', 3, '000015', 'confirmado'),
    (null, '2023061525', '2024-02-06', 250.00, 'SECU', 3, '000015', 'confirmado'),

    (null, '2023071525', '2024-03-09', 250.00, 'SECU', 3, '000015', 'confirmado'),
    (null, '2023081525', '2024-04-08', 250.00, 'SECU', 3, '000015', 'confirmado'),
    (null, '2023091525', '2024-05-14', 250.00, 'SECU', 3, '000015', 'confirmado'), -- 300
    (null, '2023101525', '2024-06-11', 250.00, 'SECU', 3, '000015', 'confirmado'), -- 301
    (null, '2023111525', '2024-07-10', 250.00, 'SECU', 3, '000015', 'confirmado'),
    (null, '2023121525', '2024-08-09', 250.00, 'SECU', 3, '000015', 'confirmado'),

    -- ALUMNO 01
    -- TERCER PERIODO
    (null, '0323210604', '2023-09-05', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0322310606', '2023-10-06', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0322310607', '2023-11-08', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0322310608', '2023-12-11', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0189176271', '2024-01-12', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0148972894', '2024-02-10', 200.00, 'PRIM', 3, '000001', 'confirmado'),

    (null, '8928594354', '2024-03-14', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0231489824', '2024-04-13', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0146259824', '2024-05-12', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0154682924', '2024-06-09', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0124829842', '2024-07-08', 200.00, 'PRIM', 3, '000001', 'confirmado'),
    (null, '0123829473', '2024-08-07', 200.00, 'PRIM', 3, '000001', 'confirmado'),

    -- ALUMNO 02
    -- TERCER PERIODO
    (null, '3018740809', '2023-09-09', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '1704894098', '2023-10-10', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '1780740448', '2023-11-14', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '8907984984', '2023-12-12', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '8984048448', '2024-01-10', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '0949848448', '2024-02-08', 200.00, 'PRIM', 3, '000002', 'confirmado'),

    (null, '3529482854', '2024-03-09', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '3246254985', '2024-04-10', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '3662496298', '2024-05-11', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '3961747311', '2024-06-08', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '3624814211', '2024-07-06', 200.00, 'PRIM', 3, '000002', 'confirmado'),
    (null, '3215148981', '2024-08-14', 200.00, 'PRIM', 3, '000002', 'confirmado'),

    -- ALUMNO 06
    (null, '0243214622', '2023-09-07', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '8475975657', '2023-10-10', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '3625658965', '2023-11-12', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '7457845744', '2023-12-18', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '3624584747', '2024-01-14', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '2521452144', '2024-02-17', 200.00, 'PRIM', 3, '000006', 'confirmado'),

    (null, '2897855757', '2024-03-08', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '3632989545', '2024-04-10', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '3654785474', '2024-05-06', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '3965967575', '2024-06-08', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '3625289757', '2024-07-09', 200.00, 'PRIM', 3, '000006', 'confirmado'),
    (null, '3997895454', '2024-08-14', 200.00, 'PRIM', 3, '000006', 'confirmado'),

    -- ALUMNO 07
    (null, '9842242455', '2023-09-07', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '6363757557', '2023-10-05', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '3625857575', '2023-11-04', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '6254298354', '2023-12-09', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '5879872274', '2024-01-12', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '8982594824', '2024-02-15', 200.00, 'PRIM', 3, '000007', 'confirmado'),

    (null, '3578957824', '2024-03-09', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '8938549245', '2024-04-14', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '3624518497', '2024-05-13', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '3254927454', '2024-06-11', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '8892754724', '2024-07-12', 200.00, 'PRIM', 3, '000007', 'confirmado'),
    (null, '3874987984', '2024-08-08', 200.00, 'PRIM', 3, '000007', 'confirmado'), -- 351


-- PAGOS DE EVENTOS

    -- PERIODO 1

    -- Eventos para Luis García
    (null, '2021090101', '2021-09-01', 50.00, 'KIND', 1, '000001', 'cancelado'),
    (null, '2021101501', '2021-10-15', 20.00, 'KIND', 1, '000001', 'cancelado'),
    (null, '2021112501', '2021-11-25', 25.00, 'KIND', 1, '000001', 'cancelado'),
    (null, '2021121501', '2021-12-15', 30.00, 'KIND', 1, '000001', 'cancelado'),
    (null, '2022031501', '2022-03-15', 20.00, 'KIND', 1, '000001', 'cancelado'),
    (null, '2022061001', '2022-06-05', 100.00, 'KIND', 1, '000001', 'confirmado'),

    -- Eventos para Ana Martínez
    (null, '2021090102', '2021-09-01', 50.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2021101502', '2021-10-02', 20.00, 'KIND', 1, '000002', 'cancelado'), -- 359
    (null, '2021112502', '2021-11-11', 25.00, 'KIND', 1, '000002', 'cancelado'),
    (null, '2021121502', '2021-12-15', 30.00, 'KIND', 1, '000002', 'cancelado'),
    (null, '2022031502', '2022-03-18', 20.00, 'KIND', 1, '000002', 'confirmado'),
    (null, '2022061002', '2022-06-08', 100.00, 'KIND', 1, '000002', 'confirmado'),

    -- Eventos para Diego Rodríguez Gómez
    (null, '2021090103', '2021-09-01', 50.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2021101503', '2021-10-14', 20.00, 'KIND', 1, '000003', 'confirmado'), -- 365
    (null, '2021112503', '2021-11-13', 25.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2021121503', '2021-12-11', 30.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022031503', '2022-03-12', 20.00, 'KIND', 1, '000003', 'confirmado'),
    (null, '2022061003', '2022-06-07', 100.00, 'KIND', 1, '000003', 'confirmado'),

    -- Eventos para María López
    (null, '2021090104', '2021-09-01', 50.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2021101504', '2021-10-15', 20.00, 'KIND', 1, '000004', 'cancelado'),
    (null, '2021112504', '2021-11-14', 25.00, 'KIND', 1, '000004', 'cancelado'),
    (null, '2021121504', '2021-12-01', 30.00, 'KIND', 1, '000004', 'cancelado'),
    (null, '2022031540', '2022-03-11', 20.00, 'KIND', 1, '000004', 'confirmado'),
    (null, '2022061004', '2022-06-02', 100.00, 'KIND', 1, '000004', 'confirmado'),

    -- Eventos para Javier Hernández
    (null, '2021090105', '2021-09-01', 50.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2021101505', '2021-10-10', 20.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2021112505', '2021-11-09', 25.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2021121505', '2021-12-08', 30.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022031505', '2022-03-14', 20.00, 'KIND', 1, '000005', 'confirmado'),
    (null, '2022061005', '2022-06-06', 100.00, 'KIND', 1, '000005', 'confirmado'),

    -- ALUMNO 06
    (null, '8651849849', '2021-09-11', 50.00, 'PRIM', 1, '000006', 'cancelado'),
    (null, '8954979646', '2021-10-14', 20.00, 'PRIM', 1, '000006', 'cancelado'),
    (null, '6454849852', '2021-11-10', 25.00, 'PRIM', 1, '000006', 'cancelado'),
    (null, '8986513132', '2021-12-09', 30.00, 'PRIM', 1, '000006', 'cancelado'), -- 385
    (null, '8987411321', '2022-03-15', 20.00, 'PRIM', 1, '000006', 'cancelado'),
    (null, '8977894513', '2022-06-08', 100.00, 'PRIM', 1, '000006', 'cancelado'),

    -- ALUMNO 07
    (null, '8651849810', '2021-09-11', 50.00, 'PRIM', 1, '000007', 'cancelado'),
    (null, '8954979566', '2021-10-12', 20.00, 'PRIM', 1, '000007', 'cancelado'),
    (null, '6454884852', '2021-11-13', 25.00, 'PRIM', 1, '000007', 'cancelado'),
    (null, '8986595132', '2021-12-14', 30.00, 'PRIM', 1, '000007', 'cancelado'),
    (null, '8981511321', '2022-03-18', 20.00, 'PRIM', 1, '000007', 'cancelado'),
    (null, '8977994513', '2022-06-19', 100.00, 'PRIM', 1, '000007', 'cancelado'),

    -- ALUMNO 11
    (null, '8651949810', '2021-09-11', 50.00, 'PRIM', 1, '000011', 'cancelado'),
    (null, '8954207956', '2021-10-12', 20.00, 'PRIM', 1, '000011', 'cancelado'),
    (null, '6454324852', '2021-11-13', 25.00, 'PRIM', 1, '000011', 'cancelado'),
    (null, '8987425132', '2021-12-14', 30.00, 'PRIM', 1, '000011', 'cancelado'),
    (null, '8981981321', '2022-03-15', 20.00, 'PRIM', 1, '000011', 'cancelado'),
    (null, '8977995513', '2022-06-16', 100.00, 'PRIM', 1, '000011', 'cancelado'),

    -- ALUNMO 12
    (null, '8651749810', '2021-09-11', 50.00, 'PRIM', 1, '000012', 'cancelado'),
    (null, '8954329566', '2021-10-18', 20.00, 'PRIM', 1, '000012', 'cancelado'),
    (null, '6454024852', '2021-11-19', 25.00, 'PRIM', 1, '000012', 'cancelado'),
    (null, '8986325132', '2021-12-20', 30.00, 'PRIM', 1, '000012', 'cancelado'),
    (null, '8981011321', '2022-03-21', 20.00, 'PRIM', 1, '000012', 'cancelado'),
    (null, '8977104513', '2022-06-08', 100.00, 'PRIM', 1, '000012', 'cancelado'),

    -- PERIODO 2

    -- Eventos para Carlos Gómez
    (null, '2022072506', '2022-07-25', 300.00, 'PRIM', 2, '000006', 'cancelado'),  
    (null, '2022093006', '2022-09-25', 40.00, 'PRIM', 2, '000006', 'confirmado'),    
    (null, '2022111006', '2022-11-10', 15.00, 'PRIM', 2, '000006', 'cancelado'),  
    (null, '2023012006', '2023-01-11', 25.00, 'PRIM', 2, '000006', 'confirmado'),    
    (null, '2023121006', '2023-12-08', 50.00, 'PRIM', 2, '000006', 'cancelado'), 
    (null, '2023061506', '2023-06-04', 120.00, 'PRIM', 2, '000006', 'confirmado'), 

    -- Eventos para Laura Díaz
    (null, '2022072507', '2022-07-11', 300.00, 'PRIM', 2, '000007', 'cancelado'),  
    (null, '2022093007', '2022-09-05', 40.00, 'PRIM', 2, '000007', 'confirmado'),    
    (null, '2022111007', '2022-10-30', 15.00, 'PRIM', 2, '000007', 'confirmado'),  
    (null, '2023012007', '2023-01-08', 25.00, 'PRIM', 2, '000007', 'cancelado'),    
    (null, '2023121007', '2023-12-01', 50.00, 'PRIM', 2, '000007', 'cancelado'), 
    (null, '2023061507', '2023-06-01', 120.00, 'PRIM', 2, '000007', 'confirmado'), 

    -- Eventos para Juan Martínez
    (null, '2022072508', '2022-07-14', 300.00, 'PRIM', 2, '000008', 'confirmado'),  
    (null, '2022093008', '2022-09-08', 40.00, 'PRIM', 2, '000008', 'cancelado'),    
    (null, '2022111008', '2022-11-05', 15.00, 'PRIM', 2, '000008', 'confirmado'),  
    (null, '2023012008', '2023-01-11', 25.00, 'PRIM', 2, '000008', 'cancelado'),    
    (null, '2023121008', '2023-12-04', 50.00, 'PRIM', 2, '000008', 'cancelado'), 
    (null, '2023061508', '2023-06-05', 120.00, 'PRIM', 2, '000008', 'confirmado'), 

    -- Eventos para Sofía Pérez
    (null, '2022072509', '2022-07-05', 300.00, 'PRIM', 2, '000009', 'cancelado'),  
    (null, '2022093009', '2022-09-10', 40.00, 'PRIM', 2, '000009', 'confirmado'),    
    (null, '2022111009', '2022-11-09', 15.00, 'PRIM', 2, '000009', 'confirmado'),  
    (null, '2023012009', '2023-01-08', 25.00, 'PRIM', 2, '000009', 'cancelado'),    
    (null, '2023121009', '2023-12-04', 50.00, 'PRIM', 2, '000009', 'confirmado'), 
    (null, '2023061509', '2023-06-11', 120.00, 'PRIM', 2, '000009', 'confirmado'), 

    -- Eventos para Pedro González
    (null, '2022072510', '2022-07-11', 300.00, 'PRIM', 2, '000010', 'cancelado'),  
    (null, '2022093010', '2022-09-14', 40.00, 'PRIM', 2, '000010', 'confirmado'),    
    (null, '2022111010', '2022-11-01', 15.00, 'PRIM', 2, '000010', 'cancelado'),  
    (null, '2023012010', '2023-01-12', 25.00, 'PRIM', 2, '000010', 'confirmado'),    
    (null, '2023121010', '2023-12-09', 50.00, 'PRIM', 2, '000010', 'cancelado'), 
    (null, '2023061510', '2023-06-11', 120.00, 'PRIM', 2, '000010', 'confirmado'),

    -- ALUMNO 01
    (null, '2849765970', '2022-07-11', 300.00, 'PRIM', 2, '000001', 'cancelado'),  
    (null, '8295842247', '2022-09-12', 40.00, 'PRIM', 2, '000001', 'cancelado'),    
    (null, '9897812100', '2022-11-04', 15.00, 'PRIM', 2, '000001', 'cancelado'),  
    (null, '0051641424', '2023-01-05', 25.00, 'PRIM', 2, '000001', 'cancelado'),    
    (null, '0314810148', '2023-12-06', 50.00, 'PRIM', 2, '000001', 'cancelado'), 
    (null, '8092180213', '2023-06-07', 120.00, 'PRIM', 2, '000001', 'cancelado'),

    -- ALUMNO 02
    (null, '2543245345', '2022-07-21', 300.00, 'PRIM', 2, '000002', 'cancelado'),  
    (null, '3542450424', '2022-09-22', 40.00, 'PRIM', 2, '000002', 'cancelado'),    
    (null, '3543875457', '2022-11-06', 15.00, 'PRIM', 2, '000002', 'cancelado'),  
    (null, '6978678557', '2023-01-11', 25.00, 'PRIM', 2, '000002', 'cancelado'),    
    (null, '2542543245', '2023-12-01', 50.00, 'PRIM', 2, '000002', 'cancelado'), 
    (null, '9428894855', '2023-06-03', 120.00, 'PRIM', 2, '000002', 'cancelado'),

    -- ALUMNO 11
    (null, '8981974511', '2022-07-05', 60.00, 'SECU', 2, '000011', 'cancelado'),  
    (null, '9784755237', '2022-09-08', 40.00, 'SECU', 2, '000011', 'cancelado'),    
    (null, '8983543545', '2022-11-01', 50.00, 'SECU', 2, '000011', 'cancelado'),  
    (null, '8982542354', '2023-01-14', 30.00, 'SECU', 2, '000011', 'cancelado'),    
    (null, '9567965352', '2023-12-02', 35.00, 'SECU', 2, '000011', 'cancelado'), 
    (null, '9857473254', '2023-06-03', 150.00, 'SECU', 2, '000011', 'cancelado'),

    -- ALUMNO 12
    (null, '8978894561', '2022-07-04', 60.00, 'SECU', 2, '000012', 'cancelado'),  
    (null, '2312165451', '2022-09-11', 40.00, 'SECU', 2, '000012', 'cancelado'),    
    (null, '3225687894', '2022-11-07', 50.00, 'SECU', 2, '000012', 'cancelado'),  
    (null, '8987845412', '2023-01-12', 30.00, 'SECU', 2, '000012', 'cancelado'),    
    (null, '5987897412', '2023-12-03', 35.00, 'SECU', 2, '000012', 'cancelado'), 
    (null, '8978942132', '2023-06-11', 150.00, 'SECU', 2, '000012', 'cancelado'),

    -- PERIODO 3

    -- ALUMNO 01
    (null, '2849765971', '2022-07-11', 300.00, 'PRIM', 3, '000001', 'cancelado'),  
    (null, '8295842248', '2022-09-12', 40.00, 'PRIM', 3, '000001', 'cancelado'),    
    (null, '9897812101', '2022-11-05', 15.00, 'PRIM', 3, '000001', 'cancelado'),  
    (null, '0051641425', '2023-01-13', 25.00, 'PRIM', 3, '000001', 'cancelado'),    
    (null, '0314810149', '2023-12-05', 50.00, 'PRIM', 3, '000001', 'cancelado'), 
    (null, '8092180214', '2023-06-11', 120.00, 'PRIM', 3, '000001', 'cancelado'),

    -- ALUMNO 02
    (null, '2849765971', '2022-07-11', 300.00, 'PRIM', 3, '000002', 'cancelado'),  
    (null, '8295842248', '2022-09-14', 40.00, 'PRIM', 3, '000002', 'cancelado'),    
    (null, '9897812101', '2022-11-03', 15.00, 'PRIM', 3, '000002', 'cancelado'),  
    (null, '0051641425', '2023-01-11', 25.00, 'PRIM', 3, '000002', 'cancelado'),    
    (null, '0314810149', '2023-12-06', 50.00, 'PRIM', 3, '000002', 'cancelado'), 
    (null, '8092180214', '2023-06-09', 120.00, 'PRIM', 3, '000002', 'cancelado'),

    -- ALUMNO 06
    (null, '1898715132', '2022-07-05', 300.00, 'PRIM', 3, '000006', 'cancelado'),  
    (null, '8987845123', '2022-09-08', 40.00, 'PRIM', 3, '000006', 'cancelado'),    
    (null, '0120210215', '2022-11-06', 15.00, 'PRIM', 3, '000006', 'cancelado'),  
    (null, '7875102875', '2023-01-11', 25.00, 'PRIM', 3, '000006', 'cancelado'),    
    (null, '0210014489', '2023-12-08', 50.00, 'PRIM', 3, '000006', 'cancelado'), 
    (null, '9870015786', '2023-06-11', 120.00, 'PRIM', 3, '000006', 'cancelado'),

    -- ALUMNO 07
    (null, '8789423102', '2022-07-09', 300.00, 'PRIM', 3, '000007', 'cancelado'),  
    (null, '9471231580', '2022-09-11', 40.00, 'PRIM', 3, '000007', 'cancelado'),    
    (null, '7413548651', '2022-11-02', 15.00, 'PRIM', 3, '000007', 'cancelado'),  
    (null, '6518632475', '2023-01-11', 25.00, 'PRIM', 3, '000007', 'cancelado'),    
    (null, '9512302145', '2023-12-03', 50.00, 'PRIM', 3, '000007', 'cancelado'), 
    (null, '5144896321', '2023-06-11', 120.00, 'PRIM', 3, '000007', 'cancelado'),    

    -- Eventos para Ana Hernández 
    (null, '2023091011', '2023-09-01', 60.00, 'SECU', 3, '000011', 'confirmado'), 
    (null, '2023110511', '2023-10-29', 40.00, 'SECU', 3, '000011', 'cancelado'),    
    (null, '2024021511', '2024-02-11', 50.00, 'SECU', 3, '000011', 'confirmado'), 
    (null, '2024032011', '2024-03-05', 30.00, 'SECU', 3, '000011', 'cancelado'),    
    (null, '2024042511', '2024-04-09', 35.00, 'SECU', 3, '000011', 'confirmado'),  
    (null, '2024060511', '2024-05-21', 150.00, 'SECU', 3, '000011', 'confirmado'),

    -- Eventos para Diego Martínez 
    (null, '2023091012', '2023-09-01', 60.00, 'SECU', 3, '000012', 'confirmado'),  
    (null, '2023110512', '2023-10-21', 40.00, 'SECU', 3, '000012', 'cancelado'),    
    (null, '2024021512', '2024-02-04', 50.00, 'SECU', 3, '000012', 'confirmado'),  
    (null, '2024032012', '2024-03-11', 30.00, 'SECU', 3, '000012', 'cancelado'),   
    (null, '2024042512', '2024-04-06', 35.00, 'SECU', 3, '000012', 'confirmado'),  
    (null, '2024060512', '2024-05-29', 150.00, 'SECU', 3, '000012', 'confirmado'),  

    -- Eventos para María López 
    (null, '2023091013', '2023-09-01', 60.00, 'SECU', 3, '000013', 'cancelado'),  
    (null, '2023110513', '2023-10-21', 40.00, 'SECU', 3, '000013', 'confirmado'),    
    (null, '2024021513', '2024-02-10', 50.00, 'SECU', 3, '000013', 'cancelado'),  
    (null, '2024032013', '2024-03-05', 30.00, 'SECU', 3, '000013', 'confirmado'),   
    (null, '2024042513', '2024-04-11', 35.00, 'SECU', 3, '000013', 'cancelado'),  
    (null, '2024060513', '2024-05-18', 150.00, 'SECU', 3, '000013', 'confirmado'),  

    -- Eventos para Javier Pérez 
    (null, '2023091014', '2023-09-01', 60.00, 'SECU', 3, '000014', 'cancelado'),  
    (null, '2023110514', '2023-11-02', 40.00, 'SECU', 3, '000014', 'confirmado'),    
    (null, '2024021514', '2024-02-03', 50.00, 'SECU', 3, '000014', 'confirmado'),  
    (null, '2024032014', '2024-03-11', 30.00, 'SECU', 3, '000014', 'cancelado'),   
    (null, '2024042514', '2024-04-14', 35.00, 'SECU', 3, '000014', 'confirmado'),  
    (null, '2024060514', '2024-05-11', 150.00, 'SECU', 3, '000014', 'confirmado'),  

    -- Eventos para Laura García 
    (null, '2023091015', '2023-09-01', 60.00, 'SECU', 3, '000015', 'confirmado'),  
    (null, '2023110515', '2023-10-04', 40.00, 'SECU', 3, '000015', 'cancelado'),    
    (null, '2024021515', '2024-02-01', 50.00, 'SECU', 3, '000015', 'confirmado'),  
    (null, '2024032015', '2024-03-08', 30.00, 'SECU', 3, '000015', 'confirmado'),    
    (null, '2024042515', '2024-04-15', 35.00, 'SECU', 3, '000015', 'cancelado'),  
    (null, '2024060515', '2024-05-12', 150.00, 'SECU', 3, '000015', 'confirmado');

-- Tabla grupo /// AUTO_INCREMENT
INSERT INTO grupo (numero, nombre, periodo, nivel_educativo, grado) VALUES
    -- KINDER periodo 1
    (null, '1A_21-22', 1, 'KIND', 1), -- 1
    (null, '1B_21-22', 1, 'KIND', 1), -- 2
    (null, '1C_21-22', 1, 'KIND', 1), -- 3

    (null, '2A_21-22', 1, 'KIND', 2), -- 4
    (null, '2B_21-22', 1, 'KIND', 2), -- 5
    (null, '2C_21-22', 1, 'KIND', 2), -- 6

    (null, '3A_21-22', 1, 'KIND', 3), -- 7
    (null, '3B_21-22', 1, 'KIND', 3), -- 8
    (null, '3C_21-22', 1, 'KIND', 3), -- 9

    -- KINDER periodo 2
    (null, '1A_22-23', 2, 'KIND', 1), -- 10
    (null, '1B_22-23', 2, 'KIND', 1), -- 11
    (null, '1C_22-23', 2, 'KIND', 1), -- 12

    (null, '2A_22-23', 2, 'KIND', 2), -- 13
    (null, '2B_22-23', 2, 'KIND', 2), -- 14
    (null, '2C_22-23', 2, 'KIND', 2), -- 15

    (null, '3A_22-23', 2, 'KIND', 3), -- 16
    (null, '3B_22-23', 2, 'KIND', 3), -- 17
    (null, '3C_22-23', 2, 'KIND', 3), -- 18

    -- KINDER periodo 3
    (null, '1A_23-24', 3, 'KIND', 1), -- 19
    (null, '1B_23-24', 3, 'KIND', 1), -- 20
    (null, '1C_23-24', 3, 'KIND', 1), -- 21

    (null, '2A_23-24', 3, 'KIND', 2), -- 22
    (null, '2B_23-24', 3, 'KIND', 2), -- 23
    (null, '2C_23-24', 3, 'KIND', 2), -- 24

    (null, '3A_23-23', 3, 'KIND', 3), -- 25
    (null, '3B_23-23', 3, 'KIND', 3), -- 26
    (null, '3C_23-23', 3, 'KIND', 3), -- 27

    -- KINDER periodo 4
    (null, '1A_24-25', 4, 'KIND', 1), -- 28
    (null, '1B_24-25', 4, 'KIND', 1), -- 29
    (null, '1C_24-25', 4, 'KIND', 1), -- 30

    (null, '2A_24-25', 4, 'KIND', 2), -- 31
    (null, '2B_24-25', 4, 'KIND', 2), -- 32
    (null, '2C_24-25', 4, 'KIND', 2), -- 33

    (null, '3A_24-25', 4, 'KIND', 3), -- 34
    (null, '3B_24-25', 4, 'KIND', 3), -- 35
    (null, '3C_24-25', 4, 'KIND', 3), -- 36

    -- PRIMARIA periodo 1
    (null, '1A_21-22', 1, 'PRIM', 4), -- 37
    (null, '1B_21-22', 1, 'PRIM', 4), -- 38
    (null, '1C_21-22', 1, 'PRIM', 4), -- 39

    (null, '2A_21-22', 1, 'PRIM', 5), -- 40
    (null, '2B_21-22', 1, 'PRIM', 5), -- 41
    (null, '2C_21-22', 1, 'PRIM', 5), -- 42

    (null, '3A_21-22', 1, 'PRIM', 6), -- 43
    (null, '3B_21-22', 1, 'PRIM', 6), -- 44
    (null, '3C_21-22', 1, 'PRIM', 6), -- 45

    (null, '4A_21-22', 1, 'PRIM', 7), -- 46
    (null, '4B_21-22', 1, 'PRIM', 7), -- 47
    (null, '4C_21-22', 1, 'PRIM', 7), -- 48

    (null, '5A_21-22', 1, 'PRIM', 8), -- 49
    (null, '5B_21-22', 1, 'PRIM', 8), -- 50
    (null, '5C_21-22', 1, 'PRIM', 8), -- 51

    (null, '6A_21-22', 1, 'PRIM', 9), -- 52
    (null, '6B_21-22', 1, 'PRIM', 9), -- 53
    (null, '6C_21-22', 1, 'PRIM', 9), -- 54

    -- PRIMARIA periodo 2
    (null, '1A_22-23', 2, 'PRIM', 4), -- 55
    (null, '1B_22-23', 2, 'PRIM', 4), -- 56
    (null, '1C_22-23', 2, 'PRIM', 4), -- 57

    (null, '2A_22-23', 2, 'PRIM', 5), -- 58
    (null, '2B_22-23', 2, 'PRIM', 5), -- 59
    (null, '2C_22-23', 2, 'PRIM', 5), -- 60

    (null, '3A_22-23', 2, 'PRIM', 6), -- 61
    (null, '3B_22-23', 2, 'PRIM', 6), -- 62
    (null, '3C_22-23', 2, 'PRIM', 6), -- 63

    (null, '4A_22-23', 2, 'PRIM', 7), -- 64
    (null, '4B_22-23', 2, 'PRIM', 7), -- 65
    (null, '4C_22-23', 2, 'PRIM', 7), -- 66

    (null, '5A_22-23', 2, 'PRIM', 8), -- 67
    (null, '5B_22-23', 2, 'PRIM', 8), -- 68
    (null, '5C_22-23', 2, 'PRIM', 8), -- 69

    (null, '6A_22-23', 2, 'PRIM', 9), -- 70
    (null, '6B_22-23', 2, 'PRIM', 9), -- 71
    (null, '6C_22-23', 2, 'PRIM', 9), -- 72

    -- PRIMARIA periodo 3
    (null, '1A_23-24', 3, 'PRIM', 4), -- 73
    (null, '1B_23-24', 3, 'PRIM', 4), -- 74
    (null, '1C_23-24', 3, 'PRIM', 4), -- 75

    (null, '2A_23-24', 3, 'PRIM', 5), -- 76
    (null, '2B_23-24', 3, 'PRIM', 5), -- 77
    (null, '2C_23-24', 3, 'PRIM', 5), -- 78

    (null, '3A_23-24', 3, 'PRIM', 6), -- 79
    (null, '3B_23-24', 3, 'PRIM', 6), -- 80
    (null, '3C_23-24', 3, 'PRIM', 6), -- 81

    (null, '4A_23-24', 3, 'PRIM', 7), -- 82
    (null, '4B_23-24', 3, 'PRIM', 7), -- 83
    (null, '4C_23-24', 3, 'PRIM', 7), -- 84

    (null, '5A_23-24', 3, 'PRIM', 8), -- 85
    (null, '5B_23-24', 3, 'PRIM', 8), -- 86
    (null, '5C_23-24', 3, 'PRIM', 8), -- 87

    (null, '6A_23-24', 3, 'PRIM', 9), -- 88
    (null, '6B_23-24', 3, 'PRIM', 9), -- 89
    (null, '6C_23-24', 3, 'PRIM', 9), -- 90

    -- PRIMARIA periodo 4
    (null, '1A_24-25', 4, 'PRIM', 4), -- 91
    (null, '1B_24-25', 4, 'PRIM', 4), -- 92
    (null, '1C_24-25', 4, 'PRIM', 4), -- 93

    (null, '2A_24-25', 4, 'PRIM', 5), -- 94
    (null, '2B_24-25', 4, 'PRIM', 5), -- 95
    (null, '2C_24-25', 4, 'PRIM', 5), -- 96

    (null, '3A_24-25', 4, 'PRIM', 6), -- 97
    (null, '3B_24-25', 4, 'PRIM', 6), -- 98
    (null, '3C_24-25', 4, 'PRIM', 6), -- 99

    (null, '4A_24-25', 4, 'PRIM', 7), -- 100
    (null, '4B_24-25', 4, 'PRIM', 7), -- 101
    (null, '4C_24-25', 4, 'PRIM', 7), -- 102

    (null, '5A_24-25', 4, 'PRIM', 8), -- 103
    (null, '5B_24-25', 4, 'PRIM', 8), -- 104
    (null, '5C_24-25', 4, 'PRIM', 8), -- 105

    (null, '6A_24-25', 4, 'PRIM', 9), -- 106
    (null, '6B_24-25', 4, 'PRIM', 9), -- 107
    (null, '6C_24-25', 4, 'PRIM', 9), -- 108

    -- SECUNDARIA periodo 1
    (null, '1A_21-22', 1, 'SECU', 10), -- 109
    (null, '1B_21-22', 1, 'SECU', 10), -- 110
    (null, '1C_21-22', 1, 'SECU', 10), -- 111

    (null, '2A_21-22', 1, 'SECU', 11), -- 112
    (null, '2B_21-22', 1, 'SECU', 11), -- 113
    (null, '2C_21-22', 1, 'SECU', 11), -- 114

    (null, '3A_21-22', 1, 'SECU', 12), -- 115
    (null, '3B_21-22', 1, 'SECU', 12), -- 116
    (null, '3C_21-22', 1, 'SECU', 12), -- 117

    -- SECUNDARIA periodo 2
    (null, '1A_22-23', 2, 'SECU', 10), -- 118
    (null, '1B_22-23', 2, 'SECU', 10), -- 119
    (null, '1C_22-23', 2, 'SECU', 10), -- 120

    (null, '2A_22-23', 2, 'SECU', 11), -- 121
    (null, '2B_22-23', 2, 'SECU', 11), -- 122
    (null, '2C_22-23', 2, 'SECU', 11), -- 123

    (null, '3A_22-23', 2, 'SECU', 12), -- 124
    (null, '3B_22-23', 2, 'SECU', 12), -- 125
    (null, '3C_22-23', 2, 'SECU', 12), -- 126

    -- SECUNDARIA periodo 3
    (null, '1A_23-24', 3, 'SECU', 10), -- 127
    (null, '1B_23-24', 3, 'SECU', 10), -- 128
    (null, '1C_23-24', 3, 'SECU', 10), -- 129

    (null, '2A_23-24', 3, 'SECU', 11), -- 130
    (null, '2B_23-24', 3, 'SECU', 11), -- 131
    (null, '2C_23-24', 3, 'SECU', 11), -- 132

    (null, '3A_23-24', 3, 'SECU', 12), -- 133
    (null, '3B_23-24', 3, 'SECU', 12), -- 134
    (null, '3C_23-24', 3, 'SECU', 12), -- 135

    -- SECUNDARIA periodo 4
    (null, '1A_24-25', 4, 'SECU', 10), -- 136
    (null, '1B_24-25', 4, 'SECU', 10), -- 137
    (null, '1C_24-25', 4, 'SECU', 10), -- 138

    (null, '2A_24-25', 4, 'SECU', 11), -- 139
    (null, '2B_24-25', 4, 'SECU', 11), -- 140
    (null, '2C_24-25', 4, 'SECU', 11), -- 141

    (null, '3A_24-25', 4, 'SECU', 12), -- 142
    (null, '3B_24-25', 4, 'SECU', 12), -- 143
    (null, '3C_24-25', 4, 'SECU', 12); -- 144

-- Tabla grupo_alumno 
INSERT INTO grupo_alumno (alumno, grupo) VALUES
    ('000001', 7),
    ('000002', 7),
    ('000003', 8),
    ('000004', 8),
    ('000005', 9),

    ('000006', 64),
    ('000007', 64),
    ('000008', 67),
    ('000009', 65),
    ('000010', 65),

    ('000011', 130),
    ('000012', 130),
    ('000013', 133),
    ('000014', 131),
    ('000015', 131),

    -- PERIODO 2
    ('000001', 55),
    ('000002', 55),
    -- PERIODO 3
    ('000001', 77),
    ('000002', 77),
    -- PERIODO 1
    ('000006', 43),
    ('000007', 43),
    -- PERIODO 3
    ('000006', 86),
    ('000007', 86),
    -- PERIODO 1
    ('000011', 88),
    ('000012', 88),
    -- PERIODO 2
    ('000011', 118),
    ('000012', 118),

    -- PERIODO 4
    ('000001', 97),
    ('000002', 97),
    ('000006', 106),
    ('000007', 106),
    ('000011', 142),
    ('000012', 142);

-- Tabla inscripcion
INSERT INTO inscripcion (codigo, precio, grado) VALUES
    ('INS_KIND1_21-22', 500.00, 1),
    ('INS_KIND1_22-23', 500.00, 1),
    ('INS_KIND1_23-24', 500.00, 1),
    ('INS_KIND1_24-25', 500.00, 1),

    ('INS_KIND2_21-22', 550.00, 2),
    ('INS_KIND2_22-23', 550.00, 2),
    ('INS_KIND2_23-24', 550.00, 2),
    ('INS_KIND2_24-25', 550.00, 2),
    
    ('INS_KIND3_21-22', 600.00, 3),
    ('INS_KIND3_22-23', 600.00, 3),
    ('INS_KIND3_23-24', 600.00, 3),
    ('INS_KIND3_24-25', 600.00, 3),

    ('INS_PRIM1_21-22', 650.00, 4),
    ('INS_PRIM1_22-23', 650.00, 4),
    ('INS_PRIM1_23-24', 650.00, 4),
    ('INS_PRIM1_24-25', 650.00, 4),

    ('INS_PRIM2_21-22', 700.00, 5),
    ('INS_PRIM2_22-23', 700.00, 5),
    ('INS_PRIM2_23-24', 700.00, 5),
    ('INS_PRIM2_24-25', 700.00, 5),

    ('INS_PRIM3_21-22', 750.00, 6),
    ('INS_PRIM3_22-23', 750.00, 6),
    ('INS_PRIM3_23-24', 750.00, 6),
    ('INS_PRIM3_24-25', 750.00, 6),

    ('INS_PRIM4_21-22', 650.00, 7),
    ('INS_PRIM4_22-23', 650.00, 7),
    ('INS_PRIM4_23-24', 650.00, 7),
    ('INS_PRIM4_24-25', 650.00, 7),

    ('INS_PRIM5_21-22', 700.00, 8),
    ('INS_PRIM5_22-23', 700.00, 8),
    ('INS_PRIM5_23-24', 700.00, 8),
    ('INS_PRIM5_24-25', 700.00, 8),

    ('INS_PRIM6_21-22', 750.00, 9),
    ('INS_PRIM6_22-23', 750.00, 9),
    ('INS_PRIM6_23-24', 750.00, 9),
    ('INS_PRIM6_24-25', 750.00, 9),

    ('INS_SECU1_21-22', 650.00, 10),
    ('INS_SECU1_22-23', 650.00, 10),
    ('INS_SECU1_23-24', 650.00, 10),
    ('INS_SECU1_24-25', 650.00, 10),

    ('INS_SECU2_21-22', 700.00, 11),
    ('INS_SECU2_22-23', 700.00, 11),
    ('INS_SECU2_23-24', 700.00, 11),
    ('INS_SECU2_24-25', 700.00, 11),

    ('INS_SECU3_21-22', 750.00, 12),
    ('INS_SECU3_22-23', 750.00, 12),
    ('INS_SECU3_23-24', 750.00, 12),
    ('INS_SECU3_24-25', 750.00, 12);

-- Tabla examen
INSERT INTO examen (codigo, precio, tipo_de_examen) VALUES
    ('EX_PAR', 50.00, 'PAR'),
    ('EX_REM', 60.00, 'REM'),
    ('EX_EXT', 70.00, 'EXT'),
    ('EX_DIAG', 80.00, 'DIAG'),
    ('EX_ING', 90.00, 'ING');

-- Tabla mensualidad
INSERT INTO mensualidad (codigo, nombre, precio, tipo_de_mensualidad) VALUES
    ('ENE', 'Mensualidad de Enero', 200.00, 'REG'), 
    ('FEB', 'Mensualidad de Febrero', 200.00, 'REG'),
    ('MAR', 'Mensualidad de Marzo', 200.00, 'REG'),
    ('ABR', 'Mensualidad de Abril', 200.00, 'REG'),
    ('MAY', 'Mensualidad de Mayo', 200.00, 'REG'),
    ('JUN', 'Mensualidad de Junio', 200.00, 'VAC'),
    ('JUL', 'Mensualidad de Julio', 200.00, 'VAC'),
    ('AGO', 'Mensualidad de Agosto', 200.00, 'VAC'),
    ('SEP', 'Mensualidad de Septiembre', 200.00, 'REG'),
    ('OCT', 'Mensualidad de Octubre', 200.00, 'REG'),
    ('NOV', 'Mensualidad de Noviembre', 200.00, 'REG'),
    ('DIC', 'Mensualidad de Diciembre', 200.00, 'REG');

-- Tabla paquete_de_uniforme /// AUTO_INCREMENT
INSERT INTO paquete_de_uniforme (numero, descripcion, costo, genero, talla) VALUES
    (null, 'Paquete de uniforme Masculino S (KINDER)', 475.75, 'M', 'S'),
    (null, 'Paquete de uniforme Masculino M (KINDER)', 475.75, 'M', 'M'),
    (null, 'Paquete de uniforme Masculino L (KINDER)', 475.75, 'M', 'L'),
    (null, 'Paquete de uniforme Masculino S (PRIMARIA)', 475.75, 'M', 'S'),
    (null, 'Paquete de uniforme Masculino M (PRIMARIA)', 475.75, 'M', 'M'),
    (null, 'Paquete de uniforme Masculino L (PRIMARIA)', 475.75, 'M', 'L'),
    (null, 'Paquete de uniforme Masculino S (SECUNDARIA)', 475.75, 'M', 'S'),
    (null, 'Paquete de uniforme Masculino M (SECUNDARIA)', 475.75, 'M', 'M'),
    (null, 'Paquete de uniforme Masculino L (SECUNDARIA)', 475.75, 'M', 'L'), -- 9
    (null, 'Paquete de uniforme Femenino S (KINDER)', 475.75, 'F', 'S'),
    (null, 'Paquete de uniforme Femenino M (KINDER)', 475.75, 'F', 'M'),
    (null, 'Paquete de uniforme Femenino L (KINDER)', 475.75, 'F', 'L'),
    (null, 'Paquete de uniforme Femenino S (PRIMARIA)', 475.75, 'F', 'S'),
    (null, 'Paquete de uniforme Femenino M (PRIMARIA)', 475.75, 'F', 'M'),
    (null, 'Paquete de uniforme Femenino L (PRIMARIA)', 475.75, 'F', 'L'),
    (null, 'Paquete de uniforme Femenino S (SECUNDARIA)', 475.75, 'F', 'S'),
    (null, 'Paquete de uniforme Femenino M (SECUNDARIA)', 475.75, 'F', 'M'),
    (null, 'Paquete de uniforme Femenino L (SECUNDARIA)', 475.75, 'F', 'L');


-- Tabla detalle_paquete (Tipo de Uniforme y Paquete de Uniforme) 
INSERT INTO detalle_paquete (paquete_de_uniforme, tipo_de_uniforme) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 2),
    (3, 3),
    (4, 6),
    (4, 7),
    (4, 8),
    (5, 6),
    (5, 7),
    (5, 8),
    (6, 6),
    (6, 7),
    (6, 8),
    (7, 11),
    (7, 12),
    (7, 13),
    (8, 11),
    (8, 12),
    (8, 13),
    (9, 11),
    (9, 12),
    (9, 13),
    (10, 3),
    (10, 4),
    (10, 5),
    (11, 3),
    (11, 4),
    (11, 5),
    (12, 3),
    (12, 4),
    (12, 5),
    (13, 8),
    (13, 9),
    (13, 10),
    (14, 8),
    (14, 9),
    (14, 10),
    (15, 8),
    (15, 9),
    (15, 10),
    (16, 13),
    (16, 14),
    (16, 15),
    (17, 13),
    (17, 14),
    (17, 15),
    (18, 13),
    (18, 14),
    (18, 15);

-- Tabla tipo_de_pago /// AUTO_INCREMENT
INSERT INTO tipo_de_pago (numero, descripcion, pago, inscripcion, paquete_de_uniforme, examen, mensualidad, evento, paquete_de_material, mantenimiento) VALUES
    -- CICLO 2021-2022

    -- PAGOS DE INSCRIPCIÓN
    (null, 'Pago de Inscripción 3ro de Kinder', 1, 'INS_KIND3_21-22', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 2, 'INS_KIND3_21-22', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 3, 'INS_KIND3_21-22', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 4, 'INS_KIND3_21-22', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 5, 'INS_KIND3_21-22', NULL, NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Inscripción 3ro de Primaria', 6, 'INS_PRIM3_21-22', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Primaria', 7, 'INS_PRIM3_21-22', NULL, NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Inscripción 6to de Primaria', 8, 'INS_PRIM6_21-22', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 6to de Primaria', 9, 'INS_PRIM6_21-22', NULL, NULL, NULL, NULL, NULL, NULL),

    -- CICLO 2022-2023
    (null, 'Pago de Inscripción 4to de Primaria', 10, 'INS_PRIM4_22-23', NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 4to de Primaria', 11, 'INS_PRIM4_22-23', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 5to de Primaria', 12, 'INS_PRIM5_22-23', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 4to de Primaria', 13, 'INS_PRIM4_22-23', NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 4to de Primaria', 14, 'INS_PRIM4_22-23', NULL, NULL, NULL, NULL, NULL, NULL), 

    (null, 'Pago de Inscripción 1ro de Primaria', 15, 'INS_PRIM1_22-23', NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 1ro de Primaria', 16, 'INS_PRIM1_22-23', NULL, NULL, NULL, NULL, NULL, NULL), 

    (null, 'Pago de Inscripción 1ro de Secundaria', 17, 'INS_SECU1_22-23', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 1ro de Secundaria', 18, 'INS_SECU1_22-23', NULL, NULL, NULL, NULL, NULL, NULL),

    -- CICLO 2023-2024
    (null, 'Pago de Inscripción 2do de Secundaria', 19, 'INS_SECU2_23-24', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', 20, 'INS_SECU2_23-24', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Secundaria', 21, 'INS_SECU3_23-24', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', 22, 'INS_SECU2_23-24', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', 23, 'INS_SECU2_23-24', NULL, NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Inscripción 2do de Primaria', 24, 'INS_PRIM2_23-24', NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 2do de Primaria', 25, 'INS_PRIM2_23-24', NULL, NULL, NULL, NULL, NULL, NULL),
    
    (null, 'Pago de Inscripción 5to de Primaria', 26, 'INS_PRIM5_23-24', NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 5to de Primaria', 27, 'INS_PRIM5_23-24', NULL, NULL, NULL, NULL, NULL, NULL),


    -- PAGOS DE MENSUALIDAD

    -- PERIODO 1

    -- ALUMNO 1
    (null, 'Pago de Mensualidad de Septiembre', 28, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 29, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 30, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 31, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 32, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 33, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 34, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 35, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 36, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 37, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 38, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 39, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 2
    (null, 'Pago de Mensualidad de Septiembre', 40, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 41, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 42, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 43, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 44, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 45, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 46, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 47, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 48, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 49, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 50, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 51, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 3
    (null, 'Pago de Mensualidad de Septiembre', 52, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 53, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 54, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 55, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 56, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 57, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 58, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 59, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 60, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 61, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 62, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 63, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 4
    (null, 'Pago de Mensualidad de Septiembre', 64, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 65, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 66, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 67, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 68, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 69, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 70, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 71, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 72, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 73, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 74, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 75, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 5
    (null, 'Pago de Mensualidad de Septiembre', 76, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 77, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 78, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 79, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 80, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 81, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 82, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 83, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 84, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 85, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 86, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 87, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 6
    (null, 'Pago de Mensualidad de Septiembre', 88, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 89, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 90, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 91, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 92, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 93, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 94, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 95, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 96, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 97, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 98, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 99, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 7
    (null, 'Pago de Mensualidad de Septiembre', 100, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 101, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 102, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 103, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 104, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 105, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 106, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 107, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 108, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 109, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 110, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 111, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 11
    (null, 'Pago de Mensualidad de Septiembre', 112, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 113, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 114, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 115, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 116, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 117, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 118, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 119, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 120, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 121, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 122, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 123, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 12
    (null, 'Pago de Mensualidad de Septiembre', 124, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 125, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 126, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 127, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 128, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 129, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 130, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 131, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 132, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 133, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 134, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 135, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- PERIODO 2

    -- ALUMNO 6
    (null, 'Pago de Mensualidad de Septiembre', 136, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 137, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 138, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 139, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 140, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 141, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 142, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 143, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 144, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 145, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 146, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 147, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 7
    (null, 'Pago de Mensualidad de Septiembre', 148, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 149, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 150, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 151, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 152, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 153, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 154, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 155, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 156, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 157, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 158, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 159, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 8
    (null, 'Pago de Mensualidad de Septiembre', 160, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 161, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 162, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 163, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 164, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 165, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 166, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 167, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 168, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 169, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 170, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 171, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 9
    (null, 'Pago de Mensualidad de Septiembre', 172, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 173, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 174, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 175, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 176, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 177, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 178, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 179, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 180, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 181, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 182, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 183, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 10
    (null, 'Pago de Mensualidad de Septiembre', 184, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 185, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 186, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 187, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 188, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 189, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 190, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 191, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 192, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 193, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 194, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 195, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 1
    (null, 'Pago de Mensualidad de Septiembre', 196, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 197, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 198, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 199, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 200, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 201, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 202, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 203, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 204, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 205, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 206, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 207, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 2
    (null, 'Pago de Mensualidad de Septiembre', 208, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 209, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 210, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 211, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 212, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 213, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 214, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 215, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 216, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 217, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 218, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 219, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 11
    (null, 'Pago de Mensualidad de Septiembre', 220, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 221, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 222, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 223, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 224, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 225, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 226, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 227, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 228, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 229, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 230, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 231, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 12
    (null, 'Pago de Mensualidad de Septiembre', 232, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 233, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 234, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 235, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 236, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 237, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 238, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 239, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 240, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 241, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 242, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 243, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- PERIODO 3

    -- ALUMNO 11
    (null, 'Pago de Mensualidad de Septiembre', 244, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 245, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 246, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 247, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 248, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 249, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 250, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 251, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 252, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 253, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 254, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 255, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 12
    (null, 'Pago de Mensualidad de Septiembre', 256, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 257, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 258, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 259, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 260, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 261, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 262, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 263, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 264, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 265, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 266, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 267, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 13
    (null, 'Pago de Mensualidad de Septiembre', 268, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 269, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 270, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 271, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 272, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 273, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 274, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 275, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 276, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 277, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 278, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 279, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 14
    (null, 'Pago de Mensualidad de Septiembre', 280, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 281, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 282, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 283, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 284, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 285, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 286, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 287, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 288, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 289, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 290, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 291, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 15
    (null, 'Pago de Mensualidad de Septiembre', 292, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 293, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 294, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 295, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 296, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 297, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 298, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 299, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 300, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 301, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 302, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 303, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 1
    (null, 'Pago de Mensualidad de Septiembre', 304, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 305, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 306, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 307, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 308, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 309, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 310, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 311, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 312, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 313, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 314, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 315, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 2
    (null, 'Pago de Mensualidad de Septiembre', 316, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 317, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 318, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 319, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 320, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 321, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 322, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 323, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 324, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 325, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 326, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 327, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 6
    (null, 'Pago de Mensualidad de Septiembre', 328, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 329, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 330, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 331, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 332, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 333, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 334, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 335, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 336, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 337, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 338, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 339, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- ALUMNO 7
    (null, 'Pago de Mensualidad de Septiembre', 340, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 341, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 342, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 343, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Enero', 344, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 345, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 346, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 347, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 348, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 349, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Julio', 350, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 351, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),

    -- PAGOS DE EVENTOS

    -- PERIODO 1
    -- KINDER
    (null, 'Pago para Fiesta de Bienvenida', 352, NULL, NULL, NULL, NULL, 1, NULL, NULL),
    (null, 'Pago para el Día de Juegos', 353, NULL,  NULL, NULL, NULL, 2, NULL, NULL),
    (null, 'Pago para el Festival de Otoño', 354, NULL,  NULL, NULL, NULL, 3, NULL, NULL),
    (null, 'Pago para Fiesta de Navidad', 355, NULL,  NULL, NULL, NULL, 4, NULL, NULL),
    (null, 'Pago para Desfile de Primavera', 356,  NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 357, NULL, NULL, NULL, NULL, 6, NULL, NULL),

    (null, 'Pago para Fiesta de Bienvenida', 358, NULL, NULL, NULL, NULL, 1, NULL, NULL),
    (null, 'Pago para el Día de Juegos', 359, NULL, NULL, NULL, NULL, 2, NULL, NULL),
    (null, 'Pago para el Festival de Otoño', 360, NULL, NULL, NULL, NULL, 3, NULL, NULL),
    (null, 'Pago para Fiesta de Navidad', 361, NULL, NULL, NULL, NULL, 4, NULL, NULL),
    (null, 'Pago para Desfile de Primavera', 362, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 363, NULL, NULL, NULL, NULL, 6, NULL, NULL),

    (null, 'Pago para Fiesta de Bienvenida', 364, NULL, NULL, NULL, NULL, 1, NULL, NULL),
    (null, 'Pago para el Día de Juegos', 365, NULL, NULL, NULL, NULL, 2, NULL, NULL),
    (null, 'Pago para el Festival de Otoño', 366, NULL, NULL, NULL, NULL, 3, NULL, NULL),
    (null, 'Pago para Fiesta de Navidad', 367, NULL, NULL, NULL, NULL, 4, NULL, NULL),
    (null, 'Pago para Desfile de Primavera', 368, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 369, NULL, NULL, NULL, NULL, 6, NULL, NULL),

    (null, 'Pago para Fiesta de Bienvenida', 370, NULL, NULL, NULL, NULL, 1, NULL, NULL),
    (null, 'Pago para el Día de Juegos', 371, NULL, NULL, NULL, NULL, 2, NULL, NULL),
    (null, 'Pago para el Festival de Otoño', 372, NULL, NULL, NULL, NULL, 3, NULL, NULL),
    (null, 'Pago para Fiesta de Navidad', 373, NULL, NULL, NULL, NULL, 4, NULL, NULL),
    (null, 'Pago para Desfile de Primavera', 374, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 375, NULL, NULL, NULL, NULL, 6, NULL, NULL),

    (null, 'Pago para Fiesta de Bienvenida', 376, NULL, NULL, NULL, NULL, 1, NULL, NULL),
    (null, 'Pago para el Día de Juegos', 377, NULL, NULL, NULL, NULL, 2, NULL, NULL),
    (null, 'Pago para el Festival de Otoño', 378, NULL, NULL, NULL, NULL, 3, NULL, NULL),
    (null, 'Pago para Fiesta de Navidad', 379, NULL, NULL, NULL, NULL, 4, NULL, NULL),
    (null, 'Pago para Desfile de Primavera', 380, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 381, NULL, NULL, NULL, NULL, 6, NULL, NULL),

    -- PRIMARIA
    -- ALUMNO 06
    (null, 'Pago para Campamento de Verano Escolar', 382, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 383, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 384, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 385, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 386, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 387, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- ALUMNO 07
    (null, 'Pago para Campamento de Verano Escolar', 388, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 389, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 390, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 391, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 392, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 393, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- ALUMNO 11
    (null, 'Pago para Campamento de Verano Escolar', 394, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 395, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 396, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 397, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 398, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 399, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- ALUMNO 12
    (null, 'Pago para Campamento de Verano Escolar', 400, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 401, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 402, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 403, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 404, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 405, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- PERIODO 2
    -- PRIMARIA
    (null, 'Pago para Campamento de Verano Escolar', 406, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 407, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 408, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 409, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 410, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 411, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    (null, 'Pago para Campamento de Verano Escolar', 412, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 413, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 414, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 415, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 416, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 417, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    (null, 'Pago para Campamento de Verano Escolar', 418, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 419, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 420, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 421, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 422, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 423, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    (null, 'Pago para Campamento de Verano Escolar', 424, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 425, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 426, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 427, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 428, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 429, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    (null, 'Pago para Campamento de Verano Escolar', 430, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 431, NULL,  NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 432, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 433, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 434, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 435, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- ALUMNO 01
    (null, 'Pago para Campamento de Verano Escolar', 436, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 437, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 438, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 439, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 440, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 441, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- ALUMNO 02
    (null, 'Pago para Campamento de Verano Escolar', 442, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 443, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 444, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 445, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 446, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 447, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- SECUNDARIA
    -- ALUMNO 11
    (null, 'Pago para Taller de Orientación Vocacional', 448, NULL, NULL, NULL, NULL, 13, NULL, NULL),
    (null, 'Pago para Concurso de Ciencia y Tecnología', 449, NULL, NULL, NULL, NULL, 14, NULL, NULL),
    (null, 'Pago para Competencia Deportiva Interescolar', 450, NULL, NULL, NULL, NULL, 15, NULL, NULL),
    (null, 'Pago para Semana Cultural', 451, NULL, NULL, NULL, NULL, 16, NULL, NULL),
    (null, 'Pago para Festival de Música', 451, NULL, NULL, NULL, NULL, 17, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 453, NULL, NULL, NULL, NULL, 18, NULL, NULL),

    -- ALUMNO 12
    (null, 'Pago para Taller de Orientación Vocacional', 454, NULL, NULL, NULL, NULL, 13, NULL, NULL),
    (null, 'Pago para Concurso de Ciencia y Tecnología', 455, NULL, NULL, NULL, NULL, 14, NULL, NULL),
    (null, 'Pago para Competencia Deportiva Interescolar', 456, NULL, NULL, NULL, NULL, 15, NULL, NULL),
    (null, 'Pago para Semana Cultural', 457, NULL, NULL, NULL, NULL, 16, NULL, NULL),
    (null, 'Pago para Festival de Música', 458, NULL, NULL, NULL, NULL, 17, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 459, NULL, NULL, NULL, NULL, 18, NULL, NULL),

    -- PERIODO 3

    -- PRIMARIA
    -- ALUMNO 01
    (null, 'Pago para Campamento de Verano Escolar', 460, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 461, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 462, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 463, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 464, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 465, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- ALUMNO 02
    (null, 'Pago para Campamento de Verano Escolar', 466, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 467, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 468, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 469, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 470, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 471, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- ALUMNO 06
    (null, 'Pago para Campamento de Verano Escolar', 472, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 473, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 474, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 475, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 476, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 477, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- ALUMNO 07
    (null, 'Pago para Campamento de Verano Escolar', 478, NULL, NULL, NULL, NULL, 7, NULL, NULL),
    (null, 'Pago para Día de la Familia en la Escuela', 479, NULL, NULL, NULL, NULL, 8, NULL, NULL),
    (null, 'Pago para Fería de Ciencias de Primaria', 480, NULL, NULL, NULL, NULL, 9, NULL, NULL),
    (null, 'Pago para Concurso de Lectura y Escritura', 481, NULL, NULL, NULL, NULL, 10, NULL, NULL),
    (null, 'Pago para Festival de Navidad Escolar', 482, NULL, NULL, NULL, NULL, 11, NULL, NULL),
    (null, 'Pago para Fiesta de Fin de Año', 483, NULL, NULL, NULL, NULL, 12, NULL, NULL),

    -- SECUNDARIA
    (null, 'Pago para Taller de Orientación Vocacional', 484, NULL, NULL, NULL, NULL, 13, NULL, NULL),
    (null, 'Pago para Concurso de Ciencia y Tecnología', 485, NULL, NULL, NULL, NULL, 14, NULL, NULL),
    (null, 'Pago para Competencia Deportiva Interescolar', 486, NULL,NULL, NULL, NULL, 15, NULL, NULL),
    (null, 'Pago para Semana Cultural', 487, NULL, NULL, NULL, NULL, 16, NULL, NULL),
    (null, 'Pago para Festival de Música', 488, NULL, NULL, NULL, NULL, 17, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 489, NULL, NULL, NULL, NULL, 18, NULL, NULL),

    (null, 'Pago para Taller de Orientación Vocacional', 490, NULL, NULL, NULL, NULL, 13, NULL, NULL),
    (null, 'Pago para Concurso de Ciencia y Tecnología', 491, NULL, NULL, NULL, NULL, 14, NULL, NULL),
    (null, 'Pago para Competencia Deportiva Interescolar', 492, NULL, NULL, NULL, NULL, 15, NULL, NULL),
    (null, 'Pago para Semana Cultural', 493, NULL, NULL, NULL, NULL, 16, NULL, NULL),
    (null, 'Pago para Festival de Música', 494, NULL, NULL, NULL, NULL, 17, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 495, NULL, NULL, NULL, NULL, 18, NULL, NULL),

    (null, 'Pago para Taller de Orientación Vocacional', 496, NULL, NULL, NULL, NULL, 13, NULL, NULL),
    (null, 'Pago para Concurso de Ciencia y Tecnología', 497, NULL, NULL, NULL, NULL, 14, NULL, NULL),
    (null, 'Pago para Competencia Deportiva Interescolar', 498, NULL, NULL, NULL, NULL, 15, NULL, NULL),
    (null, 'Pago para Semana Cultural', 499, NULL, NULL, NULL, NULL, 16, NULL, NULL),
    (null, 'Pago para Festival de Música', 500, NULL, NULL, NULL, NULL, 17, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 501, NULL, NULL, NULL, NULL, 18, NULL, NULL),

    (null, 'Pago para Taller de Orientación Vocacional', 502, NULL, NULL, NULL, NULL, 13, NULL, NULL),
    (null, 'Pago para Concurso de Ciencia y Tecnología', 503, NULL, NULL, NULL, NULL, 14, NULL, NULL),
    (null, 'Pago para Competencia Deportiva Interescolar', 504, NULL, NULL, NULL, NULL, 15, NULL, NULL),
    (null, 'Pago para Semana Cultural', 505, NULL, NULL, NULL, NULL, 16, NULL, NULL),
    (null, 'Pago para Festival de Música', 506, NULL, NULL, NULL, NULL, 17, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 507, NULL, NULL, NULL, NULL, 18, NULL, NULL),

    (null, 'Pago para Taller de Orientación Vocacional', 508, NULL, NULL, NULL, NULL, 13, NULL, NULL),
    (null, 'Pago para Concurso de Ciencia y Tecnología', 509, NULL, NULL, NULL, NULL, 14, NULL, NULL),
    (null, 'Pago para Competencia Deportiva Interescolar', 510, NULL, NULL, NULL, NULL, 15, NULL, NULL),
    (null, 'Pago para Semana Cultural', 511, NULL, NULL, NULL, NULL, 16, NULL, NULL),
    (null, 'Pago para Festival de Música', 512, NULL, NULL, NULL, NULL, 17, NULL, NULL),
    (null, 'Pago para Ceremonia de Graduación', 513, NULL, NULL, NULL, NULL, 18, NULL, NULL);
-- Tabla tutor
INSERT INTO tutor (numero, nombrePila, primerApellido, segApellido, numTel) VALUES
    -- Alumno 000001 (Luis García Hernández)
    (null, 'Carlos', 'García', 'Hernández', '(664)1276543'),
    (null, 'Ana', 'Hernández', 'García', '(664)9991239'),

-- Alumno 000002 (Ana Martínez López)
    (null, 'Luis', 'Martínez', 'López', '(664)2345678'),
    (null, 'María', 'López', 'Martínez', '(664)5477895'),

-- Alumno 000003 (Diego Rodríguez Gómez)
    (null, 'Javier', 'Rodríguez', 'Gómez', '(664)3456789'),
    (null, 'Laura', 'Gómez', 'Rodríguez', '(664)1239843'),

-- Alumno 000004 (María López Martínez)
    (null, 'Carlos', 'López', 'Martínez', '(664)4567890'),
    (null, 'Ana', 'Martínez', 'López', '(664)3434223'),

-- Alumno 000005 (Javier Hernández Pérez)
    (null, 'Pedro', 'Hernández', 'Pérez', '(664)5678901'),
    (null, 'Sofía', 'Pérez', 'Hernández', '(664)1111233'),

-- Alumno 000006 (Carlos Gómez García)
    (null, 'Luis', 'Gómez', 'García', '(664)6789012'),
    (null, 'Ana', 'García', 'Gómez', '(664)5454423'),

-- Alumno 000007 (Laura Díaz Rodríguez)
    (null, 'Mario', 'Díaz', 'Rodríguez', '(664)7890123'),
    (null, 'Isabel', 'Rodríguez', 'Díaz', '(664)4312487'),

-- Alumno 000008 (Juan Martínez Sánchez)
    (null, 'José', 'Martínez', 'Sánchez', '(664)8901234'),
    (null, 'Rosa', 'Sánchez', 'Martínez', '(664)1342678'),

-- Alumno 000009 (Sofía Pérez Gómez)
    (null, 'Andrés', 'Pérez', 'Gómez', '(664)9012345'),
    (null, 'Laura', 'Gómez', 'Pérez', '(664)6813024'),

-- Alumno 000010 (Pedro González López)
    (null, 'Héctor', 'González', 'López', '(664)2345678'),
    (null, 'Carmen', 'López', 'González', '(664)5810982'),

-- Alumno 000011 (Ana Hernández González)
    (null, 'Felipe', 'Hernández', 'González', '(664)1234567'),
    (null, 'María', 'González', 'Hernández', '(664)6719305'),

-- Alumno 000012 (Diego Martínez Rodríguez)
    (null, 'Roberto', 'Martínez', 'Rodríguez','(664)3456789'),
    (null, 'Verónica', 'Rodríguez', 'Martínez','(664)9864313'),

-- Alumno 000013 (María López Sánchez)
    (null, 'Jorge', 'López', 'Sánchez', '(664)4567890'),
    (null, 'Patricia', 'Sánchez', 'López', '(664)8675092'),

-- Alumno 000014 (Javier Pérez Martínez)
    (null, 'Eduardo', 'Pérez', 'Martínez', '(664)5678901'),
    (null, 'Claudia', 'Martínez', 'Pérez', '(664)5679832'),

-- Alumno 000015 (Laura García Gómez)
    (null, 'Ricardo', 'García', 'Gómez', '(664)1012356'),
    (null, 'Elena', 'Gómez', 'García', '(664)9445435');


INSERT INTO tutor_alumno (alumno, tutor) VALUES
    ('000001', 1),
    ('000001', 2),
    ('000002', 3),
    ('000002', 4),
    ('000003', 5),
    ('000003', 6),
    ('000004', 7),
    ('000004', 8),
    ('000005', 9),
    ('000005', 10),
    ('000006', 11),
    ('000006', 12),
    ('000007', 13),
    ('000007', 14),
    ('000008', 15),
    ('000008', 16),
    ('000009', 17),
    ('000009', 18),
    ('000010', 19),
    ('000010', 20),
    ('000011', 21),
    ('000011', 22),
    ('000012', 23),
    ('000012', 24),
    ('000013', 25),
    ('000013', 26),
    ('000014', 27),
    ('000014', 28),
    ('000015', 29),
    ('000015', 30);



INSERT INTO man_ped (mantenimiento, periodo) VALUES
    ('MNT_TECH', 1),
    ('MNT_AULA', 1),
    ('MNT_SIST', 1),
    ('MNT_TUB', 1),
    ('MNT_JAR', 1),
    ('MNT_CLIM', 1),
    ('MNT_EQ', 1),
    ('MNT_PINT', 1),
    ('MNT_PLAG', 1),
    ('MNT_MOBI', 1),
    ('MNT_SANI', 1),
    ('MNT_CANCH', 1),
    ('MNT_SEGU', 1),
    ('MNT_REMOD', 1),
    ('MNT_EMERG', 1),
    ('MNT_TECH', 2),
    ('MNT_AULA', 2),
    ('MNT_SIST', 2),
    ('MNT_TUB', 2),
    ('MNT_JAR', 2),
    ('MNT_CLIM', 2),
    ('MNT_EQ', 2),
    ('MNT_PINT', 2),
    ('MNT_PLAG', 2),
    ('MNT_MOBI', 2),
    ('MNT_SANI', 2),
    ('MNT_CANCH', 2),
    ('MNT_SEGU', 2),
    ('MNT_REMOD', 2),
    ('MNT_EMERG', 2),
    ('MNT_TECH', 3),
    ('MNT_AULA', 3),
    ('MNT_SIST', 3),
    ('MNT_TUB', 3),
    ('MNT_JAR', 3),
    ('MNT_CLIM', 3),
    ('MNT_EQ', 3),
    ('MNT_PINT', 3),
    ('MNT_PLAG', 3),
    ('MNT_MOBI', 3),
    ('MNT_SANI', 3),
    ('MNT_CANCH', 3),
    ('MNT_SEGU', 3),
    ('MNT_REMOD', 3),
    ('MNT_EMERG', 3),
    ('MNT_TECH', 4),
    ('MNT_AULA', 4),
    ('MNT_SIST', 4),
    ('MNT_TUB', 4),
    ('MNT_JAR', 4),
    ('MNT_CLIM', 4),
    ('MNT_EQ', 4),
    ('MNT_PINT', 4),
    ('MNT_PLAG', 4),
    ('MNT_MOBI', 4),
    ('MNT_SANI', 4),
    ('MNT_CANCH', 4),
    ('MNT_SEGU', 4),
    ('MNT_REMOD', 4),
    ('MNT_EMERG', 4);
INSERT INTO paq_periodo (paquete_de_material, periodo) VALUES
    -- LIBBAS
    ('LIBBAS_KIND1', 1),
    ('LIBBAS_KIND1', 2),
    ('LIBBAS_KIND1', 3),
    ('LIBBAS_KIND1', 4),

    ('LIBBAS_KIND2', 1),
    ('LIBBAS_KIND2', 2),
    ('LIBBAS_KIND2', 3),
    ('LIBBAS_KIND2', 4),

    ('LIBBAS_KIND3', 1),
    ('LIBBAS_KIND3', 2),
    ('LIBBAS_KIND3', 3),
    ('LIBBAS_KIND3', 4),

    ('LIBBAS_PRIM1', 1),
    ('LIBBAS_PRIM1', 2),
    ('LIBBAS_PRIM1', 3),
    ('LIBBAS_PRIM1', 4),

    ('LIBBAS_PRIM2', 1),
    ('LIBBAS_PRIM2', 2),
    ('LIBBAS_PRIM2', 3),
    ('LIBBAS_PRIM2', 4),

    ('LIBBAS_PRIM3', 1),
    ('LIBBAS_PRIM3', 2),
    ('LIBBAS_PRIM3', 3),
    ('LIBBAS_PRIM3', 4),

    ('LIBBAS_PRIM4', 1),
    ('LIBBAS_PRIM4', 2),
    ('LIBBAS_PRIM4', 3),
    ('LIBBAS_PRIM4', 4),

    ('LIBBAS_PRIM5', 1),
    ('LIBBAS_PRIM5', 2),
    ('LIBBAS_PRIM5', 3),
    ('LIBBAS_PRIM5', 4),

    ('LIBBAS_PRIM6', 1),
    ('LIBBAS_PRIM6', 2),
    ('LIBBAS_PRIM6', 3),
    ('LIBBAS_PRIM6', 4),

    ('LIBBAS_SECU1', 1),
    ('LIBBAS_SECU1', 2),
    ('LIBBAS_SECU1', 3),
    ('LIBBAS_SECU1', 4),

    ('LIBBAS_SECU2', 1),
    ('LIBBAS_SECU2', 2),
    ('LIBBAS_SECU2', 3),
    ('LIBBAS_SECU2', 4),

    ('LIBBAS_SECU3', 1),
    ('LIBBAS_SECU3', 2),
    ('LIBBAS_SECU3', 3),
    ('LIBBAS_SECU3', 4),

    -- MATART
    ('MATART_KIND1', 1),
    ('MATART_KIND1', 2),
    ('MATART_KIND1', 3),
    ('MATART_KIND1', 4),

    ('MATART_KIND2', 1),
    ('MATART_KIND2', 2),
    ('MATART_KIND2', 3),
    ('MATART_KIND2', 4),

    ('MATART_KIND3', 1),
    ('MATART_KIND3', 2),
    ('MATART_KIND3', 3),
    ('MATART_KIND3', 4),

    ('MATART_PRIM1', 1),
    ('MATART_PRIM1', 2),
    ('MATART_PRIM1', 3),
    ('MATART_PRIM1', 4),

    ('MATART_PRIM2', 1),
    ('MATART_PRIM2', 2),
    ('MATART_PRIM2', 3),
    ('MATART_PRIM2', 4),

    ('MATART_PRIM3', 1),
    ('MATART_PRIM3', 2),
    ('MATART_PRIM3', 3),
    ('MATART_PRIM3', 4),

    ('MATART_PRIM4', 1),
    ('MATART_PRIM4', 2),
    ('MATART_PRIM4', 3),
    ('MATART_PRIM4', 4),

    ('MATART_PRIM5', 1),
    ('MATART_PRIM5', 2),
    ('MATART_PRIM5', 3),
    ('MATART_PRIM5', 4),

    ('MATART_PRIM6', 1),
    ('MATART_PRIM6', 2),
    ('MATART_PRIM6', 3),
    ('MATART_PRIM6', 4),

    ('MATART_SECU1', 1),
    ('MATART_SECU1', 2),
    ('MATART_SECU1', 3),
    ('MATART_SECU1', 4),

    ('MATART_SECU2', 1),
    ('MATART_SECU2', 2),
    ('MATART_SECU2', 3),
    ('MATART_SECU2', 4),

    ('MATART_SECU3', 1),
    ('MATART_SECU3', 2),
    ('MATART_SECU3', 3),
    ('MATART_SECU3', 4),

    -- PAQLAB
    ('PAQLAB_KIND1', 1),
    ('PAQLAB_KIND1', 2),
    ('PAQLAB_KIND1', 3),
    ('PAQLAB_KIND1', 4),

    ('PAQLAB_KIND2', 1),
    ('PAQLAB_KIND2', 2),
    ('PAQLAB_KIND2', 3),
    ('PAQLAB_KIND2', 4),

    ('PAQLAB_KIND3', 1),
    ('PAQLAB_KIND3', 2),
    ('PAQLAB_KIND3', 3),
    ('PAQLAB_KIND3', 4),

    ('PAQLAB_PRIM1', 1),
    ('PAQLAB_PRIM1', 2),
    ('PAQLAB_PRIM1', 3),
    ('PAQLAB_PRIM1', 4),

    ('PAQLAB_PRIM2', 1),
    ('PAQLAB_PRIM2', 2),
    ('PAQLAB_PRIM2', 3),
    ('PAQLAB_PRIM2', 4),

    ('PAQLAB_PRIM3', 1),
    ('PAQLAB_PRIM3', 2),
    ('PAQLAB_PRIM3', 3),
    ('PAQLAB_PRIM3', 4),

    ('PAQLAB_PRIM4', 1),
    ('PAQLAB_PRIM4', 2),
    ('PAQLAB_PRIM4', 3),
    ('PAQLAB_PRIM4', 4),

    ('PAQLAB_PRIM5', 1),
    ('PAQLAB_PRIM5', 2),
    ('PAQLAB_PRIM5', 3),
    ('PAQLAB_PRIM5', 4),

    ('PAQLAB_PRIM6', 1),
    ('PAQLAB_PRIM6', 2),
    ('PAQLAB_PRIM6', 3),
    ('PAQLAB_PRIM6', 4),

    ('PAQLAB_SECU1', 1),
    ('PAQLAB_SECU1', 2),
    ('PAQLAB_SECU1', 3),
    ('PAQLAB_SECU1', 4),

    ('PAQLAB_SECU2', 1),
    ('PAQLAB_SECU2', 2),
    ('PAQLAB_SECU2', 3),
    ('PAQLAB_SECU2', 4),

    ('PAQLAB_SECU3', 1),
    ('PAQLAB_SECU3', 2),
    ('PAQLAB_SECU3', 3),
    ('PAQLAB_SECU3', 4),

    -- PAQDEP
    ('PAQDEP_KIND1', 1),
    ('PAQDEP_KIND1', 2),
    ('PAQDEP_KIND1', 3),
    ('PAQDEP_KIND1', 4),

    ('PAQDEP_KIND2', 1),
    ('PAQDEP_KIND2', 2),
    ('PAQDEP_KIND2', 3),
    ('PAQDEP_KIND2', 4),

    ('PAQDEP_KIND3', 1),
    ('PAQDEP_KIND3', 2),
    ('PAQDEP_KIND3', 3),
    ('PAQDEP_KIND3', 4),

    ('PAQDEP_PRIM1', 1),
    ('PAQDEP_PRIM1', 2),
    ('PAQDEP_PRIM1', 3),
    ('PAQDEP_PRIM1', 4),

    ('PAQDEP_PRIM2', 1),
    ('PAQDEP_PRIM2', 2),
    ('PAQDEP_PRIM2', 3),
    ('PAQDEP_PRIM2', 4),

    ('PAQDEP_PRIM3', 1),
    ('PAQDEP_PRIM3', 2),
    ('PAQDEP_PRIM3', 3),
    ('PAQDEP_PRIM3', 4),

    ('PAQDEP_PRIM4', 1),
    ('PAQDEP_PRIM4', 2),
    ('PAQDEP_PRIM4', 3),
    ('PAQDEP_PRIM4', 4),

    ('PAQDEP_PRIM5', 1),
    ('PAQDEP_PRIM5', 2),
    ('PAQDEP_PRIM5', 3),
    ('PAQDEP_PRIM5', 4),

    ('PAQDEP_PRIM6', 1),
    ('PAQDEP_PRIM6', 2),
    ('PAQDEP_PRIM6', 3),
    ('PAQDEP_PRIM6', 4),

    ('PAQDEP_SECU1', 1),
    ('PAQDEP_SECU1', 2),
    ('PAQDEP_SECU1', 3),
    ('PAQDEP_SECU1', 4),

    ('PAQDEP_SECU2', 1),
    ('PAQDEP_SECU2', 2),
    ('PAQDEP_SECU2', 3),
    ('PAQDEP_SECU2', 4),

    ('PAQDEP_SECU3', 1),
    ('PAQDEP_SECU3', 2),
    ('PAQDEP_SECU3', 3),
    ('PAQDEP_SECU3', 4),

    -- PAQMAT
    ('PAQMAT_KIND1', 1),
    ('PAQMAT_KIND1', 2),
    ('PAQMAT_KIND1', 3),
    ('PAQMAT_KIND1', 4),

    ('PAQMAT_KIND2', 1),
    ('PAQMAT_KIND2', 2),
    ('PAQMAT_KIND2', 3),
    ('PAQMAT_KIND2', 4),

    ('PAQMAT_KIND3', 1),
    ('PAQMAT_KIND3', 2),
    ('PAQMAT_KIND3', 3),
    ('PAQMAT_KIND3', 4),

    ('PAQMAT_PRIM1', 1),
    ('PAQMAT_PRIM1', 2),
    ('PAQMAT_PRIM1', 3),
    ('PAQMAT_PRIM1', 4),

    ('PAQMAT_PRIM2', 1),
    ('PAQMAT_PRIM2', 2),
    ('PAQMAT_PRIM2', 3),
    ('PAQMAT_PRIM2', 4),

    ('PAQMAT_PRIM3', 1),
    ('PAQMAT_PRIM3', 2),
    ('PAQMAT_PRIM3', 3),
    ('PAQMAT_PRIM3', 4),

    ('PAQMAT_PRIM4', 1),
    ('PAQMAT_PRIM4', 2),
    ('PAQMAT_PRIM4', 3),
    ('PAQMAT_PRIM4', 4),

    ('PAQMAT_PRIM5', 1),
    ('PAQMAT_PRIM5', 2),
    ('PAQMAT_PRIM5', 3),
    ('PAQMAT_PRIM5', 4),

    ('PAQMAT_PRIM6', 1),
    ('PAQMAT_PRIM6', 2),
    ('PAQMAT_PRIM6', 3),
    ('PAQMAT_PRIM6', 4),

    ('PAQMAT_SECU1', 1),
    ('PAQMAT_SECU1', 2),
    ('PAQMAT_SECU1', 3),
    ('PAQMAT_SECU1', 4),

    ('PAQMAT_SECU2', 1),
    ('PAQMAT_SECU2', 2),
    ('PAQMAT_SECU2', 3),
    ('PAQMAT_SECU2', 4),

    ('PAQMAT_SECU3', 1),
    ('PAQMAT_SECU3', 2),
    ('PAQMAT_SECU3', 3),
    ('PAQMAT_SECU3', 4),

    -- MATCOM
    ('MATCOM_KIND1', 1),
    ('MATCOM_KIND1', 2),
    ('MATCOM_KIND1', 3),
    ('MATCOM_KIND1', 4),

    ('MATCOM_KIND2', 1),
    ('MATCOM_KIND2', 2),
    ('MATCOM_KIND2', 3),
    ('MATCOM_KIND2', 4),

    ('MATCOM_KIND3', 1),
    ('MATCOM_KIND3', 2),
    ('MATCOM_KIND3', 3),
    ('MATCOM_KIND3', 4),

    ('MATCOM_PRIM1', 1),
    ('MATCOM_PRIM1', 2),
    ('MATCOM_PRIM1', 3),
    ('MATCOM_PRIM1', 4),

    ('MATCOM_PRIM2', 1),
    ('MATCOM_PRIM2', 2),
    ('MATCOM_PRIM2', 3),
    ('MATCOM_PRIM2', 4),

    ('MATCOM_PRIM3', 1),
    ('MATCOM_PRIM3', 2),
    ('MATCOM_PRIM3', 3),
    ('MATCOM_PRIM3', 4),

    ('MATCOM_PRIM4', 1),
    ('MATCOM_PRIM4', 2),
    ('MATCOM_PRIM4', 3),
    ('MATCOM_PRIM4', 4),

    ('MATCOM_PRIM5', 1),
    ('MATCOM_PRIM5', 2),
    ('MATCOM_PRIM5', 3),
    ('MATCOM_PRIM5', 4),

    ('MATCOM_PRIM6', 1),
    ('MATCOM_PRIM6', 2),
    ('MATCOM_PRIM6', 3),
    ('MATCOM_PRIM6', 4),

    ('MATCOM_SECU1', 1),
    ('MATCOM_SECU1', 2),
    ('MATCOM_SECU1', 3),
    ('MATCOM_SECU1', 4),

    ('MATCOM_SECU2', 1),
    ('MATCOM_SECU2', 2),
    ('MATCOM_SECU2', 3),
    ('MATCOM_SECU2', 4),

    ('MATCOM_SECU3', 1),
    ('MATCOM_SECU3', 2),
    ('MATCOM_SECU3', 3),
    ('MATCOM_SECU3', 4),

    -- PAQLAP
    ('PAQLAP_KIND1', 1),
    ('PAQLAP_KIND1', 2),
    ('PAQLAP_KIND1', 3),
    ('PAQLAP_KIND1', 4),

    ('PAQLAP_KIND2', 1),
    ('PAQLAP_KIND2', 2),
    ('PAQLAP_KIND2', 3),
    ('PAQLAP_KIND2', 4),

    ('PAQLAP_KIND3', 1),
    ('PAQLAP_KIND3', 2),
    ('PAQLAP_KIND3', 3),
    ('PAQLAP_KIND3', 4),

    ('PAQLAP_PRIM1', 1),
    ('PAQLAP_PRIM1', 2),
    ('PAQLAP_PRIM1', 3),
    ('PAQLAP_PRIM1', 4),

    ('PAQLAP_PRIM2', 1),
    ('PAQLAP_PRIM2', 2),
    ('PAQLAP_PRIM2', 3),
    ('PAQLAP_PRIM2', 4),

    ('PAQLAP_PRIM3', 1),
    ('PAQLAP_PRIM3', 2),
    ('PAQLAP_PRIM3', 3),
    ('PAQLAP_PRIM3', 4),

    ('PAQLAP_PRIM4', 1),
    ('PAQLAP_PRIM4', 2),
    ('PAQLAP_PRIM4', 3),
    ('PAQLAP_PRIM4', 4),

    ('PAQLAP_PRIM5', 1),
    ('PAQLAP_PRIM5', 2),
    ('PAQLAP_PRIM5', 3),
    ('PAQLAP_PRIM5', 4),

    ('PAQLAP_PRIM6', 1),
    ('PAQLAP_PRIM6', 2),
    ('PAQLAP_PRIM6', 3),
    ('PAQLAP_PRIM6', 4),

    ('PAQLAP_SECU1', 1),
    ('PAQLAP_SECU1', 2),
    ('PAQLAP_SECU1', 3),
    ('PAQLAP_SECU1', 4),

    ('PAQLAP_SECU2', 1),
    ('PAQLAP_SECU2', 2),
    ('PAQLAP_SECU2', 3),
    ('PAQLAP_SECU2', 4),

    ('PAQLAP_SECU3', 1),
    ('PAQLAP_SECU3', 2),
    ('PAQLAP_SECU3', 3),
    ('PAQLAP_SECU3', 4),

    -- PAQCUA
    ('PAQCUA_KIND1', 1),
    ('PAQCUA_KIND1', 2),
    ('PAQCUA_KIND1', 3),
    ('PAQCUA_KIND1', 4),

    ('PAQCUA_KIND2', 1),
    ('PAQCUA_KIND2', 2),
    ('PAQCUA_KIND2', 3),
    ('PAQCUA_KIND2', 4),

    ('PAQCUA_KIND3', 1),
    ('PAQCUA_KIND3', 2),
    ('PAQCUA_KIND3', 3),
    ('PAQCUA_KIND3', 4),

    ('PAQCUA_PRIM1', 1),
    ('PAQCUA_PRIM1', 2),
    ('PAQCUA_PRIM1', 3),
    ('PAQCUA_PRIM1', 4),

    ('PAQCUA_PRIM2', 1),
    ('PAQCUA_PRIM2', 2),
    ('PAQCUA_PRIM2', 3),
    ('PAQCUA_PRIM2', 4),

    ('PAQCUA_PRIM3', 1),
    ('PAQCUA_PRIM3', 2),
    ('PAQCUA_PRIM3', 3),
    ('PAQCUA_PRIM3', 4),

    ('PAQCUA_PRIM4', 1),
    ('PAQCUA_PRIM4', 2),
    ('PAQCUA_PRIM4', 3),
    ('PAQCUA_PRIM4', 4),

    ('PAQCUA_PRIM5', 1),
    ('PAQCUA_PRIM5', 2),
    ('PAQCUA_PRIM5', 3),
    ('PAQCUA_PRIM5', 4),

    ('PAQCUA_PRIM6', 1),
    ('PAQCUA_PRIM6', 2),
    ('PAQCUA_PRIM6', 3),
    ('PAQCUA_PRIM6', 4),

    ('PAQCUA_SECU1', 1),
    ('PAQCUA_SECU1', 2),
    ('PAQCUA_SECU1', 3),
    ('PAQCUA_SECU1', 4),

    ('PAQCUA_SECU2', 1),
    ('PAQCUA_SECU2', 2),
    ('PAQCUA_SECU2', 3),
    ('PAQCUA_SECU2', 4),

    ('PAQCUA_SECU3', 1),
    ('PAQCUA_SECU3', 2),
    ('PAQCUA_SECU3', 3),
    ('PAQCUA_SECU3', 4),

    -- PAQ
    ('PAQCOL_KIND1', 1),
    ('PAQCOL_KIND1', 2),
    ('PAQCOL_KIND1', 3),
    ('PAQCOL_KIND1', 4),

    ('PAQCOL_KIND2', 1),
    ('PAQCOL_KIND2', 2),
    ('PAQCOL_KIND2', 3),
    ('PAQCOL_KIND2', 4),

    ('PAQCOL_KIND3', 1),
    ('PAQCOL_KIND3', 2),
    ('PAQCOL_KIND3', 3),
    ('PAQCOL_KIND3', 4),

    ('PAQCOL_PRIM1', 1),
    ('PAQCOL_PRIM1', 2),
    ('PAQCOL_PRIM1', 3),
    ('PAQCOL_PRIM1', 4),

    ('PAQCOL_PRIM2', 1),
    ('PAQCOL_PRIM2', 2),
    ('PAQCOL_PRIM2', 3),
    ('PAQCOL_PRIM2', 4),

    ('PAQCOL_PRIM3', 1),
    ('PAQCOL_PRIM3', 2),
    ('PAQCOL_PRIM3', 3),
    ('PAQCOL_PRIM3', 4),

    ('PAQCOL_PRIM4', 1),
    ('PAQCOL_PRIM4', 2),
    ('PAQCOL_PRIM4', 3),
    ('PAQCOL_PRIM4', 4),

    ('PAQCOL_PRIM5', 1),
    ('PAQCOL_PRIM5', 2),
    ('PAQCOL_PRIM5', 3),
    ('PAQCOL_PRIM5', 4),

    ('PAQCOL_PRIM6', 1),
    ('PAQCOL_PRIM6', 2),
    ('PAQCOL_PRIM6', 3),
    ('PAQCOL_PRIM6', 4),

    ('PAQCOL_SECU1', 1),
    ('PAQCOL_SECU1', 2),
    ('PAQCOL_SECU1', 3),
    ('PAQCOL_SECU1', 4),

    ('PAQCOL_SECU2', 1),
    ('PAQCOL_SECU2', 2),
    ('PAQCOL_SECU2', 3),
    ('PAQCOL_SECU2', 4),

    ('PAQCOL_SECU3', 1),
    ('PAQCOL_SECU3', 2),
    ('PAQCOL_SECU3', 3),
    ('PAQCOL_SECU3', 4),

    -- PAQREG
    ('PAQREG_KIND1', 1),
    ('PAQREG_KIND1', 2),
    ('PAQREG_KIND1', 3),
    ('PAQREG_KIND1', 4),

    ('PAQREG_KIND2', 1),
    ('PAQREG_KIND2', 2),
    ('PAQREG_KIND2', 3),
    ('PAQREG_KIND2', 4),

    ('PAQREG_KIND3', 1),
    ('PAQREG_KIND3', 2),
    ('PAQREG_KIND3', 3),
    ('PAQREG_KIND3', 4),

    ('PAQREG_PRIM1', 1),
    ('PAQREG_PRIM1', 2),
    ('PAQREG_PRIM1', 3),
    ('PAQREG_PRIM1', 4),

    ('PAQREG_PRIM2', 1),
    ('PAQREG_PRIM2', 2),
    ('PAQREG_PRIM2', 3),
    ('PAQREG_PRIM2', 4),

    ('PAQREG_PRIM3', 1),
    ('PAQREG_PRIM3', 2),
    ('PAQREG_PRIM3', 3),
    ('PAQREG_PRIM3', 4),

    ('PAQREG_PRIM4', 1),
    ('PAQREG_PRIM4', 2),
    ('PAQREG_PRIM4', 3),
    ('PAQREG_PRIM4', 4),

    ('PAQREG_PRIM5', 1),
    ('PAQREG_PRIM5', 2),
    ('PAQREG_PRIM5', 3),
    ('PAQREG_PRIM5', 4),

    ('PAQREG_PRIM6', 1),
    ('PAQREG_PRIM6', 2),
    ('PAQREG_PRIM6', 3),
    ('PAQREG_PRIM6', 4),

    ('PAQREG_SECU1', 1),
    ('PAQREG_SECU1', 2),
    ('PAQREG_SECU1', 3),
    ('PAQREG_SECU1', 4),

    ('PAQREG_SECU2', 1),
    ('PAQREG_SECU2', 2),
    ('PAQREG_SECU2', 3),
    ('PAQREG_SECU2', 4),

    ('PAQREG_SECU3', 1),
    ('PAQREG_SECU3', 2),
    ('PAQREG_SECU3', 3),
    ('PAQREG_SECU3', 4),

    -- PAQBOR
    ('PAQBOR_KIND1', 1),
    ('PAQBOR_KIND1', 2),
    ('PAQBOR_KIND1', 3),
    ('PAQBOR_KIND1', 4),

    ('PAQBOR_KIND2', 1),
    ('PAQBOR_KIND2', 2),
    ('PAQBOR_KIND2', 3),
    ('PAQBOR_KIND2', 4),

    ('PAQBOR_KIND3', 1),
    ('PAQBOR_KIND3', 2),
    ('PAQBOR_KIND3', 3),
    ('PAQBOR_KIND3', 4),

    ('PAQBOR_PRIM1', 1),
    ('PAQBOR_PRIM1', 2),
    ('PAQBOR_PRIM1', 3),
    ('PAQBOR_PRIM1', 4),

    ('PAQBOR_PRIM2', 1),
    ('PAQBOR_PRIM2', 2),
    ('PAQBOR_PRIM2', 3),
    ('PAQBOR_PRIM2', 4),

    ('PAQBOR_PRIM3', 1),
    ('PAQBOR_PRIM3', 2),
    ('PAQBOR_PRIM3', 3),
    ('PAQBOR_PRIM3', 4),

    ('PAQBOR_PRIM4', 1),
    ('PAQBOR_PRIM4', 2),
    ('PAQBOR_PRIM4', 3),
    ('PAQBOR_PRIM4', 4),

    ('PAQBOR_PRIM5', 1),
    ('PAQBOR_PRIM5', 2),
    ('PAQBOR_PRIM5', 3),
    ('PAQBOR_PRIM5', 4),

    ('PAQBOR_PRIM6', 1),
    ('PAQBOR_PRIM6', 2),
    ('PAQBOR_PRIM6', 3),
    ('PAQBOR_PRIM6', 4),

    ('PAQBOR_SECU1', 1),
    ('PAQBOR_SECU1', 2),
    ('PAQBOR_SECU1', 3),
    ('PAQBOR_SECU1', 4),

    ('PAQBOR_SECU2', 1),
    ('PAQBOR_SECU2', 2),
    ('PAQBOR_SECU2', 3),
    ('PAQBOR_SECU2', 4),

    ('PAQBOR_SECU3', 1),
    ('PAQBOR_SECU3', 2),
    ('PAQBOR_SECU3', 3),
    ('PAQBOR_SECU3', 4),

    -- PAQTIJ
    ('PAQTIJ_KIND1', 1),
    ('PAQTIJ_KIND1', 2),
    ('PAQTIJ_KIND1', 3),
    ('PAQTIJ_KIND1', 4),

    ('PAQTIJ_KIND2', 1),
    ('PAQTIJ_KIND2', 2),
    ('PAQTIJ_KIND2', 3),
    ('PAQTIJ_KIND2', 4),

    ('PAQTIJ_KIND3', 1),
    ('PAQTIJ_KIND3', 2),
    ('PAQTIJ_KIND3', 3),
    ('PAQTIJ_KIND3', 4),

    ('PAQTIJ_PRIM1', 1),
    ('PAQTIJ_PRIM1', 2),
    ('PAQTIJ_PRIM1', 3),
    ('PAQTIJ_PRIM1', 4),

    ('PAQTIJ_PRIM2', 1),
    ('PAQTIJ_PRIM2', 2),
    ('PAQTIJ_PRIM2', 3),
    ('PAQTIJ_PRIM2', 4),

    ('PAQTIJ_PRIM3', 1),
    ('PAQTIJ_PRIM3', 2),
    ('PAQTIJ_PRIM3', 3),
    ('PAQTIJ_PRIM3', 4),

    ('PAQTIJ_PRIM4', 1),
    ('PAQTIJ_PRIM4', 2),
    ('PAQTIJ_PRIM4', 3),
    ('PAQTIJ_PRIM4', 4),

    ('PAQTIJ_PRIM5', 1),
    ('PAQTIJ_PRIM5', 2),
    ('PAQTIJ_PRIM5', 3),
    ('PAQTIJ_PRIM5', 4),

    ('PAQTIJ_PRIM6', 1),
    ('PAQTIJ_PRIM6', 2),
    ('PAQTIJ_PRIM6', 3),
    ('PAQTIJ_PRIM6', 4),

    ('PAQTIJ_SECU1', 1),
    ('PAQTIJ_SECU1', 2),
    ('PAQTIJ_SECU1', 3),
    ('PAQTIJ_SECU1', 4),

    ('PAQTIJ_SECU2', 1),
    ('PAQTIJ_SECU2', 2),
    ('PAQTIJ_SECU2', 3),
    ('PAQTIJ_SECU2', 4),

    ('PAQTIJ_SECU3', 1),
    ('PAQTIJ_SECU3', 2),
    ('PAQTIJ_SECU3', 3),
    ('PAQTIJ_SECU3', 4),

    -- PAQHOJ
    ('PAQHOJ_KIND1', 1),
    ('PAQHOJ_KIND1', 2),
    ('PAQHOJ_KIND1', 3),
    ('PAQHOJ_KIND1', 4),

    ('PAQHOJ_KIND2', 1),
    ('PAQHOJ_KIND2', 2),
    ('PAQHOJ_KIND2', 3),
    ('PAQHOJ_KIND2', 4),

    ('PAQHOJ_KIND3', 1),
    ('PAQHOJ_KIND3', 2),
    ('PAQHOJ_KIND3', 3),
    ('PAQHOJ_KIND3', 4),

    ('PAQHOJ_PRIM1', 1),
    ('PAQHOJ_PRIM1', 2),
    ('PAQHOJ_PRIM1', 3),
    ('PAQHOJ_PRIM1', 4),

    ('PAQHOJ_PRIM2', 1),
    ('PAQHOJ_PRIM2', 2),
    ('PAQHOJ_PRIM2', 3),
    ('PAQHOJ_PRIM2', 4),

    ('PAQHOJ_PRIM3', 1),
    ('PAQHOJ_PRIM3', 2),
    ('PAQHOJ_PRIM3', 3),
    ('PAQHOJ_PRIM3', 4),

    ('PAQHOJ_PRIM4', 1),
    ('PAQHOJ_PRIM4', 2),
    ('PAQHOJ_PRIM4', 3),
    ('PAQHOJ_PRIM4', 4),

    ('PAQHOJ_PRIM5', 1),
    ('PAQHOJ_PRIM5', 2),
    ('PAQHOJ_PRIM5', 3),
    ('PAQHOJ_PRIM5', 4),

    ('PAQHOJ_PRIM6', 1),
    ('PAQHOJ_PRIM6', 2),
    ('PAQHOJ_PRIM6', 3),
    ('PAQHOJ_PRIM6', 4),

    ('PAQHOJ_SECU1', 1),
    ('PAQHOJ_SECU1', 2),
    ('PAQHOJ_SECU1', 3),
    ('PAQHOJ_SECU1', 4),

    ('PAQHOJ_SECU2', 1),
    ('PAQHOJ_SECU2', 2),
    ('PAQHOJ_SECU2', 3),
    ('PAQHOJ_SECU2', 4),

    ('PAQHOJ_SECU3', 1),
    ('PAQHOJ_SECU3', 2),
    ('PAQHOJ_SECU3', 3),
    ('PAQHOJ_SECU3', 4);
    
    INSERT INTO uni_periodo (tipo_de_uniforme, periodo) VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    
    (1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),

    (1, 3),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 3),

    (1, 4),
    (2, 4),
    (3, 4),
    (4, 4),
    (5, 4),

    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),

    (6, 2),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2),

    (6, 3),
    (7, 3),
    (8, 3),
    (9, 3),
    (10, 3),

    (6, 4),
    (7, 4),
    (8, 4),
    (9, 4),
    (10, 4),

    (11, 1),
    (12, 1),
    (13, 1),
    (14, 1),
    (15, 1),

    (11, 2),
    (12, 2),
    (13, 2),
    (14, 2),
    (15, 2),

    (11, 3),
    (12, 3),
    (13, 3),
    (14, 3),
    (15, 3),

    (11, 4),
    (12, 4),
    (13, 4),
    (14, 4),
    (15, 4);

INSERT INTO grado_alumno (alumno, grado) VALUES 
    ('000001', 3), 
    ('000002', 3),  
    ('000003', 3),  
    ('000004', 3),  
    ('000005', 3), 
    
    ('000006', 7),   
    ('000007', 7),   
    ('000008', 8),   
    ('000009', 7),   
    ('000010', 7), 
  
    ('000011', 11),   
    ('000012', 11),   
    ('000013', 12),   
    ('000014', 11),   
    ('000015', 11),

    -- PERIODO 2
    ('000001', 4), 
    ('000002', 4), 
    -- PERIODO 3
    ('000001', 5), 
    ('000002', 5), 
    -- PERIODO 1
    ('000006', 6),   
    ('000007', 6), 
    -- PERIODO 3
    ('000006', 8),   
    ('000007', 8), 
    -- PERIODO 1
    ('000011', 9),   
    ('000012', 9), 
    -- PERIODO 2
    ('000011', 10),   
    ('000012', 10),

    -- PERIODO 4
    ('000001', 6), 
    ('000002', 6), 
    ('000006', 9),   
    ('000007', 9),
    ('000011', 12),   
    ('000012', 12);
