-- Creación de vista 'ultimas_solicitudes' 
-- Objetivo: Esta vista muestra la fecha, el estado y el número de ID de la última solicitud de adopción presentada para cada mascota

USE plataforma_adopcion_mascotas;

CREATE VIEW ultimas_solicitudes
AS SELECT S.id_solicitud, S.fecha_solicitud, S.estado, S.id_mascota FROM solicitud_adopcion AS S
INNER JOIN (SELECT id_mascota, MAX(fecha_solicitud) AS fecha_ultima_solicitud FROM solicitud_adopcion GROUP BY id_mascota) AS M
ON S.id_mascota = M.id_mascota AND S.fecha_solicitud = M.fecha_ultima_solicitud;

-- Creación de vista 'mascotas_disponibles'
-- Objetivo: Esta vista muestra información básica de aquellas mascotas que aún están disponibles para adopción, incluyendo el nombre y la dirección del refugio en el cual se encuentran

CREATE VIEW mascotas_disponibles
AS SELECT mascota.id_mascota, mascota.nombre, mascota.especie, mascota.tamaño, 
timestampdiff(year, mascota.fecha_nacimiento, curdate()) AS edad,
refugio.id_refugio, refugio.nombre AS refugio, refugio.direccion FROM mascota
INNER JOIN refugio ON mascota.id_refugio = refugio.id_refugio
LEFT JOIN ultimas_solicitudes ON mascota.id_mascota = ultimas_solicitudes.id_mascota
WHERE (ultimas_solicitudes.estado <> 'aprobada' OR ultimas_solicitudes.id_mascota IS NULL);

-- Creación de vista 'adopciones_realizadas'
-- Objetivo: Esta vista muestra información de las mascotas que van siendo adoptadas, incluyendo los nombres de los refugios en los que estaban alojadas, de los usuarios que las adoptaron y las fechas en la que se realizaron las solicitudes de adopción

CREATE VIEW adopciones_realizadas
AS SELECT mascota.id_mascota, mascota.nombre as nombre_mascota, mascota.especie, mascota.sexo, 
timestampdiff(year, mascota.fecha_nacimiento, curdate()) AS edad,
refugio.id_refugio, refugio.nombre AS nombre_refugio, 
usuario.id_usuario, concat(usuario.nombre,' ',usuario.apellido) as nombrecompleto_usuario,
solicitud_adopcion.fecha_solicitud, solicitud_adopcion.estado FROM mascota, refugio, usuario, solicitud_adopcion
WHERE mascota.id_refugio = refugio.id_refugio
AND mascota.id_mascota = solicitud_adopcion.id_mascota
AND solicitud_adopcion.id_usuario = usuario.id_usuario
AND solicitud_adopcion.estado = 'aprobada'
ORDER BY solicitud_adopcion.fecha_solicitud;

-- Creación de vista 'resumen_refugios'
-- Objetivo: Esta vista agrupa información recopilada por cada refugio para mostrar rápidamente cuántas mascotas tienen aún disponibles para dar en adopción, cuántas de sus mascotas fueron adoptadas, cuántas solicitudes de adopción han tenido que rechazar y cuántas visitas han recibido, desde que los refugios se abrieron

CREATE VIEW resumen_refugios
AS SELECT r.id_refugio, r.nombre AS nombre_refugio, r.direccion, 
COUNT(DISTINCT md.id_mascota) AS q_mascotas_disponibles, 
COUNT(DISTINCT ar.id_mascota) AS q_mascotas_adoptadas,
COUNT(CASE WHEN sa.estado = 'rechazada' THEN 1 END) AS q_solicitudes_rechazadas,
COUNT(DISTINCT v.id_mascota) AS q_visitas_recibidas
FROM refugio AS r
LEFT JOIN mascota AS m ON r.id_refugio = m.id_refugio
LEFT JOIN mascotas_disponibles AS md ON m.id_mascota = md.id_mascota
LEFT JOIN adopciones_realizadas AS ar ON m.id_mascota = ar.id_mascota
LEFT JOIN solicitud_adopcion AS sa ON m.id_mascota = sa.id_mascota
LEFT JOIN visita AS v ON m.id_mascota = v.id_mascota
GROUP BY r.id_refugio, r.nombre, r.direccion
ORDER BY r.id_refugio;

-- Creación de vista 'visitas_mascotas_disponibles'
-- Objetivo: Esta vista muestra información de la cantidad de visitas que han recibido aquellas mascotas que aún están disponibles para ser adoptadas, además de la dirección del refugio en el que se encuentran, incluyendo aquellas mascotas que aún no han recibido visitas

CREATE VIEW visitas_mascotas_disponibles
AS SELECT md.id_mascota, md.nombre, md.edad, md.direccion AS direccion_refugio,
MAX(v.fecha_visita) AS ultima_visita,
COUNT(v.id_mascota) AS cantidad_visitas
FROM mascotas_disponibles AS md
LEFT JOIN visita AS v ON md.id_mascota = v.id_mascota 
GROUP BY md.id_mascota = md.edad 
ORDER BY cantidad_visitas DESC;


