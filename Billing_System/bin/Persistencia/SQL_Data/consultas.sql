/*1. Datos de un alumno en un periodo escolar IMPLEMENTADO
a. Periodo escolar
b. Fecha de inicio
c. Fecha final
d. Matricula del alumno
e. Nombre del alumno
f. Grado
g. Nivel
h. Nombre de los tutores
i. Dirección*/
SELECT pe.nombre as Periodo_Escolar,
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final,
a.matricula as Matricula,
CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, 
gr.nombre as Grado,
CONCAT(t.primerApellido, ' ', t.segApellido, ' ', t.nombrePila) as Tutor,
CONCAT(a.dirCalle, ' ', a.dirNumero, ' ', a.dirColonia) as Direccion
FROM alumno as a
INNER JOIN tutor_alumno as ta on ta.alumno = a.matricula
INNER JOIN tutor as t on t.numero = ta.tutor
inner join grupo_alumno as gra on gra.alumno = a.matricula
inner join grupo as g on g.numero = gra.grupo
INNER JOIN periodo as pe ON pe.numero = g.periodo
INNER JOIN grado as gr on gr.numero = g.grado
INNER JOIN nivel_educativo as ne on ne.codigo = g.nivel_educativo
WHERE a.matricula = '000001' and periodo = 1;

/*2. Grupos en los que ha estado un alumno  IMPLEMENTADO
a. Matricula del alumno
b. Nombre del alumno
c. Fecha de inicio del periodo escolar
d. Fecha final del periodo escolar
e. Grado
f. Nivel*/
SELECT a.matricula as Matricula,
CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Final_del_Periodo_Escolar,
gr.nombre as Grado,
g.nombre as Grupo 
FROM alumno as a
INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula
INNER JOIN grupo as g on g.numero = ga.grupo
INNER JOIN periodo as pe on pe.numero = g.periodo
INNER JOIN grado as gr on gr.numero = g.grado
where a.matricula = '000001' 
ORDER BY a.matricula;

/*3. Números de teléfono de un tutor    IMPLEMENTADO
a. Nombre del tutor
b. Nombre del alumno
c. Número de teléfono*/ 
SELECT 
CONCAT(t.primerApellido, ' ', t.segApellido, ' ', t.nombrePila) as Tutor,
CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
t.numTel as Número_de_Teléfono 
FROM tutor as t
INNER JOIN tutor_alumno as ta on t.numero = ta.tutor
INNER JOIN alumno as a on a.matricula = ta.alumno
WHERE a.matricula='000001' 
ORDER BY a.matricula;

/*4. Inscripciones pagadas de un alumno IMPLEMENTADO
a. Matricula del alumno
b. Nombre del alumno
c. Fecha de inicio del periodo escolar
d. Fecha final del periodo escolar
e. Fecha de pago
f. Grado
g. Nivel*/ 
SELECT a.matricula as Matricula,
CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
DATE_FORMAT(pe.añoInicio, "%d/%m/%y" ) as Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d/%m/%y" ) as Final_del_Periodo_Escolar,
pe.nombre as Periodo,
g.nombre as Grupo,
g.nivel_educativo as Nivel_Educativo,
gr.nombre as Grado,
DATE_FORMAT(p.fechaPago, '%d/%m/%Y') AS Fecha_del_Pago,
tp.descripcion as Pago
FROM alumno as a
INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula
INNER JOIN grupo as g on g.numero = ga.grupo
INNER JOIN periodo as pe on pe.numero = g.periodo
inner join grado as gr on g.grado = gr.numero
inner join pago as p on p.periodo = pe.numero
inner join tipo_de_pago as tp on tp.pago = p.numero
where a.matricula = '000001' and tp.inscripcion is not null and p.alumno = '000001'
ORDER BY a.matricula;


