
	SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
	SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
	SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


	DROP DATABASE IF EXISTS `mydb`;
	CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
	USE `mydb`;


	DROP TABLE IF EXISTS usuarios;
	CREATE TABLE `usuarios` (
	  `idusuarios` BIGINT NOT NULL AUTO_INCREMENT,
	  `nombre` VARCHAR(100) NOT NULL,
	  `apellido` VARCHAR(100) NOT NULL,
	  `usuario` VARCHAR(45) NOT NULL,
	  `password` VARCHAR(250) NOT NULL,
	  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  PRIMARY KEY (`idusuarios`)
	) ENGINE = InnoDB;


	DROP TABLE IF EXISTS categoria_tarea;
	CREATE TABLE `categoria_tarea` (
	  `id_categoria` INT NOT NULL AUTO_INCREMENT,
	  `descripcion` VARCHAR(100) NOT NULL,
	  `estado` INT NOT NULL,
	  PRIMARY KEY (`id_categoria`)
	) ENGINE = InnoDB;

	-- Tabla timestamps
	DROP TABLE IF EXISTS timestamps;
	CREATE TABLE `timestamps` (
	  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	  `update_time` TIMESTAMP NULL DEFAULT NULL
	);


	DROP TABLE IF EXISTS category;
	CREATE TABLE `category` (
	  `category_id` INT NOT NULL AUTO_INCREMENT,
	  `name` VARCHAR(255) NOT NULL,
	  PRIMARY KEY (`category_id`)
	);


	DROP TABLE IF EXISTS tareas;
	CREATE TABLE `tareas` (
	  `id_tareas` BIGINT NOT NULL AUTO_INCREMENT,
	  `fecha` DATETIME NOT NULL,
	  `prioridad` INT NOT NULL,
	  `titulo` VARCHAR(500) NOT NULL,
	  `descripcion_tareas` VARCHAR(250) NOT NULL,
	  `comentario` VARCHAR(45) NOT NULL,
	  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  `id_usuarios` BIGINT NOT NULL,
	  `id_categoria` INT NOT NULL,
	  PRIMARY KEY (`id_tareas`),
	  INDEX `fk_tareas_usuarios_idx` (`id_usuarios`),
	  INDEX `fk_tareas_categoria_tarea1_idx` (`id_categoria`),
	  CONSTRAINT `fk_tareas_usuarios`
		FOREIGN KEY (`id_usuarios`)
		REFERENCES `usuarios` (`idusuarios`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	  CONSTRAINT `fk_tareas_categoria_tarea1`
		FOREIGN KEY (`id_categoria`)
		REFERENCES `categoria_tarea` (`id_categoria`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);

	SET SQL_MODE=@OLD_SQL_MODE;
	SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
	SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
