-- Region
-- I'll make more countries later
-- Insert Type 1 
INSERT INTO Region (Country, Language) 
VALUES ('', '');
-- Insert Type 2 
INSERT INTO Region 
SET Country = '', Language = '';
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempRegions (
    Country VARCHAR(60),
    Language VARCHAR(30)
);
-- Insert data into the temporary table
INSERT INTO TempRegions (Country, Language) 
VALUES ('', ''), ('', '');
-- Insert data from the temporary table into Region
INSERT INTO Region (Country, Language) 
SELECT Country, Language 
FROM TempRegions;
-- Drop the temporary table
DROP TABLE TempRegions;
SELECT * FROM Region;

-- Company
-- Insert Type 1
INSERT INTO Company (Name, NumberOfEmployees, NetWorth) 
VALUES ('Universal Music Group', 8300, 20000000000.00);
-- Insert Type 2
INSERT INTO Company 
SET Name = 'Sony Music Entertainment', 
    NumberOfEmployees = 8500, 
    NetWorth = 18000000000.00;
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempCompanies (
    Name VARCHAR(60),
    NumberOfEmployees INT,
    NetWorth DECIMAL(25,2)
);
-- Insert data into the temporary table
INSERT INTO TempCompanies (Name, NumberOfEmployees, NetWorth) 
VALUES ('Warner Music Group', 5600, 14000000000.00), 
       ('BMG', 2000, 5000000000.00);
-- Insert data from the temporary table into Company
INSERT INTO Company (Name, NumberOfEmployees, NetWorth) 
SELECT Name, NumberOfEmployees, NetWorth 
FROM TempCompanies;
-- Drop the temporary table
DROP TABLE TempCompanies;
SELECT * FROM Company;

-- Label
-- Insert Type 1
INSERT INTO Label (LabelID, LabelName, CompanyName, Type) 
VALUES ('Def Jam Recordings', 'Universal Music Group', 'Type1');
-- Insert Type 2
INSERT INTO Label 
SET LabelName = 'Columbia Records', 
    CompanyName = 'Sony Music Entertainment', 
    Type = 'Type2';
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempLabels (
    LabelName VARCHAR(60),
    CompanyName VARCHAR(60),
    Type VARCHAR(30)
);
-- Insert data into the temporary table
INSERT INTO TempLabels (LabelName, CompanyName, Type) 
VALUES ('Atlantic Records', 'Warner Music Group', 'Type4'), 
       ('RCA Records', 'Sony Music Entertainment', 'Type5'),
	   ('BMG Rights Management', 'BMG', 'Type6');      
-- Insert data from the temporary table into Label
INSERT INTO Label (LabelName, CompanyName, Type) 
SELECT LabelName, CompanyName, Type 
FROM TempLabels;
-- Drop the temporary table
DROP TABLE TempLabels;
SELECT * FROM Label;

-- Artist
-- Insert Type 1
INSERT INTO Artist (Name, CreationYear, EndYear, YearsActive, NumberOfMembers, MonthlyListeners, FromRegion, LabelID) 
VALUES ('Taylor Swift', 2006, NULL, 18, 1, 90000000, 'United States of America', ''); -- LabelID is temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO Artist 
SET Name = 'Ed Sheeran', 
    CreationYear = 2011, 
    EndYear = NULL, 
    YearsActive = 13, 
    NumberOfMembers = 1, 
    MonthlyListeners = 100000000, 
    FromRegion = 'United Kingdom', 
    LabelID = ''; -- LabelID is temporarily left blank due to auto-increment
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempSoloArtists (
    Name VARCHAR(60),
    CreationYear INT,
    EndYear INT,
    YearsActive INT,
    NumberOfMembers INT,
    MonthlyListeners INT,
    FromRegion VARCHAR(60),
    LabelID INT
);
-- Insert data into the temporary table
INSERT INTO TempSoloArtists (Name, CreationYear, EndYear, YearsActive, NumberOfMembers, MonthlyListeners, FromRegion, LabelID)
VALUES ('Adele', 2006, NULL, 18, 1, 80000000, 'United Kingdom', ''), -- LabelID is temporarily left blank due to auto-increment
       ('The Weeknd', 2010, NULL, 13, 1, 100000000, 'Canada', ''); -- LabelID is temporarily left blank due to auto-increment
