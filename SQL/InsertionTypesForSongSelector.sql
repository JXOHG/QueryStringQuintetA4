-- Region
-- I'll make more countries later
-- Insert Type 1 
INSERT INTO Region (Country, Language) 
VALUES ('Canada', 'English');

-- Company
-- Insert Type 2
INSERT INTO Company 
SET Name = 'Sony Music Entertainment', 
    NumberOfEmployees = 8500, 
    NetWorth = 18000000000.00;

-- Label
-- Insert Type 3
-- Create a temporary table
CREATE TEMPORARY TABLE TempLabels (
    LabelName VARCHAR(60),
    CompanyName VARCHAR(60),
    Type VARCHAR(30)
);
-- Insert data into the temporary table
INSERT INTO TempLabels (LabelName, CompanyName, Type) 
VALUES ('RCA Records', 'Sony Music Entertainment', 'Type5'),  
-- Insert data from the temporary table into Label
INSERT INTO Label (LabelName, CompanyName, Type) 
SELECT LabelName, CompanyName, Type 
FROM TempLabels;
-- Drop the temporary table
DROP TABLE TempLabels;
SELECT * FROM Label;
