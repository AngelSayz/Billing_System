/*1. Datos de un alumno en un periodo escolar
a. Periodo escolar
b. Fecha de inicio
c. Fecha final
d. Matricula del alumno
e. Nombre del alumno
f. Grado
g. Nivel
h. Nombre de los tutores
i. Dirección*/
SELECT pe.numero as Periodo_Escolar,
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final,
a.matricula as Matricula,
CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
gr.nombre as Grado,
ne.nombre as Nivel,
CONCAT(t.primerApellido, ' ', t.segApellido, ' ', t.nombrePila) as Tutor,
CONCAT(t.dirCalle, ' ', t.dirNumero, ' ', t.dirColonia) as Direccion,
FROM alumno as a
INNER JOIN tutor_alumno as ta on = ta.alumno = a.matricula
INNER JOIN tutor as t on = t.numero = ta.tutor
INNER JOIN pago as p on p.alumno = a.matricula 
INNER JOIN periodo as pe ON pe.numero = p.periodo
INNER JOIN grado_alumno as ga on ga.alumno = a.matricula
INNER JOIN grado as gr on gr.codigo = ga.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE pe.numero = ? and a.matricula = ?;

/*2. Grupos en los que ha estado un alumno
a. Matricula del alumno
b. Nombre del alumno
c. Fecha de inicio del periodo escolar
d. Fecha final del periodo escolar
e. Grado
f. Nivel*/
SELECT a.matricula as Matricula del Alumno,
CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
gr.nombre as Grado,
ne.nombre as Nivel,
g.nombre as Grupo
FROM alumno as a
INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula
INNER JOIN grupo as g on g.numero = ga.grupo
INNER JOIN periodo as pe on pe.numero = g.periodo
INNER JOIN grado_alumno as gra on gra.alumno = a.matricula 
INNER JOIN grado as gr on gr.codigo = gra.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE a.matricula = ?;

/*3. Números de teléfono de un tutor
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
WHERE t.nombrePila = ? and t.primerApellido = ? and t.segApellido = ?;

/*4. Inscripciones pagadas de un alumno
a. Matricula del alumno
b. Nombre del alumno
c. Fecha de inicio del periodo escolar
d. Fecha final del periodo escolar
e. Fecha de pago
f. Grado
g. Nivel*/
SELECT a.matricula as Matricula,
       CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
       DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
       DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
       DATE_FORMAT(p.fechaPago, "%d-%m-%y" ) as Fecha_de_Pago,
       gr.nombre as Grado,
       ne.nombre as Nivel
FROM alumno as a
INNER JOIN pago as p on p.alumno = a.matricula
INNER JOIN periodo as pe on pe.numero = p.periodo
INNER JOIN grado_alumno as ga on ga.alumno = a.matricula
INNER JOIN grado as gr on gr.codigo = ga.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
-- INNER JOIN tipo_de_pago as tp on tp.pago = p.referencia
WHERE p.tipo_de_pago = (SELECT tp.numero FROM tipo_de_pago as tp WHERE tp.descripcion = 'Inscripción') -- WHERE tp.inscripcion = not null
AND a.matricula = ?;

/*5. Mensualidades pagadas de un alumno en un periodo escolar
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
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
gr.nombre as Grado,
ne.nombre as Nivel,
EXTRACT(MONTH FROM pa.fechaPago) as Mes_Pagado,
DATE_FORMAT(p.fechaPago, "%d-%m-%y" ) as Fecha_de_Pago
FROM alumno as a
INNER JOIN pago as p on p.alumno = a.matricula
INNER JOIN periodo as pe on pe.numero = p.periodo
INNER JOIN grado_alumno as ga on ga.alumno = a.matricula
INNER JOIN grado as gr on gr.codigo = ga.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
-- INNER JOIN tipo_de_pago as tp on tp.pago = p.referencia
WHERE p.tipo_de_pago = (SELECT tp.numero FROM tipo_de_pago as tp WHERE tp.descripcion = 'Mensualidad') -- WHERE tp.mensualidad = not null
AND a.matricula = ? AND p.periodo = ?;

/*6. Pagos realizados por un evento especial
a. Nombre del evento
b. Fecha del evento
c. Costo del evento
d. Fecha del pago
e. Matricula del alumno
f. Nombre del alumno
g. Grupo
h. Grado
i. Nivel*/
SELECT ev.nombre as Nombre_del_Evento,
DATE_FORMAT(ev.fecha, "%d-%m-%y" ) as Fecha_del_Evento, 
pa.monto as Costo_del_Evento,
DATE_FORMAT(p.fechaPago, "%d-%m-%y" ) as Fecha_de_Pago,
a.matricula as Matricula,
CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno,
g.nombre as Grupo,
gr.nombre as Grado,
ne.nombre as Nivel
FROM evento as ev
INNER JOIN pago as pa on pa.tipo_de_pago = (SELECT tp.numero FROM tipo_de_pago as tp WHERE tp.descripcion = 'Evento') AND pa.referencia = ev.codigo
INNER JOIN alumno as a on a.matricula = pa.alumno
INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula
INNER JOIN grupo as g on g.numero = ga.grupo
INNER JOIN grado_alumno as gra on gra.alumno = a.matricula
INNER JOIN grado as gr on gr.codigo = gra.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE ev.nombre = ?;

