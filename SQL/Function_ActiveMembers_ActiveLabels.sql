use SongSelector;

#THIS IS NUMBER 5
SELECT m.MemberID, m.FirstName, m.LastName, m.Alias, m.DateOfBirth, ms.Role, ms.DateJoined
FROM Membership ms
JOIN Member m
ON ms.MemberID = m.MemberID
JOIN Artist a
ON ms.ArtistID = a.SpotifyID
WHERE a.Name = 'Harmonic Chorales'
ORDER BY m.LastName, m.FirstName;

#THIS IS NUMBER 6, Find Top 3 Most Active Labels by Number of Active Artists
SELECT l.LabelName AS Label, l.CompanyName AS Company, COUNT(a.SpotifyID) AS ActiveArtists
FROM Label l
LEFT JOIN Artist a
ON l.LabelID = a.LabelID
WHERE a.SpotifyID IS NOT NULL AND (a.EndYear IS NULL OR a.EndYear > YEAR(CURDATE()))
GROUP BY l.LabelName, l.CompanyName
ORDER BY ActiveArtists DESC LIMIT 3;