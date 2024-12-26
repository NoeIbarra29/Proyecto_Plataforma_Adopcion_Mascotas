-- Creación de la tabla 'LOG_update_delete_mascota' que será utilizada como bitácora de los dos triggers que se van a crear después

USE plataforma_adopcion_mascotas;

CREATE TABLE `log_update_delete_mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `especie` varchar(200) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('hembra','macho','desconocido') NOT NULL,
  `tamaño` enum('chico','mediano','grande') DEFAULT NULL,
  `id_refugio` int NOT NULL,
  `fecha_modif` date NOT NULL,
  `time_modif` time NOT NULL,
  `usuario_modif` varchar(200) NOT NULL,
  `tipo_modif` varchar(200) NOT NULL,
  PRIMARY KEY (`id_mascota`));
  
-- Creación del trigger 'bef_update_mascota' cuyo objetivo es generar un historial de cada actualización realizada sobre los registros de la tabla 'Mascota'
-- utilizando la tabla 'log_update_delete_mascota'

CREATE TRIGGER `bef_update_mascota`
BEFORE UPDATE ON `mascota`
FOR EACH ROW 
INSERT INTO `LOG_update_delete_mascota` (id_mascota, nombre, especie, fecha_nacimiento, sexo, 
tamaño, id_refugio, fecha_modif, time_modif, usuario_modif, tipo_modif)
VALUES (NULL, NEW.nombre, NEW.especie, NEW.fecha_nacimiento, NEW.sexo, NEW.tamaño,
NEW.id_refugio, current_date(), current_time(), session_user(), 'UPDATE: Se actualizó el registro');

-- Actualización de ciertos registros de la tabla 'Mascota' para comprobar el funcionamiento del trigger 'bef_update_mascota'

SET sql_safe_updates = 0;

UPDATE mascota SET sexo = 'hembra' WHERE id_mascota = 42 OR id_mascota = 33 OR id_mascota = 39 OR id_mascota = 10;

UPDATE mascota SET sexo = 'macho' WHERE id_mascota = 47 OR id_mascota = 5 OR id_mascota = 13 OR id_mascota = 50;

UPDATE mascota SET tamaño = 'chico' WHERE especie = 'Ave';

-- Comprobación del funcionamiento del trigger 'bef_update_mascota' revisando la tabla 'LOG_update_delete_mascota' 

SELECT * FROM log_update_delete_mascota;

-- Creación del trigger 'after_delete_mascota' cuyo objetivo es generar un historial de cada registro que se elimine de la tabla 'Mascota'
-- utilizando la tabla 'log_update_delete_mascota'

CREATE TRIGGER `after_delete_mascota`
AFTER DELETE ON `mascota`
FOR EACH ROW 
INSERT INTO `LOG_update_delete_mascota` (id_mascota, nombre, especie, fecha_nacimiento, sexo, 
tamaño, id_refugio, fecha_modif, time_modif, usuario_modif, tipo_modif)
VALUES (NULL, OLD.nombre, OLD.especie, OLD.fecha_nacimiento, OLD.sexo, OLD.tamaño,
OLD.id_refugio, current_date(), current_time(), session_user(), 'DELETE: Se eliminó el registro');

-- Eliminación de un registro de la tabla 'Mascota' para comprobar el funcionamiento del trigger 'after_delete_mascota'

DELETE FROM mascota WHERE nombre = 'Para eliminar';

-- Comprobación del funcionamiento del trigger 'after_delete_mascota' revisando la tabla 'LOG_update_delete_mascota' 

SELECT * FROM log_update_delete_mascota;

-- Creación de la tabla 'LOG_solicitud_adop_espejo' que será utilizada como bitácora del trigger que se va a crear después

CREATE TABLE `log_solicitud_adop_espejo` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` date NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL,
  `id_usuario` int NOT NULL,
  `id_mascota` int NOT NULL,
  `fecha_insercion` date NOT NULL,
  `time_insercion` time NOT NULL,
  `usuario_insercion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_solicitud`));
  
