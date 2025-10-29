CREATE DATABASE IF NOT EXISTS rmv_parcial_plp3
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE rmv_parcial_plp3;

DROP TABLE IF EXISTS rmv_opciones;
DROP TABLE IF EXISTS rmv_preguntas;
DROP TABLE IF EXISTS rmv_partidas;

CREATE TABLE rmv_preguntas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  rmv_texto VARCHAR(255) NOT NULL,
  rmv_categoria ENUM('HTML','CSS','JS','PHP') NOT NULL,
  rmv_dificultad ENUM('facil','media','dificil') NOT NULL DEFAULT 'facil',
  rmv_correcta_id INT DEFAULT NULL
) ENGINE=InnoDB;

CREATE TABLE rmv_opciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  rmv_pregunta_id INT NOT NULL,
  rmv_texto VARCHAR(255) NOT NULL,
  rmv_es_correcta TINYINT(1) NOT NULL DEFAULT 0,
  CONSTRAINT fk_rmv_op_preg FOREIGN KEY (rmv_pregunta_id)
    REFERENCES rmv_preguntas(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE rmv_partidas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  rmv_nombre VARCHAR(30) NOT NULL,
  rmv_puntaje INT NOT NULL,
  rmv_duracion_seg INT NOT NULL,
  rmv_categoria VARCHAR(10) NOT NULL,
  rmv_dificultad VARCHAR(10) NOT NULL,
  rmv_creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE INDEX idx_rmv_p_catdif ON rmv_preguntas(rmv_categoria, rmv_dificultad);
CREATE INDEX idx_rmv_part_score ON rmv_partidas(rmv_puntaje, rmv_duracion_seg);
