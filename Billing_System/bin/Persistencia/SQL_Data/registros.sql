-- Tabla alumno
INSERT INTO alumno (matricula, nombrePila, primerApellido, segApellido, edad, fechaNac, nombreTutor, primerApellTutor, segApellTutor, dirCalle, dirNumero, dirColonia, numTel, category) VALUES
    ('0', 'Admin', '-', '', 0, '2000-01-01', '-', '-', '', '-', '-', '-', '.', 'admin'),
    ('250817', 'Angel', 'Mayo','Ramos', '19', '2000-01-01', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'admin'),
    ('000001', 'Luis', 'García', 'Hernández', 5, '2019-03-10', 'María González', 'Hernández', 'Gutiérrez', 'Av. Benito Juárez', '123', 'Centro', '555-123-4567', 'user'),
    ('000002', 'Ana', 'Martínez', 'López', 4, '2020-06-15', 'Alejandro Pérez', 'Gómez', 'López', 'Calle 5 de Mayo', '456', 'Revolución', '555-234-5678', 'user'),
    ('000003', 'Diego', 'Rodríguez', 'Gómez', 5, '2019-02-28', 'Fernanda Sánchez', 'García', 'Martínez', 'Av. Constitución', '789', 'Independencia', '555-345-6789', 'user'),
    ('000004', 'María', 'López', 'Martínez', 4, '2020-04-22', 'Roberto Martínez', 'Sánchez', 'Flores', 'Calle Hidalgo', '234', 'Las Rosas', '555-456-7890', 'user'),
    ('000005', 'Javier', 'Hernández', 'Pérez', 5, '2019-08-03', 'Isabel Hernández', 'Martínez', 'Díaz', 'Av. Reforma', '567', 'San Miguel', '555-567-8901', 'user'),
    ('000006', 'Carlos', 'Gómez', 'García', 10, '2014-01-05', 'Laura Pérez', 'Fernández', 'Ramírez', 'Calle Morelos', '321', 'Centro', '555-678-9012', 'user'),
    ('000007', 'Laura', 'Díaz', 'Rodríguez', 9, '2015-05-12', 'Juan García', 'Hernández', 'Torres', 'Av. Revolución', '654', 'Revolución', '555-789-0123', 'user'),
    ('000008', 'Juan', 'Martínez', 'Sánchez', 11, '2013-11-20', 'Luz Martínez', 'Sánchez', 'Jiménez', 'Calle 20 de Noviembre', '987', 'Independencia', '555-890-1234', 'user'),
    ('000009', 'Sofía', 'Pérez', 'Gómez', 10, '2014-08-17', 'Pedro Rodríguez', 'López', 'Vázquez', 'Calle Zaragoza', '432', 'Las Rosas', '555-901-2345', 'user'),
    ('000010', 'Pedro', 'González', 'López', 9, '2015-02-28', 'Sofía Hernández', 'Gómez', 'Santos', 'Av. Juárez', '876', 'San Miguel', '555-012-3456', 'user'),
    ('000011', 'Ana', 'Hernández', 'González', 14, '2010-09-08', 'Carlos López', 'Martínez', 'Reyes', 'Calle Allende', '543', 'San Rafael', '555-234-5678', 'user'),
    ('000012', 'Diego', 'Martínez', 'Rodríguez', 13, '2011-12-15', 'María Ramírez', 'Flores', 'Núñez', 'Av. Guerrero', '789', 'La Paz', '555-345-6789', 'user'),
    ('000013', 'María', 'López', 'Sánchez', 15, '2009-08-22', 'Diego Torres', 'Gutiérrez', 'Ortega', 'Calle Madero', '234', 'San Antonio', '555-456-7890', 'user'),
    ('000014', 'Javier', 'Pérez', 'Martínez', 14, '2010-11-10', 'Luisa Díaz', 'Castillo', 'García', 'Av. Hidalgo', '567', 'Del Valle', '555-567-8901', 'user'),
    ('000015', 'Laura', 'García', 'Gómez', 13, '2012-04-30', 'Javier Cruz', 'Herrera', 'Pineda', 'Calle Colón', '890', 'Las Águilas', '555-678-9012', 'user');

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

-- Tabla talla_uniforme
INSERT INTO talla_Uniforme (tipo_de_uniforme, talla) VALUES  
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

-- Tabla detalle_pago

    alter table 

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