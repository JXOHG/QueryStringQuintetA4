USE SongSelector;
DELIMITER //

CREATE PROCEDURE TotalSongNumByArtist()
BEGIN 
    -- Get the Total Number of Songs Released by Each Artist in JSON Format
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'Name', Name,
            'SpotifyID', SpotifyID,
            'TotalNumberOfSongs', TotalNumberOfSongs
        )
    ) AS ArtistSongsSummaryJSON
    FROM (
        SELECT 
            a.Name AS Name,
            a.SpotifyID AS SpotifyID,
            COUNT(s.ISRCCode) AS TotalNumberOfSongs
        FROM Artist a
        JOIN Song s
        ON a.SpotifyID = s.AuthorArtistID
        GROUP BY a.Name, a.SpotifyID
    ) AS ArtistSummary;

END//
DELIMITER ;
CALL TotalSongNumByArtist();