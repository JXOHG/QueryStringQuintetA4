#THIS IS NUMBER 5
DELIMITER $$

CREATE PROCEDURE ArtistActiveMembers()

BEGIN
SELECT m.MemberID, m.FirstName, m.LastName, m.Alias, m.DateOfBirth, ms.Role, ms.DateJoined
FROM Membership ms
JOIN Member m
ON ms.MemberID = m.MemberID
JOIN Artist a
ON ms.ArtistID = a.SpotifyID
WHERE a.Name = 'Harmonic Chorales'
ORDER BY m.LastName, m.FirstName;

END$$
DELIMITER ;
