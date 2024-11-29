USE SongSelector;
DELIMITER //

CREATE PROCEDURE LiveEventInRegion()
BEGIN 
    -- List of All Live Events in a Region
SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'Event', l.Name,
            'EventID', l.LiveEventID,
            'Artist', a.Name,
            'ArtistID', l.HostArtistID,
            'Date', l.Date,
            'Location', l.Location
        )
    ) AS LiveEventsJSON
    FROM LiveEvents l
    JOIN Artist a ON l.HostArtistID = a.SpotifyID
    JOIN Region r ON l.Location = r.Country
    WHERE r.Country = 'Brazil';

END//
DELIMITER ;
CALL LiveEventInRegion();