-- MySQL Script generated by MySQL Workbench
-- Sun Mar  2 09:27:08 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Inscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inscripciones` (
  `id_inscripciones` INT NOT NULL,
  `id_estudiante` VARCHAR(45) NULL,
  `id_curso` VARCHAR(45) NULL,
  PRIMARY KEY (`id_inscripciones`),
  UNIQUE INDEX `id_inscripciones_UNIQUE` (`id_inscripciones` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estudiantes` (
  `id_estudiante` INT NOT NULL,
  `Fecha de nacimiento` DATE NULL,
  `Nombre del estudiante` MEDIUMTEXT NOT NULL,
  `Correo Electrónico` MEDIUMTEXT NOT NULL,
  `Inscripciones_id_inscripciones` INT NOT NULL,
  PRIMARY KEY (`id_estudiante`, `Inscripciones_id_inscripciones`),
  UNIQUE INDEX `id_estudiante_UNIQUE` (`id_estudiante` ASC) VISIBLE,
  INDEX `fk_Estudiantes_Inscripciones_idx` (`Inscripciones_id_inscripciones` ASC) VISIBLE,
  CONSTRAINT `fk_Estudiantes_Inscripciones`
    FOREIGN KEY (`Inscripciones_id_inscripciones`)
    REFERENCES `mydb`.`Inscripciones` (`id_inscripciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cursos` (
  `id_curso` INT NOT NULL,
  `Matemáticas` TINYTEXT NOT NULL,
  `Idioma Español` TINYTEXT NOT NULL,
  `Computación` TINYTEXT NOT NULL,
  `Cursos_id_curso` INT NOT NULL,
  `Inscripciones_id_inscripciones` INT NOT NULL,
  PRIMARY KEY (`id_curso`, `Cursos_id_curso`, `Inscripciones_id_inscripciones`),
  UNIQUE INDEX `id_curso_UNIQUE` (`id_curso` ASC) VISIBLE,
  UNIQUE INDEX `Matemáticas_UNIQUE` (`Matemáticas` ASC) VISIBLE,
  UNIQUE INDEX `Idioma Español_UNIQUE` (`Idioma Español` ASC) VISIBLE,
  UNIQUE INDEX `Computación_UNIQUE` (`Computación` ASC) VISIBLE,
  INDEX `fk_Cursos_Cursos1_idx` (`Cursos_id_curso` ASC) VISIBLE,
  INDEX `fk_Cursos_Inscripciones1_idx` (`Inscripciones_id_inscripciones` ASC) VISIBLE,
  CONSTRAINT `fk_Cursos_Cursos1`
    FOREIGN KEY (`Cursos_id_curso`)
    REFERENCES `mydb`.`Cursos` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cursos_Inscripciones1`
    FOREIGN KEY (`Inscripciones_id_inscripciones`)
    REFERENCES `mydb`.`Inscripciones` (`id_inscripciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
