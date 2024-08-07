-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Dojos and Ninjas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Dojos and Ninjas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Dojos and Ninjas` DEFAULT CHARACTER SET utf8 ;
USE `Dojos and Ninjas` ;

-- -----------------------------------------------------
-- Table `Dojos and Ninjas`.`dojos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dojos and Ninjas`.`dojos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Dojos and Ninjas`.`ninjas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dojos and Ninjas`.`ninjas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `dojo_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ninjas_dojos1_idx` (`dojo_id` ASC) VISIBLE,
  CONSTRAINT `fk_ninjas_dojos1`
    FOREIGN KEY (`dojo_id`)
    REFERENCES `mydb`.`dojos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

select * from dojos;
-- Create 3 new dojos
INSERT INTO `dojos and ninjas`.`dojos` (`name`, `created_at`, `updated_at`) VALUES ('dojo1', now(), now()),
('dojo2', now(), now()),('dojo3', now(), now());
-- Delete the 3 dojos you just created
delete from dojos;
SET SQL_SAFE_UPDATES = 0; 
-- Create 3 more dojos  .,,, excute the frst querie
-- Create 3 ninjas that belong to the first dojo
select * from ninjas;
INSERT INTO `dojos and ninjas`.`ninjas` (`first_name`, `last_name`, `age`, `dojo_id`, `created_at`, `updated_at`) VALUES ('ninja1', 'h', '20', '1', now(), now()),
('ninja2', 'r', '19', '1', now(), now()),
('ninja3', 'e', '28', '1', now(), now());
-- Create 3 ninjas that belong to the second dojo
INSERT INTO `dojos and ninjas`.`ninjas` (`first_name`, `last_name`, `age`, `dojo_id`, `created_at`, `updated_at`) VALUES ('ninja1', 'i', '21', '2', now(), now()),
('ninja2', 'k', '23', '2', now(), now()),
('ninja3', 'c', '18', '2', now(), now());
-- Create 3 ninjas that belong to the third dojo
INSERT INTO `dojos and ninjas`.`ninjas` (`first_name`, `last_name`, `age`, `dojo_id`, `created_at`, `updated_at`) VALUES ('ninja1', 'g', '22', '3', now(), now()),
('ninja2', 'q', '26', '3', now(), now()),
('ninja3', 'y', '25', '3', now(), now());
-- Retrieve all the ninjas from the first dojo
select * from ninjas where dojo_id=1;
-- Retrieve all the ninjas from the last dojo
select * from ninjas where dojo_id=3;
-- Retrieve the last ninja's dojo 
select * from ninjas where dojo_id=3;
-- 