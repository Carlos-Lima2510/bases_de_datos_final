-- Tabla: Miguel Rivas --
DROP TABLE IF EXISTS pelicula;

CREATE TABLE pelicula (
    pelicula_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    genero VARCHAR(100),
    duracion INT UNSIGNED,
    clasificacion_edad VARCHAR(10)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO pelicula (titulo, genero, duracion, clasificacion_edad)
VALUES 
    ('La La Land', 'Musical', 128, 'PG-13'),
    ('Los Juegos del Hambre', 'Ciencia Ficción', 142, 'PG-13'),
    ('Inception', 'Ciencia Ficción', 148, 'PG-13'),
    ('El Conjuro', 'Terror', NULL, NULL),
    ('Titanic', 'Romance', NULL, 'PG-13');

--  Tabla: Alejandro Juarez --
DROP TABLE IF EXISTS sala;
CREATE TABLE IF NOT EXISTS `sala` ( `sala_id` INT AUTO_INCREMENT PRIMARY KEY, `nombre` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, `capacidad_maxima` INT NOT NULL, `tipo_sala` ENUM('2D', '3D', 'IMAX'), `descripcion` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `sala` (`nombre`, `capacidad_maxima`, `tipo_sala`, `descripcion`) VALUES ('Sala Experimental', 100, '2D', NULL), (NULL, 150, '3D', 'Sala con efectos especiales avanzados'), ('Sala Sin Nombre', NULL, 'IMAX', 'Sala en preparación con capacidad por definir'), ('Sala Básica', 80, NULL, 'Sala económica para funciones estándar'), ('Sala Principal', 200, 'IMAX', 'Sala principal con tecnología de última generación'), ('Sala 3D Deluxe', 150, '3D', 'Sala con proyección 3D y sonido envolvente'), ('Sala Clásica', 120, '2D', 'Sala estándar con ambiente acogedor'), ('Sala Premium', 80, '3D', 'Sala exclusiva con asientos reclinables');

-- Tabla: Kelvia Neves --

DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,  
    codigo_cliente INT,         
    nombre_completo VARCHAR(100),      
    correo_electronico VARCHAR(100), 
    numero_telefono VARCHAR(15)                 
) ENGINE=MyISAM 
  CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

INSERT INTO clientes (codigo_cliente, nombre_completo, correo_electronico, numero_telefono) VALUES
(1, 'Juan Pérez', 'juan.perez@gmail.com', '555-1234567'),
(2, 'María Gómez', 'maria.gomez@yahoo.com', '555-2345678'),
(3, 'Luis Martínez', 'luis.martinez@hotmail.com', '555-3456789'),
(4, 'Ana Torres', 'ana.torres@gmail.com', NULL),
(5, 'Carlos Ramírez', 'carlos.ramirez@outlook.com', '555-4567890'),
(6, 'Sofía Hernández', 'sofia.hernandez@gmail.com', NULL),
(7, 'Pedro López', 'pedro.lopez@yahoo.com', '555-5678901'),
(8, 'Laura Castillo', 'laura.castillo@gmail.com', '555-6789012'),
(9, 'Diego Ruiz', 'diego.ruiz@hotmail.com', NULL),
(10, 'Valeria Mendoza', 'valeria.mendoza@gmail.com', '555-7890123');

-- Tabla: Manuel Muñoz --
DROP TABLE IF EXISTS boleto;
CREATE TABLE IF NOT EXISTS boleto( 
boleto_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
funcion_id INT UNSIGNED NOT NULL,
cliente_id INT,
fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
numero_asiento INT UNSIGNED NOT NULL,
precio decimal(7,3) NOT NULL,
PRIMARY KEY (boleto_id))
ENGINE=MyISAM CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO boleto (funcion_id, cliente_id, numero_asiento, precio)  VALUES  (1, 1, 10, 180.00), (2, 2, 5, 250.75), (3, 3, 20, 300.00),  (4, NULL, 12, 600.00);

--  Tabla: Carlos Alvarado --
DROP TABLE IF EXISTS funcion;
CREATE TABLE IF NOT EXISTS funcion (
  funcion_id INT PRIMARY KEY AUTO_INCREMENT,
  codigo_funcion CHAR(5) UNIQUE NOT NULL,
  sala_id int NOT NULL,
  pelicula_id int NOT NULL,
  horario DATETIME NOT NULL
) ENGINE=MyISAM CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO funcion (codigo_funcion, sala_id, pelicula_id, horario)
VALUES ('AB103', 1, 1, "2025-01-01 15:00:00"),
('AB104', 2, 2, "2025-01-01 18:00:00"),
('AB105', 3, 3, "2025-01-01 21:00:00"),
('AB106', 4, 4, "2025-01-01 23:00:00"),
('AB107', 5, 5, "2025-01-02 10:00:00");



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

--  Agregación Kelvia --

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

