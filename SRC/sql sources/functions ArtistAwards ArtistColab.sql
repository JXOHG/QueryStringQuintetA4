DELIMITER //

-- Function to get SpotifyID from artist name
CREATE FUNCTION GetSpotifyIDFromName(artist_name VARCHAR(60)) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE spotify_id INT;
    
    SELECT SpotifyID INTO spotify_id
    FROM Artist
    WHERE Name LIKE CONCAT('%', artist_name, '%')
    LIMIT 1;
    
    RETURN spotify_id;
END //

-- Modified procedure to accept artist name
CREATE PROCEDURE GetArtistAwardsByName(IN artist_name VARCHAR(60))
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
END //

-- Modified procedure to accept artist name
CREATE PROCEDURE GetArtistCollaborationsByName(IN artist_name VARCHAR(60))
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
END //

-- Optional: Procedure to search for artists by partial name
CREATE PROCEDURE SearchArtists(IN search_term VARCHAR(60))
BEGIN
    SELECT SpotifyID, Name, CreationYear, MonthlyListeners
    FROM Artist
    WHERE Name LIKE CONCAT('%', search_term, '%')
    ORDER BY MonthlyListeners DESC;
END //

DELIMITER ;
