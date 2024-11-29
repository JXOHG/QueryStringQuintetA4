USE SongSelector;

DELIMITER $$

CREATE PROCEDURE AwardsForArtist()
BEGIN
    -- Return the awards for artists with more than 5 distinct genres, as JSON
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'RecipientArtistID', ArtistGenres.RecipientArtistID,
                'ArtistName', ArtistGenres.ArtistName
            )
        ) AS AwardsForArtistJSON
    FROM (
        SELECT a.RecipientArtistID, ar.Name AS ArtistName, mg.GenreName
        FROM Awards a
        JOIN Artist ar ON a.RecipientArtistID = ar.SpotifyID
        JOIN Song s ON a.RecipientArtistID = s.AuthorArtistID
        JOIN MultiGenreType mg ON s.ISRCCode = mg.ISRCCode
        UNION
        SELECT a.RecipientArtistID, ar.Name AS ArtistName, mg.GenreName
        FROM Awards a
        JOIN Artist ar ON a.RecipientArtistID = ar.SpotifyID
        JOIN Song s ON a.RecipientArtistID = s.AuthorArtistID
        JOIN MultiGenreType mg ON s.ISRCCode = mg.ISRCCode
    ) AS ArtistGenres
    GROUP BY ArtistGenres.RecipientArtistID, ArtistGenres.ArtistName
    HAVING COUNT(DISTINCT ArtistGenres.GenreName) > 5;

END$$

DELIMITER ;

CALL AwardsForArtist();