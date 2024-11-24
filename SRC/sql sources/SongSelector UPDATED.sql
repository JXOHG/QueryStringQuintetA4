CREATE DATABASE SongSelector;

USE SongSelector;

CREATE TABLE Region(Country VARCHAR(60) UNIQUE NOT NULL, 
	Language VARCHAR(30),
    PRIMARY KEY (Country)
	);
SELECT Country, Language
FROM Region;

CREATE TABLE Company(Name VARCHAR(60) UNIQUE NOT NULL, 
	NumberOfEmployees INT, 
	NetWorth DECIMAL(25,2),
    PRIMARY KEY (Name)
	);
-- CALL InsertCompanies();
SELECT * FROM Company
ORDER BY NetWorth;

CREATE TABLE Label(LabelID INT  UNIQUE NOT NULL AUTO_INCREMENT,
	LabelName VARCHAR(60) NOT NULL, 
    CompanyName VARCHAR(60) NOT NULL, 
    Type VARCHAR(30),
    PRIMARY KEY (LabelID),
    UNIQUE (LabelName, CompanyName),
    FOREIGN KEY (CompanyName) REFERENCES Company(Name) ON UPDATE CASCADE
	);
-- CALL InsertLabels();
SELECT * FROM Label
ORDER BY Type;
    
CREATE TABLE Artist(SpotifyID INT  UNIQUE NOT NULL AUTO_INCREMENT, 
	Name VARCHAR(60) NOT NULL, 
	CreationYear INT NOT NULL CHECK(CreationYear > 0),
	EndYear INT CHECK (EndYear > 0), 
	YearsActive INT NOT NULL, 
	NumberOfMembers INT NOT NULL,
	MonthlyListeners INT NOT NULL,
    FromRegion VARCHAR(60),
    LabelID INT,
    PRIMARY KEY (SpotifyID),
    FOREIGN KEY (FromRegion) REFERENCES Region(Country),
    FOREIGN KEY (LabelID) REFERENCES Label(LabelID) ON DELETE SET NULL
	);
SELECT * FROM Artist
ORDER BY LabelID;
SELECT SUM(NumberOfMembers) AS TotalMembers
FROM Artist;
SELECT COUNT(*) AS NumberOfArtistsWithThreeMembers
FROM Artist
WHERE NumberOfMembers = 3;
		
CREATE TABLE Member(MemberID INT UNIQUE NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	DateOfBirth DATE NOT NULL,
	Alias VARCHAR(30) NOT NULL,
	ActivityStatus BOOL,
    PRIMARY KEY (MemberID),
	UNIQUE (FirstName, LastName, DateOfBirth),
	UNIQUE (FirstName, LastName, Alias)
	);
SELECT * FROM Member;
    
CREATE TABLE Membership (
    MembershipID INT UNIQUE NOT NULL AUTO_INCREMENT,
    ArtistID INT NOT NULL,
    MemberID INT NOT NULL,
    DateJoined DATE NOT NULL,
    DateLeft DATE,
    Role VARCHAR(30),
    UNIQUE (ArtistID , MemberID , DateJoined),
    PRIMARY KEY (MembershipID),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist (SpotifyID)
        ON DELETE CASCADE,
    FOREIGN KEY (MemberID)
        REFERENCES Member (MemberID)
        ON DELETE CASCADE
);
SELECT * FROM Membership;

    CREATE TABLE Album(AlbumID INT UNIQUE NOT NULL AUTO_INCREMENT, 
	Title VARCHAR(60) NOT NULL, 
    AuthorArtistID INT, 
    NumberOfSongs INT NOT NULL, 
    ReleaseDate DATE NOT NULL,
    PRIMARY KEY (AlbumID),
    UNIQUE (Title, ReleaseDate),
    UNIQUE (Title, NumberOfSongs),
    FOREIGN KEY (AuthorArtistID) REFERENCES Artist(SpotifyID) ON DELETE SET NULL
    );
SELECT * FROM Album
ORDER BY NumberOfSongs;
SELECT SUM(NumberOfSongs) AS TotalSongs
FROM Album;

CREATE TABLE Song(ISRCCode INT UNIQUE NOT NULL AUTO_INCREMENT, 
	Title VARCHAR(60) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Streams INT NOT NULL,
    Sales INT NOT NULL, 
    AuthorArtistID INT,
    AlbumID INT,
    PRIMARY KEY (ISRCCode),
    FOREIGN KEY (AuthorArtistID) REFERENCES Artist(SpotifyID) ON DELETE SET NULL,
	FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID) ON DELETE SET NULL
    );
SELECT * FROM Song;
    
