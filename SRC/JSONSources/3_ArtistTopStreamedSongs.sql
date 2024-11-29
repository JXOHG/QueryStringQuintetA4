USE SongSelector;
DELIMITER //
CREATE PROCEDURE artistTopStreamedSongs()
BEGIN 
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'ISRCCode', s.ISRCCode,
            'Song Title', s.Title,
            'Artist Name', a.Name,
            'Member First Name', b.FirstName,
            'Member Last Name', b.LastName,
            'Streams', s.Streams
        )
    ) AS TopSongs
    FROM membership m 
    JOIN song s ON s.AuthorArtistID = m.ArtistID 
    JOIN member b ON b.MemberID = m.MemberID 
    JOIN artist a ON a.SpotifyID = m.ArtistID
    WHERE (b.FirstName = 'Montero' AND b.LastName = 'West') OR a.Name = 'Whimsical Fantasies'
    ORDER BY s.Streams DESC
    LIMIT 5;
END //
DELIMITER ;