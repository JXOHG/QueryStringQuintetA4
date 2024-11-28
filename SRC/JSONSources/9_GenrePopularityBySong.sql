USE SongSelector;
DELIMITER //

CREATE PROCEDURE GenrePopularityBySongs()
BEGIN 
# Select statement #9. Return the top genres by number of songs and their description. 
SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'GenreName', g.Name,
            'NumberOfSongs', GenreCounts.NumberOfSongs,
            'Description', g.Description
        )
    ) AS TopGenresJSON
    FROM Genre g
    JOIN (
        SELECT mgt.GenreName, COUNT(mgt.ISRCCode) AS NumberOfSongs
        FROM MultiGenreType mgt
        GROUP BY mgt.GenreName
    ) AS GenreCounts
    ON g.Name = GenreCounts.GenreName
    ORDER BY GenreCounts.NumberOfSongs DESC
    LIMIT 15;

END//
DELIMITER ;
DROP PROCEDURE GenrePopularityBySongs;
CALL GenrePopularityBySongs();