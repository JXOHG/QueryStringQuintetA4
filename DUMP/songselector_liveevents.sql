-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: songselector
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `liveevents`
--

DROP TABLE IF EXISTS `liveevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liveevents` (
  `LiveEventID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `HostArtistID` int DEFAULT NULL,
  `Location` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`LiveEventID`),
  UNIQUE KEY `LiveEventID` (`LiveEventID`),
  UNIQUE KEY `Name` (`Name`,`Date`),
  UNIQUE KEY `Date` (`Date`,`HostArtistID`,`Location`),
  KEY `HostArtistID` (`HostArtistID`),
  KEY `Location` (`Location`),
  CONSTRAINT `liveevents_ibfk_1` FOREIGN KEY (`HostArtistID`) REFERENCES `artist` (`SpotifyID`) ON DELETE SET NULL,
  CONSTRAINT `liveevents_ibfk_2` FOREIGN KEY (`Location`) REFERENCES `region` (`Country`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveevents`
--

LOCK TABLES `liveevents` WRITE;
/*!40000 ALTER TABLE `liveevents` DISABLE KEYS */;
INSERT INTO `liveevents` VALUES (1,'2020-08-25','Jam Session Gala',1302,'Iceland'),(2,'2024-05-05','Showcase Night',881,'Bulgaria'),(3,'2024-01-22','Showcase Mega Show',976,'Armenia'),(4,'2024-04-02','Music Night Gala',1261,'Kyrgyzstan'),(5,'2023-04-25','Festival Event',406,'Hungary'),(6,'2020-10-01','Gala Night',1263,'Saint Vincent and the Grenadines'),(7,'2022-01-21','Music Night Fiesta',1276,'Dominica'),(8,'2022-09-27','Extravaganza 2024',1363,'India'),(9,'2025-06-16','Concert Gala',153,'Sao Tome and Principe'),(10,'2022-01-09','Music Night 2024',1054,'Indonesia'),(11,'2025-01-05','Concert Fiesta',799,'Sri Lanka'),(12,'2020-12-05','Performance Live',1179,'Guinea Bissau'),(13,'2023-01-25','Jam Session Extravaganza',838,'Venezuela'),(14,'2025-08-10','Music Night Show',515,'Fiji'),(15,'2023-06-21','Showcase Bonanza',1279,'Kiribati'),(16,'2025-09-10','Performance 2024',385,'Malaysia'),(17,'2023-03-08','Recital 2024',1143,'Ethiopia'),(18,'2024-05-09','Showcase 2024',217,'India'),(19,'2022-07-16','Jam Session Fiesta',1258,'Lesotho'),(20,'2020-12-31','Extravaganza Mega Show',362,'Paraguay'),(21,'2025-07-09','Gala Bonanza',208,'Russian Federation'),(22,'2025-07-31','Symphony Night',322,'Hungary'),(23,'2023-02-16','Extravaganza Fiesta',976,'Cameroon'),(24,'2022-06-27','Music Night Night',1339,'Honduras'),(25,'2023-12-05','Festival Gala',1231,'Zimbabwe'),(26,'2020-07-25','Recital Fiesta',567,'Belgium'),(27,'2024-08-29','Festival Bonanza',967,'Eritrea'),(28,'2020-10-16','Festival 2024',1424,'Sri Lanka'),(29,'2024-08-15','Performance Event',660,'Guatemala'),(30,'2024-03-01','Jam Session Live',1592,'Fiji'),(31,'2021-11-26','Showcase Show',1181,'Sao Tome and Principe'),(32,'2021-12-18','Performance Gala',1024,'Romania'),(33,'2021-11-05','Concert 2024',1227,'Micronesia (Federated States of)'),(34,'2024-12-29','Gala Show',1464,'United States of America'),(35,'2024-12-09','Symphony Mega Show',632,'Kyrgyzstan'),(36,'2023-11-24','Recital Live',232,'Mozambique'),(37,'2022-07-28','Extravaganza Gala',556,'Portugal'),(38,'2025-04-18','Gala Extravaganza',1419,'Montenegro'),(39,'2022-01-14','Symphony Show',1076,'Tuvalu'),(40,'2022-04-07','Extravaganza Show',1311,'Central African Republic'),(41,'2022-04-01','Symphony Live',823,'Afghanistan'),(42,'2024-02-01','Symphony Gala',83,'Slovenia'),(43,'2021-06-23','Extravaganza Live',314,'Venezuela'),(44,'2022-09-02','Music Night Bonanza',1152,'Syrian Arab Republic'),(45,'2021-02-11','Gala Mega Show',1082,'Dem. People’s Republic of Korea'),(46,'2024-05-24','Recital Event',326,'Sudan'),(47,'2022-12-14','Music Night Mega Show',1093,'Saint Lucia'),(48,'2022-08-31','Jam Session Show',510,'Comoros'),(49,'2021-02-19','Recital Night',712,'Liechtenstein'),(50,'2023-01-29','Recital Gala',1574,'Dem. Republic of the Congo'),(51,'2025-12-07','Jam Session Bonanza',305,'Chad'),(52,'2025-06-24','Jam Session 2024',1196,'Russian Federation'),(53,'2022-07-16','Gala Live',254,'Dominica'),(54,'2025-01-11','Recital Mega Show',1428,'Central African Republic'),(55,'2024-05-28','Concert Event',628,'Central African Republic'),(56,'2021-01-21','Recital Bonanza',278,'Tajikistan'),(57,'2023-03-01','Symphony Bonanza',920,'Croatia'),(58,'2022-08-03','Music Night Event',737,'Seychelles'),(59,'2024-04-07','Showcase Extravaganza',1191,'Morocco'),(60,'2021-03-28','Symphony Fiesta',1556,'Solomon Islands'),(61,'2022-04-08','Performance Show',1493,'Malta'),(62,'2025-12-03','Concert Mega Show',846,'Switzerland'),(63,'2025-09-11','Showcase Gala',337,'Bulgaria'),(64,'2021-06-09','Performance Bonanza',445,'United Kingdom'),(65,'2021-02-11','Performance Mega Show',1470,'Dominican Republic'),(66,'2021-08-26','Symphony Event',1600,'Philippines'),(67,'2023-02-13','Extravaganza Night',345,'Guatemala'),(68,'2023-09-25','Festival Live',60,'Philippines'),(69,'2020-08-04','Performance Extravaganza',618,'Botswana'),(70,'2022-04-11','Festival Night',431,'Nauru'),(71,'2023-10-26','Concert Night',704,'New Zealand'),(72,'2024-07-23','Festival Fiesta',1279,'Antigua and Barbuda'),(73,'2022-06-10','Music Night Extravaganza',37,'Armenia'),(74,'2024-09-04','Festival Extravaganza',582,'Finland'),(75,'2021-03-06','Jam Session Night',1029,'South Sudan'),(76,'2024-02-16','Symphony Extravaganza',946,'United Republic of Tanzania'),(77,'2022-07-17','Showcase Event',1599,'Ethiopia'),(78,'2024-02-04','Concert Extravaganza',388,'Angola'),(79,'2021-05-10','Gala Event',1466,'Venezuela'),(80,'2024-10-21','Festival Show',125,'Mexico'),(81,'2023-01-18','Extravaganza Bonanza',1198,'Argentina'),(82,'2024-02-04','Gala Fiesta',86,'North Macedonia'),(83,'2022-07-03','Concert Show',103,'Nauru'),(84,'2022-10-04','Festival Mega Show',1295,'Cyprus'),(85,'2022-07-19','Gala Gala',1154,'South Africa'),(86,'2024-12-21','Recital Extravaganza',1162,'North Macedonia'),(87,'2025-10-27','Music Night Live',1147,'Afghanistan'),(88,'2023-05-18','Showcase Fiesta',1230,'Lesotho'),(89,'2024-04-02','Extravaganza Extravaganza',264,'Romania'),(90,'2023-09-19','Showcase Live',528,'Paraguay'),(91,'2022-09-22','Symphony 2024',1329,'Kiribati'),(92,'2023-07-31','Performance Fiesta',236,'Georgia'),(93,'2025-11-20','Performance Night',1226,'North Macedonia'),(94,'2025-03-03','Extravaganza Event',1070,'Nicaragua'),(95,'2022-04-19','Recital Show',1454,'Russian Federation'),(96,'2022-06-12','Jam Session Event',358,'Armenia'),(97,'2025-09-21','Jam Session Mega Show',311,'Chad'),(98,'2020-05-23','Concert Live',439,'Portugal'),(99,'2020-10-05','Gala 2024',988,'Timor-Leste'),(100,'2020-08-05','Concert Bonanza',286,'Angola');
/*!40000 ALTER TABLE `liveevents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 12:11:40
