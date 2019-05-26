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
-- Table structure for table `mh_event`
--

DROP TABLE IF EXISTS `mh_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mh_event` (
  `EVENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_TITLE` varchar(45) DEFAULT NULL,
  `EVENT_CONTENT` varchar(2000) DEFAULT NULL,
  `EVENT_START_DT` date DEFAULT NULL,
  `EVENT_END_DT` date DEFAULT NULL,
  `USER_ID` varchar(45) DEFAULT NULL,
  `USER_NAME` varchar(45) DEFAULT NULL,
  `ATTACH_PATH` varchar(45) DEFAULT NULL,
  `ATTACH_NAME` varchar(45) DEFAULT NULL,
  `WRITE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mh_event`
--

LOCK TABLES `mh_event` WRITE;
/*!40000 ALTER TABLE `mh_event` DISABLE KEYS */;
INSERT INTO `mh_event` VALUES (1,'TEST 이벤트1','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:22','2019-05-06 16:01:22'),(2,'TEST 이벤트2','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:24','2019-05-06 16:01:24'),(3,'TEST 이벤트3','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:26','2019-05-06 16:01:26'),(4,'TEST 이벤트4','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:27','2019-05-06 16:01:27'),(5,'TEST 이벤트5','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:29','2019-05-06 16:01:29'),(6,'TEST 이벤트6','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:30','2019-05-06 16:01:30'),(7,'TEST 이벤트6','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:45','2019-05-06 16:01:45'),(8,'TEST 이벤트7','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:47','2019-05-06 16:01:47'),(9,'TEST 이벤트8','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:48','2019-05-06 16:01:48'),(10,'TEST 이벤트9','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:50','2019-05-06 16:01:50'),(11,'TEST 이벤트10','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:52','2019-05-06 16:01:52'),(12,'TEST 이벤트11','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:53','2019-05-06 16:01:53'),(13,'TEST 이벤트12','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:55','2019-05-06 16:01:55'),(14,'TEST 이벤트13','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:56','2019-05-06 16:01:56'),(15,'TEST 이벤트14','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:01:58','2019-05-06 16:01:58'),(16,'TEST 이벤트15','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:02:00','2019-05-06 16:02:00'),(17,'TEST 이벤트16','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:02:02','2019-05-06 16:02:02'),(18,'TEST 이벤트17','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:02:03','2019-05-06 16:02:03'),(19,'TEST 이벤트18','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:02:05','2019-05-06 16:02:05'),(20,'TEST 이벤트19','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:02:07','2019-05-06 16:02:07'),(21,'TEST 이벤트20','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:02:08','2019-05-06 16:02:08'),(22,'TEST 이벤트21','TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 TEST 컨텐트 ','2019-05-06','2019-05-06','wnghks1357@naver.com','장주환',NULL,NULL,'2019-05-06 16:02:10','2019-05-06 16:02:10');
/*!40000 ALTER TABLE `mh_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-26 13:33:49
