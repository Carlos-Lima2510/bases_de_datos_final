
DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_alejandro_juarez` //

CREATE DEFINER=`carlos.alvarado`@`%` PROCEDURE `consultas_alejandro_juarez`()
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


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_miguel_rivas` //

CREATE DEFINER=`carlos.alvarado`@`%` PROCEDURE `consultas_miguel_rivas`()
BEGIN

-- Consultas --
-- Interseccion --
SELECT titulo, genero, clasificacion_edad
FROM pelicula
WHERE genero = 'Ciencia Ficción'

INTERSECT

SELECT titulo, genero, clasificacion_edad
FROM pelicula
WHERE duracion > 145;

-- Union --
SELECT titulo, genero, clasificacion_edad
FROM pelicula
WHERE genero = 'Ciencia Ficción'

UNION

SELECT titulo, genero, clasificacion_edad
FROM pelicula
WHERE genero = 'Romance';

-- Diferencia --
SELECT titulo, genero, clasificacion_edad
FROM pelicula
WHERE clasificacion_edad = 'PG-13'

EXCEPT

SELECT titulo, genero, clasificacion_edad
FROM pelicula
WHERE genero = 'Ciencia Ficción';

-- Agregacion --
SELECT genero, 
       COUNT(*) AS cantidad_peliculas, 
       AVG(duracion) AS duracion_promedio
FROM pelicula
GROUP BY genero;

-- Reunion Natural --
SELECT * FROM pelicula NATURAL JOIN funcion;

-- Reunion Natural por derecha --
SELECT * FROM pelicula RIGHT JOIN funcion
ON pelicula.pelicula_id = funcion.pelicula_id;

-- Reunion Natural por izquierda --
SELECT * FROM pelicula LEFT JOIN funcion
ON pelicula.pelicula_id = funcion.pelicula_id;

-- Producto cartesiano --
SELECT * FROM pelicula CROSS JOIN funcion;

END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_kelvia_neves` //

CREATE DEFINER=`carlos.alvarado`@`%` PROCEDURE `consultas_kelvia_neves`()
BEGIN

-- Consultas --

-- Unión Kelvia --

SELECT * FROM clientes
    WHERE numero_telefono IS NOT NULL
    UNION
    SELECT * FROM clientes
    WHERE correo_electronico LIKE '%@gmail.com';

-- Intersección Kelvia --

SELECT * FROM clientes WHERE numero_telefono IS NOT NULL INTERSECT SELECT * FROM clientes WHERE correo_electronico LIKE '%@gmail.com';

-- Diferencia Kelvia --

SELECT cliente_id, codigo_cliente, nombre_completo, correo_electronico, numero_telefono
FROM clientes
WHERE correo_electronico IS NOT NULL
EXCEPT
SELECT cliente_id, codigo_cliente, nombre_completo, correo_electronico, numero_telefono
FROM clientes
WHERE correo_electronico IS NOT NULL AND numero_telefono IS NOT NULL;

-- Agregación Kelvia --

SELECT COUNT(*) AS clientes_con_telefono
FROM clientes
WHERE numero_telefono IS NOT NULL;

-- Reunion natural Kelvia --

 SELECT * FROM clientes NATURAL JOIN boleto;

-- Reunion natural por la izquierda Kelvia --

SELECT *
FROM clientes
LEFT JOIN boleto
ON clientes.cliente_id = boleto.cliente_id;

-- Reunion natural por la derecha Kelvia --

SELECT *
FROM clientes
RIGHT JOIN boleto
ON clientes.cliente_id = boleto.cliente_id;

-- Producto cartesiano Kelvia --

SELECT *
FROM clientes
CROSS JOIN boleto;


END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_manuel_munoz` //

CREATE DEFINER=`carlos.alvarado`@`%` PROCEDURE `consultas_manuel_munoz`()
BEGIN

-- Consultas --

-- Intersect --
SELECT * FROM boleto WHERE precio >= 200
INTERSECT
SELECT * FROM boleto WHERE sala <> 1;

-- Union --

SELECT sala, boleto_id FROM boleto WHERE precio >= 200
UNION
SELECT precio, numero_asiento FROM boleto WHERE sala <> 1;

-- Diferencia --
SELECT boleto_id FROM boleto AS b1
EXCEPT
SELECT numero_asiento FROM boleto AS b2;

-- Agregacion --
SELECT AVG(precio) FROM boleto;

-- Natural Join --
SELECT sala FROM boleto NATURAL JOIN pelicula;

-- Right Join --
SELECT * FROM boleto AS b
RIGHT JOIN
pelicula AS p ON b.sala = p.pelicula_id;

-- Left Join --
SELECT * FROM boleto AS b 
LEFT JOIN
pelicula AS p ON b.precio > p.duracion;

--  P.Cartesiano -- 
SELECT * FROM boleto CROSS JOIN sala;

END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_carlos_alvarado` //

CREATE DEFINER=`carlos.alvarado`@`%` PROCEDURE `consultas_carlos_alvarado`()
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
