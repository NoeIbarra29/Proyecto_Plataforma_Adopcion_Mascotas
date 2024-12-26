-- Creación del stored procedure 'sp_ordenar_tabla_mascota' 
-- Objetivo: Este stored procedure permite ordenar todos los registros de la tabla Mascota en función al campo que se desee y en el sentido que se requiera

USE plataforma_adopcion_mascotas;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenar_tabla_mascota`(IN campo CHAR(100))
BEGIN
	IF campo <> ' ' THEN 
		SET @ordenar = CONCAT ('ORDER BY ', campo);
	ELSE
		SET @ordenar = ' ';
	END IF;
SET @clausula = CONCAT ('SELECT * FROM mascota ', @ordenar);
PREPARE ejecutarSQL FROM @clausula;
EXECUTE ejecutarSQL;
deallocate prepare ejecutarSQL;
END $$
DELIMITER;

-- Aplicación del stored procedure 'sp_ordenar_tabla_mascota' con distintos campos 

CALL sp_ordenar_tabla_mascota ('especie ASC');

CALL sp_ordenar_tabla_mascota ('fecha_nacimiento DESC');

-- Creación del stored procedure 'sp_insertar_solicitud' 
-- Objetivo: Este stored procedure permite insertar un nuevo registro en la tabla Solicitud_Adopcion indicando los valores a insertar en los campos fecha, estado, id usuario e id mascota 

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_solicitud`
(IN n_fecha_solicitud DATE, IN n_estado CHAR(45), IN n_id_usuario INT, IN n_id_mascota INT)
BEGIN
	INSERT INTO solicitud_adopcion (fecha_solicitud, estado, id_usuario, id_mascota)
    VALUES (n_fecha_solicitud, n_estado, n_id_usuario, n_id_mascota);
END $$
DELIMITER;

-- Aplicación del stored procedure 'sp_insertar_solicitud' con distintos campos 

CALL sp_insertar_solicitud ('2024-12-17', 'pendiente', 28, 43);

CALL sp_insertar_solicitud ('2024-12-17', 'pendiente', 48, 23);
