-- Insert artists having more than 90 million monthly listeners into a new table for high-profile artists
CREATE TABLE HighProfileArtists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(60),
    MonthlyListeners INT
);
INSERT INTO HighProfileArtists (ArtistID, ArtistName, MonthlyListeners)
SELECT SpotifyID, Name, MonthlyListeners
FROM Artist
WHERE MonthlyListeners > 90000000;
SELECT * FROM HighProfileArtists;

-- Increase streams by a factor of 1.1 to all albums that released before '2010-01-01'
UPDATE Song
SET Streams = Streams * 1.1
WHERE AlbumID IN (
    SELECT AlbumID
    FROM Album
    WHERE ReleaseDate < '2010-01-01'
);

-- Delete all song collaborations under the type 'Remix' that have less than '1000000' in sales
DELETE FROM Collaboration
WHERE ISRCCode IN (
    SELECT Song.ISRCCode
    FROM Song
    WHERE Song.Sales < 1000000
)
AND Type = 'Remix';

