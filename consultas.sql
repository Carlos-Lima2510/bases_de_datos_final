
DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_carlos_alvarado` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_carlos_alvarado`()
BEGIN

-- Consultas Carlos Alvarado --


-- Intersección --

SELECT * FROM funcion WHERE horario > '2025-01-01 00:00:00' INTERSECT SELECT * FROM funcion WHERE codigo_funcion LIKE 'AB%';

-- Diferencia --

SELECT * FROM funcion WHERE horario > '2025-01-01 00:00:00' EXCEPT SELECT * FROM funcion WHERE codigo_funcion = 'AB-103';

-- Unión --

SELECT * FROM funcion WHERE sala_id = 1 UNION SELECT * FROM funcion WHERE codigo_funcion = 'AB-103';

-- Agregación --

SELECT MAX(horario) FROM funcion;

-- Reunión Natural --

SELECT f.codigo_funcion, p.titulo FROM funcion AS f NATURAL JOIN pelicula AS p;

-- Reunión Natural Por la izquierda --

SELECT f.codigo_funcion, s.nombre, s.capacidad_maxima FROM funcion AS f LEFT JOIN sala AS s ON f.sala_id = s.sala_id;

-- Reunión Natural Por la derecha --

SELECT f.codigo_funcion, s.nombre, s.capacidad_maxima FROM funcion AS f RIGHT JOIN sala AS s ON f.sala_id = s.sala_id;

-- Producto Cartesiano --

SELECT f.codigo_funcion, b.precio FROM funcion AS f CROSS JOIN boleto AS b;

END //

DELIMITER ;