-- Creación del trigger 'bef_insert_solicitud' cuyo objetivo es llevar un historial de cada nuevo registro que se inserte en la tabla 'Solicitud_Aprobacion'
-- utilizando la tabla 'log_solicitud_adop_espejo'

CREATE TRIGGER `bef_insert_solicitud`
BEFORE INSERT ON `solicitud_adopcion`
FOR EACH ROW 
INSERT INTO `log_solicitud_adop_espejo` (id_solicitud, fecha_solicitud, estado, id_usuario, id_mascota, 
fecha_insercion, time_insercion, usuario_insercion)
VALUES (NULL, NEW.fecha_solicitud, NEW.estado, NEW.id_usuario, NEW.id_mascota,
current_date(), current_time(), session_user());

-- Inserción de dos registros a la tabla 'Solicitud_Adopcion' para comprobar el funcionamiento del trigger 'bef_insert_solicitud'

INSERT INTO solicitud_adopcion VALUES (NULL, '2024-12-19', 'pendiente', 32, 27);

INSERT INTO solicitud_adopcion VALUES (NULL, '2024-12-19', 'pendiente', 45, 49);

-- Comprobación del funcionamiento del trigger 'bef_insert_solicitud' revisando la tabla 'LOG_solicitud_adop_espejo' 

SELECT * FROM log_solicitud_adop_espejo;

-- Creación de la tabla 'LOG_delete_solicitud_adop' que será utilizada como bitácora del trigger que se va a crear después

CREATE TABLE `log_delete_solicitud_adop` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` date NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL,
  `id_usuario` int NOT NULL,
  `id_mascota` int NOT NULL,
  `fecha_delete` date NOT NULL,
  `time_delete` time NOT NULL,
  `usuario_delete` varchar(200) NOT NULL,
  PRIMARY KEY (`id_solicitud`));

-- Creación del trigger 'after_delete_solicitud' cuyo objetivo es llevar un historial de cada registro que se elimine de la tabla 'Solicitud_Aprobacion'
-- utilizando la tabla 'log_delete_solicitud_adop'

CREATE TRIGGER `after_delete_solicitud`
AFTER DELETE ON `solicitud_adopcion`
FOR EACH ROW 
INSERT INTO `log_delete_solicitud_adop` (id_solicitud, fecha_solicitud, estado, id_usuario, id_mascota, 
fecha_delete, time_delete, usuario_delete)
VALUES (NULL, OLD.fecha_solicitud, OLD. estado, OLD.id_usuario, OLD.id_mascota,
current_date(), current_time(), session_user());

-- Eliminación de un registro de la tabla 'Solicitud_Adopcion' para comprobar el funcionamiento del trigger 'after_delete_solicitud'

DELETE FROM solicitud_adopcion WHERE id_solicitud = 58 OR id_solicitud = 59;

-- Comprobación del funcionamiento del trigger 'after_delete_solicitud' revisando la tabla 'log_delete_solicitud_adop' 

SELECT * FROM log_delete_solicitud_adop;

-- Creación del trigger 'validar_id_usuario' cuyo objetivo es validar que el campo 'id_usuario' que se defina al momento de insertar un nuevo registro en la tabla 'Solicitud_Adopcion', no sea igual a '1 o 2' ya que estos ID corresponden a los usuarios administradores de la plataforma y, por lo tanto, no pueden tener solicitudes de adopción asociadas

DELIMITER $$
CREATE TRIGGER `validar_id_usuario`
BEFORE INSERT ON `solicitud_adopcion`
FOR EACH ROW
BEGIN
	IF NEW.id_usuario IN (1, 2) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El valor de id_usuario no puede ser 1 o 2 ya que corresponden a usuarios admin';
	END IF;
END $$
DELIMITER;

-- Intento de inserción de un registro a la tabla 'Solicitud_Adopcion' con 'id_usuario = 1' para comprobar el funcionamiento del trigger 'validar_id_usuario'

INSERT INTO solicitud_adopcion VALUES (NULL, '2024-12-19', 'pendiente', 1, 27);
