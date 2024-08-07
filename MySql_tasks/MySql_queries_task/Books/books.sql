-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Books` DEFAULT CHARACTER SET utf8 ;
USE `Books` ;


-- -----------------------------------------------------
-- Table `Books`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `num_of_pages` INT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`favorites` (
  `authors_id` INT NOT NULL,
  `books_id` INT NOT NULL,
  INDEX `fk_authors_has_books_books1_idx` (`books_id` ASC) VISIBLE,
  INDEX `fk_authors_has_books_authors1_idx` (`authors_id` ASC) VISIBLE,
  PRIMARY KEY (`authors_id`, `books_id`),
  CONSTRAINT `fk_authors_has_books_authors1`
    FOREIGN KEY (`authors_id`)
    REFERENCES `Books`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_authors_has_books_books1`
    FOREIGN KEY (`books_id`)
    REFERENCES `Books`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


select * from authors;
-- Query: Create 5 different authors: Jane Austen, Emily Dickinson, Fyodor Dostoevsky, William Shakespeare, Lau Tzu
INSERT INTO `books`.`authors` (`name`, `created_at`, `updated_at`) VALUES ('Jane Austen', now(), now()),
('Emily Dickinson', now(), now()),
('Fyodor Dostoevsky', now(), now()),
('William Shakespeare', now(), now()),
('Lau Tzu', now(), now());

--  Create 5 books with the following names: C Sharp, Java, Python, PHP, Ruby
select * from books;
INSERT INTO `books`.`books` (`title`, `num_of_pages`, `created_at`, `updated_at`) VALUES ('C Sharp', '360', now(), now()),
('java', '789', now(), now()),
('python', '560', now(), now()),
('PHP', '840', now(), now()),
('Ruby', '666', now(), now());

-- Query: Change the name of the C Sharp book to C#
update books set title = 'c#' where title='C Sharp';
--  Change the first name of the 4th author to Bill
update authors set name = 'Bill' where id =4;
-- Have the first author favorite the first 2 books
select * from favorites;
INSERT INTO `books`.`favorites` (`authors_id`, `books_id`) VALUES ('1', '1') ,('1', '2');
-- Have the second author favorite the first 3 books
INSERT INTO `books`.`favorites` (`authors_id`, `books_id`) VALUES ('2', '1') ,('2', '2'),('2','3');

-- Have the third author favorite the first 4 books
INSERT INTO `books`.`favorites` (`authors_id`, `books_id`) VALUES ('3', '1') ,('3', '2'),('3', '3'),('3', '4');

-- Have the fourth author favorite all the books
INSERT INTO `books`.`favorites` (`authors_id`, `books_id`) VALUES ('4', '1') ,('4', '2'),('4', '3'),('4', '4'),('4','5');

-- Retrieve all the authors who favorited the 3rd book
SELECT a.name
FROM Books.authors a
JOIN Books.favorites f ON a.id = f.authors_id
WHERE f.books_id = 3;
-- Remove the first author of the 3rd book's favorites
DELETE FROM Books.favorites
WHERE authors_id = (
    SELECT authors_id
    FROM Books.favorites
    WHERE books_id = 3
    ORDER BY authors_id
    LIMIT 1
);
select * from favorites;
-- Add the 5th author as an other who favorited the 2nd book 
INSERT INTO Books.favorites (authors_id, books_id) VALUES (5, 2);
-- Find all the books that the 3rd author favorited
SELECT b.title
FROM Books.books b
JOIN Books.favorites f ON b.id = f.books_id
WHERE f.authors_id = 3;
-- Find all the authors that favorited to the 5th book
SELECT a.name
FROM Books.authors a
JOIN Books.favorites f ON a.id = f.authors_id
WHERE f.books_id = 5;
