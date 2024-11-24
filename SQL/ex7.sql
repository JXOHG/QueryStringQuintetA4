USE SongSelector;

# Create a view that displays all of the artists with a certain award.
CREATE VIEW ArtistsWithAward AS
SELECT a.Name AS ArtistName, aw.Title AS AwardTitle, aw.PresentationDate
FROM Artist a
JOIN Awards aw ON a.SpotifyID = aw.RecipientArtistID
WHERE aw.Title = 'Award for Best Song';

# Create a view that displays all of the artists working with a specific company.
CREATE VIEW ArtistsInCompany AS
SELECT a.Name AS ArtistName, c.Name AS CompanyName, l.LabelName
FROM Artist a
JOIN Label l ON a.LabelID = l.LabelID
JOIN Company c ON l.CompanyName = c.Name
WHERE c.Name = 'Alpha Depot'
ORDER BY c.Name, a.Name;

# Create a view that displays all of the artists in a specific region.
CREATE VIEW ArtistsInRegion AS
SELECT a.Name AS ArtistName, a.FromRegion AS Region
FROM Artist a
JOIN Region r ON a.FromRegion = r.Country
WHERE r.Country = 'Hungary'
ORDER BY a.Name;


