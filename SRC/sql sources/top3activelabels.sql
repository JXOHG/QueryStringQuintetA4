#THIS IS NUMBER 6, Find Top 3 Most Active Labels by Number of Active Artists
DELIMITER $$
CREATE PROCEDURE GetTop3ActiveLabels()
Begin

SELECT l.LabelName AS Label, l.CompanyName AS Company, COUNT(a.SpotifyID) AS ActiveArtists
FROM Label l
LEFT JOIN Artist a
ON l.LabelID = a.LabelID
WHERE a.SpotifyID IS NOT NULL AND (a.EndYear IS NULL OR a.EndYear > YEAR(CURDATE()))
GROUP BY l.LabelName, l.CompanyName
ORDER BY ActiveArtists DESC LIMIT 3;

END$$

DELIMITER ;