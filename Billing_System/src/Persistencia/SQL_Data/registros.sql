-- Tabla alumno
INSERT INTO alumno (matricula, nombre_de_pila, primerApellido, segApellido, edad, fechaNac, category) VALUES
    ('0000', 'Jose', 'Zuniga', 'Medina', 20, '2004-06-14', 'admin');
    ('0000000001', 'Luis', 'García', 'Hernández', 5, '2019-03-10', 'user'),
    ('0000000002', 'Ana', 'Martínez', 'López', 4, '2020-06-15', 'user'),
    ('0000000003', 'Diego', 'Rodríguez', 'Gómez', 5, '2019-02-28', 'user'),
    ('0000000004', 'María', 'López', 'Martínez', 4, '2020-04-22', 'user'),
    ('0000000005', 'Javier', 'Hernández', 'Pérez', 5, '2019-08-03', 'user'),
    ('0000000006', 'Carlos', 'Gómez', 'García', 10, '2014-01-05', 'user'),
    ('0000000007', 'Laura', 'Díaz', 'Rodríguez', 9, '2015-05-12', 'user'),
    ('0000000008', 'Juan', 'Martínez', 'Sánchez', 11, '2013-11-20', 'user'),
    ('0000000009', 'Sofía', 'Pérez', 'Gómez', 10, '2014-08-17', 'user'),
    ('0000000010', 'Pedro', 'González', 'López', 9, '2015-02-28', 'user'),
    ('0000000011', 'Ana', 'Hernández', 'González', 14, '2010-09-08', 'user'),
    ('0000000012', 'Diego', 'Martínez', 'Rodríguez', 13, '2011-12-15', 'user'),
    ('0000000013', 'María', 'López', 'Sánchez', 15, '2009-08-22', 'user'),
    ('0000000014', 'Javier', 'Pérez', 'Martínez', 14, '2010-11-10', 'user'),
    ('0000000015', 'Laura', 'García', 'Gómez', 13, '2012-04-30', 'user'),
    ('0000', 'Admin', 'X', '', 0, '0000-00-00', 'admin');

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

-- Tabla talla
INSERT INTO talla (codigo, descripcion) VALUES
    ('XS', 'Extra Pequeño'),
    ('S', 'Pequeño'),
    ('M', 'Mediano'),
    ('L', 'Grande'),
    ('XL', 'Extra Grande');

-- Tabla tipo_de_uniforme /// AUTO_INCREMENT
INSERT INTO tipo_de_uniforme (numero, precio, descripcion) VALUES
    (null, 150.00, 'Uniforme regular'),
    (null, 200.50, 'Uniforme deportivo'),
    (null, 180.75, 'Uniforme formal'),
    (null, 120.25, 'Uniforme de invierno'),
    (null, 180.00, 'Uniforme de verano');

-- Tabla tipo_de_examen
INSERT INTO tipo_de_examen (codigo, nombre) VALUES
    ('PAR', 'Parcial'),
    ('FIN', 'Final'),
    ('REM', 'Remedial'),
    ('DIAG', 'Diagnostico'),
    ('EORAL', 'Examen oral');