-- Insert data from the temporary table into Artist
INSERT INTO Artist (Name, CreationYear, EndYear, YearsActive, NumberOfMembers, MonthlyListeners, FromRegion, LabelID) 
SELECT Name, CreationYear, EndYear, YearsActive, NumberOfMembers, MonthlyListeners, FromRegion, LabelID 
FROM TempSoloArtists;
-- Drop the temporary table
DROP TABLE TempSoloArtists;
SELECT * FROM Artist;

-- Member
-- Insert Type 1
INSERT INTO Member (FirstName, LastName, DateOfBirth, Alias, ActivityStatus) 
VALUES ('Taylor', 'Swift', '1989-12-13', 'TayTay', 1);
-- Insert Type 2
INSERT INTO Member 
SET FirstName = 'Ed', 
    LastName = 'Sheeran', 
    DateOfBirth = '1991-02-17', 
    Alias = 'Teddy', 
    ActivityStatus = 1;
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempMembers (
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    DateOfBirth DATE,
    Alias VARCHAR(30),
    ActivityStatus BOOL
);
-- Insert data into the temporary table
INSERT INTO TempMembers (FirstName, LastName, DateOfBirth, Alias, ActivityStatus)
VALUES ('Adele', 'Adkins', '1988-05-05', 'Adele', TRUE), 
       ('Abel', 'Tesfaye', '1990-02-16', 'The Weeknd', TRUE);
-- Insert data from the temporary table into Member
INSERT INTO Member (FirstName, LastName, DateOfBirth, Alias, ActivityStatus) 
SELECT FirstName, LastName, DateOfBirth, Alias, ActivityStatus 
FROM TempMembers;
-- Drop the temporary table
DROP TABLE TempMembers;
SELECT * FROM Member;

-- Membership 
-- Insert Type 1
INSERT INTO Membership (ArtistID, MemberID, DateJoined, DateLeft, Role) 
VALUES ('', '', '2006-10-01', NULL, 'Singer'); -- Both ID's temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO Membership -- Both ID's temporarily left blank due to auto-increment
SET ArtistID = '', 
    MemberID = '', 
    DateJoined = '2011-09-01', 
    DateLeft = NULL, 
    Role = 'Singer-Songwriter';
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempMemberships (
    ArtistID INT,
    MemberID INT,
    DateJoined DATE,
    DateLeft DATE,
    Role VARCHAR(30)
);
-- Insert data into the temporary table
INSERT INTO TempMemberships (ArtistID, MemberID, DateJoined, DateLeft, Role)
VALUES ('', '', '2006-01-01', NULL, 'Singer'), -- Both ID's temporarily left blank due to auto-increment
       ('', '', '2010-06-01', NULL, 'Singer-Songwriter');
-- Insert data from the temporary table into Membership
INSERT INTO Membership (ArtistID, MemberID, DateJoined, DateLeft, Role) 
SELECT ArtistID, MemberID, DateJoined, DateLeft, Role 
FROM TempMemberships;
-- Drop the temporary table
DROP TABLE TempMemberships;
SELECT * FROM Membership;

-- Album
-- Insert Type 1
INSERT INTO Album (Title, AuthorArtistID, NumberOfSongs, ReleaseDate)
VALUES ('1989', '', 13, '2014-10-27'); -- AuthorArtistID temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO Album 
SET Title = 'Divide', 
    AuthorArtistID = '', -- AuthorArtistID temporarily left blank due to auto-increment
    NumberOfSongs = 12, 
    ReleaseDate = '2017-03-03';
-- Create a temporary table
CREATE TEMPORARY TABLE TempAlbums (
    Title VARCHAR(60),
    AuthorArtistID INT,
    NumberOfSongs INT,
    ReleaseDate DATE
);
-- Insert Type 3
-- Insert data into the temporary table
INSERT INTO TempAlbums (Title, AuthorArtistID, NumberOfSongs, ReleaseDate)
VALUES ('25', '', 11, '2015-11-20'), -- AuthorArtistID temporarily left blank due to auto-increment
       ('After Hours', '', 14, '2020-03-20');
