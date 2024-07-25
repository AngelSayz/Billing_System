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
SELECT pe.numero as Periodo Escolar,
pe.añoInicio as Fecha de Inicio,
pe.añoFin as Fecha Final,
a.matricula as Matricula del Alumno,
CONCAT(a.primerApellido, ' ', a.segundoApellido, ' ', a.nombredepila) as Alumno,
gr.nombre as Grado,
ne.nombre as Nivel,
CONCAT(a.pApellTutor, ' ', a.sApellTutor, ' ', a.nombPilaTutor) as Tutor,
CONCAT(a.dirCalle, ' ', a.dirNum, ' ', a.dirColonia) as Direccion,
FROM alumno as a
INNER JOIN pago as p on p.alumno = a.matricula
INNER JOIN periodo as pe ON pe.numero = p.periodo
INNER JOIN grado_alumno as ga on ga.alumno = al.matricula
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
CONCAT(a.primerApellido, ' ', a.segundoApellido, ' ', a.nombredepila) as Alumno,
pe.añoInicio AS Fecha de Inicio del Periodo Escolar,
pe.añoFin as Fecha Final del Periodo Escolar,
gr.nombre as Grado,
ne.nombre as Nivel,
g.nombre as Grupo
FROM alumno as a
INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula
INNER JOIN grupo as g on g.numero = ga.grupo
INNER JOIN periodo as pe on pe.numero = g.periodo
INNER JOIN grado as gr on gr.codigo = g.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE a.matricula = ?;

/*3. Números de teléfono de un tutor
a. Nombre del tutor
b. Nombre del alumno
c. Número de teléfono*/
SELECT 
CONCAT(a.pApellTutor, ' ', a.sApellTutor, ' ', a.nombPilaTutor) as Tutor,
CONCAT(a.primerApellido, ' ', a.segundoApellido, ' ', a.nombredepila) as Alumno,
a.telTutor as Número de Teléfono
FROM alumno as a
WHERE a.nombPilaTutor = ? and a.pApellTutor = ? and a.sApellTutor = ?;

/*4. Inscripciones pagadas de un alumno
a. Matricula del alumno
b. Nombre del alumno
c. Fecha de inicio del periodo escolar
d. Fecha final del periodo escolar
e. Fecha de pago
f. Grado
g. Nivel*/
SELECT a.matricula as Matricula del Alumno,
CONCAT(a.primerApellido, ' ', a.segundoApellido, ' ', a.nombredepila) as Alumno,
pe.añoInicio as Fecha de Inicio del Periodo Escolar,
pe.añoFin as Fecha Final del Periodo Escolar,
p.fechaPago as Fecha de Pago,
gr.nombre as Grado,
ne.nombre as Nivel
FROM alumno as a
INNER JOIN pago as p on p.alumno = a.matricula
INNER JOIN periodo as pe on pe.numero = p.periodo
INNER JOIN grado_alumno as ga on ga.alumno = a.matricula
INNER JOIN grado as gr on gr.codigo = ga.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE p.tipo_de_pago = (SELECT tp.numero FROM tipo_de_pago as tp WHERE tp.descripcion = 'Inscripción')
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
SELECT a.matricula as Matricula del Alumno,
CONCAT(a.primerApellido, ' ', a.segundoApellido, ' ', a.nombredepila) as Alumno,
pe.añoInicio as Fecha de Inicio del Periodo Escolar,
pe.añoFin as Fecha Final del Periodo Escolar,
gr.nombre as "Grado",
ne.nombre as "Nivel",
EXTRACT(MONTH FROM pa.fechaPago) as Mes Pagado,
pa.fechaPago as Fecha de Pago
FROM alumno as a
INNER JOIN pago as p on p.alumno = a.matricula
INNER JOIN periodo as pe on pe.numero = p.periodo
INNER JOIN grado_alumno as ga on ga.alumno = a.matricula
INNER JOIN grado as gr on gr.codigo = ga.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE p.tipo_de_pago = (SELECT tp.numero FROM tipo_de_pago as tp WHERE tp.descripcion = 'Mensualidad')
    and a.matricula = ?
    and p.periodo = ?;

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
SELECT ev.nombre as Nombre del Evento,
ev.fecha as Fecha del Evento,
pa.monto as Costo del Evento,
pa.fechaPago as Fecha de Pago,
a.matricula as Matricula del Alumno,
CONCAT(a.primerApellido, ' ', a.segundoApellido, ' ', a.nombredepila) as Alumno,
g.nombre as Grupo,
gr.nombre as Grado,
ne.nombre as Nivel
FROM evento as ev
INNER JOIN pago as pa on pa.evento = ev.codigo
INNER JOIN alumno as a on a.matricula = pa.alumno
INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula
INNER JOIN grupo as g on g.numero = ga.grupo
INNER JOIN grado as gr on gr.codigo = g.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE ev.nombre = ?;

/*7. Costos del mantenimiento por periodo escolar
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Concepto del mantenimiento
d. Costo*/
SELECT pe.añoInicio as Fecha de Inicio del Periodo Escolar,
pe.añoFin as Fecha Final del Periodo Escolar,
'Mantenimiento' as Concepto del Mantenimiento,
SUM(pa.monto) as Costo
FROM pago as pa
INNER JOIN periodo as pe on pe.numero = pa.periodo
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
SELECT pe.añoInicio as Fecha de Inicio del Periodo Escolar,
pe.añoFin as Fecha Final del Periodo Escolar,
ne.nombre as Nivel Escolar,
gr.nombre as Grado,
pm.nombre as Descripción del Paquete de Útiles,
pm.precio as Costo
FROM paquete_de_material as pm
INNER JOIN grado as gr on gr.codigo = pm.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
INNER JOIN periodo as pe on pe.numero = ?;

/*9. Lista de precios de los uniformes para un para un periodo y nivel escolar.
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Nivel escolar
d. Grado
e. Descripción del uniforme
f. Tipo de uniforme
g. Costo del uniforme*/
SELECT pe.añoInicio as Fecha de Inicio del Periodo Escolar,
pe.añoFin as Fecha Final del Periodo Escolar,
ne.nombre as Nivel Escolar,
gr.nombre as Grado,
pu.descripcion as Descripción del Uniforme,
tu.descripcion as Tipo de Uniforme,
*tu.precio as Costo del Uniforme
FROM paquete_de_uniforme as pu
INNER JOIN tipo_de_uniforme as tu on tu.numero = pu.tipoUniforme
INNER JOIN grado as gr on gr.codigo = pu.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
INNER JOIN periodo as pe on pe.numero = ?;

/*10.Total de pagos realizados para un nivel educativo en un periodo escolar
a. Fecha de inicio del periodo escolar
b. Fecha final del periodo escolar
c. Nivel escolar
d. Total de pagos*/
SELECT pe.añoInicio as Fecha de Inicio del Periodo Escolar,
pe.añoFin as Fecha Final del Periodo Escolar,
ne.nombre as Nivel Escolar,
SUM(pa.monto) as Total de Pagos
FROM pago as pa
INNER JOIN periodo as pe on pe.numero = pa.periodo
INNER JOIN alumno as a on a.matricula = pa.alumno
INNER JOIN grado_alumno as ga on ga.alumno = a.matricula
INNER JOIN grado as gr on gr.codigo = ga.grado
INNER JOIN nivel_educativo as ne on ne.codigo = gr.nivel_educativo
WHERE ne.codigo = ?
and pa.periodo = ?
GROUP BY pe.añoInicio, pe.añoFin, ne.nombre;