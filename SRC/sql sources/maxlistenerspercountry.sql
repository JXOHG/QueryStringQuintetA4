select r.country as Country, r.Language, a.name as 'Artist Name', a.NumberOfMembers as 'Number of Group Members', max(a.MonthlyListeners) as 'Max Listeners'
from region r, artist a 
where a.FromRegion = r.Country
group by r.country, a.name, a.NumberOfMembers
order by max(a.MonthlyListeners) desc
limit 10;