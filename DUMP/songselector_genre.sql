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
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `Name` varchar(60) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `OriginDate` date DEFAULT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES ('Afrobeats','A music genre that combines elements of West African music and American jazz.','2010-01-01'),('Amapiano','A South African genre blending house and jazz elements.','2010-01-01'),('Ambient','A genre of music that puts an emphasis on tone and atmosphere.','1970-01-01'),('Bachata','A genre of Latin American music originating from the Dominican Republic.','1960-01-01'),('Ballad','A form of verse, often a narrative set to music.','1500-01-01'),('Bluegrass','A form of American roots music.','1940-01-01'),('Blues','A music genre characterized by its chord progressions and lyrics of melancholy.','1910-01-01'),('Bossa Nova','A genre of Brazilian music that fuses samba and jazz.','1950-01-01'),('Britpop','A British alternative rock subgenre that emerged in the early 1990s.','1990-01-01'),('Celtic','A broad grouping of music originating from the Celtic people of Western Europe.','1900-01-01'),('Chamber Music','A form of classical music composed for a small group of instruments.','1600-01-01'),('Chillwave','A genre of music with relaxed, atmospheric melodies.','2010-01-01'),('Classical Music','Art music produced in the traditions of Western culture.','1600-01-01'),('Country','Music originating from the rural southern United States.','1920-01-01'),('Dancehall','A genre of Jamaican popular music that originated in the late 1970s.','1970-01-01'),('Disco','A genre of dance music containing elements of funk, soul, and pop.','1970-01-01'),('Drum \'n\' Bass','An electronic music genre featuring fast breakbeats.','1990-01-01'),('Dubstep','A genre of electronic dance music with heavy bass and syncopated beats.','1990-01-01'),('Electro','A genre of electronic music influenced by funk.','1980-01-01'),('Electronic Dance Music (EDM)','Music created for dance-based entertainment.','1980-01-01'),('Emo','A genre of rock music characterized by emotional lyrics.','1980-01-01'),('Flamenco','A style of Spanish music and dance.','1800-01-01'),('Folk','Traditional music that originates in the cultural traditions of a community.','1930-01-01'),('Gospel','A genre of Christian music known for its vocal-driven sound.','1920-01-01'),('Grime','A genre of electronic music that emerged in London in the early 2000s.','2000-01-01'),('Hardcore Punk','A fast-paced subgenre of punk rock.','1970-01-01'),('Heavy Metal','A genre of rock music with intense tempos and aggressive sounds.','1960-01-01'),('Hip-Hop/Rap','A genre characterized by rhythmic, rhyming speech.','1970-01-01'),('House','A genre of electronic dance music characterized by repetitive beats.','1980-01-01'),('Indie/Alternative','A genre encompassing various distinct styles outside the mainstream.','1980-01-01'),('J-Pop','A genre of Japanese pop music.','1990-01-01'),('Jazz','A music genre that originated in the African-American communities.','1920-01-01'),('K-Pop','Korean pop music known for its colorful audiovisual elements.','1990-01-01'),('Latin Music','Music that incorporates Latin American influences.','1950-01-01'),('Lo-fi','A genre using low-fidelity recording practices.','1990-01-01'),('Metal','A genre characterized by loud, aggressive sounds.','1960-01-01'),('Motown','A genre of R&B and soul music known for its polished production.','1960-01-01'),('Musical Theatre','A form of theatrical performance that combines songs, spoken dialogue, and dance.','1800-01-01'),('New Wave','A genre mixing punk rock with other styles like funk and electronic.','1970-01-01'),('Opera','A form of theatre in which music is a fundamental component.','1600-01-01'),('Pop','Popular music aimed at a wide audience.','1950-01-01'),('Post-Punk','A genre that came out of the punk rock movement.','1970-01-01'),('Progressive Rock','A subgenre of rock music with complex compositions.','1960-01-01'),('Punk Rock','A rock music genre that emerged in the mid-1970s.','1975-01-01'),('R&B','A genre of popular music that originated in African American communities.','1940-01-01'),('Reggae','Music genre with emphasis on rhythm and blues, originating from Jamaica.','1960-01-01'),('Rock','A genre characterized by a strong rhythm and often amplified instruments.','1940-01-01'),('Salsa','A genre that incorporates various Cuban musical styles.','1960-01-01'),('Samba','A Brazilian music genre and dance style.','1900-01-01'),('Shoegaze','A subgenre of indie and alternative rock characterized by its ethereal sound.','1980-01-01'),('Ska','A music genre that originated in Jamaica combining elements of Caribbean mento and calypso.','1960-01-01'),('Soul','A genre that combines elements of African-American gospel, R&B, and jazz.','1950-01-01'),('Swing','A form of jazz music developed in the United States.','1930-01-01'),('Synth-Pop','A genre using synthesizers as the dominant musical instrument.','1980-01-01'),('Tech House','A subgenre of house music blending elements of techno.','1990-01-01'),('Techno','A form of electronic dance music that emerged in Detroit.','1980-01-01'),('Trance','A genre of electronic dance music that develops melodic phrases.','1990-01-01'),('Trap','A genre known for its use of 808 kicks, hi-hats, and snares.','1990-01-01'),('Trap Metal','A fusion genre that blends trap music with heavy metal elements.','2015-01-01'),('Zydeco','A music genre originating in Louisiana combining Cajun music with blues.','1920-01-01');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
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
