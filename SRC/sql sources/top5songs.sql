select s.ISRCCode, s.Title as 'Song Title', a.Name, b.FirstName, b.LastName, s.Streams
from membership m join song s on s.AuthorArtistID = m.ArtistID join member b on b.MemberID = m.MemberID join artist a on a.SpotifyID = m.ArtistID
where (b.FirstName = 'Montero' and b.LastName = 'West') or a.Name = 'Whimsical Fantasies'
-- where (b.FirstName = 'Montero' and b.LastName = 'West')
-- where a.Name = 'Whimsical Fantasies'
order by s.Streams desc
limit 5