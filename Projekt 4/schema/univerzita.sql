-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: db
-- Vytvořeno: Ned 16. čen 2024, 19:57
-- Verze serveru: 8.3.0
-- Verze PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `db`
--
CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Struktura tabulky `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `student_number` varchar(20) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  KEY `student_number` (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `address`
--

INSERT INTO `address` (`student_number`, `street`, `city`, `zip_code`) VALUES
('F22111', 'Náměstí Míru', 'Ústí nad Labem', '60200'),
('F22112', 'Masarykova', 'Praha', '11000'),
('F22113', 'Květná', 'Brno', '60200'),
('F22114', 'Tyršova', 'Ostrava', '70200'),
('F22115', 'Husova', 'Plzeň', '30100');

-- --------------------------------------------------------

--
-- Struktura tabulky `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_code` varchar(10) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `credits` int NOT NULL,
  PRIMARY KEY (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `course`
--

INSERT INTO `course` (`course_code`, `course_name`, `credits`) VALUES
('BIO', 'Biologie', 3),
('FYZ', 'Fyzika 1', 4),
('MAT', 'Matematika 1', 5),
('PRI', 'Programování pro internet', 4),
('ZEK', 'Základy ekonomie', 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `faculty` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `student`
--

INSERT INTO `student` (`student_number`, `first_name`, `last_name`, `faculty`, `email`) VALUES
('F22111', 'Jan', 'Novák', 'Přírodovědecká fakulta', 'jan.novak@gmail.com'),
('F22112', 'Petr', 'Svoboda', 'Filozofická fakulta', 'petr.svoboda@gmail.com'),
('F22113', 'Eva', 'Malá', 'Pedagogická fakulta', 'eva.mala@gmail.com'),
('F22114', 'Lucie', 'Králová', 'Lékařská fakulta', 'lucie.kralova@gmail.com'),
('F22115', 'Karel', 'Novotný', 'Právnická fakulta', 'karel.novotny@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabulky `student_course`
--

DROP TABLE IF EXISTS `student_course`;
CREATE TABLE IF NOT EXISTS `student_course` (
  `student_number` varchar(20) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  PRIMARY KEY (`student_number`,`course_code`),
  KEY `course_code` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `student_course`
--

INSERT INTO `student_course` (`student_number`, `course_code`) VALUES
('F22112', 'BIO'),
('F22115', 'BIO'),
('F22113', 'FYZ'),
('F22115', 'FYZ'),
('F22112', 'MAT'),
('F22114', 'MAT'),
('F22111', 'PRI'),
('F22114', 'PRI'),
('F22111', 'ZEK'),
('F22113', 'ZEK');

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`);

--
-- Omezení pro tabulku `student_course`
--
ALTER TABLE `student_course`
  ADD CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`),
  ADD CONSTRAINT `student_course_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
