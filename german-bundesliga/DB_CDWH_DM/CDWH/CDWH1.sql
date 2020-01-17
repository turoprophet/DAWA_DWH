-- Script for creating the CDWH schema

DROP DATABASE IF EXISTS dawa_cdwh;

CREATE DATABASE dawa_cdwh;

USE dawa_cdwh;

--
-- Table structure for table `Country`
--

CREATE TABLE `Country` (
  `countryName` varchar(45) NOT NULL
);

--
-- Table structure for table `Decades`
--

CREATE TABLE `Decades` (
  `idDecade` int(11) NOT NULL,
  `Decade` varchar(45)
);

--
-- Table structure for table `Division`
--

CREATE TABLE `Division` (
  `idDivision` int(11) NOT NULL,
  `Name` varchar(45)
);

--
-- Table structure for table `Match_results`
--

CREATE TABLE `Match_results` (
  `idMatch_results` int(11) NOT NULL,
  `idStadium` int(11) NOT NULL,
  `idTeam` int(11) NOT NULL,
  `idWeek` int(11) NOT NULL,
  `Goals` int(11),
  `Goals_Against` int(11),
  `numerGames` int(11),
  `Win` int(11),
  `Shots` int(11),
  `Shots_On_Target` int(11),
  `Red_Cards` int(11),
  `Yellow_Cards` int(11)
);

--
-- Table structure for table `Season`
--

CREATE TABLE `Season` (
  `idSeason` int(11) NOT NULL,
  `Season` varchar(45),
  `idDecade` int(11) NOT NULL
);

--
-- Table structure for table `Stadium`
--

CREATE TABLE `Stadium` (
  `idStadium` int(11) NOT NULL,
  `stateName` varchar(45) NOT NULL,
  `name` varchar(45),
  `teamName` varchar(45)
);

--
-- Table structure for table `State`
--

CREATE TABLE `State` (
  `stateName` varchar(45) NOT NULL,
  `countryName` varchar(45) NOT NULL
);

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `idTeam` int(11) NOT NULL,
  `Name` varchar(45),
  `idDivision` int(11) NOT NULL
);

--
-- Table structure for table `Week`
--

CREATE TABLE `Week` (
  `idWeek` int(11) NOT NULL,
  `idSeason` int(11) NOT NULL,
  `weekNum` int(1) NOT NULL
);