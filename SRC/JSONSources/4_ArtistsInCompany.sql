USE SongSelector;
DELIMITER $$

CREATE PROCEDURE ArtistsInCompany()
BEGIN
    -- Use a subquery to count the number of artists per label and company
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'Company', artist_count.Company,
                'LabelName', artist_count.LabelName,
                'NumberOfArtists', artist_count.NumberOfArtists
            )
        ) AS ArtistsInCompanyJSON
    FROM (
        SELECT c.Name AS Company, l.LabelName, COUNT(a.Name) AS NumberOfArtists
        FROM label l
        JOIN artist a ON l.LabelID = a.LabelID
        JOIN company c ON c.Name = l.CompanyName  
        GROUP BY c.Name, l.LabelName
    ) AS artist_count;

END$$

DELIMITER ;

CALL ArtistsInCompany();