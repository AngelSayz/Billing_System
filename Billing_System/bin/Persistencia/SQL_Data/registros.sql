-- Tabla alumno
INSERT INTO alumno (matricula, nombrePila, primerApellido, segApellido, edad, fechaNac, category) VALUES
    ('0', 'Admin', '-', '', 0, '2000-01-01', 'admin'),
    ('000001', 'Luis', 'García', 'Hernández', 5, '2019-03-10', 'user'),
    ('000002', 'Ana', 'Martínez', 'López', 4, '2020-06-15', 'user'),
    ('000003', 'Diego', 'Rodríguez', 'Gómez', 5, '2019-02-28', 'user'),
    ('000004', 'María', 'López', 'Martínez', 4, '2020-04-22', 'user'),
    ('000005', 'Javier', 'Hernández', 'Pérez', 5, '2019-08-03', 'user'),
    ('000006', 'Carlos', 'Gómez', 'García', 10, '2014-01-05', 'user'),
    ('000007', 'Laura', 'Díaz', 'Rodríguez', 9, '2015-05-12', 'user'),
    ('000008', 'Juan', 'Martínez', 'Sánchez', 11, '2013-11-20', 'user'),
    ('000009', 'Sofía', 'Pérez', 'Gómez', 10, '2014-08-17', 'user'),
    ('000010', 'Pedro', 'González', 'López', 9, '2015-02-28', 'user'),
    ('000011', 'Ana', 'Hernández', 'González', 14, '2010-09-08', 'user'),
    ('000012', 'Diego', 'Martínez', 'Rodríguez', 13, '2011-12-15', 'user'),
    ('000013', 'María', 'López', 'Sánchez', 15, '2009-08-22', 'user'),
    ('000014', 'Javier', 'Pérez', 'Martínez', 14, '2010-11-10', 'user'),
    ('000015', 'Laura', 'García', 'Gómez', 13, '2012-04-30', 'user');

-- Tabla periodo ///// AUTO_INCREMENT
INSERT INTO periodo (numero, añoInicio, añoFin) VALUES
    (null, '2024-01-01', '2024-06-30'),
    (null, '2024-07-01', '2024-12-31'),
    (null, '2025-01-01', '2025-06-30'),
    (null, '2025-07-01', '2025-12-31');

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

-- Tabla evento
INSERT INTO evento (numero, nombre, fecha) VALUES
    (null, 'Reunión de Padres', '2024-08-15'),
    (null, 'Feria de Ciencias', '2024-09-20'),
    (null, 'Día del Deporte', '2024-10-05'),
    (null, 'Concierto de Navidad', '2024-12-20'),
    (null, 'Carnaval Escolar', '2024-02-10'),
    (null, 'Día de la Madre', '2024-05-10'),
    (null, 'Día del Libro', '2024-04-23'),
    (null, 'Fiesta de Fin de Año', '2024-12-15'),
    (null, 'Competencia Deportiva', '2024-06-15'),
    (null, 'Visita Cultural', '2024-03-05'),
    (null, 'Concurso de Talento', '2024-09-15'),
    (null, 'Día del Estudiante', '2024-11-17');

-- Tabla mantenimiento
INSERT INTO mantenimiento (codigo, descripcion, precio) VALUES
    ('MNT001', 'Reparación de techos', 1200.00),
    ('MNT002', 'Limpieza profunda de aulas', 500.00),
    ('MNT003', 'Mantenimiento de sistemas eléctricos', 800.00),
    ('MNT004', 'Reparación de tuberías y fontanería', 600.00),
    ('MNT005', 'Servicio de jardinería y paisajismo', 300.00),
    ('MNT006', 'Revisión de sistemas de climatización', 400.00),
    ('MNT007', 'Mantenimiento de equipos tecnológicos', 1000.00),
    ('MNT008', 'Pintura de aulas y oficinas', 1500.00),
    ('MNT009', 'Control de plagas', 250.00),
    ('MNT010', 'Reparación de mobiliario', 700.00),
    ('MNT011', 'Sanitización de baños y áreas comunes', 350.00),
    ('MNT012', 'Reparación de canchas deportivas', 800.00),
    ('MNT013', 'Mantenimiento de sistemas de seguridad', 500.00),
    ('MNT014', 'Remodelación de salas de profesores', 1200.00),
    ('MNT015', 'Reemplazo de extintores y equipos de emergencia', 300.00);

-- Tabla nivel_educativo
INSERT INTO nivel_educativo (codigo, nombre) VALUES
    ('KIND', 'Kinder'),
    ('PRIM', 'Primaria'),
    ('SECU', 'Secundaria');

