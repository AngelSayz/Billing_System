-- Tabla alumno

    INSERT INTO alumno (matricula, nombrePila, primerApellido, segApellido, edad, fechaNac, dirCalle, dirNumero, dirColonia, category, password) VALUES
    ('0', 'Admin', '-', '', 0, '2000-01-01', '-', '-','-', 'admin', '0'),
    ('000001', 'Luis', 'García', 'Hernández', 5, '2019-03-10', 'Av. Reforma', '123', 'Centro', 'user', 'Luis123'),
    ('000002', 'Ana', 'Martínez', 'López', 4, '2020-06-15', 'Calle del Sol', '456', 'Santa María', 'user', 'BlossomForth'),
    ('000003', 'Diego', 'Rodríguez', 'Gómez', 5, '2019-02-28', 'Calle Luna', '789', 'La Colina', 'user', 'God_Diego_Go'),
    ('000004', 'María', 'López', 'Martínez', 4, '2020-04-22', 'Boulevard del Norte', '321', 'Las Palmas', 'user', 'CONTRASEÑACUENTA'),
    ('000005', 'Javier', 'Hernández', 'Pérez', 5, '2019-08-03', 'Avenida Central', '654', 'El Prado', 'user', 'JavierEscuela'),
    ('000006', 'Carlos', 'Gómez', 'García', 10, '2014-01-05', 'Calle de la Luna', '987', 'El Molino', 'user', 'karl'),
    ('000007', 'Laura', 'Díaz', 'Rodríguez', 9, '2015-05-12', 'Avenida de los Robles', '432', 'San José', 'user', 'CalleLaureles'),
    ('000008', 'Juan', 'Martínez', 'Sánchez', 11, '2013-11-20', 'Calle del Bosque', '876', 'La Loma', 'user', 'qwerty'),
    ('000009', 'Sofía', 'Pérez', 'Gómez', 10, '2014-08-17', 'Calle de la Primavera', '543', 'Los Pinos', 'user', 'THE_FIRST'),
    ('000010', 'Pedro', 'González', 'López', 9, '2015-02-28', 'Calle del Sol', '456', 'Santa María', 'user', 'CRIMSON'),
    ('000011', 'Ana', 'Hernández', 'González', 14, '2010-09-08', 'Av. Reforma', '123', 'Centro', 'user', 'UHML166'),
    ('000012', 'Diego', 'Martínez', 'Rodríguez', 13, '2011-12-15', 'Calle Luna', '789', 'La Colina', 'user', 'diegui :3'),
    ('000013', 'María', 'López', 'Sánchez', 15, '2009-08-22', 'Boulevard del Norte', '321', 'Las Palmas', 'user', 'ElPresidenteMarsopaEstaPerdido'),
    ('000014', 'Javier', 'Pérez', 'Martínez', 14, '2010-11-10', 'Avenida Central', '654', 'El Prado', 'user', 'Greenflower123'),
    ('000015', 'Laura', 'García', 'Gómez', 13, '2012-04-30', 'Calle de la Primavera', '543', 'Los Pinos', 'user', 'URLaura');

-- Tabla periodo ///// AUTO_INCREMENT
INSERT INTO periodo (numero, nombre, añoInicio, añoFin) VALUES 
    (null, 'CICLO 2021-2022','2021-07-01', '2022-06-30'),
    (null, 'CICLO 2022-2023','2022-07-01', '2023-06-30'),
    (null, 'CICLO 2023-2024','2023-07-01', '2024-06-30');
    (null, 'CICLO 2024-2025','2024-07-01', '2025-06-30');

