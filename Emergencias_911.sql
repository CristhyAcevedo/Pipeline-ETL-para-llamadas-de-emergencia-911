-- Creación de la base de datos
CREATE DATABASE Emergencias_911;
GO

USE Emergencias_911;
GO

-- Tabla: Tipos de Emergencias
CREATE TABLE Tipos_Emergencias (
    tipo_emergencia_id INT IDENTITY(1,1) PRIMARY KEY,
    categoria VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla: Ubicaciones
CREATE TABLE Ubicaciones (
    ubicacion_id INT IDENTITY(1,1) PRIMARY KEY,
    ciudad VARCHAR(100),
    estado VARCHAR(100),
    codigo_postal VARCHAR(10)
);

-- Tabla: Fuentes de Datos
CREATE TABLE Fuentes_Datos (
    fuente_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_fuente VARCHAR(100),
    tipo_fuente VARCHAR(50)
);

-- Tabla: Llamadas de Emergencia
CREATE TABLE Llamadas_Emergencia (
    llamada_id INT IDENTITY(1,1) PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    tipo_emergencia_id INT,
    ubicacion_id INT,
    fuente_id INT,
    FOREIGN KEY (tipo_emergencia_id) REFERENCES Tipos_Emergencias(tipo_emergencia_id),
    FOREIGN KEY (ubicacion_id) REFERENCES Ubicaciones(ubicacion_id),
    FOREIGN KEY (fuente_id) REFERENCES Fuentes_Datos(fuente_id)
);

-- Tabla: Respuestas a Emergencias
CREATE TABLE Respuestas_Emergencia (
    respuesta_id INT IDENTITY(1,1) PRIMARY KEY,
    llamada_id INT,
    tiempo_despacho INT,
    tiempo_llegada INT,
    FOREIGN KEY (llamada_id) REFERENCES Llamadas_Emergencia(llamada_id)
);
