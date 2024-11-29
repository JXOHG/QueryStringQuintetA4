USE SongSelector;
DELIMITER $$
CREATE PROCEDURE ArtistActiveMembers()
BEGIN
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'MemberID', m.MemberID,
            'FirstName', m.FirstName,
            'LastName', m.LastName,
            'Alias', m.Alias,
            'DateOfBirth', m.DateOfBirth,
            'Role', ms.Role,
            'DateJoined', ms.DateJoined
        )
    ) AS ArtistActiveMembersJSON
    FROM Membership ms
    JOIN Member m ON ms.MemberID = m.MemberID
    JOIN Artist a ON ms.ArtistID = a.SpotifyID
    WHERE a.Name = 'Harmonic Chorales'
    ORDER BY m.LastName, m.FirstName;
END$$
DELIMITER ;

CALL ArtistActiveMembers();