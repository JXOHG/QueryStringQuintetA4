USE SongSelector;

DELIMITER $$
CREATE PROCEDURE GetTop3ActiveLabels()
BEGIN
	#THIS IS NUMBER 6, Find Top 3 Most Active Labels by Number of Active Artists
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'Label', l.LabelName,
            'Company', l.CompanyName,
            'ActiveArtists', COUNT(a.SpotifyID)
        )
    ) AS Top3ActiveLabelsJSON
    FROM Label l
    LEFT JOIN Artist a ON l.LabelID = a.LabelID
    WHERE a.SpotifyID IS NOT NULL 
      AND (a.EndYear IS NULL OR a.EndYear > YEAR(CURDATE()))
    GROUP BY l.LabelName, l.CompanyName
    ORDER BY ActiveArtists DESC
    LIMIT 3;

END$$

DELIMITER ;

CALL GetTop3ActiveLabels();