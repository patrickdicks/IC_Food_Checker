--
--  Author: Patrick Dicks
--  Title: IC Food Checker
--  Objectives: 
--      Create database
--      Write CREATE queries to build tables
--      Write INSERT queries to populate tables with data from ICN food list
--      Write SELECT queries to return foods appearing from the ICN food list with information about their bladder-friendliness rating
--  License: MIT
--  food_db.sql
--

DROP TABLE IF EXISTS `user` CASCADE;
DROP TABLE IF EXISTS `food` CASCADE;
DROP TABLE IF EXISTS `votes` CASCADE;

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
    `userId` int(11) NOT NULL AUTO_INCREMENT,
    `userName` varchar(20) NOT NULL,
    `loginStatus` boolean,
    `email` varchar(50) NOT NULL,
    `password` varchar(200) NOT NULL,
    `salt` varchar(16) NOT NULL,
    `birthDate` date,
    `registerDate` TIMESTAMP,
    `lastLogin` date,
    `admin` boolean DEFAULT 0,
    PRIMARY KEY (`userId`),
    UNIQUE (`email`),
    UNIQUE (`userName`)
) ENGINE=Innodb;

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
    `voteId` int(11) NOT NULL AUTO_INCREMENT,
    `foodStatusName` varchar(255) NOT NULL,
    `numVotes` int(11),
    `lastUpdated` date,
    PRIMARY KEY (`voteId`)
) ENGINE=Innodb;

--
-- Table structure for table `food`
--

CREATE TABLE IF NOT EXISTS `food` (
    `foodId` int(11) NOT NULL AUTO_INCREMENT,
    `foodName` varchar(255) NOT NULL,
    `comfortRating` tinyint(5) NOT NULL,
    `origin` varchar(50) NOT NULL,
    `voteFriendly` int(11) DEFAULT NULL,
    `voteAvoid` int(11) DEFAULT NULL,
    `voteTry`int(11) DEFAULT NULL,
    PRIMARY KEY (`foodId`),
    FOREIGN KEY (`voteFriendly`) REFERENCES `votes` (`voteId`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`voteAvoid`) REFERENCES `votes` (`voteId`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`voteTry`) REFERENCES `votes` (`voteId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=Innodb;