USE SongSelector;
DELIMITER //

CREATE PROCEDURE ColabHistory()
BEGIN 
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'MainArtist', ar.Name,
            'SongTitle', s.Title,
            'ReleaseDate', s.ReleaseDate,
            'Streams', s.Streams,
            'CollaboratingArtist', collab_artist.Name,
            'CollaborationType', c.Type
        )
    ) AS CollaborationHistoryJSON
    FROM Collaboration c
    JOIN Song s ON c.ISRCCode = s.ISRCCode
   JOIN Artist ar ON ar.SpotifyID = 10
   JOIN Artist collab_artist ON c.ArtistID = collab_artist.SpotifyID
   ORDER BY s.ReleaseDate DESC
    LIMIT 10;
END//
DELIMITER ;

CALL ColabHistory();

