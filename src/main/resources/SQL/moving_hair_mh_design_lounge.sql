-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: moving_hair
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mh_design_lounge`
--

DROP TABLE IF EXISTS `mh_design_lounge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mh_design_lounge` (
  `USER_ID` varchar(30) NOT NULL,
  `ADDR1` varchar(45) DEFAULT NULL,
  `ADDR2` varchar(45) DEFAULT NULL,
  `ADDR3` varchar(45) DEFAULT NULL,
  `ADDR4` varchar(45) DEFAULT NULL,
  `ADDR5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `mh_design_lounge_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `mh_user` (`USER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mh_design_lounge`
--

LOCK TABLES `mh_design_lounge` WRITE;
/*!40000 ALTER TABLE `mh_design_lounge` DISABLE KEYS */;
INSERT INTO `mh_design_lounge` VALUES ('wnghks1357','서울특별시 양천구 신정동','서울특별시 구로구 신도림동','서울특별시 구로구 고척동',NULL,NULL);
/*!40000 ALTER TABLE `mh_design_lounge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-26 13:33:48
