-- Get the Total Number of Songs Released by Each Artist
SELECT a.Name AS Name, a.SpotifyID AS SpotifyID, COUNT(s.ISRCCode) AS TotalNumberOfSongs
FROM Artist a
JOIN Song s
ON a.SpotifyID = s.AuthorArtistID
GROUP BY a.Name, a.SpotifyID;

-- List of All Live Events in a Region
SELECT l.Name AS Event, l.LiveEventID AS EventID, a.Name AS Artist, l.HostArtistID as ArtistID, l.Date, l.Location
FROM LiveEvents l
JOIN Artist a
ON l.HostArtistID = a.SpotifyID
JOIN Region r
ON l.Location = r.Country
WHERE r.Country = 'Brazil';