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
-- Temporary view structure for view `artistsincompany`
--

DROP TABLE IF EXISTS `artistsincompany`;
/*!50001 DROP VIEW IF EXISTS `artistsincompany`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `artistsincompany` AS SELECT 
 1 AS `ArtistName`,
 1 AS `CompanyName`,
 1 AS `LabelName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `artistsinregion`
--

DROP TABLE IF EXISTS `artistsinregion`;
/*!50001 DROP VIEW IF EXISTS `artistsinregion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `artistsinregion` AS SELECT 
 1 AS `ArtistName`,
 1 AS `Region`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `artistswithaward`
--

DROP TABLE IF EXISTS `artistswithaward`;
/*!50001 DROP VIEW IF EXISTS `artistswithaward`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `artistswithaward` AS SELECT 
 1 AS `ArtistName`,
 1 AS `AwardTitle`,
 1 AS `PresentationDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `artistsincompany`
--

/*!50001 DROP VIEW IF EXISTS `artistsincompany`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artistsincompany` AS select `a`.`Name` AS `ArtistName`,`c`.`Name` AS `CompanyName`,`l`.`LabelName` AS `LabelName` from ((`artist` `a` join `label` `l` on((`a`.`LabelID` = `l`.`LabelID`))) join `company` `c` on((`l`.`CompanyName` = `c`.`Name`))) where (`c`.`Name` = 'Alpha Depot') order by `c`.`Name`,`a`.`Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `artistsinregion`
--

/*!50001 DROP VIEW IF EXISTS `artistsinregion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artistsinregion` AS select `a`.`Name` AS `ArtistName`,`a`.`FromRegion` AS `Region` from (`artist` `a` join `region` `r` on((`a`.`FromRegion` = `r`.`Country`))) where (`r`.`Country` = 'Hungary') order by `a`.`Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `artistswithaward`
--

/*!50001 DROP VIEW IF EXISTS `artistswithaward`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artistswithaward` AS select `a`.`Name` AS `ArtistName`,`aw`.`Title` AS `AwardTitle`,`aw`.`PresentationDate` AS `PresentationDate` from (`artist` `a` join `awards` `aw` on((`a`.`SpotifyID` = `aw`.`RecipientArtistID`))) where (`aw`.`Title` = 'Best Singer') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'songselector'
--
/*!50003 DROP FUNCTION IF EXISTS `GetSpotifyIDFromName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetSpotifyIDFromName`(artist_name VARCHAR(60)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE spotify_id INT;
    
    SELECT SpotifyID INTO spotify_id
    FROM Artist
    WHERE Name LIKE CONCAT('%', artist_name, '%')
    LIMIT 1;
    
    RETURN spotify_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetArtistAwardsByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetArtistAwardsByName`(IN artist_name VARCHAR(60))
BEGIN
    DECLARE artist_id INT;
    
    -- Get the SpotifyID for the artist
    SET artist_id = GetSpotifyIDFromName(artist_name);
    
    -- Check if artist exists
    IF artist_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Artist not found';
    END IF;

    -- Get awards
    SELECT 
        ar.Name AS ArtistName,
        a.Title AS AwardTitle,
        a.PresentationDate,
        a.Value AS AwardValue,
        a.Category
    FROM Awards a
    JOIN Artist ar ON a.RecipientArtistID = ar.SpotifyID
    WHERE a.RecipientArtistID = artist_id
    ORDER BY a.PresentationDate DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetArtistCollaborationsByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetArtistCollaborationsByName`(IN artist_name VARCHAR(60))
BEGIN
    DECLARE artist_id INT;
    
    -- Get the SpotifyID for the artist
    SET artist_id = GetSpotifyIDFromName(artist_name);
    
    -- Check if artist exists
    IF artist_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Artist not found';
    END IF;

    -- Get collaborations
    SELECT 
        ar.Name AS MainArtist,
        s.Title AS SongTitle,
        s.ReleaseDate,
        s.Streams,
        collab_artist.Name AS CollaboratingArtist,
        c.Type AS CollaborationType
    FROM Collaboration c
    JOIN Song s ON c.ISRCCode = s.ISRCCode
    JOIN Artist ar ON ar.SpotifyID = artist_id
    JOIN Artist collab_artist ON c.ArtistID = collab_artist.SpotifyID
    WHERE c.ArtistID = artist_id
    ORDER BY s.ReleaseDate DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchArtists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchArtists`(IN search_term VARCHAR(60))
BEGIN
    SELECT SpotifyID, Name, CreationYear, MonthlyListeners
    FROM Artist
    WHERE Name LIKE CONCAT('%', search_term, '%')
    ORDER BY MonthlyListeners DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TestArtistProcedures` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TestArtistProcedures`()
BEGIN
    -- Get a valid artist ID from the database
    DECLARE test_artist_id INT;
    
    SELECT SpotifyID INTO test_artist_id
    FROM Artist
    LIMIT 1;
    
    -- Test valid artist ID
    SELECT 'Testing with valid artist ID' AS TestCase;
    CALL GetArtistAwards(test_artist_id);
    CALL GetArtistCollaborations(test_artist_id);
    
    -- Note: The following tests will produce error messages as expected
    -- Test invalid artist ID (will raise error)
    -- CALL GetArtistAwards(-1);
    -- CALL GetArtistCollaborations(-1);
    
    -- Test NULL artist ID (will raise error)
    -- CALL GetArtistAwards(NULL);
    -- CALL GetArtistCollaborations(NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 12:11:40
