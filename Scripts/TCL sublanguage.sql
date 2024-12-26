-- Primero se consulta qué valor tiene la variable AUTOCOMMIT en esta base de datos

SELECT @@autocommit;

-- La variable está seteada en 1, lo cual significa que todas las operaciones DML que se ejecuten en esta bbdd van a impactar de forma automática siempre
-- Por lo tanto, se debe cambiar el valor a 0 para que el impacto sea manual cuando se desee 

SET autocommit = 0;

-- Ahora se prueba eliminar dos registros de la tabla 'Solicitud_Adopcion' iniciando la sentencia con una transacción SQL

START TRANSACTION;
DELETE FROM solicitud_adopcion WHERE id_solicitud = 54 OR id_solicitud = 57;

SELECT * FROM solicitud_adopcion;

-- Con la sentencia ROLLBACK se revierten todos los cambios realizados en la transacción hasta el momento

ROLLBACK;

-- Se prueba insertan ocho nuevos registros en la tabla 'Solicitud_Adopcion', iniciando previamente con una transacción SQL, y definiendo dos SAVEPOINTS (lotes) para tener la posibilidad de manejar las operaciones que se ejecuten sobre dichos registros de forma parcial

START TRANSACTION;
INSERT INTO visita VALUES (null, '2024-12-19', 12, 9);
INSERT INTO visita VALUES (null, '2024-12-19', 13, 14);
INSERT INTO visita VALUES (null, '2024-12-19', 51, 46);
INSERT INTO visita VALUES (null, '2024-12-19', 43, 43);
SAVEPOINT lotevisita1;
INSERT INTO visita VALUES (null, '2024-12-19', 42, 11);
INSERT INTO visita VALUES (null, '2024-12-19', 19, 16);
INSERT INTO visita VALUES (null, '2024-12-19', 21, 22);
INSERT INTO visita VALUES (null, '2024-12-19', 5, 3);
SAVEPOINT lotevisita2;

SELECT * FROM plataforma_adopcion_mascotas.visita;

-- Por último, se da de baja el primer SAVEPOINT definido en el paso anterior y se ejecuta COMMIT para todo

RELEASE SAVEPOINT lotevisita1;

COMMIT;

