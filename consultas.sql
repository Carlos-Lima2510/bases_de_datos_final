DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_alejandro_juarez` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_alejandro_juarez`()
BEGIN

-- Consultas --

-- Unión --
SELECT * FROM sala WHERE capacidad_maxima > 100 UNION SELECT * FROM sala WHERE tipo_sala = 'IMAX';

-- Intersección --
SELECT * FROM sala WHERE capacidad_maxima > 100 INTERSECT SELECT * FROM sala WHERE tipo_sala = 'IMAX';

-- Diferencia --
SELECT * FROM sala WHERE capacidad_maxima > 100 EXCEPT SELECT * FROM sala WHERE tipo_sala = 'IMAX';

-- Agregación --
SELECT COUNT(*) AS total_salas, AVG(capacidad_maxima) AS capacidad_promedio FROM sala;

-- Reunion natural --
SELECT * FROM sala NATURAL JOIN funcion;

-- Reunion natural por la izquierda --
SELECT * FROM sala LEFT JOIN funcion ON sala.sala_id = funcion.sala_id;

-- Reunion natural por la derecha --
SELECT * FROM sala RIGHT JOIN funcion ON sala.sala_id = funcion.sala_id;

-- Producto cartesiano --
SELECT * FROM sala CROSS JOIN funcion;

END //

DELIMITER ;