-- Tabla tipo_de_mensualidad
INSERT INTO tipo_de_mensualidad (codigo, nombre) VALUES
    ('REG', 'Regular'),
    ('ADI', 'Adicional'),
    ('OBL', 'Obligatorio'),
    ('VAC', 'Vacacional');

-- Tabla genero
INSERT INTO genero (codigo, nombre) VALUES
    ('M', 'Masculino'),
    ('F', 'Femenino');

-- Tabla tipo_de_uniforme /// AUTO_INCREMENT
INSERT INTO tipo_de_uniforme (numero, descripcion) VALUES
    (null, 'Uniforme regular'),
    (null, 'Uniforme deportivo'),
    (null, 'Uniforme formal'),
    (null, 'Uniforme de invierno'),
    (null, 'Uniforme de verano');

-- Tabla tipo_de_examen
INSERT INTO tipo_de_examen (codigo, nombre) VALUES
    ('PAR', 'Parcial'),
    ('FIN', 'Final'),
    ('REM', 'Remedial'),
    ('DIAG', 'Diagnostico'),
    ('EORAL', 'Examen oral');

-- Tabla pago /// AUTO_INCREMENT
INSERT INTO pago (referencia, fechaPago, monto, nivel_educativo, periodo, alumno) VALUES
    ('2024011501', '2024-01-15', 600.00, 'KIND', 1, '000001'),
    ('2024011502', '2024-01-15', 600.00, 'KIND', 1, '000002'),
    ('2024011503', '2024-01-15', 600.00, 'KIND', 1, '000003'),
    ('2024011504', '2024-01-15', 600.00, 'KIND', 1, '000004'),
    ('2024011505', '2024-01-15', 600.00, 'KIND', 1, '000005'),
    
    ('2024071501', '2024-07-15', 650.00, 'PRIM', 2, '000006'),
    ('2024071502', '2024-07-15', 650.00, 'PRIM', 2, '000007'),
    ('2024071503', '2024-07-15', 700.00, 'PRIM', 2, '000008'),
    ('2024071504', '2024-07-15', 650.00, 'PRIM', 2, '000009'),
    ('2024071505', '2024-07-15', 650.00, 'PRIM', 2, '000010'),
    
    ('2025011501', '2025-01-15', 700.00, 'SECU', 3, '000011'),
    ('2025011502', '2025-01-15', 700.00, 'SECU', 3, '000012'),
    ('2025011503', '2025-01-15', 750.00, 'SECU', 3, '000013'),
    ('2025011504', '2025-01-15', 700.00, 'SECU', 3, '000014'),
    ('2025011505', '2025-01-15', 700.00, 'SECU', 3, '000015');

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
INSERT INTO grado (numero, nombre, nivel_educativo) VALUES
    (null, 'Primero de Kinder', 'KIND'),
    (null, 'Segundo de Kinder', 'KIND'),
    (null, 'Tercero de Kinder', 'KIND'),
    (null, 'Primero de Primaria', 'PRIM'),
    (null, 'Segundo de Primaria', 'PRIM'),
    (null, 'Tercero de Primaria', 'PRIM'),
    (null, 'Cuarto de Primaria', 'PRIM'),
    (null, 'Quinto de Primaria', 'PRIM'),
    (null, 'Sexto de Primaria', 'PRIM'),
    (null, 'Primero de Secundaria', 'SECU'),
    (null, 'Segundo de Secundaria', 'SECU'),
    (null, 'Tercero de Secundaria', 'SECU');


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
    ('COUTBAS', 'Cuota escolar básica', 500.00, 'REG'),
    ('ALIMESC', 'Alimentación escolar', 150.00, 'ADI'),
    ('MATDIDA', 'Material didáctico', 50.00, 'ADI'),
    ('SEGESC', 'Seguro escolar', 50.00, 'OBL'),
    ('ACTEXT', 'Actividades extracurriculares', 100.00, 'ADI'),
    ('TRANESC', 'Transporte escolar', 200.00, 'ADI'),
    ('COUTTEC', 'Cuota de tecnología', 50.00, 'ADI'),
    ('COUTMANT', 'Cuota de mantenimiento', 75.00, 'ADI'),
    ('PAGOVAC', 'Vacaciones', 300.00, 'VAC');

