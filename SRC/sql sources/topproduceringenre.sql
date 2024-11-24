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