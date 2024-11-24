
--Top Producer genre
SELECT DISTINCT Title AS SongTitle, p.FirstName AS ProducerFirstName, p.LastName AS ProducerLastName
FROM Song s 
JOIN Production pt ON s.ISRCCode = pt.ISRCCode
JOIN Producer p ON pt.ProducerID = p.ProducerID
WHERE p.ProducerID = 8
AND EXISTS (
    SELECT *
    FROM MultiGenreType mgt
    WHERE mgt.ISRCCode = s.ISRCCode
    AND mgt.GenreName = 'Pop'
);



--Top15 genre
SELECT g.Name AS GenreName, GenreCounts.NumberOfSongs, g.Description
FROM Genre g, (SELECT mgt.GenreName, COUNT(mgt.ISRCCode) AS NumberOfSongs
    FROM MultiGenreType mgt
    GROUP BY mgt.GenreName) AS GenreCounts
WHERE g.Name = GenreCounts.GenreName
ORDER BY GenreCounts.NumberOfSongs DESC
LIMIT 15;


--Top 3 active labels
SELECT l.LabelName AS Label, l.CompanyName AS Company, COUNT(a.SpotifyID) AS ActiveArtists
FROM Label l
LEFT JOIN Artist a
ON l.LabelID = a.LabelID
WHERE a.SpotifyID IS NOT NULL AND (a.EndYear IS NULL OR a.EndYear > YEAR(CURDATE()))
GROUP BY l.LabelName, l.CompanyName
ORDER BY ActiveArtists DESC LIMIT 3;


--max listenrs per country
select r.country as Country, r.Language, a.name as 'Artist Name', a.NumberOfMembers as 'Number of Group Members', max(a.MonthlyListeners) as 'Max Listeners'
from region r, artist a 
where a.FromRegion = r.Country
group by r.country, a.name, a.NumberOfMembers
order by max(a.MonthlyListeners) desc
limit 10;

--collaboration history
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


--awards in multiple genres
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

--top 5 songs
select s.ISRCCode, s.Title as 'Song Title', a.Name, b.FirstName, b.LastName, s.Streams
from membership m join song s on s.AuthorArtistID = m.ArtistID join member b on b.MemberID = m.MemberID join artist a on a.SpotifyID = m.ArtistID
where (b.FirstName = 'Montero' and b.LastName = 'West') or a.Name = 'Whimsical Fantasies'
-- where (b.FirstName = 'Montero' and b.LastName = 'West')
-- where a.Name = 'Whimsical Fantasies'
order by s.Streams desc
limit 5