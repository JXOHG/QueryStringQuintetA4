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
-- Table structure for table `performancetype`
--

DROP TABLE IF EXISTS `performancetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performancetype` (
  `PerformanceTypeID` int NOT NULL AUTO_INCREMENT,
  `ArtistID` int NOT NULL,
  `EventID` int NOT NULL,
  `Type` varchar(30) NOT NULL,
  PRIMARY KEY (`PerformanceTypeID`),
  UNIQUE KEY `PerformanceTypeID` (`PerformanceTypeID`),
  UNIQUE KEY `ArtistID` (`ArtistID`,`EventID`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `performancetype_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`SpotifyID`) ON DELETE CASCADE,
  CONSTRAINT `performancetype_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `liveevents` (`LiveEventID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performancetype`
--

LOCK TABLES `performancetype` WRITE;
/*!40000 ALTER TABLE `performancetype` DISABLE KEYS */;
INSERT INTO `performancetype` VALUES (1,1276,7,'Private Event'),(2,388,78,'Concert'),(3,528,90,'Artist Showcase'),(4,208,21,'Concert'),(5,946,76,'Private Event'),(6,515,14,'Private Event'),(7,314,43,'Rave'),(8,1181,31,'Rave'),(9,1261,4,'Concert'),(10,1493,61,'Artist Showcase'),(11,712,49,'Concert'),(12,322,22,'Tribute Performance'),(13,838,13,'Private Event'),(14,1054,10,'Rave'),(15,1574,50,'Artist Showcase'),(16,660,29,'Concert'),(17,1556,60,'Rave'),(18,1592,30,'Artist Showcase'),(19,1226,93,'Artist Showcase'),(20,1230,88,'Tribute Performance'),(21,362,20,'Rave'),(22,1454,95,'Artist Showcase'),(23,337,63,'Private Event'),(24,1263,6,'Rave'),(25,632,35,'Concert'),(26,1363,8,'Concert'),(27,1147,87,'Artist Showcase'),(28,1093,47,'Concert'),(29,881,2,'Concert'),(30,1428,54,'Private Event'),(31,1258,19,'Artist Showcase'),(32,1464,34,'Artist Showcase'),(33,1339,24,'Concert'),(34,125,80,'Concert'),(35,556,37,'Tribute Performance'),(36,1295,84,'Artist Showcase'),(37,358,96,'Private Event'),(38,823,41,'Rave'),(39,1231,25,'Tribute Performance'),(40,567,26,'Rave'),(41,704,71,'Artist Showcase'),(42,83,42,'Rave'),(43,988,99,'Rave'),(44,976,3,'Private Event'),(45,582,74,'Artist Showcase'),(46,1470,65,'Rave'),(47,920,57,'Rave'),(48,799,11,'Private Event'),(49,1599,77,'Artist Showcase'),(50,236,92,'Private Event'),(51,286,100,'Artist Showcase'),(52,967,27,'Rave'),(53,1191,59,'Tribute Performance'),(54,1076,39,'Private Event'),(55,1196,52,'Tribute Performance'),(56,1329,91,'Private Event'),(57,1302,1,'Concert'),(58,1424,28,'Artist Showcase'),(59,86,82,'Private Event'),(60,976,23,'Private Event'),(61,311,97,'Artist Showcase'),(62,232,36,'Artist Showcase'),(63,1024,32,'Rave'),(64,1227,33,'Concert'),(65,1029,75,'Concert'),(66,1179,12,'Artist Showcase'),(67,217,18,'Rave'),(68,1279,15,'Tribute Performance'),(69,153,9,'Concert'),(70,1143,17,'Concert'),(71,103,83,'Tribute Performance'),(72,1070,94,'Rave'),(73,510,48,'Tribute Performance'),(74,1419,38,'Tribute Performance'),(75,1152,44,'Rave'),(76,254,53,'Concert'),(77,445,64,'Artist Showcase'),(78,1600,66,'Private Event'),(79,385,16,'Tribute Performance'),(80,326,46,'Rave'),(81,345,67,'Artist Showcase'),(82,1466,79,'Rave'),(83,846,62,'Concert'),(84,264,89,'Artist Showcase'),(85,628,55,'Artist Showcase'),(86,439,98,'Concert'),(87,1279,72,'Private Event'),(88,60,68,'Tribute Performance'),(89,431,70,'Rave'),(90,37,73,'Rave'),(91,618,69,'Concert'),(92,305,51,'Tribute Performance'),(93,1311,40,'Private Event'),(94,278,56,'Concert'),(95,1162,86,'Private Event'),(96,1082,45,'Artist Showcase'),(97,1154,85,'Rave'),(98,406,5,'Tribute Performance'),(99,737,58,'Concert'),(100,1198,81,'Artist Showcase');
/*!40000 ALTER TABLE `performancetype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 12:11:39
