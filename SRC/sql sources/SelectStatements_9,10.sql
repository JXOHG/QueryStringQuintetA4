USE SongSelector;

# Select statement #9. Return the top genres by number of songs and their description. 
SELECT g.Name AS GenreName, GenreCounts.NumberOfSongs, g.Description
FROM Genre g, (SELECT mgt.GenreName, COUNT(mgt.ISRCCode) AS NumberOfSongs
    FROM MultiGenreType mgt
    GROUP BY mgt.GenreName) AS GenreCounts
WHERE g.Name = GenreCounts.GenreName
ORDER BY GenreCounts.NumberOfSongs DESC
LIMIT 15;


# Select statement #10. Return the songs produced by a specific producer in the selected genre.
SELECT DISTINCT Title AS SongTitle, p.FirstName AS ProducerFirstName, p.LastName AS ProducerLastName
FROM Song s 
JOIN Production pt ON s.ISRCCode = pt.ISRCCode
JOIN Producer p ON pt.ProducerID = p.ProducerID
WHERE p.ProducerID = 1
AND EXISTS (
    SELECT *
    FROM MultiGenreType mgt
    WHERE mgt.ISRCCode = s.ISRCCode
    AND mgt.GenreName = 'Pop'
);

