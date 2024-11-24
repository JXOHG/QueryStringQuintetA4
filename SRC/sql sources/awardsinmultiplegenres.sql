SELECT RecipientArtistID, ArtistName
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
) ArtistGenres
GROUP BY RecipientArtistID, ArtistName
HAVING COUNT(DISTINCT GenreName) > 5;