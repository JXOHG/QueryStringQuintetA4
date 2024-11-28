USE SongSelector;
DELIMITER //
CREATE PROCEDURE artistTopStreamedSongs()
BEGIN 
 SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'ISRCCode', s.ISRCCode,
            'Song Title', s.Title,
            'Artist Name', a.Name,
            'Member First Name', b.FirstName,
            'Member Last Name', b.LastName,
            'Streams', s.Streams
        )	
)
from membership m join song s on s.AuthorArtistID = m.ArtistID join member b on b.MemberID = m.MemberID join artist a on a.SpotifyID = m.ArtistID
where (b.FirstName = 'Montero' and b.LastName = 'West') or a.Name = 'Whimsical Fantasies'
-- where (b.FirstName = 'Montero' and b.LastName = 'West')
-- where a.Name = 'Whimsical Fantasies'
order by s.Streams desc
limit 5;

END//
DELIMITER ;

call artistTopStreamedSongs();