SELECT 
	ar.Name AS MainArtist,
	s.Title AS SongTitle,
	s.ReleaseDate,
	s.Streams,
	collab_artist.Name AS CollaboratingArtist,
	c.Type AS CollaborationType
FROM Collaboration c
JOIN Song s ON c.ISRCCode = s.ISRCCode
JOIN Artist ar ON ar.SpotifyID = 10
JOIN Artist collab_artist ON c.ArtistID = collab_artist.SpotifyID
ORDER BY s.ReleaseDate DESC
LIMIT 10;