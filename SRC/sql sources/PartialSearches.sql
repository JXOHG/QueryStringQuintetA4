DELIMITER //
--  Procedure to search for songs by partial name
CREATE PROCEDURE SearchSongs(IN search_term VARCHAR(60))
BEGIN
    SELECT ISRCCode, Title, ReleaseDate, Streams, Sales, AuthorArtistID, AlbumID
    FROM Song
    WHERE Title LIKE CONCAT('%', search_term, '%')
    ORDER BY Title DESC;
END //



--  Procedure to search for albums by partial name
CREATE PROCEDURE SearchAlbums(IN search_term VARCHAR(60))
BEGIN
    SELECT AlbumID, Title, AuthorArtistID, NumberOfSongs, RelaseDate
    FROM Album
    WHERE Title LIKE CONCAT('%', search_term, '%')
    ORDER BY Title DESC;
END //



--  Procedure to search for artists by partial name
CREATE PROCEDURE SearchArtists(IN search_term VARCHAR(60))
BEGIN
    SELECT SpotifyID, Name, CreationYear, MonthlyListeners
    FROM Artist
    WHERE Name LIKE CONCAT('%', search_term, '%')
    ORDER BY MonthlyListeners DESC;
END //
--  Procedure to search for labels by partial name
CREATE PROCEDURE SearchLabels(IN search_term VARCHAR(60))
BEGIN
	SELECT LabelID, LabelName, CompanyName, Type
    FROM Label
    WHERE LabelName LIKE CONCAT('%', search_term, '%')
    ORDER BY LabelName DESC;
END //


DELIMITER ;