CREATE database Billing_System

CREATE TABLE alumno (
    matricula VARCHAR(10) PRIMARY KEY,
    nombre_de_pila VARCHAR(15) NOT NULL,
    primerApellido VARCHAR(15) NOT NULL,
    segApellido VARCHAR(15),
    edad INT NOT NULL,
    fechaNac DATE NOT NULL
);
-- Tabla Periodo
CREATE TABLE periodo (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    añoInicio date NOT NULL,
    añoFin date NOT NULL
);

-- Tabla Paquete de Material
CREATE TABLE paquete_de_material (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL,
    precio float NOT NULL
);

-- Tabla Evento
CREATE TABLE evento (
    numero int PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(15) NOT NULL,
    fecha DATE NOT NULL
);

-- Tabla Nivel Educativo
CREATE TABLE nivel_educativo (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL
);

-- Tabla Tipo de Mensualidad
CREATE TABLE tipo_de_mensualidad (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL
);

-- Tabla Genero
CREATE TABLE genero (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL
);

-- Tabla Talla
CREATE TABLE talla (
    codigo VARCHAR(10) PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

-- Tabla Tipo de Uniforme
CREATE TABLE tipo_de_uniforme (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    precio float NOT NULL,
    descripcion VARCHAR(50) NOT NULL
);

-- Tabla Tipo de Examen
CREATE TABLE tipo_de_examen (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL
);

-- Tabla Pago
CREATE TABLE pago (
    numero int PRIMARY KEY AUTO_INCREMENT,
    fechaPago DATE NOT NULL,
    monto float,
    nivel_educativo VARCHAR(10) NOT NULL,
    periodo INT NOT NULL,
    alumno VARCHAR(10) NOT NULL,
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo),
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    FOREIGN KEY (alumno) REFERENCES alumno(matricula)
);

-- Tabla Grupo
CREATE TABLE grupo (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(5) NOT NULL,
    periodo INT NOT NULL,
    nivel_educativo VARCHAR(10) NOT NULL,
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo)
);

-- Tabla Grupo_Alumno
CREATE TABLE grupo_alumno (
    alumno VARCHAR(10),
    grupo INT,
    PRIMARY key (alumno, grupo),
    FOREIGN KEY (alumno) REFERENCES alumno(matricula),
    FOREIGN KEY (grupo) REFERENCES grupo(numero)
);

-- Tabla Grado
CREATE TABLE grado (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(10) NOT NULL,
    nivel_educativo VARCHAR(10) NOT NULL,
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo)
);

-- Tabla Inscripcion
CREATE TABLE inscripcion (
    codigo VARCHAR(10) PRIMARY KEY,
    precio float NOT NULL,
    grado INT,
    FOREIGN KEY (grado) REFERENCES grado(numero)
);

-- Tabla Paquete de Libros
CREATE TABLE paquete_de_libros (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    precio float NOT NULL,
    grado INT NOT NULL,
    FOREIGN KEY (grado) REFERENCES grado(numero)
);

-- Tabla Examen
CREATE TABLE examen (
    codigo VARCHAR(10) PRIMARY KEY,
    precio float NOT NULL,
    tipo_de_examen VARCHAR(10) NOT NULL,
    FOREIGN KEY (tipo_de_examen) REFERENCES tipo_de_examen(codigo)
);

-- Tabla Mensualidad
CREATE TABLE mensualidad (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    precio float NOT NULL,
    tipo_de_mensualidad VARCHAR(10) NOT NULL,
    FOREIGN KEY (tipo_de_mensualidad) REFERENCES tipo_de_mensualidad(codigo)
);

-- Tabla Paquete de Uniforme
CREATE TABLE paquete_de_uniforme (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    precio float NOT NULL,
    genero VARCHAR(10) NOT NULL,
    FOREIGN KEY (genero) REFERENCES genero(codigo)
);

-- Tabla Detalle_Paquete (Tipo de Uniforme y Paquete de Uniforme)
CREATE TABLE detalle_Paquete (
    paquete_de_uniforme INT,
    tipo_de_uniforme int,
    PRIMARY key (paquete_de_uniforme, tipo_de_uniforme),
    FOREIGN KEY (paquete_de_uniforme) REFERENCES paquete_de_uniforme(numero),
    FOREIGN KEY (tipo_de_uniforme) REFERENCES tipo_de_uniforme(numero)
);

-- Tabla Tipo de Pago
CREATE TABLE tipo_de_pago (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    inscripcion VARCHAR(10),
    paquete_de_libros VARCHAR(10),
    paquete_de_uniforme INT,
    examen VARCHAR(10),
    mensualidad VARCHAR(10),
    evento int,
    paquete_de_material VARCHAR(10),
    FOREIGN KEY (inscripcion) REFERENCES inscripcion(codigo),
    FOREIGN KEY (paquete_de_libros) REFERENCES paquete_de_libros(codigo),
    FOREIGN KEY (paquete_de_uniforme) REFERENCES paquete_de_uniforme(numero),
    FOREIGN KEY (examen) REFERENCES examen(codigo),
    FOREIGN KEY (mensualidad) REFERENCES mensualidad(codigo),
    FOREIGN KEY (evento) REFERENCES evento(numero),
    FOREIGN KEY (paquete_de_material) REFERENCES paquete_de_material(codigo)
);
