USE SongSelector;
DELIMITER $$
CREATE PROCEDURE GetTop3ActiveLabels()
BEGIN
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'Label', LabelName,
            'Company', CompanyName,
            'ActiveArtists', ActiveArtists
        )
    ) AS Top3ActiveLabelsJSON
    FROM (
        SELECT 
            l.LabelName, 
            l.CompanyName, 
            COUNT(a.SpotifyID) AS ActiveArtists
        FROM Label l
        LEFT JOIN Artist a ON l.LabelID = a.LabelID
        WHERE a.SpotifyID IS NOT NULL 
          AND (a.EndYear IS NULL OR a.EndYear > YEAR(CURDATE()))
        GROUP BY l.LabelName, l.CompanyName
        ORDER BY ActiveArtists DESC
        LIMIT 3
    ) AS SubQuery;
END$$
DELIMITER ;