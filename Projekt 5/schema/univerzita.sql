-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: database
-- Vytvořeno: Pon 17. čen 2024, 08:46
-- Verze serveru: 8.3.0
-- Verze PHP: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `univerzita`
--
CREATE DATABASE IF NOT EXISTS `univerzita` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `univerzita`;

-- --------------------------------------------------------

--
-- Struktura tabulky `Fakulta`
--

DROP TABLE IF EXISTS `Fakulta`;
CREATE TABLE `Fakulta` (
  `id` int NOT NULL,
  `nazev` varchar(255) NOT NULL,
  `dekan_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Fakulta`
--

INSERT INTO `Fakulta` (`id`, `nazev`, `dekan_id`) VALUES
(1, 'Fakulta Informatiky', 1),
(2, 'Fakulta Ekonomická', 2),
(3, 'Fakulta Přírodovědecká', 3),
(4, 'Fakulta Humanitních Studií', 4),
(5, 'Fakulta Stavební', 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `Katedra`
--

DROP TABLE IF EXISTS `Katedra`;
CREATE TABLE `Katedra` (
  `id` int NOT NULL,
  `fakulta_id` int DEFAULT NULL,
  `zkratka` varchar(20) NOT NULL,
  `vedouci_id` int DEFAULT NULL,
  `webove_stranky` varchar(255) DEFAULT 'https://www.ujep.cz/cs/'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Katedra`
--

INSERT INTO `Katedra` (`id`, `fakulta_id`, `zkratka`, `vedouci_id`, `webove_stranky`) VALUES
(1, 1, 'KIT', 1, 'https://www.ujep.cz/cs/kit'),
(2, 2, 'KEK', 2, 'https://www.ujep.cz/cs/kek'),
(3, 3, 'KBF', 3, 'https://www.ujep.cz/cs/kbf'),
(4, 4, 'KHS', 4, 'https://www.ujep.cz/cs/khs'),
(5, 5, 'KST', 5, 'https://www.ujep.cz/cs/kst');

-- --------------------------------------------------------

--
-- Struktura tabulky `Osoba`
--

DROP TABLE IF EXISTS `Osoba`;
CREATE TABLE `Osoba` (
  `id` int NOT NULL,
  `jmeno` varchar(255) NOT NULL,
  `prijmeni` varchar(255) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Osoba`
--

INSERT INTO `Osoba` (`id`, `jmeno`, `prijmeni`, `telefon`, `email`) VALUES
(1, 'Jan', 'Novák', '123456789', 'jan.novak@example.com'),
(2, 'Petr', 'Svoboda', '234567890', 'petr.svoboda@example.com'),
(3, 'Eva', 'Kučerová', '345678901', 'eva.kucerova@example.com'),
(4, 'Karel', 'Dvořák', '456789012', 'karel.dvorak@example.com'),
(5, 'Marta', 'Kovářová', '567890123', 'marta.kovarova@example.com');

-- --------------------------------------------------------

--
-- Struktura tabulky `Pozice`
--

DROP TABLE IF EXISTS `Pozice`;
CREATE TABLE `Pozice` (
  `id` int NOT NULL,
  `nazev` varchar(255) NOT NULL,
  `zamestnanec_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Pozice`
--

INSERT INTO `Pozice` (`id`, `nazev`, `zamestnanec_id`) VALUES
(1, 'profesor', 1),
(2, 'docent', 2),
(3, 'odborný_asistent', 3),
(4, 'asistent', 4),
(5, 'lektor', 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `Predmet`
--

DROP TABLE IF EXISTS `Predmet`;
CREATE TABLE `Predmet` (
  `id` int NOT NULL,
  `zkratka` varchar(20) NOT NULL,
  `nazev` varchar(255) NOT NULL,
  `popis` text,
  `typ` enum('přednáška','seminář','cvičení','kombinované') DEFAULT 'kombinované',
  `katedra_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Predmet`
--

INSERT INTO `Predmet` (`id`, `zkratka`, `nazev`, `popis`, `typ`, `katedra_id`) VALUES
(1, 'INF101', 'Úvod do programování', 'Základní kurz programování v jazyce C.', 'přednáška', 1),
(2, 'EKON201', 'Ekonomie 101', 'Úvod do ekonomie.', 'seminář', 2),
(3, 'BIO301', 'Mikrobiologie', 'Pokročilá mikrobiologie.', 'cvičení', 3),
(4, 'HUM401', 'Sociologie', 'Úvod do sociologie.', 'kombinované', 4),
(5, 'STAV501', 'Stavební technologie', 'Přehled stavebních technologií.', 'přednáška', 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `Zamestnanec`
--

DROP TABLE IF EXISTS `Zamestnanec`;
CREATE TABLE `Zamestnanec` (
  `id` int NOT NULL,
  `jmeno` varchar(255) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `katedra_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Zamestnanec`
--

INSERT INTO `Zamestnanec` (`id`, `jmeno`, `telefon`, `email`, `katedra_id`) VALUES
(1, 'Michal', '654321098', 'michal@example.com', 1),
(2, 'Lucie', '765432109', 'lucie@example.com', 2),
(3, 'Tomáš', '876543210', 'tomas@example.com', 3),
(4, 'Jana', '987654321', 'jana@example.com', 4),
(5, 'Pavel', '098765432', 'pavel@example.com', 5);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `Fakulta`
--
ALTER TABLE `Fakulta`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `Katedra`
--
ALTER TABLE `Katedra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fakulta_id` (`fakulta_id`),
  ADD KEY `vedouci_id` (`vedouci_id`);

--
-- Indexy pro tabulku `Osoba`
--
ALTER TABLE `Osoba`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `Pozice`
--
ALTER TABLE `Pozice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zamestnanec_id` (`zamestnanec_id`);

--
-- Indexy pro tabulku `Predmet`
--
ALTER TABLE `Predmet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `katedra_id` (`katedra_id`);

--
-- Indexy pro tabulku `Zamestnanec`
--
ALTER TABLE `Zamestnanec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `katedra_id` (`katedra_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `Fakulta`
--
ALTER TABLE `Fakulta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `Katedra`
--
ALTER TABLE `Katedra`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `Osoba`
--
ALTER TABLE `Osoba`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `Pozice`
--
ALTER TABLE `Pozice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `Predmet`
--
ALTER TABLE `Predmet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `Zamestnanec`
--
ALTER TABLE `Zamestnanec`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `Katedra`
--
ALTER TABLE `Katedra`
  ADD CONSTRAINT `Katedra_ibfk_1` FOREIGN KEY (`fakulta_id`) REFERENCES `Fakulta` (`id`),
  ADD CONSTRAINT `Katedra_ibfk_2` FOREIGN KEY (`vedouci_id`) REFERENCES `Osoba` (`id`);

--
-- Omezení pro tabulku `Pozice`
--
ALTER TABLE `Pozice`
  ADD CONSTRAINT `Pozice_ibfk_1` FOREIGN KEY (`zamestnanec_id`) REFERENCES `Zamestnanec` (`id`);

--
-- Omezení pro tabulku `Predmet`
--
ALTER TABLE `Predmet`
  ADD CONSTRAINT `Predmet_ibfk_1` FOREIGN KEY (`katedra_id`) REFERENCES `Katedra` (`id`);

--
-- Omezení pro tabulku `Zamestnanec`
--
ALTER TABLE `Zamestnanec`
  ADD CONSTRAINT `Zamestnanec_ibfk_1` FOREIGN KEY (`katedra_id`) REFERENCES `Katedra` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