-- Insert data from the temporary table into Album
INSERT INTO Album (Title, AuthorArtistID, NumberOfSongs, ReleaseDate) 
SELECT Title, AuthorArtistID, NumberOfSongs, ReleaseDate 
FROM TempAlbums;
-- Drop the temporary table
DROP TABLE TempAlbums;
SELECT * FROM Album;

-- Song
-- Insert Type 1
INSERT INTO Song (Title, ReleaseDate, Streams, Sales, AuthorArtistID, AlbumID)
VALUES ('Shake It Off', '2014-08-18', 300000000, 5000000, '', ''); -- Both ID's temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO Song 
SET Title = 'Shape of You', 
    ReleaseDate = '2017-01-06', 
    Streams = 500000000, 
    Sales = 10000000, 
    AuthorArtistID = '', -- Both ID's temporarily left blank due to auto-increment
    AlbumID = '';
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempSongs (
    Title VARCHAR(60),
    ReleaseDate DATE,
    Streams INT,
    Sales INT,
    AuthorArtistID INT,
    AlbumID INT
);
-- Insert data into the temporary table
INSERT INTO TempSongs (Title, ReleaseDate, Streams, Sales, AuthorArtistID, AlbumID)
VALUES ('Rolling in the Deep', '2011-11-29', 200000000, 7000000, '',''), -- Both ID's temporarily left blank due to auto-increment
       ('Blinding Lights', '2019-11-29', 800000000, 15000000, '', '');
-- Insert data from the temporary table into Song
INSERT INTO Song (Title, ReleaseDate, Streams, Sales, AuthorArtistID, AlbumID)
SELECT Title, ReleaseDate, Streams, Sales, AuthorArtistID, AlbumID
FROM TempSongs;
-- Drop the temporary table
DROP TABLE TempSongs;
SELECT * FROM Song;

-- LiveEvents
-- Insert Type 1
INSERT INTO LiveEvents (Date, Name, HostArtistID, Location)
VALUES ('2024-12-01', 'The Eras Tour', '', 'United States of America'); -- HostArtistID temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO LiveEvents 
SET Date = '2024-12-15', 
    Name = 'Divide Tour', 
    HostArtistID = '', -- HostArtistID temporarily left blank due to auto-increment
    Location = 'United Kingdom';
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempLiveEvents (
    Date DATE,
    Name VARCHAR(60),
    HostArtistID INT,
    Location VARCHAR(60)
);
-- Insert data into the temporary table
INSERT INTO TempLiveEvents (Date, Name, HostArtistID, Location)
VALUES ('2024-11-10', 'X Tour', '', 'Australia'), -- HostArtistID temporarily left blank due to auto-increment
       ('2024-12-05', 'After Hours Tour', '', 'Canada');
-- Insert data from the temporary table into LiveEvents
INSERT INTO LiveEvents (Date, Name, HostArtistID, Location)
SELECT Date, Name, HostArtistID, Location
FROM TempLiveEvents;
-- Drop the temporary table
DROP TABLE TempLiveEvents;
SELECT * FROM LiveEvents;

-- PerformanceType
-- Insert Type 1
INSERT INTO PerformanceType (ArtistID, EventID, Type)
VALUES ('', '', 'Headliner'); -- Both ID's temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO PerformanceType 
SET ArtistID = '', -- Both ID's temporarily left blank due to auto-increment
    EventID = '', 
    Type = 'Opening Act';
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempPerformanceTypes (
    ArtistID INT,
    EventID INT,
    Type VARCHAR(30)
);
-- Insert data into the temporary table
INSERT INTO TempPerformanceTypes (ArtistID, EventID, Type)
VALUES ('', '', 'Guest Performer'), -- Both ID's temporarily left blank due to auto-increment
       ('', '', 'Headliner');
-- Insert data from the temporary table into PerformanceType
INSERT INTO PerformanceType (ArtistID, EventID, Type)
SELECT ArtistID, EventID, Type
FROM TempPerformanceTypes;
-- Drop the temporary table
DROP TABLE TempPerformanceTypes;
SELECT * FROM PerformanceType;

