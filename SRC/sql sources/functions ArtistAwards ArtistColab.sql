use SongSelector;
DELIMITER //

CREATE FUNCTION GetArtistAwards(artist_id INT)
RETURNS JSON
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE result JSON;
    
    -- Correctly use the artist_id parameter in the WHERE clause
    SET result = (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'AwardID', AwardID,
                'Title', Title,
                'PresentationDate', PresentationDate,
                'Value', Value,
                'Category', Category,
                'CreationYear', CreationYear
            )
        )
        FROM Awards
        WHERE RecipientArtistID = artist_id  -- Use the parameter here
    );

    RETURN result;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetArtistCollaboration(artist_id INT)
RETURNS JSON
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE result JSON;
    
    SET result = (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'CollaborationID', CollaborationID,
                'ISRCCode', ISRCCode,
                'Type', Type
            )
        )
        FROM Collaboration
        WHERE ArtistID = artist_id
    );

    RETURN result;
END //

DELIMITER ;