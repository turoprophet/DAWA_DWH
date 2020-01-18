-- Script for creating the DM schema

DROP DATABASE IF EXISTS dawa_dm;

CREATE DATABASE dawa_dm;

USE dawa_dm;

--
-- Table structure for table `Location_DataMart`
--

CREATE TABLE `Location_DataMart` (
  `idPlace` int(11) NOT NULL,
  `stadiumName` varchar(45) NOT NULL,
  `stateName` varchar(45) NOT NULL,
  `countryName` varchar(45) NOT NULL,
  `teamName` varchar(45) NOT NULL
);

--
-- Table structure for table `Match_results_DataMart`
--

CREATE TABLE `Match_results_DataMart` (
  `idMatch_results` int(11) NOT NULL,
  `idPlace` int(11) NOT NULL,
  `idTeam` int(11) NOT NULL,
  `idTime` int(11) NOT NULL,
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
-- Table structure for table `Team_DataMart`
--

CREATE TABLE `Team_DataMart` (
  `idTeam` int(11) NOT NULL,
  `name` varchar(45),
  `divisionName` varchar(45)  
);

--
-- Table structure for table `Time_DataMart`
--

CREATE TABLE `Time_DataMart` (
  `idTime` int(11) NOT NULL,
  `weekNum` int(11) NOT NULL,
  `seasonName` varchar(45) NOT NULL,
  `decadeName` varchar(45) NOT NULL
);