/*7. Costos del mantenimiento por periodo escolar
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Concepto del mantenimiento
d. Costo*/
SELECT 
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
-- m.descripcion as Concepto_del_Mantenimiento,
SUM(pa.monto) as Costo
FROM pago as pa
INNER JOIN periodo as pe on pe.numero = pa.periodo
-- INNER JOIN tipo_de_pago as tp on tp.pago = pa.referencia
-- INNER JOIN mantenimiento as m on m.codigo = tp.mantenimiento
WHERE pa.tipo_de_pago = (SELECT tp.numero FROM tipo_de_pago as tp WHERE tp.descripcion = 'Mantenimiento')
AND pe.numero = ?
GROUP BY pe.añoInicio, pe.añoFin;

/*8. Lista de precios de los paquetes de útiles escolares (papelería) para un
periodo y nivel escolar.
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Nivel escolar
d. Grado
e. Descripción del paquete de útiles
f. Costo*/
SELECT 
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
ne.nombre as Nivel_Escolar,
gr.nombre as Grado,
pm.nombre as Descripción_del_Paquete_de_Útiles,
pm.precio as Costo
FROM nivel_educativo as ne
INNER JOIN grado as gr on gr.nivel_educativo = ne.codigo
INNER JOIN pago as pa on pa.nivel_educativo = ne.codigo
INNER JOIN periodo as pe on pe.numero = p.periodo
INNER JOIN tipo_de_pago as tp on tp.pago = pa.referencia
INNER JOIN paquete_de_material as pm on tp.paquete_de_material = pm.codigo
WHERE pe.numero = ?; and gr.codigo=?;

/*9. Lista de precios de los uniformes para un periodo y nivel escolar.
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Nivel escolar
d. Grado
e. Descripción del uniforme
f. Tipo de uniforme
g. Costo del uniforme*/
SELECT 
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
ne.nombre as Nivel_Escolar,
gr.nombre as Grado,
pu.descripcion as Descripción_del_Uniforme,
tu.descripcion as Tipo_de_Uniforme,
tu.precio as Costo_del_Uniforme
FROM periodo as pe
INNER JOIN tipo_de_uniforme as tu on tu.numero = pu.tipoUniforme
INNER JOIN nivel_educativo as ne on ne.codigo = pe.nivel_educativo
INNER JOIN grado as gr on gr.nivel_educativo = ne.codigo
INNER JOIN pago as pa on pa.nivel_educativo = ne.codigo
INNER JOIN tipo_de_pago as tp on tp.pago = pa.referencia
INNER JOIN paquete_de_uniforme as pu on tp.paquete_de_uniforme = pu.numero

/*10.Total de pagos realizados para un nivel educativo en un periodo escolar
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Nivel escolar
d. Total de pagos*/
SELECT 
DATE_FORMAT(pe.añoInicio, "%d-%m-%y" ) as Fecha_de_Inicio_del_Periodo_Escolar,
DATE_FORMAT(pe.añoFin, "%d-%m-%y" ) as Fecha_Final_del_Periodo_Escolar,
ne.nombre as Nivel_Escolar,
SUM(pa.monto) as Total_de_Pagos
FROM pago as pa
INNER JOIN periodo as pe on pe.numero = pa.periodo
INNER JOIN alumno as a on a.matricula = pa.alumno
INNER JOIN grado_alumno as ga on ga.alumno = a.matricula
INNER JOIN grado as gr on gr.codigo = ga.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE ne.codigo = ? and pa.periodo = ?
GROUP BY pe.añoInicio, pe.añoFin, ne.nombre;