-- Tabla paquete_de_material
INSERT INTO paquete_de_material (codigo, nombre, precio) VALUES
    ('LIBBAS', 'Libros Básicos', 250.00),
    ('MATART', 'Material de Arte', 150.50),
    ('PAQLAB', 'Paquete de Laboratorio', 300.75),
    ('PAQDEP', 'Paquete de Deportes', 120.00),
    ('PAQMAT', 'Paquete de Material Escolar', 120.00),
    ('PAQADVART', 'Paquete de Arte Avanzado', 180.50),
    ('PAQCIEN', 'Paquete de Ciencias Experimentales', 220.25),
    ('PAQINI', 'Paquete de Inicio para Nuevos Estudiantes', 150.00),
    ('MATCOM', 'Material de Computación', 200.00),
    ('PAQVER', 'Paquete de Verano Recreativo', 90.00),
    ('LIBLIT', 'Libros de Literatura Infantil', 150.50);

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
    --Proximos y pagables
   19 (null, 'Kermes de regreso a clases', '2024-7-02', 200.00),
   20 (null, 'Fiesta independencia de Mexico', '2024-09-16', 75.00),
   21 (null, 'Fiesta navidad', '2024-12-17', 100.00),
   22 (null, 'Fiesta semana santa' '2024-04-13', 65.00),
   23 (null, 'Dia del Niño', '2025-06-30', 70.00);

-- Tabla mantenimiento
INSERT INTO mantenimiento (codigo, descripcion, precio) VALUES
    ('MNT_TECH', 'Mantenimiento aulas ciclo 21-22', 800.00),
    ('MNT_TECH', 'Mantenimiento jardines ciclo 22-23', 840.00),
    ('MNT_TECH', 'Mantenimiento a ciclo 22-23', 840.00),
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

-- Tabla tipo_de_mensualidad
INSERT INTO tipo_de_mensualidad (codigo, nombre) VALUES
    ('REG', 'Regular'),
    ('VAC', 'Vacacional');

-- Tabla genero
INSERT INTO genero (codigo, nombre) VALUES
    ('M', 'Masculino'),
    ('F', 'Femenino');

-- Tabla tipo_de_uniforme /// AUTO_INCREMENT
INSERT INTO tipo_de_uniforme (numero, descripcion, precio) VALUES
    (null, 'Uniforme regular masculino', 700.00),
    (null, 'Uniforme de invierno masculino', 830.00),
    (null, 'Uniforme deportivo', 600.00),
    (null, 'Uniforme regular femenino', 750),
    (null, 'Uniforme de invierno femenino', 740);

-- Tabla tipo_de_examen
INSERT INTO tipo_de_examen (codigo, nombre) VALUES
    ('PAR', 'Parcial'),
    ('FIN', 'Final'),
    ('REM', 'Remedial'),
    ('DIAG', 'Diagnostico'),
    ('EORAL', 'Examen oral');

