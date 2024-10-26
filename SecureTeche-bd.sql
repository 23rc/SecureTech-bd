
CREATE DATABASE [SecureTech-bd];
GO

USE [SecureTech-bd];
GO



CREATE TABLE rol (
    codigoRol INT IDENTITY(1,1) NOT NULL,
    nombreRol NVARCHAR(128) NOT NULL,
	estatus TINYINT NOT NULL,
	CONSTRAINT pk_rol_codigoRol PRIMARY KEY CLUSTERED(codigoRol ASC),
	CONSTRAINT uq_rol_nombreRol UNIQUE (nombreRol)
);
GO
DROP TABLE usuario
CREATE TABLE usuario (
    codigoUsuario INT IDENTITY(1,1) NOT NULL,
    codigoRol INT NULL,
    correo NVARCHAR(128) NOT NULL,
    clave NVARCHAR(255) NOT NULL,
	estatus TINYINT NOT NULL,
    fechaRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT uq_usuario_correo UNIQUE (correo),
	CONSTRAINT uq_usuario_clave UNIQUE (clave),
	CONSTRAINT pk_usuario_codigoUsuario PRIMARY KEY CLUSTERED(codigoUsuario ASC),
	CONSTRAINT fk_usuario_codigoRol FOREIGN KEY (codigoRol) REFERENCES rol(codigoRol)
);
GO

-- Tabla Paciente
CREATE TABLE paciente (
    codigoPaciente INT IDENTITY(1,1) NOT NULL,
    nombreCompleto NVARCHAR(128) NOT NULL,
    fechaNacimiento DATE NOT NULL,
	estatus TINYINT NOT NULL,
	CONSTRAINT pk_paciente_codigoPaciente PRIMARY KEY CLUSTERED (codigoPaciente ASC)
);
GO

-- Tabla Tratamiento
CREATE TABLE tratamiento (
    codigoTratamiento INT IDENTITY(1,1) NOT NULL,
    codigoPaciente INT NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    fechaInicio DATE NOT NULL,
    estatus TINYINT NOT NULL,
	CONSTRAINT pk_tratamiento_codigoTratamiento PRIMARY KEY CLUSTERED (codigoTratamiento ASC),
	CONSTRAINT fk_tratamiento_codigoPaciente FOREIGN KEY (codigoPaciente) REFERENCES paciente(codigoPaciente)
);
GO

-- Tabla ResultadoDePrueba
CREATE TABLE resultadoDePrueba (
    codigoResultado INT IDENTITY(1,1) NOT NULL,
    codigoPaciente INT NOT NULL,
    tipoPrueba NVARCHAR(128) NOT NULL,
    resultado NVARCHAR(255) NOT NULL,
	fechaPrueba DATE NOT NULL,
	estatus TINYINT NOT NULL,
	CONSTRAINT pk_resultadoDePrueba_codigoResultado PRIMARY KEY CLUSTERED (codigoResultado ASC),
	CONSTRAINT fk_resultadoDePrueba_codigoPaciente FOREIGN KEY (codigoPaciente) REFERENCES paciente(codigoPaciente)
);
GO