/*5. Mensualidades pagadas de un alumno en un periodo escolar NO IMPLEMENTADO
a. Matricula del alumno
b. Nombre del alumno
c. Fecha de inicio del periodo escolar
d. Fecha final del periodo escolar
e. Grado
f. Nivel
g. Mes pagado
h. Fecha de pago*/
SELECT a.matricula as Matricula,
CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Final_del_Periodo_Escolar,
pe.nombre as Periodo,
g.nombre as Grupo,
g.nivel_educativo as Nivel_Educativo,
gr.nombre as Grado,
DATE_FORMAT(p.fechaPago, '%d/%m/%Y') AS Fecha_del_Pago,
tp.descripcion as Pago
FROM alumno as a
INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula
INNER JOIN grupo as g on g.numero = ga.grupo
INNER JOIN periodo as pe on pe.numero = g.periodo
inner join grado as gr on g.grado = gr.numero
inner join pago as p on p.periodo = pe.numero
inner join tipo_de_pago as tp on tp.pago = p.numero
where a.matricula = '000001' and tp.mensualidad is not null and p.alumno = '000001' and pe.numero = 1
ORDER BY a.matricula;

/*6. Pagos realizados por un evento especial   IMPLEMENTADO
a. Nombre del evento
b. Fecha del evento
c. Costo del evento
d. Fecha del pago
e. Matricula del alumno
f. Nombre del alumno
g. Grupo
h. Grado
i. Nivel*/
SELECT DISTINCT
    ev.nombre AS Evento,
    DATE_FORMAT(ev.fecha, '%d/%m/%Y') AS Fecha,
    ev.costo AS Costo,
    a.matricula AS Matricula,
    CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) AS Alumno,
    g.nombre AS Grupo,
    g.nivel_educativo AS Nivel_Educativo,
    gr.nombre AS Grado,
    DATE_FORMAT(p.fechaPago, '%d/%m/%Y') AS Fecha_del_Pago
FROM 
    alumno AS a
INNER JOIN 
    grupo_alumno AS ga ON ga.alumno = a.matricula
INNER JOIN 
    grupo AS g ON g.numero = ga.grupo
INNER JOIN 
    periodo AS pe ON pe.numero = g.periodo
INNER JOIN 
    grado AS gr ON g.grado = gr.numero
INNER JOIN 
    pago AS p ON p.periodo = pe.numero
INNER JOIN 
    tipo_de_pago AS tp ON tp.pago = p.numero
INNER JOIN 
    evento AS ev ON ev.numero = tp.evento
WHERE 
    tp.evento IS NOT NULL 
    AND p.estado = 'confirmado' 
    AND ev.numero = 1
    AND g.nivel_educativo = 'KIND'
    AND p.periodo = 1;


/*7. Costos del mantenimiento por periodo escolar IMPLEMENTADO
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Concepto del mantenimiento
d. Costo*/
SELECT
    DATE_FORMAT(p.añoInicio, '%d/%m/%Y') AS Fecha_de_inicio_del_periodo_escolar,
    DATE_FORMAT(p.añoFin, '%d/%m/%Y') AS Fecha_final_del_periodo_escolar,
    m.descripcion AS Concepto_del_mantenimiento,
    m.precio AS Costo,
    NULL AS Total_del_periodo
FROM
    mantenimiento AS m
    INNER JOIN man_ped AS mp ON mp.mantenimiento = m.codigo
    INNER JOIN periodo AS p ON mp.periodo = p.numero
WHERE
    p.numero = 3

UNION ALL

SELECT
    NULL AS Fecha_de_inicio_del_periodo_escolar,
    NULL AS Fecha_final_del_periodo_escolar,
    'Total' AS Concepto_del_mantenimiento,
    NULL AS Costo,
    ROUND(SUM(m.precio), 2) AS Total_del_periodo
FROM
    mantenimiento AS m
    INNER JOIN man_ped AS mp ON mp.mantenimiento = m.codigo
    INNER JOIN periodo AS p ON mp.periodo = p.numero
WHERE
    p.numero = 3;