-- Tabla paquete_de_uniforme /// AUTO_INCREMENT
INSERT INTO paquete_de_uniforme (numero, descripcion, costo, genero) VALUES
    (null, 'Paquete de uniforme escolar básico M', 150.00, 'M'),
    (null, 'Paquete de uniforme escolar básico F', 150.00, 'F'),
    (null, 'Paquete de uniforme deportivo M', 200.50, 'M'),
    (null, 'Paquete de uniforme deportivo F', 200.50, 'F'),
    (null, 'Paquete de uniforme de gala M', 180.75, 'M'),
    (null, 'Paquete de uniforme de gala F', 180.75, 'F'),
    (null, 'Paquete de uniforme de invierno M', 120.25, 'M'),
    (null, 'Paquete de uniforme de invierno F', 120.25, 'F'),
    (null, 'Paquete de uniforme de verano M', 180.00, 'M'),
    (null, 'Paquete de uniforme de verano F', 180.00, 'F');

-- Tabla detalle_paquete (Tipo de Uniforme y Paquete de Uniforme) 
INSERT INTO detalle_Paquete (paquete_de_uniforme, tipo_de_uniforme, precio, talla) VALUES
    (1, 1, 150.0, 'XS'),
    (1, 1, 150.0, 'S'),
    (1, 1, 150.0, 'M'),
    (1, 1, 150.0, 'L'),
    (1, 1, 150.0, 'XL'),
    (2, 1, 150.0, 'XS'),
    (2, 1, 150.0, 'S'),
    (2, 1, 150.0, 'M'),
    (2, 1, 150.0, 'L'),
    (2, 1, 150.0, 'XL'),
    (3, 2, 200.50, 'XS'),
    (3, 2, 200.50, 'S'),
    (3, 2, 200.50, 'M'),
    (3, 2, 200.50, 'L'),
    (3, 2, 200.50, 'XL'),
    (4, 2, 200.50, 'XL'),
    (4, 2, 200.50, 'S'),
    (4, 2, 200.50, 'M'),
    (4, 2, 200.50, 'L'),
    (4, 2, 200.50, 'XL'),
    (5, 3, 180.75, 'XS'),
    (5, 3, 180.75, 'S'),
    (5, 3, 180.75, 'M'),
    (5, 3, 180.75, 'L'),
    (5, 3, 180.75, 'XL'),
    (6, 3, 180.75, 'XS'),
    (6, 3, 180.75, 'S'),
    (6, 3, 180.75, 'M'),
    (6, 3, 180.75, 'L'),
    (6, 3, 180.75, 'XL'),
    (7, 4, 120.25, 'XS'),
    (7, 4, 120.25, 'S'),
    (7, 4, 120.25, 'M'),
    (7, 4, 120.25, 'L'),
    (7, 4, 120.25, 'XL'),
    (8, 4, 120.25, 'XS'),
    (8, 4, 120.25, 'S'),
    (8, 4, 120.25, 'M'),
    (8, 4, 120.25, 'L'),
    (8, 4, 120.25, 'XL'),
    (9, 5, 180.00, 'XS'),
    (9, 5, 180.00, 'S'),
    (9, 5, 180.00, 'M'),
    (9, 5, 180.00, 'L'),
    (9, 5, 180.00, 'XL'),
    (10, 5, 180.00, 'XS');
    (10, 5, 180.00, 'S');
    (10, 5, 180.00, 'M');
    (10, 5, 180.00, 'L');
    (10, 5, 180.00, 'XL');