CREATE TABLE LiveEvents(LiveEventID INT UNIQUE NOT NULL AUTO_INCREMENT, 
	Date DATE NOT NULL, 
	Name VARCHAR(60), 
    HostArtistID INT, 
    Location VARCHAR(60),
    PRIMARY KEY (LiveEventID),
    UNIQUE (Name, Date),
    UNIQUE (Date, HostArtistID, Location),
    FOREIGN KEY (HostArtistID) REFERENCES Artist(SpotifyID) ON DELETE SET NULL,
    FOREIGN KEY (Location) REFERENCES Region(Country)
    );
SELECT * FROM LiveEvents;

CREATE TABLE PerformanceType(PerformanceTypeID INT UNIQUE NOT NULL AUTO_INCREMENT,
	ArtistID INT NOT NULL, 
    EventID INT NOT NULL,  
    Type VARCHAR(30) NOT NULL, -- Changed to 'Type', 'Role' does not make sense
    PRIMARY KEY (PerformanceTypeID), 
    UNIQUE (ArtistID, EventID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(SpotifyID) ON DELETE CASCADE,
    FOREIGN KEY (EventID) REFERENCES LiveEvents(LiveEventID) ON DELETE CASCADE
    );
SELECT * FROM PerformanceType;

CREATE TABLE Producer(ProducerID INT UNIQUE NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(30) NOT NUL\L, 
    LastName VARCHAR(30) NOT NULL, 
    Alias VARCHAR(30) NOT NULL, 
    AssociatedLabel INT, 
    Creation VARCHAR(30) NOT NULL, 
    NetWorth DECIMAL(25,2), 
    NumberOfArtists INT,
    PRIMARY KEY (ProducerID),
    UNIQUE (FirstName, LastName, Alias),
    FOREIGN KEY (AssociatedLabel) REFERENCES Label(LabelID) ON DELETE SET NULL
    );
-- CALL InsertProducers();
SELECT * FROM Producer
ORDER BY Networth;

CREATE TABLE Production(ProductionID INT UNIQUE NOT NULL AUTO_INCREMENT,
	ProducerID INT, 
    ISRCCode INT NOT NULL, 
    Date DATE NOT NULL, 
    Role VARCHAR(30) NOT NULL,
    PRIMARY KEY (ProductionID),
    UNIQUE (ISRCCode, Date, Role),
    FOREIGN KEY (ProducerID) REFERENCES Producer(ProducerID) ON DELETE CASCADE,
	FOREIGN KEY (ISRCCode) REFERENCES Song(ISRCCode) ON DELETE CASCADE
    );
SELECT * FROM Production;

CREATE TABLE Collaboration(CollaborationID INT UNIQUE NOT NULL AUTO_INCREMENT,
	ISRCCode INT NOT NULL, 
    ArtistID INT NOT NULL, 
    Type VARCHAR(30),
    PRIMARY KEY (CollaborationID),
    UNIQUE (ISRCCode, ArtistID),
    FOREIGN KEY (ISRCCode) REFERENCES Song(ISRCCode)ON DELETE CASCADE,
    FOREIGN KEY (ArtistID) REFERENCES Artist(SpotifyID) ON DELETE CASCADE 
    );
SELECT * FROM Collaboration;

CREATE TABLE Genre(Name VARCHAR(60) UNIQUE NOT NULL, 
	Description VARCHAR(1000), 
    OriginDate DATE,
    PRIMARY KEY (Name)
    );
Select Name, Description, OriginDate
FROM Genre;

CREATE TABLE MultiGenreType(MultiGenreTypeID INT UNIQUE NOT NULL AUTO_INCREMENT,
	GenreName VARCHAR(60) NOT NULL, 
    ISRCCode INT NOT NULL, 
    Type VARCHAR(30),
    PRIMARY KEY (MultiGenreTypeID),
    UNIQUE (GenreName, ISRCCode),
    FOREIGN KEY (GenreName) REFERENCES Genre(Name) ON DELETE CASCADE,
	FOREIGN KEY (ISRCCode) REFERENCES Song(ISRCCode) ON DELETE CASCADE
    );
SELECT * FROM MultiGenreType;

CREATE TABLE Awards (
    AwardID INT UNIQUE NOT NULL AUTO_INCREMENT,
    Title VARCHAR(60) NOT NULL,
    PresentationDate DATE NOT NULL,
    Value DECIMAL(10 , 2 ) NOT NULL,
    Category VARCHAR(30),
    CreationYear DATE,
    RecipientArtistID INT NOT NULL,
    PRIMARY KEY (AwardID),
    UNIQUE (Title , PresentationDate),
    UNIQUE (PresentationDate , Value , RecipientArtistID),
    FOREIGN KEY (RecipientArtistID)
        REFERENCES Artist (SpotifyID)
        ON DELETE CASCADE
);
SELECT * FROM AWARDS
ORDER BY RecipientArtistID;

