-- Crear la base de datos
CREATE DATABASE Billing_System;

USE Billing_System;


CREATE TABLE alumno (
    matricula VARCHAR(6) PRIMARY KEY,
    nombre_de_pila VARCHAR(15) NOT NULL,
    primerApellido VARCHAR(15) NOT NULL,
    segApellido VARCHAR(15),
    edad INT NOT NULL,
    fechaNac DATE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    category varchar(5) not null
);

CREATE TABLE periodo (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    añoInicio DATE NOT NULL,
    añoFin DATE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE paquete_de_material (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL,
    precio FLOAT NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE evento (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(15) NOT NULL,
    fecha DATE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE nivel_educativo (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tipo_de_mensualidad (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE genero (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE talla (
    codigo VARCHAR(10) PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tipo_de_uniforme (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    precio FLOAT NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tipo_de_examen (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pago (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    referencia varchar(10) unique,
    fechaPago DATE NOT NULL,
    monto FLOAT,
    nivel_educativo VARCHAR(10) NOT NULL,
    periodo INT NOT NULL,
    alumno VARCHAR(10) NOT NULL,
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo),
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    FOREIGN KEY (alumno) REFERENCES alumno(matricula),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grupo (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(5) NOT NULL,
    periodo INT NOT NULL,
    nivel_educativo VARCHAR(10) NOT NULL,
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grupo_alumno (
    alumno VARCHAR(10),
    grupo INT,
    PRIMARY KEY (alumno, grupo),
    FOREIGN KEY (alumno) REFERENCES alumno(matricula),
    FOREIGN KEY (grupo) REFERENCES grupo(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grado (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(10) NOT NULL,
    nivel_educativo VARCHAR(10) NOT NULL,
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inscripcion (
    codigo VARCHAR(10) PRIMARY KEY,
    precio FLOAT NOT NULL,
    grado INT,
    FOREIGN KEY (grado) REFERENCES grado(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE paquete_de_libros (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    precio FLOAT NOT NULL,
    grado INT NOT NULL,
    FOREIGN KEY (grado) REFERENCES grado(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE examen (
    codigo VARCHAR(10) PRIMARY KEY,
    precio FLOAT NOT NULL,
    tipo_de_examen VARCHAR(10) NOT NULL,
    FOREIGN KEY (tipo_de_examen) REFERENCES tipo_de_examen(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mensualidad (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    precio FLOAT NOT NULL,
    tipo_de_mensualidad VARCHAR(10) NOT NULL,
    FOREIGN KEY (tipo_de_mensualidad) REFERENCES tipo_de_mensualidad(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE paquete_de_uniforme (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    precio FLOAT NOT NULL,
    genero VARCHAR(10) NOT NULL,
    FOREIGN KEY (genero) REFERENCES genero(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE detalle_Paquete (
    paquete_de_uniforme INT,
    tipo_de_uniforme INT,
    PRIMARY KEY (paquete_de_uniforme, tipo_de_uniforme),
    FOREIGN KEY (paquete_de_uniforme) REFERENCES paquete_de_uniforme(numero),
    FOREIGN KEY (tipo_de_uniforme) REFERENCES tipo_de_uniforme(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tipo_de_pago (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    inscripcion VARCHAR(10),
    paquete_de_libros VARCHAR(10),
    paquete_de_uniforme INT,
    examen VARCHAR(10),
    mensualidad VARCHAR(10),
    evento INT,
    paquete_de_material VARCHAR(10),
    FOREIGN KEY (inscripcion) REFERENCES inscripcion(codigo),
    FOREIGN KEY (paquete_de_libros) REFERENCES paquete_de_libros(codigo),
    FOREIGN KEY (paquete_de_uniforme) REFERENCES paquete_de_uniforme(numero),
    FOREIGN KEY (examen) REFERENCES examen(codigo),
    FOREIGN KEY (mensualidad) REFERENCES mensualidad(codigo),
    FOREIGN KEY (evento) REFERENCES evento(numero),
    FOREIGN KEY (paquete_de_material) REFERENCES paquete_de_material(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE alumno
ADD category varchar(5) not null;