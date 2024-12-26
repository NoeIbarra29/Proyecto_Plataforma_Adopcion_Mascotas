-- Creación de la función 'solicitudes_pendientes_porusuario' 
-- Objetivo: Esta función permite consultar y calcular la cantidad de solicitudes de adopción en estado "pendiente" que tiene un usuario, conociendo su número de ID 
-- La idea es que los usuarios tengan una sola solicitud pendiente por vez, de lo contrario, habrá que comunicar al refugio con la solicitud de adopción más reciente que la rechace hasta finalizar la primera 

USE plataforma_adopcion_mascotas;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `solicitudes_pendientes_porusuario`(usuario_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = 
		(SELECT COUNT(id_usuario) FROM solicitud_adopcion WHERE estado = 'pendiente' and id_usuario = usuario_id);
	RETURN resultado;
END $$
DELIMITER;

-- Aplicación de la función 'solicitudes_pendientes_porusuario' con distintos 'id_usuario'

SELECT solicitudes_pendientes_porusuario (43);

SELECT solicitudes_pendientes_porusuario (22);

SELECT solicitudes_pendientes_porusuario (30);

-- Creación de la función 'nro_usuarios_registrados'
-- Objetivo: Esta función permite consultar y calcular la cantidad de usuarios que se registraron en la plataforma de adopción de mascotas en determinado período de tiempo, estableciendo las fechas de inicio y fechas de fin

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nro_usuarios_registrados`(fecha_inicio DATE, fecha_fin DATE) RETURNS int
    NO SQL
BEGIN
	DECLARE resultado INT;
    SET resultado = (SELECT count(*) FROM usuario where fecha_registro between fecha_inicio and fecha_fin);
    RETURN resultado;
END $$
DELIMITER;

-- Aplicación de la función 'nro_usuarios_registrados' con distintas 'fechas de inicio' y 'fecha de fin'

SELECT nro_usuarios_registrados ('2020-01-01', '2024-01-01');

SELECT nro_usuarios_registrados ('2021-01-01', '2022-12-31');

SELECT nro_usuarios_registrados ('2023-01-01', '2024-06-30');

-- Creación de la función 'adoptante'
-- Objetivo: Esta función permite consultar rápidamente quién fue el/la adoptante de determinada mascota, conociendo el número de ID de la mascota y haciendo uso de una las vistas anteriormente creadas "adopciones_realizadas"

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `adoptante`(mascota_id INT) RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR (100);
    SET resultado = (SELECT nombrecompleto_usuario FROM adopciones_realizadas WHERE id_mascota = mascota_id);
    RETURN resultado;
END $$
DELIMITER;

-- Aplicación de la función 'adoptante' con distintos 'id_mascota'

SELECT adoptante (48);

SELECT adoptante (7);

SELECT adoptante (10);
