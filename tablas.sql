-- Tabla: Carlos Alvarado --

CREATE TABLE IF NOT EXISTS funcion (
    funcion_id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_funcion CHAR(5) NOT NULL,
    sala_id int NOT NULL,
    pelicula_id int NOT NULL,
    horario DATETIME NOT NULL,
    boleto_id int NOT NULL
) ENGINE=MyISAM CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO funcion (codigo_funcion, sala_id, pelicula_id, horario, boleto_id)
VALUES ('AB103', 1, 1, "2025-01-01 15:00:00", 1);