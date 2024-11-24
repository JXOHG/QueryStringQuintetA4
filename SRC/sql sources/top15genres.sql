SELECT g.Name AS GenreName, GenreCounts.NumberOfSongs, g.Description
FROM Genre g, (SELECT mgt.GenreName, COUNT(mgt.ISRCCode) AS NumberOfSongs
    FROM MultiGenreType mgt
    GROUP BY mgt.GenreName) AS GenreCounts
WHERE g.Name = GenreCounts.GenreName
ORDER BY GenreCounts.NumberOfSongs DESC
LIMIT 15;