/*8. Lista de precios de los paquetes de útiles escolares (papelería) para un NO IMPLEMENTADO
periodo y nivel escolar.
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Nivel escolar
d. Grado
e. Descripción del paquete de útiles
f. Costo*/
SELECT DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
ne.nombre as Nivel,
pm.nombre as Descripcion,
pm.precio as Costo
FROM paquete_de_material as pm
inner join paq_periodo as pp on pp.paquete_de_material = pm.codigo
inner join periodo as pe on pe.numero = pp.periodo
inner join grado as g on pm.grado = g.numero
inner join nivel_educativo as ne on ne.codigo = g.nivel_educativo
where pe.numero = 4 and ne.codigo = 'SECU' and pm.tipo = 'papeleria';

/*9. Lista de precios de los uniformes para un periodo y nivel escolar. IMPLEMENTADO
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Nivel escolar
d. Grado
e. Descripción del uniforme
f. Tipo de uniforme
g. Costo del uniforme*/
SELECT DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
ne.nombre as Nivel,
g.nombre as Grado,
tu.descripcion as Descripcion,
tu.precio as Precio
FROM tipo_de_uniforme as tu
inner join uni_periodo as up on up.tipo_de_uniforme = tu.numero
inner join periodo as pe on pe.numero = up.periodo
inner join nivel_educativo as ne on ne.codigo = tu.nivel_educativo
inner join grado as g on g.nivel_educativo = ne.codigo
where pe.numero = 1 and ne.codigo = 'SECU';
/*10.Total de pagos realizados para un nivel educativo en un periodo escolar IMPLEMENTADO
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Nivel escolar
d. Total de pagos*/
SELECT 
    DATE_FORMAT(pe.añoInicio, "%d-%m-%y") AS Fecha_de_Inicio_del_Periodo_Escolar,
    DATE_FORMAT(pe.añoFin, "%d-%m-%y") AS Fecha_Final_del_Periodo_Escolar,
    ne.nombre AS Nivel_Escolar,
    COUNT(*) AS Total_de_Pagos
FROM pago AS pa
INNER JOIN periodo AS pe ON pe.numero = pa.periodo
INNER JOIN nivel_educativo AS ne ON ne.codigo = pa.nivel_educativo
WHERE pa.periodo = 3 AND pa.nivel_educativo = 'SECU' AND pa.estado = 'confirmado'
GROUP BY pe.añoInicio, pe.añoFin, ne.nombre;

/*Consultas usadas en la logica del proyecto:
Consultar un pago:*/

SELECT 
    CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
    a.matricula as Matricula,
    DATE_FORMAT(p.fechaPago, '%d-%m-%y') as Fecha_de_Pago,
    ROUND(p.monto, 2) as Monto,
    p.referencia as Referencia,
    CASE 
        WHEN tp.inscripcion IS NOT NULL THEN 'Inscripcion'
        WHEN tp.paquete_de_libros IS NOT NULL THEN 'Paquete de Libros'
        WHEN tp.paquete_de_uniforme IS NOT NULL THEN 'Paquete de Uniforme'
        WHEN tp.examen IS NOT NULL THEN 'Examen'
        WHEN tp.mensualidad IS NOT NULL THEN 'Mensualidad'
        WHEN tp.evento IS NOT NULL THEN 'Evento'
        WHEN tp.paquete_de_material IS NOT NULL THEN 'Paquete de Material'
        WHEN tp.mantenimiento IS NOT NULL THEN 'Mantenimiento'
        ELSE 'Desconocido'
    END as Tipo_de_Pago,
    tp.descripcion as Descripcion,
    p.estado as Estado
FROM Pago as p 
INNER JOIN tipo_de_pago as tp ON tp.pago = p.referencia
INNER JOIN alumno as a on p.alumno = a.matricula
WHERE a.matricula = '000001'
  AND (
        tp.inscripcion IS NOT NULL OR 
        tp.paquete_de_libros IS NOT NULL OR 
        tp.paquete_de_uniforme IS NOT NULL OR 
        tp.examen IS NOT NULL OR 
        tp.mensualidad IS NOT NULL OR 
        tp.evento IS NOT NULL OR 
        tp.paquete_de_material IS NOT NULL OR 
        tp.mantenimiento IS NOT NULL
  ) ORDER BY fechaPago;