-- Tabla pago /// AUTO_INCREMENT
INSERT INTO pago (referencia, fechaPago, monto, nivel_educativo, periodo, alumno, estado) VALUES
    ('2021061501', '2021-06-13', 600.00, 'KIND', 1, '000001', 'cancelado'),
    ('2021061502', '2021-06-13', 600.00, 'KIND', 1, '000002', 'pendiente'),
    ('2021061503', '2021-06-13', 600.00, 'KIND', 1, '000003', 'confirmado'),
    ('2021061504', '2021-06-13', 600.00, 'KIND', 1, '000004', 'confirmado'),
    ('2021061505', '2021-06-13', 600.00, 'KIND', 1, '000005', 'confirmado'),
    
    ('2022071501', '2022-06-15', 650.00, 'PRIM', 2, '000006', 'confirmado'),
    ('2022071502', '2022-06-15', 650.00, 'PRIM', 2, '000007', 'confirmado'),
    ('2022071503', '2022-06-15', 700.00, 'PRIM', 2, '000008', 'confirmado'),
    ('2022071504', '2022-06-15', 650.00, 'PRIM', 2, '000009', 'confirmado'),
    ('2022071505', '2022-06-15', 650.00, 'PRIM', 2, '000010', 'confirmado'),
    
    ('2023061501', '2023-06-14', 700.00, 'SECU', 3, '000011', 'confirmado'),
    ('2023061502', '2023-06-14', 700.00, 'SECU', 3, '000012', 'confirmado'),
    ('2023061503', '2023-06-14', 750.00, 'SECU', 3, '000013', 'confirmado'),
    ('2023061504', '2023-06-14', 700.00, 'SECU', 3, '000014', 'confirmado'),
    ('2023061505', '2023-06-14', 700.00, 'SECU', 3, '000015', 'confirmado'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000001
    ('2022011511', '2022-01-15', 200.00, 'KIND', 1, '000001', 'pendiente'),
    ('2022021511', '2022-02-15', 200.00, 'KIND', 1, '000001', 'pendiente'),
    ('2022031511', '2022-03-15', 200.00, 'KIND', 1, '000001', 'pendiente'),
    ('2022041511', '2022-04-15', 200.00, 'KIND', 1, '000001', 'pendiente'),
    ('2022051511', '2022-05-15', 200.00, 'KIND', 1, '000001', 'pendiente'),
    ('2022061511', '2022-06-15', 200.00, 'KIND', 1, '000001', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000002
    ('2022011512', '2022-01-15', 200.00, 'KIND', 1, '000002', 'pendiente'),
    ('2022021512', '2022-02-15', 200.00, 'KIND', 1, '000002', 'pendiente'),
    ('2022031512', '2022-03-15', 200.00, 'KIND', 1, '000002', 'pendiente'),
    ('2022041512', '2022-04-15', 200.00, 'KIND', 1, '000002', 'pendiente'),
    ('2022051512', '2022-05-15', 200.00, 'KIND', 1, '000002', 'pendiente'),
    ('2022061512', '2022-06-15', 200.00, 'KIND', 1, '000002', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000003
    ('2022011513', '2022-01-15', 200.00, 'KIND', 1, '000003', 'pendiente'),
    ('2022021513', '2022-02-15', 200.00, 'KIND', 1, '000003', 'pendiente'),
    ('2022031513', '2022-03-15', 200.00, 'KIND', 1, '000003', 'pendiente'),
    ('2022041513', '2022-04-15', 200.00, 'KIND', 1, '000003', 'pendiente'),
    ('2022051513', '2022-05-15', 200.00, 'KIND', 1, '000003', 'pendiente'),
    ('2022061513', '2022-06-15', 200.00, 'KIND', 1, '000003', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000004
    ('2022011514', '2022-01-15', 200.00, 'KIND', 1, '000004', 'pendiente'),
    ('2022021514', '2022-02-15', 200.00, 'KIND', 1, '000004', 'pendiente'),
    ('2022031514', '2022-03-15', 200.00, 'KIND', 1, '000004', 'pendiente'),
    ('2022041514', '2022-04-15', 200.00, 'KIND', 1, '000004', 'pendiente'),
    ('2022051514', '2022-05-15', 200.00, 'KIND', 1, '000004', 'pendiente'),
    ('2022061514', '2022-06-15', 200.00, 'KIND', 1, '000004', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000005
    ('2022011515', '2022-01-15', 200.00, 'KIND', 1, '000005', 'pendiente'),
    ('2022021515', '2022-02-15', 200.00, 'KIND', 1, '000005', 'pendiente'),
    ('2022031515', '2022-03-15', 200.00, 'KIND', 1, '000005', 'pendiente'),
    ('2022041515', '2022-04-15', 200.00, 'KIND', 1, '000005', 'pendiente'),
    ('2022051515', '2022-05-15', 200.00, 'KIND', 1, '000005', 'pendiente'),
    ('2022061515', '2022-06-15', 200.00, 'KIND', 1, '000005', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000006
    ('2022071516', '2022-07-15', 200.00, 'PRIM', 2, '000006', 'pendiente'),
    ('2022081516', '2022-08-15', 200.00, 'PRIM', 2, '000006', 'pendiente'),
    ('2022091516', '2022-09-15', 200.00, 'PRIM', 2, '000006', 'pendiente'),
    ('2022101516', '2022-10-15', 200.00, 'PRIM', 2, '000006', 'pendiente'),
    ('2022111516', '2022-11-15', 200.00, 'PRIM', 2, '000006', 'pendiente'),
    ('2022121516', '2022-12-15', 200.00, 'PRIM', 2, '000006', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000007
    ('2022071517', '2022-07-15', 200.00, 'PRIM', 2, '000007', 'pendiente'),
    ('2022081517', '2022-08-15', 200.00, 'PRIM', 2, '000007', 'pendiente'),
    ('2022091517', '2022-09-15', 200.00, 'PRIM', 2, '000007', 'pendiente'),
    ('2022101517', '2022-10-15', 200.00, 'PRIM', 2, '000007', 'pendiente'),
    ('2022111517', '2022-11-15', 200.00, 'PRIM', 2, '000007', 'pendiente'),
    ('2022121517', '2022-12-15', 200.00, 'PRIM', 2, '000007', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000008
    ('2022071518', '2022-07-15', 200.00, 'PRIM', 2, '000008', 'pendiente'),
    ('2022081518', '2022-08-15', 200.00, 'PRIM', 2, '000008', 'pendiente'),
    ('2022091518', '2022-09-15', 200.00, 'PRIM', 2, '000008', 'pendiente'),
    ('2022101518', '2022-10-15', 200.00, 'PRIM', 2, '000008', 'pendiente'),
    ('2022111518', '2022-11-15', 200.00, 'PRIM', 2, '000008', 'pendiente'),
    ('2022121518', '2022-12-15', 200.00, 'PRIM', 2, '000008', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000009
    ('2022071519', '2022-07-15', 200.00, 'PRIM', 2, '000009', 'pendiente'),
    ('2022081519', '2022-08-15', 200.00, 'PRIM', 2, '000009', 'pendiente'),
    ('2022091519', '2022-09-15', 200.00, 'PRIM', 2, '000009', 'pendiente'),
    ('2022101519', '2022-10-15', 200.00, 'PRIM', 2, '000009', 'pendiente'),
    ('2022111519', '2022-11-15', 200.00, 'PRIM', 2, '000009', 'pendiente'),
    ('2022121519', '2022-12-15', 200.00, 'PRIM', 2, '000009', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000010
    ('2022071520', '2022-07-15', 200.00, 'PRIM', 2, '000010', 'pendiente'),
    ('2022081520', '2022-08-15', 200.00, 'PRIM', 2, '000010', 'pendiente'),
    ('2022091520', '2022-09-15', 200.00, 'PRIM', 2, '000010', 'pendiente'),
    ('2022101520', '2022-10-15', 200.00, 'PRIM', 2, '000010', 'pendiente'),
    ('2022111520', '2022-11-15', 200.00, 'PRIM', 2, '000010', 'pendiente'),
    ('2022121520', '2022-12-15', 200.00, 'PRIM', 2, '000010', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000011
    ('2023011521', '2023-01-15', 250.00, 'SECU', 3, '000011', 'pendiente'),
    ('2023021521', '2023-02-15', 250.00, 'SECU', 3, '000011', 'pendiente'),
    ('2023031521', '2023-03-15', 250.00, 'SECU', 3, '000011', 'pendiente'),
    ('2023041521', '2023-04-15', 250.00, 'SECU', 3, '000011', 'pendiente'),
    ('2023051521', '2023-05-15', 250.00, 'SECU', 3, '000011', 'pendiente'),
    ('2023061521', '2023-06-15', 250.00, 'SECU', 3, '000011', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000012
    ('2023011522', '2023-01-15', 250.00, 'SECU', 3, '000012', 'pendiente'),
    ('2023021522', '2023-02-15', 250.00, 'SECU', 3, '000012', 'pendiente'),
    ('2023031522', '2023-03-15', 250.00, 'SECU', 3, '000012', 'pendiente'),
    ('2023041522', '2023-04-15', 250.00, 'SECU', 3, '000012', 'pendiente'),
    ('2023051522', '2023-05-15', 250.00, 'SECU', 3, '000012', 'pendiente'),
    ('2023061522', '2023-06-15', 250.00, 'SECU', 3, '000012', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000013
    ('2023011523', '2023-01-15', 250.00, 'SECU', 3, '000013', 'pendiente'),
    ('2023021523', '2023-02-15', 250.00, 'SECU', 3, '000013', 'pendiente'),
    ('2023031523', '2023-03-15', 250.00, 'SECU', 3, '000013', 'pendiente'),
    ('2023041523', '2023-04-15', 250.00, 'SECU', 3, '000013', 'pendiente'),
    ('2023051523', '2023-05-15', 250.00, 'SECU', 3, '000013', 'pendiente'),
    ('2023061523', '2023-06-15', 250.00, 'SECU', 3, '000013', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000014
    ('2023011524', '2023-01-15', 250.00, 'SECU', 3, '000014', 'pendiente'),
    ('2023021524', '2023-02-15', 250.00, 'SECU', 3, '000014', 'pendiente'),
    ('2023031524', '2023-03-15', 250.00, 'SECU', 3, '000014', 'pendiente'),
    ('2023041524', '2023-04-15', 250.00, 'SECU', 3, '000014', 'pendiente'),
    ('2023051524', '2023-05-15', 250.00, 'SECU', 3, '000014', 'pendiente'),
    ('2023061524', '2023-06-15', 250.00, 'SECU', 3, '000014', 'pendiente'),

-- PAGOS POR MENSUALIDAD DEL ALUMNO 000015
    ('2023011525', '2023-01-15', 250.00, 'SECU', 3, '000015', 'pendiente'),
    ('2023021525', '2023-02-15', 250.00, 'SECU', 3, '000015', 'pendiente'),
    ('2023031525', '2023-03-15', 250.00, 'SECU', 3, '000015', 'pendiente'),
    ('2023041525', '2023-04-15', 250.00, 'SECU', 3, '000015', 'pendiente'),
    ('2023051525', '2023-05-15', 250.00, 'SECU', 3, '000015', 'pendiente'),
    ('2023061525', '2023-06-15', 250.00, 'SECU', 3, '000015', 'pendiente');

-- Tabla grupo /// AUTO_INCREMENT
INSERT INTO grupo (numero, nombre, periodo, nivel_educativo) VALUES
    (null, 'A', 1, 'KIND'),
    (null, 'B', 1, 'KIND'),
    (null, 'A', 2, 'PRIM'),
    (null, 'B', 2, 'PRIM'),
    (null, 'A', 3, 'SECU'),
    (null, 'B', 3, 'SECU');

-- Tabla grupo_alumno 
INSERT INTO grupo_alumno (alumno, grupo) VALUES
    ('000001', 1),
    ('000002', 2),
    ('000003', 1),
    ('000004', 2),
    ('000005', 1),
    ('000006', 3),
    ('000007', 4),
    ('000008', 3),
    ('000009', 4),
    ('000010', 3),
    ('000011', 5),
    ('000012', 6),
    ('000013', 5),
    ('000014', 6),
    ('000015', 5);

-- Tabla grado
INSERT INTO grado (numero, nombre, nivel_educativo, periodo) VALUES
    (null, 'Primero de Kinder', 'KIND', 1),
    (null, 'Segundo de Kinder', 'KIND', 1),
    (null, 'Tercero de Kinder', 'KIND', 1),
    (null, 'Primero de Primaria', 'PRIM', 2),
    (null, 'Segundo de Primaria', 'PRIM', 2),
    (null, 'Tercero de Primaria', 'PRIM', 2),
    (null, 'Cuarto de Primaria', 'PRIM', 2),
    (null, 'Quinto de Primaria', 'PRIM', 2),
    (null, 'Sexto de Primaria', 'PRIM', 2),
    (null, 'Primero de Secundaria', 'SECU', 3),
    (null, 'Segundo de Secundaria', 'SECU', 3),
    (null, 'Tercero de Secundaria', 'SECU', 3);


-- Tabla inscripcion
INSERT INTO inscripcion (codigo, precio, grado) VALUES
    ('INS_KIND1', 500.00, 1),
    ('INS_KIND2', 550.00, 2),
    ('INS_KIND3', 600.00, 3),
    ('INS_PRIM1', 650.00, 4),
    ('INS_PRIM2', 700.00, 5),
    ('INS_PRIM3', 750.00, 6),
    ('INS_PRIM4', 650.00, 7),
    ('INS_PRIM5', 700.00, 8),
    ('INS_PRIM6', 750.00, 9),
    ('INS_SECU1', 650.00, 10),
    ('INS_SECU2', 700.00, 11),
    ('INS_SECU3', 750.00, 12);

-- Tabla paquete_de_libros
INSERT INTO paquete_de_libros (codigo, nombre, precio, grado) VALUES
    ('PAQ_KIND1', 'Paquete Primero de Kinder', 200.00, 1),
    ('PAQ_KIND2', 'Paquete Segundo de Kinder', 250.00, 2),
    ('PAQ_KIND3', 'Paquete Tercero de Kinder', 300.00, 3),
    ('PAQ_PRIM1', 'Paquete Primero de Primaria', 350.00, 4),
    ('PAQ_PRIM2', 'Paquete Segundo de Primaria', 400.00, 5),
    ('PAQ_PRIM3', 'Paquete Tercero de Primaria', 400.00, 6),
    ('PAQ_PRIM4', 'Paquete Cuarto de Primaria', 350.00, 7),
    ('PAQ_PRIM5', 'Paquete Quinto de Primaria', 400.00, 8),
    ('PAQ_PRIM6', 'Paquete Sexto de Primaria', 400.00, 9),
    ('PAQ_SECU1', 'Paquete Primero de Secundaria', 350.00, 10),
    ('PAQ_SECU2', 'Paquete Segundo de Secundaria', 400.00, 11),
    ('PAQ_SECU3', 'Paquete Tercero de Secundaria', 400.00, 12);

-- Tabla examen
INSERT INTO examen (codigo, precio, tipo_de_examen) VALUES
    ('EXAM_PAR', 50.00, 'PAR'),
    ('EXAM_FIN', 60.00, 'FIN'),
    ('EXAM_REM', 70.00, 'REM'),
    ('EXAM_DIAG', 80.00, 'DIAG'),
    ('EXAM_EORAL', 90.00, 'EORAL');

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
    (null, 'Paquete de uniforme escolar hombre S', 2130, 'M', 'S'),
    (null, 'Paquete de uniforme escolar hombre M', 2130, 'M', 'M'),
    (null, 'Paquete de uniforme escolar hombre L', 2130, 'M', 'L'),
    (null, 'Paquete de uniforme escolar mujer S', 2090, 'F', 'S'),
    (null, 'Paquete de uniforme escolar mujer M', 2090, 'F', 'M'),
    (null, 'Paquete de uniforme escolar mujer L', 2090, 'F', 'L');
-- Tabla detalle_paquete (Tipo de Uniforme y Paquete de Uniforme) 
INSERT INTO detalle_Paquete (paquete_de_uniforme, tipo_de_uniforme) VALUES
    (1, 1), -- Paquete hombre S - Uniforme regular masculino
    (1, 2), -- Paquete hombre S - Uniforme de invierno masculino
    (1, 3), -- Paquete hombre S - Uniforme deportivo
    (2, 1), -- Paquete hombre M - Uniforme regular masculino
    (2, 2), -- Paquete hombre M - Uniforme de invierno masculino
    (2, 3), -- Paquete hombre M - Uniforme deportivo
    (3, 1), -- Paquete hombre L - Uniforme regular masculino
    (3, 2), -- Paquete hombre L - Uniforme de invierno masculino
    (3, 3), -- Paquete hombre L - Uniforme deportivo
    (4, 4), -- Paquete mujer S - Uniforme regular femenino
    (4, 5), -- Paquete mujer S - Uniforme de invierno femenino
    (4, 3), -- Paquete mujer S - Uniforme deportivo
    (5, 4), -- Paquete mujer M - Uniforme regular femenino
    (5, 5), -- Paquete mujer M - Uniforme de invierno femenino
    (5, 3), -- Paquete mujer M - Uniforme deportivo
    (6, 4), -- Paquete mujer L - Uniforme regular femenino
    (6, 5), -- Paquete mujer L - Uniforme de invierno femenino
    (6, 3); -- Paquete mujer L - Uniforme deportivo

-- Tabla tipo_de_pago /// AUTO_INCREMENT
INSERT INTO tipo_de_pago (numero, descripcion, pago, inscripcion, paquete_de_libros, paquete_de_uniforme, examen, mensualidad, evento, paquete_de_material, mantenimiento) VALUES
    -- PAGOS DE INSCRIPCIÓN
    (null, 'Pago de Inscripción 3ro de Kinder', 1, 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 2, 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 3, 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 4, 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 5, 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Inscripción 4to de Primaria', 6, 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 4to de Primaria', 7, 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 5to de Primaria', 8, 'INS_PRIM5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 4to de Primaria', 9, 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 4to de Primaria', 10, 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL, NULL), 

    (null, 'Pago de Inscripción 2do de Secundaria', 11, 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', 12, 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Secundaria', 13, 'INS_SECU3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', 14, 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', 15, 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),

    -- PAGOS DE MENSUALIDAD
    (null, 'Pago de Mensualidad de Enero', 16, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 17, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 18, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 19, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 20, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 21, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 22, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 23, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 24, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 25, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 26, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 27, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 28, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 29, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 30, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 31, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 32, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 33, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 34, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 35, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 36, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 37, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 38, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 39, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 40, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 41, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 42, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 43, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 44, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 45, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Julio', 46, NULL, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 47, NULL, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Septiembre', 48, NULL, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 49, NULL, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 50, NULL, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 51, NULL, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Julio', 52, NULL, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 53, NULL, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Septiembre', 54, NULL, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 55, NULL, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 56, NULL, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 57, NULL, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Julio', 58, NULL, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 59, NULL, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Septiembre', 60, NULL, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 61, NULL, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 62, NULL, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 63, NULL, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Julio', 64, NULL, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 65, NULL, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Septiembre', 66, NULL, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 67, NULL, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 68, NULL, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 69, NULL, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Julio', 70, NULL, NULL, NULL, NULL, 'JUL', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Agosto', 71, NULL, NULL, NULL, NULL, 'AGO', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Septiembre', 72, NULL, NULL, NULL, NULL, 'SEP', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Octubre', 73, NULL, NULL, NULL, NULL, 'OCT', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Noviembre', 74, NULL, NULL, NULL, NULL, 'NOV', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Diciembre', 75, NULL, NULL, NULL, NULL, 'DIC', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 76, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 77, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 78, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 79, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 80, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 81, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 82, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 83, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 84, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 85, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 86, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 87, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 88, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 89, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 90, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 91, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 92, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 93, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 94, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 95, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 96, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 97, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 98, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 99, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    (null, 'Pago de Mensualidad de Enero', 100, NULL, NULL, NULL, NULL, 'ENE', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Febrero', 101, NULL, NULL, NULL, NULL, 'FEB', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Marzo', 102, NULL, NULL, NULL, NULL, 'MAR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Abril', 103, NULL, NULL, NULL, NULL, 'ABR', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Mayo', 104, NULL, NULL, NULL, NULL, 'MAY', NULL, NULL, NULL),
    (null, 'Pago de Mensualidad de Junio', 105, NULL, NULL, NULL, NULL, 'JUN', NULL, NULL, NULL),

    -- PAGOS DE EVENTOS
    (null, 'Pago para el Día del Libro', 106, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Competencia Deportiva', 107, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),

    (null, 'Pago para el Día del Libro', 108, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Competencia Deportiva', 109, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),

    (null, 'Pago para el Día del Libro', 110, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Competencia Deportiva', 111, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),

    (null, 'Pago para el Día del Libro', 112, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Competencia Deportiva', 113, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),

    (null, 'Pago para el Día del Libro', 114, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
    (null, 'Pago para Competencia Deportiva', 115, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL);

-- Tabla grado_alumno
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
    ('000015', 11);

-- Tabla tutor
INSERT INTO tutor (numero, nombrePila, primerApellido, segApellido, numTel) VALUES
    -- Alumno 000001 (Luis García Hernández)
    (null, 'Carlos', 'García', 'Hernández', '(664)1234567'),
    (null, 'Ana', 'Hernández', 'García', '(664)1234567'),

    -- Alumno 000002 (Ana Martínez López)
    (null, 'Luis', 'Martínez', 'López', '(664)2345678'),
    (null, 'María', 'López', 'Martínez', '(664)2345678'),

    -- Alumno 000003 (Diego Rodríguez Gómez)
    (null, 'Javier', 'Rodríguez', 'Gómez', '(664)3456789'),
    (null, 'Laura', 'Gómez', 'Rodríguez', '(664)3456789'),

    -- Alumno 000004 (María López Martínez)
    (null, 'Carlos', 'López', 'Martínez', '(664)4567890'),
    (null, 'Ana', 'Martínez', 'López', '(664)4567890'),

    -- Alumno 000005 (Javier Hernández Pérez)
    (null, 'Pedro', 'Hernández', 'Pérez', '(664)5678901'),
    (null, 'Sofía', 'Pérez', 'Hernández', '(664)5678901'),

    -- Alumno 000006 (Carlos Gómez García)
    (null, 'Luis', 'Gómez', 'García', '(664)6789012'),
    (null, 'Ana', 'García', 'Gómez', '(664)6789012'),

    -- Alumno 000007 (Laura Díaz Rodríguez)
    (null, 'Mario', 'Díaz', 'Rodríguez', '(664)7890123'),
    (null, 'Isabel', 'Rodríguez', 'Díaz', '(664)7890123'),

    -- Alumno 000008 (Juan Martínez Sánchez)
    (null, 'José', 'Martínez', 'Sánchez', '(664)8901234'),
    (null, 'Rosa', 'Sánchez', 'Martínez', '(664)8901234'),

    -- Alumno 000009 (Sofía Pérez Gómez)
    (null, 'Andrés', 'Pérez', 'Gómez', '(664)9012345'),
    (null, 'Laura', 'Gómez', 'Pérez', '(664)9012345'),

    -- Alumno 000010 (Pedro González López)
    (null, 'Héctor', 'González', 'López', '(664)2345678'),
    (null, 'Carmen', 'López', 'González', '(664)2345678'),

    -- Alumno 000011 (Ana Hernández González)
    (null, 'Felipe', 'Hernández', 'González', '(664)1234567'),
    (null, 'María', 'González', 'Hernández', '(664)1234567'),

    -- Alumno 000012 (Diego Martínez Rodríguez)
    (null, 'Roberto', 'Martínez', 'Rodríguez', '(664)3456789'),
    (null, 'Verónica', 'Rodríguez', 'Martínez', '(664)3456789'),

    -- Alumno 000013 (María López Sánchez)
    (null, 'Jorge', 'López', 'Sánchez', '(664)4567890'),
    (null, 'Patricia', 'Sánchez', 'López', '(664)4567890'),

    -- Alumno 000014 (Javier Pérez Martínez)
    (null, 'Eduardo', 'Pérez', 'Martínez', '(664)5678901'),
    (null, 'Claudia', 'Martínez', 'Pérez', '(664)5678901'),

    -- Alumno 000015 (Laura García Gómez)
    (null, 'Ricardo', 'García', 'Gómez', '(664)9012345'),
    (null, 'Elena', 'Gómez', 'García', '(664)9012345');

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

INSERT INTO grupo_grado (grupo, grado) VALUES
    (2, 3),
    (1, 7),
    (2, 8),
    (1, 11),
    (2, 12);
