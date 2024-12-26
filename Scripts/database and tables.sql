-- Creación de la base de datos del proyecto

CREATE DATABASE plataforma_adopcion_mascotas;

-- Creación de las tablas del proyecto 

USE plataforma_adopcion_mascotas;

CREATE TABLE `refugio` (
  `id_refugio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` bigint NOT NULL,
  `email` varchar(200) NOT NULL,
  `website` varchar(200) NOT NULL,
  PRIMARY KEY (`id_refugio`));

CREATE TABLE `mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `especie` varchar(200) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('hembra','macho','desconocido') NOT NULL,
  `tamaño` enum('chico','mediano','grande') DEFAULT NULL,
  `estirilizado` tinyint(1) DEFAULT '1',
  `descripcion` text,
  `id_refugio` int NOT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `id_refugio` (`id_refugio`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`id_refugio`) REFERENCES `refugio` (`id_refugio`));

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contraseña` varchar(200) NOT NULL,
  `telefono` bigint NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `tipo_usuario` enum('adoptador','administrador') NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`));

CREATE TABLE `visita` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `fecha_visita` date NOT NULL,
  `id_usuario` int NOT NULL,
  `id_mascota` int NOT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_mascota` (`id_mascota`),
  CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`));

CREATE TABLE `solicitud_adopcion` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` date NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL,
  `id_usuario` int NOT NULL,
  `id_mascota` int NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_mascota` (`id_mascota`),
  CONSTRAINT `solicitud_adopcion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `solicitud_adopcion_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`));