-- Tabla tipo_de_pago /// AUTO_INCREMENT
INSERT INTO tipo_de_pago (numero, descripcion, pago, inscripcion, paquete_de_libros, paquete_de_uniforme, examen, mensualidad, evento, paquete_de_material) VALUES
    (null, 'Pago de Inscripción 3ro de Kinder', '2024011501', 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', '2024011502', 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', '2024011503', 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', '2024011504', 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', '2024011505', 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Inscripción 4to de Primaria', '2024071501', 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 4to de Primaria', '2024071502', 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 5to de Primaria', '2024071503', 'INS_PRIM5', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 4to de Primaria', '2024071504', 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL), 
    (null, 'Pago de Inscripción 4to de Primaria', '2024071505', 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL), 

    (null, 'Pago de Inscripción 2do de Secundaria', '2025011501', 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', '2025011502', 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Secundaria', '2025011503', 'INS_SECU3', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', '2025011504', 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', '2025011505', 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO tutor (numero, nombrePila, primerApellido, segApellido, dirCalle, dirNumero, dirColonia, numTel) VALUES
    -- Alumno 000001 (Luis García Hernández)
    (null, 'Carlos', 'García', 'Hernández', 'Av. Reforma', '123', 'Centro', '(664)1234567'),
    (null, 'Ana', 'Hernández', 'García', 'Av. Reforma', '123', 'Centro', '(664)1234567'),

-- Alumno 000002 (Ana Martínez López)
    (null, 'Luis', 'Martínez', 'López', 'Calle del Sol', '456', 'Santa María', '(664)2345678'),
    (null, 'María', 'López', 'Martínez', 'Calle del Sol', '456', 'Santa María', '(664)2345678'),

-- Alumno 000003 (Diego Rodríguez Gómez)
    (null, 'Javier', 'Rodríguez', 'Gómez', 'Calle Luna', '789', 'La Colina', '(664)3456789'),
    (null, 'Laura', 'Gómez', 'Rodríguez', 'Calle Luna', '789', 'La Colina', '(664)3456789'),

-- Alumno 000004 (María López Martínez)
    (null, 'Carlos', 'López', 'Martínez', 'Boulevard del Norte', '321', 'Las Palmas', '(664)4567890'),
    (null, 'Ana', 'Martínez', 'López', 'Boulevard del Norte', '321', 'Las Palmas', '(664)4567890'),

-- Alumno 000005 (Javier Hernández Pérez)
    (null, 'Pedro', 'Hernández', 'Pérez', 'Avenida Central', '654', 'El Prado', '(664)5678901'),
    (null, 'Sofía', 'Pérez', 'Hernández', 'Avenida Central', '654', 'El Prado', '(664)5678901'),

-- Alumno 000006 (Carlos Gómez García)
    (null, 'Luis', 'Gómez', 'García', 'Calle de la Luna', '987', 'El Molino', '(664)6789012'),
    (null, 'Ana', 'García', 'Gómez', 'Calle de la Luna', '987', 'El Molino', '(664)6789012'),

-- Alumno 000007 (Laura Díaz Rodríguez)
    (null, 'Mario', 'Díaz', 'Rodríguez', 'Avenida de los Robles', '432', 'San José', '(664)7890123'),
    (null, 'Isabel', 'Rodríguez', 'Díaz', 'Avenida de los Robles', '432', 'San José', '(664)7890123'),

-- Alumno 000008 (Juan Martínez Sánchez)
    (null, 'José', 'Martínez', 'Sánchez', 'Calle del Bosque', '876', 'La Loma', '(664)8901234'),
    (null, 'Rosa', 'Sánchez', 'Martínez', 'Calle del Bosque', '876', 'La Loma', '(664)8901234'),

-- Alumno 000009 (Sofía Pérez Gómez)
    (null, 'Andrés', 'Pérez', 'Gómez', 'Calle de la Primavera', '543', 'Los Pinos', '(664)9012345'),
    (null, 'Laura', 'Gómez', 'Pérez', 'Calle de la Primavera', '543', 'Los Pinos', '(664)9012345'),

-- Alumno 000010 (Pedro González López)
    (null, 'Héctor', 'González', 'López', 'Calle del Sol', '456', 'Santa María', '(664)2345678'),
    (null, 'Carmen', 'López', 'González', 'Calle del Sol', '456', 'Santa María', '(664)2345678'),

-- Alumno 000011 (Ana Hernández González)
    (null, 'Felipe', 'Hernández', 'González', 'Av. Reforma', '123', 'Centro', '(664)1234567'),
    (null, 'María', 'González', 'Hernández', 'Av. Reforma', '123', 'Centro', '(664)1234567'),

-- Alumno 000012 (Diego Martínez Rodríguez)
    (null, 'Roberto', 'Martínez', 'Rodríguez', 'Calle Luna', '789', 'La Colina', '(664)3456789'),
    (null, 'Verónica', 'Rodríguez', 'Martínez', 'Calle Luna', '789', 'La Colina', '(664)3456789'),

-- Alumno 000013 (María López Sánchez)
    (null, 'Jorge', 'López', 'Sánchez', 'Boulevard del Norte', '321', 'Las Palmas', '(664)4567890'),
    (null, 'Patricia', 'Sánchez', 'López', 'Boulevard del Norte', '321', 'Las Palmas', '(664)4567890'),

-- Alumno 000014 (Javier Pérez Martínez)
    (null, 'Eduardo', 'Pérez', 'Martínez', 'Avenida Central', '654', 'El Prado', '(664)5678901'),
    (null, 'Claudia', 'Martínez', 'Pérez', 'Avenida Central', '654', 'El Prado', '(664)5678901'),

-- Alumno 000015 (Laura García Gómez)
    (null, 'Ricardo', 'García', 'Gómez', 'Calle de la Primavera', '543', 'Los Pinos', '(664)9012345'),
    (null, 'Elena', 'Gómez', 'García', 'Calle de la Primavera', '543', 'Los Pinos', '(664)9012345');


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
