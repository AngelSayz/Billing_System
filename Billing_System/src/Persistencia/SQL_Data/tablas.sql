-- Crear la base de datos
CREATE DATABASE Billing_System;

USE Billing_System;


CREATE TABLE alumno (
    matricula VARCHAR(6) PRIMARY KEY NOT NULL,
    nombrePila VARCHAR(15) NOT NULL,
    primerApellido VARCHAR(15) NOT NULL,
    segApellido VARCHAR(15),
    edad INT NOT NULL,
    fechaNac DATE NOT NULL,
    dirCalle VARCHAR(30) NOT NULL,
    dirNumero VARCHAR(10) NOT NULL,
    dirColonia VARCHAR(30) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    category VARCHAR(5) NOT NULL,
    password VARCHAR(30) NOT NULL
);
CREATE TABLE mantenimiento (
    codigo VARCHAR(10) PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE tipo_de_mensualidad (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE periodo (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(15) NOT NULL,
    añoInicio DATE NOT NULL,
    añoFin DATE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE evento (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE nivel_educativo (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE grado (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nivel_educativo VARCHAR(10) NOT NULL,
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE paquete_de_material (
    codigo VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    grado INT,
    tipo VARCHAR(20),
    FOREIGN KEY (grado) REFERENCES grado(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE genero (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tipo_de_uniforme (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    nivel_educativo VARCHAR(10),
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tipo_de_examen (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pago (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    referencia VARCHAR(10) NOT NULL,
    fechaPago DATE NOT NULL,
    monto DECIMAL(10,2),
    nivel_educativo VARCHAR(10) NOT NULL,
    periodo INT NOT NULL,
    alumno VARCHAR(6) NOT NULL,
    estado VARCHAR(10) NOT NULL,
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo),
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    FOREIGN KEY (alumno) REFERENCES alumno(matricula),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE grupo (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(15) NOT NULL,
    periodo INT NOT NULL,
    nivel_educativo VARCHAR(10) NOT NULL,
    grado INT NOT NULL,
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    FOREIGN KEY (nivel_educativo) REFERENCES nivel_educativo(codigo),
    FOREIGN KEY (grado) REFERENCES grado(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grupo_alumno (
    alumno VARCHAR(6),
    grupo INT,
    PRIMARY KEY (alumno, grupo),
    FOREIGN KEY (alumno) REFERENCES alumno(matricula),
    FOREIGN KEY (grupo) REFERENCES grupo(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE inscripcion (
    codigo VARCHAR(15) PRIMARY KEY,
    precio DECIMAL(10,2) NOT NULL,
    grado INT,
    FOREIGN KEY (grado) REFERENCES grado(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE examen (
    codigo VARCHAR(10) PRIMARY KEY,
    precio DECIMAL(10,2) NOT NULL,
    tipo_de_examen VARCHAR(10) NOT NULL,
    FOREIGN KEY (tipo_de_examen) REFERENCES tipo_de_examen(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mensualidad (
    codigo VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    tipo_de_mensualidad VARCHAR(10) NOT NULL,
    FOREIGN KEY (tipo_de_mensualidad) REFERENCES tipo_de_mensualidad(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE paquete_de_uniforme (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    genero VARCHAR(10) NOT NULL,
    talla VARCHAR (10) NOT NULL,
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
    pago INT,
    inscripcion VARCHAR(15),
    paquete_de_uniforme INT,
    examen VARCHAR(10),
    mensualidad VARCHAR(10),
    evento INT,
    paquete_de_material VARCHAR(10),
    mantenimiento VARCHAR(10),
    FOREIGN KEY (pago) REFERENCES pago(numero),
    FOREIGN KEY (inscripcion) REFERENCES inscripcion(codigo),
    FOREIGN KEY (paquete_de_uniforme) REFERENCES paquete_de_uniforme(numero),
    FOREIGN KEY (examen) REFERENCES examen(codigo),
    FOREIGN KEY (mensualidad) REFERENCES mensualidad(codigo),
    FOREIGN KEY (evento) REFERENCES evento(numero),
    FOREIGN KEY (paquete_de_material) REFERENCES paquete_de_material(codigo),
    FOREIGN KEY (mantenimiento) REFERENCES mantenimiento(codigo),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grado_alumno (
    alumno VARCHAR(6),
    grado INT,
    PRIMARY KEY (alumno, grado),
    FOREIGN KEY (alumno) REFERENCES alumno(matricula),
    FOREIGN KEY (grado) REFERENCES grado(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tutor (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    nombrePila VARCHAR(15) NOT NULL,
    primerApellido VARCHAR(15) NOT NULL,
    segApellido VARCHAR(15),
    numTel VARCHAR(15) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tutor_alumno (
    alumno VARCHAR(6),
    tutor INT,
    PRIMARY KEY (alumno, tutor),
    FOREIGN KEY (alumno) REFERENCES alumno(matricula),
    FOREIGN KEY (tutor) REFERENCES tutor(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE man_ped (
    mantenimiento VARCHAR(10),
    periodo INT,
    PRIMARY KEY (mantenimiento, periodo),
    FOREIGN KEY (mantenimiento) REFERENCES mantenimiento(codigo),
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE paq_periodo (
    paquete_de_material VARCHAR(20),
    periodo INT,
    PRIMARY KEY (paquete_de_material, periodo),
    FOREIGN KEY (paquete_de_material) REFERENCES paquete_de_material(codigo),
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE uni_periodo (
    tipo_de_uniforme INT,
    periodo INT,
    PRIMARY KEY (tipo_de_uniforme, periodo),
    FOREIGN KEY (tipo_de_uniforme) REFERENCES tipo_de_uniforme(numero),
    FOREIGN KEY (periodo) REFERENCES periodo(numero),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


