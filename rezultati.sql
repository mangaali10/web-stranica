-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 19, 2026 at 02:19 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rezultati`
--

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
CREATE TABLE IF NOT EXISTS `coach` (
  `CoachID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `ExperienceLevel` varchar(40) DEFAULT NULL,
  `PreferredFormation` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CoachID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `gameID` int NOT NULL AUTO_INCREMENT,
  `TeamID` int DEFAULT NULL,
  `Opponent` varchar(40) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Result` varchar(40) DEFAULT NULL,
  `FormationUsed` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`gameID`),
  KEY `TeamID` (`TeamID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `E-mail` varchar(100) NOT NULL,
  `Sifra` varchar(255) NOT NULL,
  `Ime` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `PlayerID` int NOT NULL AUTO_INCREMENT,
  `TeamID` int DEFAULT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Position` varchar(40) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `SkillRating` varchar(40) DEFAULT NULL,
  `FitnessLevel` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `TeamID` (`TeamID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tacticalrecommendation`
--

DROP TABLE IF EXISTS `tacticalrecommendation`;
CREATE TABLE IF NOT EXISTS `tacticalrecommendation` (
  `RecommendationID` int NOT NULL AUTO_INCREMENT,
  `gameID` int DEFAULT NULL,
  `SuggestedFormation` varchar(40) DEFAULT NULL,
  `PlayingStyle` varchar(40) DEFAULT NULL,
  `DefensiveStrategy` varchar(40) DEFAULT NULL,
  `ConfidenceScore` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`RecommendationID`),
  KEY `gameID` (`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `TeamID` int NOT NULL AUTO_INCREMENT,
  `CoachID` int DEFAULT NULL,
  `TeamName` varchar(40) DEFAULT NULL,
  `League` varchar(40) DEFAULT NULL,
  `Season` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `CoachID` (`CoachID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainingsession`
--

DROP TABLE IF EXISTS `trainingsession`;
CREATE TABLE IF NOT EXISTS `trainingsession` (
  `SessionID` int NOT NULL AUTO_INCREMENT,
  `TeamID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `FocusArea` varchar(40) DEFAULT NULL,
  `Duration` datetime DEFAULT NULL,
  `IntensityLevel` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SessionID`),
  KEY `TeamID` (`TeamID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