-- Producer
-- Insert Type 1
INSERT INTO Producer (FirstName, LastName, Alias, AssociatedLabel, Creation, NetWorth, NumberOfArtists)
VALUES ('Jack', 'Antonoff', 'Bleachers', '', '2010', 15000000.00, 5); -- AssociatedLabel is temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO Producer 
SET FirstName = 'Ed', 
    LastName = 'Sheeran', 
    Alias = 'Teddy', 
    AssociatedLabel = '', -- AssociatedLabel is temporarily left blank due to auto-increment
    Creation = '1999', 
    NetWorth = 10000000.00, 
    NumberOfArtists = 3;
-- Insert Type 3
-- Create a temporary table for producers
CREATE TEMPORARY TABLE TempProducers (
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Alias VARCHAR(30),
    AssociatedLabel INT,
    Creation VARCHAR(30),
    NetWorth DECIMAL(25,2),
    NumberOfArtists INT
);
-- Insert data into the temporary table
INSERT INTO TempProducers (FirstName, LastName, Alias, AssociatedLabel, Creation, NetWorth, NumberOfArtists)
VALUES ('Greg', 'Krustin', 'Greg Krustin', '', '2011', 20000000.00, 4), -- AssociatedLabel is temporarily left blank due to auto-increment
       ('Abel', 'Tesfaye', 'The Weeknd', '', '2010', 50000000.00, 6);
-- Insert data from the temporary table into Producer
INSERT INTO Producer (FirstName, LastName, Alias, AssociatedLabel, Creation, NetWorth, NumberOfArtists)
SELECT FirstName, LastName, Alias, AssociatedLabel, Creation, NetWorth, NumberOfArtists
FROM TempProducers;
-- Drop the temporary table
DROP TABLE TempProducers;
SELECT * FROM Producer;

-- Production
-- Insert Type 1
INSERT INTO Production (ProducerID, ISRCCode, Date, Role)
VALUES ('', '', '2015-05-17', 'Producer'); -- Both ID's temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO Production 
SET ProducerID = '', -- Both ID's temporarily left blank due to auto-increment
    ISRCCode = '', 
    Date = '2015-10-23', 
    Role = 'Producer';
-- Insert Type 3
-- Create a temporary table for productions
CREATE TEMPORARY TABLE TempProductions (
    ProducerID INT,
    ISRCCode INT,
    Date DATE,
    Role VARCHAR(30)
);
-- Insert data into the temporary table
INSERT INTO TempProductions (ProducerID, ISRCCode, Date, Role)
VALUES ('', '', '2017-11-10', 'Co-Producer'), -- Both ID's temporarily left blank due to auto-increment
       ('', '', '2019-11-29', 'Executive Producer');
-- Insert data from the temporary table into Production
INSERT INTO Production (ProducerID, ISRCCode, Date, Role)
SELECT ProducerID, ISRCCode, Date, Role
FROM TempProductions;
-- Drop the temporary table
DROP TABLE TempProductions;
SELECT * FROM Production;

-- Collaboration
-- Insert Type 1
INSERT INTO Collaboration (ISRCCode, ArtistID, Type)
VALUES ('', '', 'Featured Artist'); -- Both ID's temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO Collaboration 
SET ISRCCode = '', -- Both ID's temporarily left blank due to auto-increment
    ArtistID = '', 
    Type = 'Remix Artist';
-- Insert Type 3
-- Create a temporary table for collaborations
CREATE TEMPORARY TABLE TempCollaborations (
    ISRCCode INT,
    ArtistID INT,
    Type VARCHAR(30)
);
-- Insert data into the temporary table
INSERT INTO TempCollaborations (ISRCCode, ArtistID, Type)
VALUES ('', '', 'Producer'), -- Both ID's temporarily left blank due to auto-increment
       ('', '', 'Featured Artist');
