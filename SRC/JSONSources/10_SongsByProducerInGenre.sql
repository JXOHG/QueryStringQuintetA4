USE SongSelector;
DELIMITER //

CREATE PROCEDURE SongsByProducerInGenre()
BEGIN 
# Select statement #10. Return the songs produced by a specific producer in the selected genre.
SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'SongTitle', s.Title,
            'ProducerFirstName', p.FirstName,
            'ProducerLastName', p.LastName
        )
    ) AS SongsByProducerJSON
    FROM Song s
    JOIN Production pt ON s.ISRCCode = pt.ISRCCode
    JOIN Producer p ON pt.ProducerID = p.ProducerID
    WHERE p.ProducerID = 2
    AND EXISTS (
        SELECT *
        FROM MultiGenreType mgt
        WHERE mgt.ISRCCode = s.ISRCCode
        AND mgt.GenreName = 'Jazz');

END//
DELIMITER ;
CALL SongsByProducerInGenre();