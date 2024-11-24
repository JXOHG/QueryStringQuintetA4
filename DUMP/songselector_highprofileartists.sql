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
-- Table structure for table `highprofileartists`
--

DROP TABLE IF EXISTS `highprofileartists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highprofileartists` (
  `ArtistID` int NOT NULL,
  `ArtistName` varchar(60) DEFAULT NULL,
  `MonthlyListeners` int DEFAULT NULL,
  PRIMARY KEY (`ArtistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highprofileartists`
--

LOCK TABLES `highprofileartists` WRITE;
/*!40000 ALTER TABLE `highprofileartists` DISABLE KEYS */;
INSERT INTO `highprofileartists` VALUES (14,'Whimsical Odyssey',91009173),(17,'Whimsical Legends',93523398),(20,'Whimsical Tales',99995156),(24,'Whimsical Ballads',90296792),(27,'Whimsical Melodies',94316732),(60,'Daring Tales',96253638),(102,'Sublime Anthems',90850802),(112,'Sublime Hymns',99174669),(115,'Sublime Anecdotes',98607453),(116,'Sublime Reflections',90598632),(132,'Ethereal Fantasies',90757745),(134,'Ethereal Odyssey',99548207),(154,'Ethereal Vignettes',97568593),(184,'Radiant Ballads',96582401),(196,'Radiant Reflections',99922280),(197,'Radiant Moments',98643688),(205,'Infinite Overture',99162478),(213,'Infinite Journeys',91288726),(219,'Infinite Memories',94967350),(243,'Mystic Virtuosos',97189753),(244,'Mystic Symphony',96325052),(248,'Mystic Sonata',97320368),(254,'Mystic Odyssey',92394126),(320,'Vivid Palettes',92036066),(321,'Celestial Wanderers',96583139),(325,'Celestial Overture',98850367),(330,'Celestial Resonance',90551115),(339,'Celestial Memories',93152323),(359,'Celestial Eclipses',94092111),(360,'Celestial Palettes',97950853),(362,'Echoing Dreamers',98743736),(385,'Echoing Chorales',91818749),(389,'Echoing Prelude',94763873),(391,'Echoing Psalms',92078008),(401,'Aesthetic Wanderers',91269550),(406,'Aesthetic Crescendo',93644704),(411,'Aesthetic Echoes',90055971),(416,'Aesthetic Epic',96776174),(430,'Aesthetic Opus',90699590),(436,'Aesthetic Reflections',98623730),(444,'Visionary Symphony',95241171),(447,'Visionary Harmonics',99267424),(448,'Visionary Sonata',99159833),(450,'Visionary Resonance',93956076),(454,'Visionary Odyssey',95420292),(466,'Visionary Harmonies',90939482),(476,'Visionary Reflections',98923938),(482,'Zenith Dreamers',93120778),(484,'Zenith Symphony',97587557),(495,'Zenith Sagas',95805929),(499,'Zenith Memories',98872418),(510,'Zenith Opus',93578339),(526,'Majestic Crescendo',98676358),(551,'Majestic Psalms',90308197),(555,'Majestic Anecdotes',93498765),(562,'Harmonic Dreamers',92828095),(563,'Harmonic Virtuosos',91888750),(568,'Harmonic Sonata',95014993),(577,'Harmonic Legends',94226437),(580,'Harmonic Tales',91588626),(595,'Harmonic Anecdotes',96622185),(617,'Noble Legends',94169718),(622,'Noble Anthems',99507013),(638,'Noble Impressions',95488027),(639,'Noble Eclipses',91922452),(660,'Luminous Tales',92966968),(666,'Luminous Harmonies',99449402),(671,'Luminous Psalms',97235434),(689,'Enchanted Ensemble',99229885),(708,'Enchanted Cadence',90463489),(710,'Enchanted Opus',97018134),(751,'Brilliant Psalms',96004632),(758,'Brilliant Impressions',99551729),(762,'Captivating Dreamers',91528517),(766,'Captivating Crescendo',92098235),(771,'Captivating Echoes',93583127),(773,'Captivating Journeys',92813792),(780,'Captivating Tales',97975807),(782,'Captivating Anthems',99527939),(790,'Captivating Opus',98153210),(803,'Dynamic Virtuosos',93399012),(806,'Dynamic Crescendo',92481975),(809,'Dynamic Ensemble',90848383),(813,'Dynamic Journeys',97298025),(816,'Dynamic Epic',94924226),(828,'Dynamic Cadence',91526743),(865,'Epic Chorales',98175069),(873,'Epic Arias',99744295),(881,'Fantasia Wanderers',95439666),(896,'Fantasia Epic',96594892),(897,'Fantasia Legends',94219051),(904,'Fantasia Ballads',91735502),(915,'Fantasia Anecdotes',98998327),(926,'Galactic Crescendo',93579920),(927,'Galactic Harmonics',91024620),(935,'Galactic Sagas',98660157),(939,'Galactic Memories',92180097),(941,'Galactic Rhapsody',95744080),(943,'Galactic Serenades',99305679),(944,'Galactic Ballads',93710275),(976,'Heroic Epic',90748778),(982,'Heroic Anthems',91572289),(986,'Heroic Harmonies',99766491),(1010,'Illustrious Resonance',90172131),(1011,'Illustrious Echoes',92083314),(1051,'Jubilant Echoes',92860884),(1054,'Jubilant Odyssey',98036132),(1061,'Jubilant Rhapsody',93653331),(1063,'Jubilant Serenades',94398490),(1079,'Jubilant Eclipses',90309665),(1083,'Kinetic Virtuosos',98102592),(1085,'Kinetic Overture',91833341),(1087,'Kinetic Harmonics',91521604),(1094,'Kinetic Odyssey',92319737),(1096,'Kinetic Epic',95968140),(1114,'Kinetic Vignettes',96908455),(1137,'Lyrical Legends',97783127),(1141,'Lyrical Rhapsody',99611419),(1144,'Lyrical Ballads',91599119),(1153,'Lyrical Arias',95959041),(1155,'Lyrical Anecdotes',93314143),(1221,'Nirvana Rhapsody',92382415),(1232,'Nirvana Hymns',98908930),(1233,'Nirvana Arias',90092367),(1242,'Opulent Dreamers',96931675),(1249,'Opulent Ensemble',99983004),(1270,'Opulent Opus',93113888),(1281,'Pristine Wanderers',99674379),(1290,'Pristine Resonance',90507401),(1293,'Pristine Journeys',94494955),(1300,'Pristine Tales',91618894),(1302,'Pristine Anthems',91310201),(1322,'Quixotic Dreamers',97502821),(1326,'Quixotic Crescendo',97421903),(1335,'Quixotic Sagas',96481162),(1342,'Quixotic Anthems',91257837),(1346,'Quixotic Harmonies',93881475),(1354,'Quixotic Vignettes',95328434),(1372,'Radiant Fantasies',98891679),(1382,'Radiant Anthems',97076538),(1383,'Radiant Serenades',91622357),(1394,'Radiant Vignettes',99439156),(1398,'Radiant Impressions',99864821),(1427,'Serene Melodies',91995487),(1433,'Serene Arias',96595978),(1446,'Tranquil Crescendo',97633255),(1458,'Tranquil Chronicles',99045349),(1473,'Tranquil Arias',92137852),(1480,'Tranquil Palettes',99441290),(1484,'Uplifting Symphony',91145466),(1487,'Uplifting Harmonics',95620113),(1489,'Uplifting Ensemble',98167911),(1496,'Uplifting Epic',98799035),(1499,'Uplifting Memories',94756297),(1500,'Uplifting Tales',94789282),(1501,'Uplifting Rhapsody',99010893),(1506,'Uplifting Harmonies',96975024),(1523,'Vibrant Virtuosos',91490636),(1524,'Vibrant Symphony',90138341),(1529,'Vibrant Ensemble',91961891),(1555,'Vibrant Anecdotes',98690692),(1574,'Wonderous Odyssey',90571536),(1577,'Wonderous Legends',95814882),(1579,'Wonderous Memories',93328696),(1594,'Wonderous Vignettes',99421089),(1597,'Wonderous Moments',90502155);
/*!40000 ALTER TABLE `highprofileartists` ENABLE KEYS */;
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
