-- 1. Simple INSERT with VALUES - inserting a single artist
INSERT INTO Artist (Name, CreationYear, YearsActive, NumberOfMembers, MonthlyListeners, FromRegion, LabelID)
VALUES ('BTS', 2013, 10, 7, 43000000, 'Republic of Korea', 1);

-- 2. Multiple row INSERT - inserting multiple artists at once
INSERT INTO Artist (Name, CreationYear, YearsActive, NumberOfMembers, MonthlyListeners, FromRegion, LabelID)
VALUES 
    ('BLACKPINK', 2016, 7, 4, 35000000, 'Republic of Korea', 1),
    ('Red Velvet', 2014, 9, 5, 12000000, 'Republic of Korea', 2),
    ('IVE', 2021, 2, 6, 8000000, 'Republic of Korea', 3);

-- 3. INSERT using SELECT - creating new artists based on existing data
-- This inserts solo artists for each member of groups with more than 5 members
INSERT INTO Artist (Name, CreationYear, YearsActive, NumberOfMembers, MonthlyListeners, FromRegion, LabelID)
SELECT 
    CONCAT(Name, ' Solo Project'), -- Creates a new name based on group name
    2024, -- Current year for new solo projects
    1, -- First year active
    1, -- Solo artist (1 member)
    FLOOR(MonthlyListeners / NumberOfMembers), -- Estimates solo listener count
    FromRegion, -- Same region as original group
    LabelID -- Same label as original group
FROM Artist 
WHERE NumberOfMembers > 5;

-- View the results
SELECT * FROM Artist ORDER BY CreationYear DESC;