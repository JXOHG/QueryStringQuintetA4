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
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `Country` varchar(60) NOT NULL,
  `Language` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Country`),
  UNIQUE KEY `Country` (`Country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Afghanistan','Pashto'),('Albania','Albanian'),('Algeria','Arabic'),('Angola','Portuguese'),('Antigua and Barbuda','English'),('Argentina','Spanish'),('Armenia','Armenian'),('Australia','English'),('Azerbaijan','Azerbaijani'),('Bangladesh','Bengali'),('Barbados','English'),('Belarus','Belarusian'),('Belgium','Dutch'),('Bolivia','Castilian'),('Bosnia and Herzegovina','Bosnian'),('Botswana','English'),('Brazil','Portuguese'),('Brunei Darussalam','Malay'),('Bulgaria','Bulgarian'),('Burkina Faso','French'),('Burundi','French'),('Cabo Verde','Portuguese'),('Cameroon','English'),('Canada','English'),('Central African Republic','French'),('Chad','Arabic'),('Chile','Spanish'),('China','Mandarin Chinese'),('Colombia','Spanish'),('Comoros','Arabic'),('Costa Rica','Spanish'),('Côte D’Ivoire','French'),('Croatia','Croatian'),('Cyprus','Greek'),('Czech Republic','Czech'),('Dem. People’s Republic of Korea','Korean'),('Dem. Republic of the Congo','French'),('Djibouti','Arabic'),('Dominica','English'),('Dominican Republic','Spanish'),('Ecuador','Spanish'),('El Salvador','Spanish'),('Equatorial Guinea','French'),('Eritrea','Tigrinya'),('Estonia','Estonian'),('Eswatini','English'),('Ethiopia','Afar'),('Fiji','English'),('Finland','Finnish'),('Gambia (Republic of The)','English'),('Georgia','Georgian'),('Guatemala','Spanish'),('Guinea Bissau','Portuguese'),('Haiti','French'),('Honduras','Spanish'),('Hungary','Hungarian'),('Iceland','Icelandic'),('India','Hindi'),('Indonesia','Indonesian'),('Iran (Islamic Republic of)','Persian'),('Ireland','English'),('Kazakhstan','Kazakh'),('Kiribati','English'),('Kuwait','Standard Arabic'),('Kyrgyzstan','Kyrgyz'),('Lao People’s Dem. Republic','Lao'),('Lesotho','Sotho'),('Liechtenstein','German'),('Lithuania','Lithuanian'),('Luxembourg','French'),('Madagascar','French'),('Malawi','English'),('Malaysia','Malay'),('Maldives','Dhivehi'),('Malta','Maltese'),('Marshall Islands','English'),('Mauritania','Arabic'),('Mauritius','English'),('Mexico','Spanish'),('Micronesia (Federated States of)','Woleaian'),('Mongolia','Mongolian'),('Montenegro','Albanian'),('Morocco','Arabic'),('Mozambique','Portuguese'),('Nauru','English'),('Netherlands','Dutch'),('New Zealand','English'),('Nicaragua','Spanish'),('North Macedonia','Macedonian'),('Norway','Norwegian'),('Pakistan','English'),('Palau','English'),('Papua New Guinea','English'),('Paraguay','Spanish'),('Peru','Spanish'),('Philippines','English'),('Portugal','Portuguese'),('Republic of Korea','Korean'),('Republic of Moldova','Romanian'),('Romania','Romanian'),('Russian Federation','Russian'),('Rwanda','English'),('Saint Kitts and Nevis','English'),('Saint Lucia','English'),('Saint Vincent and the Grenadines','English'),('San Marino','Italian'),('Sao Tome and Principe','Portuguese'),('Saudi Arabia','Arabic'),('Seychelles','English'),('Sierra Leone','English'),('Singapore','English'),('Slovenia','Slovene'),('Solomon Islands','English'),('South Africa','Afrikaans'),('South Sudan','English'),('Sri Lanka','Sinhala'),('Sudan','Arabic'),('Switzerland','French'),('Syrian Arab Republic','Arabic'),('Tajikistan','Tajik'),('Timor-Leste','Portuguese'),('Tonga','English'),('Trinidad and Tobago','English'),('Tunisia','Tunisian'),('Turkmenistan','Turkmen'),('Tuvalu','English'),('Uganda','English'),('Ukraine','Ukrainian'),('United Arab Emirates','Arabic'),('United Kingdom','English'),('United Republic of Tanzania','English'),('United States of America','English'),('Uruguay','Spanish'),('Uzbekistan','Uzbek'),('Vanuatu','English'),('Venezuela','Spanish'),('Viet Nam','Vietnamese'),('Zimbabwe','Chewa');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
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
