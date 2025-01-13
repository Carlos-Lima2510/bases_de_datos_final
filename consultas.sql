
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

END //

DELIMITER ;