-- Tabla pago /// AUTO_INCREMENT
INSERT INTO pago (numero, fechaPago, monto, nivel_educativo, periodo, alumno) VALUES
    (null, '2024-01-15', 1500.00, 'KIND', 1, '0000000001'),
    (null, '2024-01-15', 1500.00, 'KIND', 1, '0000000002'),
    (null, '2024-01-15', 1500.00, 'KIND', 1, '0000000003'),
    (null, '2024-01-15', 1500.00, 'KIND', 1, '0000000004'),
    (null, '2024-01-15', 1500.00, 'KIND', 1, '0000000005'),
    
    (null, '2024-07-15', 2000.00, 'PRIM', 2, '0000000006'),
    (null, '2024-07-15', 2000.00, 'PRIM', 2, '0000000007'),
    (null, '2024-07-15', 2000.00, 'PRIM', 2, '0000000008'),
    (null, '2024-07-15', 2000.00, 'PRIM', 2, '0000000009'),
    (null, '2024-07-15', 2000.00, 'PRIM', 2, '0000000010'),
    
    (null, '2025-01-15', 2500.00, 'SECU', 3, '0000000011'),
    (null, '2025-01-15', 2500.00, 'SECU', 3, '0000000012'),
    (null, '2025-01-15', 2500.00, 'SECU', 3, '0000000013'),
    (null, '2025-01-15', 2500.00, 'SECU', 3, '0000000014'),
    (null, '2025-01-15', 2500.00, 'SECU', 3, '0000000015');

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
    ('0000000001', 1),
    ('0000000002', 2),
    ('0000000003', 1),
    ('0000000004', 2),
    ('0000000005', 1),
    ('0000000006', 3),
    ('0000000007', 4),
    ('0000000008', 3),
    ('0000000009', 4),
    ('0000000010', 3),
    ('0000000011', 5),
    ('0000000012', 6),
    ('0000000013', 5),
    ('0000000014', 6),
    ('0000000015', 5);

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
NSERT INTO examen (codigo, precio, tipo_de_examen) VALUES
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
INSERT INTO paquete_de_uniforme (numero, descripcion, precio, genero) VALUES
    (null, 'Paquete de uniforme escolar básico M', 300.00, 'M'),
    (null, 'Paquete de uniforme escolar básico F', 300.00, 'F'),
    (null, 'Paquete de uniforme deportivo M', 400.00, 'M'),
    (null, 'Paquete de uniforme deportivo F', 400.00, 'F'),
    (null, 'Paquete de uniforme de gala M', 600.00, 'M'),
    (null, 'Paquete de uniforme de gala F', 600.00, 'F'),
    (null, 'Paquete de uniforme de invierno M', 450.00, 'M'),
    (null, 'Paquete de uniforme de invierno F', 450.00, 'F'),
    (null, 'Paquete de uniforme de verano M', 350.00, 'M'),
    (null, 'Paquete de uniforme de verano F', 350.00, 'F');

-- Tabla talla_uniforme
INSERT INTO talla_Uniforme (paquete_de_uniforme, talla) VALUES  
    (1, 'XS'),
    (1, 'S'),
    (1, 'M'),
    (1, 'L'),
    (1, 'XL'),
    (2, 'XS'),
    (2, 'S'),
    (2, 'M'),
    (2, 'L'),
    (2, 'XL'),
    (3, 'XS'),
    (3, 'S'),
    (3, 'M'),
    (3, 'L'),
    (3, 'XL'),
    (4, 'XS'),
    (4, 'S'),
    (4, 'M'),
    (4, 'L'),
    (4, 'XL'),  
    (5, 'XS'),
    (5, 'S'),
    (5, 'M'),
    (5, 'L'),
    (5, 'XL'), 
    (6, 'XS'),
    (6, 'S'),
    (6, 'M'),
    (6, 'L'),
    (6, 'XL'),
    (7, 'XS'),
    (7, 'S'),
    (7, 'M'),
    (7, 'L'),
    (7, 'XL'),
    (8, 'XS'),
    (8, 'S'),
    (8, 'M'),
    (8, 'L'),
    (8, 'XL'),
    (9, 'XS'),
    (9, 'S'),
    (9, 'M'),
    (9, 'L'),
    (9, 'XL'),
    (10, 'XS'),
    (10, 'S'),
    (10, 'M'),
    (10, 'L'),
    (10, 'XL');


-- Tabla detalle_paquete (Tipo de Uniforme y Paquete de Uniforme) 
INSERT INTO detalle_Paquete (paquete_de_uniforme, tipo_de_uniforme) VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4),
    (9, 5),
    (10, 5);

