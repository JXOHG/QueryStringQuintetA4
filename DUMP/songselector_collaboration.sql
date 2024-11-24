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
-- Table structure for table `collaboration`
--

DROP TABLE IF EXISTS `collaboration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collaboration` (
  `CollaborationID` int NOT NULL AUTO_INCREMENT,
  `ISRCCode` int NOT NULL,
  `ArtistID` int NOT NULL,
  `Type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CollaborationID`),
  UNIQUE KEY `CollaborationID` (`CollaborationID`),
  UNIQUE KEY `ISRCCode` (`ISRCCode`,`ArtistID`),
  KEY `ArtistID` (`ArtistID`),
  CONSTRAINT `collaboration_ibfk_1` FOREIGN KEY (`ISRCCode`) REFERENCES `song` (`ISRCCode`) ON DELETE CASCADE,
  CONSTRAINT `collaboration_ibfk_2` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`SpotifyID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaboration`
--

LOCK TABLES `collaboration` WRITE;
/*!40000 ALTER TABLE `collaboration` DISABLE KEYS */;
INSERT INTO `collaboration` VALUES (1,317,81,'Featured'),(2,4178,1051,'Cover'),(3,2939,730,'Collaboration'),(4,2227,550,'Remix'),(5,5129,1281,'Cover'),(6,4351,1097,'Sample'),(7,6232,1547,'Collaboration'),(9,2043,496,'Featured'),(10,4803,1200,'Production'),(11,2982,743,'Featured'),(13,2709,672,'Featured'),(14,754,189,'Featured'),(15,1425,339,'Collaboration'),(16,6202,1542,'Remix'),(17,781,196,'Collaboration'),(18,3708,923,'Production'),(19,4116,1033,'Sample'),(20,1118,277,'Sample'),(21,3144,777,'Cover'),(22,1779,430,'Remix'),(23,5343,1336,'Collaboration'),(24,529,134,'Cover'),(25,5443,1361,'Cover'),(26,4855,1218,'Collaboration'),(28,5811,1438,'Collaboration'),(29,1439,342,'Featured'),(30,6189,1539,'Production'),(31,554,140,'Remix'),(32,4413,1113,'Cover'),(33,4817,1207,'Remix'),(34,3568,887,'Cover'),(35,5016,1261,'Featured'),(36,753,189,'Remix'),(37,4808,1202,'Remix'),(38,634,160,'Remix'),(39,4431,1115,'Collaboration'),(40,3264,805,'Cover'),(41,4117,1033,'Production'),(42,1069,261,'Featured'),(43,3825,953,'Cover'),(44,3740,933,'Production'),(45,4945,1242,'Production'),(46,5164,1288,'Collaboration'),(47,2230,550,'Remix'),(48,5489,1373,'Cover'),(49,1650,399,'Cover'),(50,5275,1319,'Cover'),(51,6083,1512,'Featured'),(52,4372,1101,'Remix'),(53,1877,455,'Sample'),(54,1455,346,'Production'),(55,137,36,'Cover'),(56,4163,1049,'Remix'),(57,2622,651,'Featured'),(58,339,86,'Featured'),(59,1185,288,'Cover'),(60,5217,1303,'Cover'),(61,3183,787,'Cover'),(62,4325,1086,'Cover'),(63,1488,360,'Sample'),(64,1732,416,'Collaboration'),(65,5148,1285,'Sample'),(66,3989,996,'Featured'),(67,1059,260,'Featured'),(68,912,230,'Production'),(69,1889,458,'Featured'),(70,5049,1267,'Remix'),(71,4544,1143,'Collaboration'),(72,2204,542,'Featured'),(73,3631,905,'Featured'),(74,1676,402,'Remix'),(75,3272,809,'Featured'),(76,942,236,'Sample'),(77,1681,403,'Cover'),(78,3222,795,'Featured'),(79,4127,1036,'Cover'),(80,3637,907,'Remix'),(81,5427,1357,'Remix'),(82,5145,1285,'Cover'),(83,4642,1171,'Sample'),(84,242,60,'Cover'),(85,503,131,'Collaboration'),(86,752,189,'Production'),(87,3288,813,'Collaboration'),(88,2993,745,'Remix'),(89,5880,1463,'Cover'),(90,100,26,'Remix'),(91,4373,1101,'Sample'),(92,5139,1284,'Cover'),(93,6163,1533,'Collaboration'),(94,910,229,'Collaboration'),(95,891,225,'Sample'),(96,675,174,'Cover'),(97,6119,1520,'Collaboration'),(98,4894,1230,'Collaboration'),(99,3827,953,'Collaboration'),(100,5464,1369,'Remix'),(101,4640,1169,'Remix'),(102,4657,1173,'Collaboration'),(103,3845,960,'Cover'),(104,3753,936,'Collaboration'),(105,420,110,'Collaboration'),(107,6178,1535,'Featured'),(108,4716,1186,'Cover'),(109,271,68,'Sample'),(110,3021,751,'Remix'),(111,1649,397,'Cover'),(112,5120,1280,'Cover'),(113,6253,1555,'Cover'),(114,3993,998,'Production'),(115,5817,1443,'Featured'),(116,1344,322,'Sample'),(117,3358,836,'Featured'),(118,4830,1210,'Remix'),(119,2955,734,'Cover'),(120,1629,394,'Featured'),(121,3792,948,'Featured'),(122,1915,467,'Featured'),(123,750,188,'Remix'),(124,6391,1599,'Cover'),(125,2852,709,'Cover'),(126,4895,1230,'Sample'),(127,4465,1126,'Production'),(128,3302,816,'Cover'),(129,577,146,'Remix'),(130,4749,1191,'Remix'),(131,461,119,'Sample'),(132,1376,330,'Cover'),(133,1089,269,'Remix'),(134,2972,742,'Remix'),(135,1158,284,'Featured'),(136,4700,1183,'Collaboration'),(137,5035,1264,'Featured'),(138,6367,1593,'Collaboration'),(139,3441,859,'Collaboration'),(141,5213,1302,'Production'),(143,5975,1479,'Sample'),(144,5162,1288,'Featured'),(145,2176,534,'Sample'),(146,5258,1316,'Collaboration'),(147,3111,771,'Production'),(148,3375,839,'Production'),(149,2077,505,'Remix'),(150,1977,478,'Collaboration'),(151,1743,420,'Remix'),(152,6370,1593,'Production'),(153,5714,1421,'Sample'),(154,1460,347,'Featured'),(155,3538,879,'Collaboration'),(156,1528,368,'Cover'),(157,2690,667,'Production'),(158,6284,1564,'Remix'),(159,2039,494,'Production'),(160,2588,640,'Sample'),(161,4185,1052,'Remix'),(162,2057,501,'Collaboration'),(163,5917,1472,'Sample'),(164,5334,1335,'Sample'),(165,1875,455,'Collaboration'),(166,6307,1572,'Sample'),(167,4548,1145,'Collaboration'),(168,4988,1256,'Collaboration'),(169,6162,1532,'Featured'),(170,509,132,'Sample'),(171,1885,457,'Sample'),(172,2340,573,'Remix'),(173,4920,1237,'Featured'),(174,2601,643,'Collaboration'),(175,6149,1527,'Collaboration'),(176,2907,721,'Production'),(177,530,134,'Collaboration'),(178,4756,1192,'Featured'),(179,6126,1521,'Cover'),(180,4391,1106,'Featured'),(181,2413,597,'Sample'),(182,3727,931,'Cover'),(183,5519,1377,'Production'),(184,4197,1053,'Sample'),(186,4154,1044,'Featured'),(187,1878,455,'Sample'),(188,2718,674,'Sample'),(189,618,156,'Sample'),(190,3600,897,'Cover'),(191,3115,772,'Remix'),(192,5598,1391,'Featured'),(193,2770,688,'Cover'),(194,6327,1577,'Remix'),(195,1895,459,'Production'),(196,5485,1373,'Production'),(197,3511,873,'Featured'),(198,914,230,'Remix'),(199,1640,396,'Production'),(200,5088,1274,'Remix');
/*!40000 ALTER TABLE `collaboration` ENABLE KEYS */;
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
