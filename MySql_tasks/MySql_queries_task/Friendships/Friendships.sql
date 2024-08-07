-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Friendships
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Friendships
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Friendships` DEFAULT CHARACTER SET utf8 ;
USE `Friendships` ;



-- -----------------------------------------------------
-- Table `Friendships`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Friendships`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fiest_name` VARCHAR(180) NULL,
  `last_name` VARCHAR(100) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Friendships`.`friendships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Friendships`.`friendships` (
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` VARCHAR(145) NULL,
  `updated_at` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_has_users_users2_idx` (`friend_id` ASC) VISIBLE,
  INDEX `fk_users_has_users_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Friendships`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_users_users2`
    FOREIGN KEY (`friend_id`)
    REFERENCES `Friendships`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

select * from users;
-- create 6 users
INSERT INTO `friendships`.`users` (`fiest_name`, `last_name`, `created_at`, `updated_at`) VALUES ('Mitri', 'khoury', now(), now()),
('tareq', 'eid', now(), now()) ,
('ahmad', 'eid', now(), now()),
('yazan', 'emad', now(), now()),
('jawdat', 'khoury', now(), now()),
('samer', 'ahmad', now(), now());
-- Have user 1 be friends with user 2, 4 and 6
select * from friendships;
INSERT INTO `friendships`.`friendships` (`user_id`, `friend_id`, `created_at`, `updated_at`) VALUES ('1', '2', now(), now()) ,
('1', '4', now(), now()),
('1', '6', now(), now());
-- Have user 2 be friends with user 1, 3 and 5
INSERT INTO `friendships`.`friendships` (`user_id`, `friend_id`, `created_at`, `updated_at`) VALUES ('2', '1', now(), now()) ,
('2', '3', now(), now()),
('2', '5', now(), now());
-- Have user 3 be friends with user 2 and 5
INSERT INTO `friendships`.`friendships` (`user_id`, `friend_id`, `created_at`, `updated_at`) VALUES ('3', '2', now(), now()) ,
('3', '5', now(), now());

-- Have user 4 be friends with user 3
INSERT INTO `friendships`.`friendships` (`user_id`, `friend_id`, `created_at`, `updated_at`) VALUES ('4', '3', now(), now());

-- Have user 5 be friends with user 1 and 6
INSERT INTO `friendships`.`friendships` (`user_id`, `friend_id`, `created_at`, `updated_at`) VALUES ('5', '1', now(), now()) ,
('5', '6', now(), now());
-- Have user 6 be friends with user 2 and 3
INSERT INTO `friendships`.`friendships` (`user_id`, `friend_id`, `created_at`, `updated_at`) VALUES ('6', '2', now(), now()) ,
('6', '3', now(), now());
-- Display the relationships create as shown in the above image
SELECT u1.fiest_name AS first_name,
u1.last_name AS last_name,
u2.fiest_name AS friend_first_name,
u2.last_name AS friend_last_name
FROM friendships f
JOIN users u1 ON f.user_id = u1.id
JOIN users u2 ON f.friend_id = u2.id;

--  Return all users who are friends with the first user, make sure their names are displayed in results.
SELECT u1.fiest_name AS first_name,
u1.last_name AS last_name,
u2.fiest_name AS friend_first_name,
u2.last_name AS friend_last_name
FROM friendships f
JOIN users u1 ON f.user_id = u1.id
JOIN users u2 ON f.friend_id = u2.id
where u1.id=1;
-- NINJA Query: Return the count of all friendships
select count(*) as count from friendships;
-- Find out who has the most friends and return the count of their friends.
SELECT u.fiest_name,u.last_name,
COUNT(f.friend_id) AS friend_count
FROM friendships f
JOIN users u ON f.user_id = u.id
GROUP BY u.id
ORDER BY friend_count DESC
LIMIT 1; -- there are two users have te maximum friends ,, i get the first one in order hahaah
-- Return the friends of the third user in alphabetical order
SELECT u1.fiest_name AS first_name,
u1.last_name AS last_name,
u2.fiest_name AS friend_first_name,
u2.last_name AS friend_last_name
FROM friendships f
JOIN users u1 ON f.user_id = u1.id
JOIN users u2 ON f.friend_id = u2.id
where u1.id=3
ORDER BY u2.fiest_name ASC, u2.last_name ASC;