-- Tabla tipo_de_pago /// AUTO_INCREMENT
INSERT INTO tipo_de_pago (numero, descripcion, inscripcion, paquete_de_libros, paquete_de_uniforme, examen, mensualidad, evento, paquete_de_material) VALUES
    -- PAGOS DE INSCRIPCIÓN
    (null, 'Pago de Inscripción 1ro de Kinder', 'INS_KIND1', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Kinder', 'INS_KIND2', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Kinder', 'INS_KIND3', NULL, NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Inscripción 1ro de Primaria', 'INS_PRIM1', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Primaria', 'INS_PRIM2', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Primaria', 'INS_PRIM3', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 4to de Primaria', 'INS_PRIM4', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 5to de Primaria', 'INS_PRIM5', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 6to de Primaria', 'INS_PRIM6', NULL, NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Inscripción 1ro de Secundaria', 'INS_SECU1', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 2do de Secundaria', 'INS_SECU2', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Inscripción 3ro de Secundaria', 'INS_SECU3', NULL, NULL, NULL, NULL, NULL, NULL),

    -- PAGOS DE LIBROS
    (null, 'Pago de Libros 1ro de Kinder', NULL, 'PAQ_KIND1', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 2do de Kinder', NULL, 'PAQ_KIND2', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 3ro de Kinder', NULL, 'PAQ_KIND3', NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Libros 1ro de Primaria', NULL, 'PAQ_PRIM1', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 2do de Primaria', NULL, 'PAQ_PRIM2', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 3ro de Primaria', NULL, 'PAQ_PRIM3', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 4to de Primaria', NULL, 'PAQ_PRIM4', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 5to de Primaria', NULL, 'PAQ_PRIM5', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 6to de Primaria', NULL, 'PAQ_PRIM6', NULL, NULL, NULL, NULL, NULL),

    (null, 'Pago de Libros 1ro de Secundaria', NULL, 'PAQ_SECU1', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 2do de Secundaria', NULL, 'PAQ_SECU2', NULL, NULL, NULL, NULL, NULL),
    (null, 'Pago de Libros 3ro de Secundaria', NULL, 'PAQ_SECU3', NULL, NULL, NULL, NULL, NULL),

    -- PAGOS DE UNIFORMES	
    (null, 'Pago de Uniforme Escolar Básico M', NULL, NULL, 1, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme Escolar Básico F', NULL, NULL, 2, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme Deportivo M', NULL, NULL, 3, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme Deportivo F', NULL, NULL, 4, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme de Gala M', NULL, NULL, 5, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme de Gala F', NULL, NULL, 6, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme de Invierno M', NULL, NULL, 7, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme de Invierno F', NULL, NULL, 8, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme de Verano M', NULL, NULL, 9, NULL, NULL, NULL, NULL),
    (null, 'Pago de Uniforme de Verano F', NULL, NULL, 10, NULL, NULL, NULL, NULL),

    -- PAGOS DE EXAMEN
    (null, 'Pago de Examen Parcial', NULL, NULL, NULL, 'EXAM_PAR', NULL, NULL, NULL),
    (null, 'Pago de Examen Final', NULL, NULL, NULL, 'EXAM_FIN', NULL, NULL, NULL),
    (null, 'Pago de Examen Remedial', NULL, NULL, NULL, 'EXAM_REM', NULL, NULL, NULL),
    (null, 'Pago de Examen Diagnóstico', NULL, NULL, NULL, 'EXAM_DIAG', NULL, NULL, NULL),
    (null, 'Pago de Examen Oral', NULL, NULL, NULL, 'EXAM_EORAL', NULL, NULL, NULL),

    -- PAGOS DE MENSUALIDAD
    (null, 'Pago de Couta Escolar Básica', NULL, NULL, NULL, NULL, 'COUTBAS', NULL, NULL),
    (null, 'Pago de Alimentación Escolar', NULL, NULL, NULL, NULL, 'ALIMESC', NULL, NULL),
    (null, 'Pago de Material Didáctico', NULL, NULL, NULL, NULL, 'MATDIDA', NULL, NULL),
    (null, 'Pago de Seguro Escolar', NULL, NULL, NULL, NULL, 'SEGESC', NULL, NULL),
    (null, 'Pago de Actividades Extracurriculares', NULL, NULL, NULL, NULL, 'ACTEXT', NULL, NULL),
    (null, 'Pago de Transporte Escolar', NULL, NULL, NULL, NULL, 'TRANESC', NULL, NULL),
    (null, 'Pago de Couta de Tecnología', NULL, NULL, NULL, NULL, 'COUTTEC', NULL, NULL),
    (null, 'Pago de Couta de Mantenimiento', NULL, NULL, NULL, NULL, 'COUTMANT', NULL, NULL),
 
    -- PAGOS DE EVENTOS
    (null, 'Pago de la Reunión de Padres', NULL, NULL, NULL, NULL, NULL, 1, NULL),
    (null, 'Pago de la Feria de Ciencias', NULL, NULL, NULL, NULL, NULL, 2, NULL),
    (null, 'Pago del Día del Deporte', NULL, NULL, NULL, NULL, NULL, 3, NULL),
    (null, 'Pago del Concierto de Navidad', NULL, NULL, NULL, NULL, NULL, 4, NULL),
    (null, 'Pago del Carnaval Escolar', NULL, NULL, NULL, NULL, NULL, 5, NULL),
    (null, 'Pago del Día de la Madre', NULL, NULL, NULL, NULL, NULL, 6, NULL),
    (null, 'Pago del Día del Libro', NULL, NULL, NULL, NULL, NULL, 7, NULL),
    (null, 'Pago de la Fiesta de Fin de Año', NULL, NULL, NULL, NULL, NULL, 8, NULL),
    (null, 'Pago de la Competencia Deportiva', NULL, NULL, NULL, NULL, NULL, 9, NULL),
    (null, 'Pago de la Visita Cultural', NULL, NULL, NULL, NULL, NULL, 10, NULL),
    (null, 'Pago del Concurso de Talento', NULL, NULL, NULL, NULL, NULL, 11, NULL),
    (null, 'Pago del Día del Estudiante', NULL, NULL, NULL, NULL, NULL, 12, NULL),

    -- PAGOS DE MATERIAL
    (null, 'Pago de Libros Básicos', NULL, NULL, NULL, NULL, NULL, NULL, 'LIBBAS'),
    (null, 'Pago de Material de Arte', NULL, NULL, NULL, NULL, NULL, NULL, 'MATART'),
    (null, 'Pago de Paquete de Laboratorio', NULL, NULL, NULL, NULL, NULL, NULL, 'PAQLAB'),
    (null, 'Pago de Paquete de Deportes', NULL, NULL, NULL, NULL, NULL, NULL, 'PAQDEP'),
    (null, 'Pago de Paquete de Material Escolar', NULL, NULL, NULL, NULL, NULL, NULL, 'PAQMAT'),
    (null, 'Pago de Paquete de Arte Avanzado', NULL, NULL, NULL, NULL, NULL, NULL, 'PAQADVART'),
    (null, 'Pago de Paquete de Ciencias Experimentales', NULL, NULL, NULL, NULL, NULL, NULL, 'PAQCIEN'),
    (null, 'Pago de Paquete de Inicio para Nuevos Estudiantes', NULL, NULL, NULL, NULL, NULL, NULL, 'PAQINI'),
    (null, 'Pago de Material de Computación', NULL, NULL, NULL, NULL, NULL, NULL, 'MATCOM'),
    (null, 'Pago de Paquete de Verano Recreativo', NULL, NULL, NULL, NULL, NULL, NULL, 'PAQVER'),
    (null, 'Pago de Libros de Literatura Infantil', NULL, NULL, NULL, NULL, NULL, NULL, 'LIBLIT');


-- Tabla detalle_pago
INSERT INTO detalle_Pago (tipo_de_pago, pago) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (5, 6),
    (5, 7),
    (6, 8),
    (5, 9),
    (5, 10),
    (12, 11),
    (12, 12),
    (12, 13),
    (12, 14),
    (12, 15);
    alter table 