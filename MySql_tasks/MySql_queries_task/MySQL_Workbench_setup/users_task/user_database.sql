-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema user_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema user_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `user_database` DEFAULT CHARACTER SET utf8 ;
USE `user_database` ;

-- -----------------------------------------------------
-- Table `user_database`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_database`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Query: Create 3 new users
INSERT INTO `user_database`.`users` ( `first_name`, `last_name`, `email`, `created_at`, `updated_at`) VALUES ('Mitri', 'khoury', 'mitri@gmail.com', now(),now()),
('ahmad', 'eid', 'ahmad@gmail.com', now(),now()), ('yazan', 'emad', 'yazan@gmail.com', now(),now());
-- Retrieve all the users
select * from users;
--  Retrieve the first user using their email address
select * from users where email='mitri@gmail.com';
-- Retrieve the last user using their id
select * from users where id=3;
-- Change the user with id=3 so their last name is Pancakes
UPDATE users SET `last_name` = 'Pancakes' WHERE (`id` = '3');
-- Delete the user with id=2 from the database
delete from users where id=2;
--  Get all the users, sorted by their first name
select * from users order by first_name;
--  Get all the users, sorted by their first name in descending order
select * from users order by first_name desc;