-- Insert data from the temporary table into Collaboration
INSERT INTO Collaboration (ISRCCode, ArtistID, Type)
SELECT ISRCCode, ArtistID, Type
FROM TempCollaborations;
-- Drop the temporary table
DROP TABLE TempCollaborations;
SELECT * FROM Collaboration;

-- Genre
-- I'll make more genres later...
-- Insert Type 1
INSERT INTO Genre (Name, Description, OriginDate)
VALUES ('', '', '');
-- Insert Type 2
INSERT INTO Genre 
SET Name = '', 
    Description = '', 
    OriginDate = '';
-- Insert Type 3
-- Create a temporary table for genres
CREATE TEMPORARY TABLE TempGenres (
    Name VARCHAR(60),
    Description VARCHAR(1000),
    OriginDate DATE
);
-- Insert data into the temporary table
INSERT INTO TempGenres (Name, Description, OriginDate)
VALUES ('', '', ''),
       ('', '', '');
-- Insert data from the temporary table into Genre
INSERT INTO Genre (Name, Description, OriginDate)
SELECT Name, Description, OriginDate
FROM TempGenres;
-- Drop the temporary table
DROP TABLE TempGenres;
SELECT * FROM Genre;

-- MultiGenreType
-- Insert Type 1
INSERT INTO MultiGenreType (GenreName, ISRCCode, Type)
VALUES ('Pop', '', '1 Genre'); -- ISRC code temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO MultiGenreType 
SET GenreName = 'Synthwave', 
    ISRCCode = '', -- ISRC code temporarily left blank due to auto-increment
    Type = '1 Genre';
-- Insert Type 3
-- Create a temporary table for multi-genre associations
CREATE TEMPORARY TABLE TempMultiGenres (
    GenreName VARCHAR(60),
    ISRCCode INT,
    Type VARCHAR(30)
);
-- Insert data into the temporary table
INSERT INTO TempMultiGenres (GenreName, ISRCCode, Type)
VALUES ('Pop', '', '1 Genre'), -- ISRC code temporarily left blank due to auto-increment
       ('R&B', '', '1 Genre');
-- Insert data from the temporary table into MultiGenreType
INSERT INTO MultiGenreType (GenreName, ISRCCode, Type)
SELECT GenreName, ISRCCode, Type
FROM TempMultiGenres;
-- Drop the temporary table
DROP TABLE TempMultiGenres;
SELECT * FROM MultiGenreType;

-- Awards
-- Insert Type 1
INSERT INTO Awards (Title, PresentationDate, Value, Category, CreationYear, RecipientArtistID)
VALUES ('Grammy Award for Album of the Year', '2024-02-05', 500000, 'Album of the Year', '2024', ''); -- RecipientArtistID is temporarily left blank due to auto-increment
-- Insert Type 2
INSERT INTO Awards 
SET Title = 'Grammy Award for Song of the Year', 
    PresentationDate = '2024-02-05', 
    Value = 500000, 
    Category = 'Song of the Year', 
    CreationYear = '2024', 
    RecipientArtistID = ''; -- RecipientArtistID is temporarily left blank due to auto-increment
-- Insert Type 3
-- Create a temporary table for awards
CREATE TEMPORARY TABLE TempAwards (
    Title VARCHAR(60),
    PresentationDate DATE,
    Value DECIMAL(10,2),
    Category VARCHAR(30),
    CreationYear DATE,
    RecipientArtistID INT
);
-- Insert data into the temporary table
INSERT INTO TempAwards (Title, PresentationDate, Value, Category, CreationYear, RecipientArtistID)
VALUES ('Grammy Award for Best Pop Solo Performance', '2024-02-05', 500000, 'Pop Solo Performance', '2024', ''),
       ('Grammy Award for Best R&B Song', '2024-02-05', 500000, 'R&B Song', '2024', ''); -- RecipientArtistID is temporarily left blank due to auto-increment
-- Insert data from the temporary table into Awards
INSERT INTO Awards (Title, PresentationDate, Value, Category, CreationYear, RecipientArtistID)
SELECT Title, PresentationDate, Value, Category, CreationYear, RecipientArtistID
FROM TempAwards;
-- Drop the temporary table
DROP TABLE TempAwards;
SELECT * FROM Awards;