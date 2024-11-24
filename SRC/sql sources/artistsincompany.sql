select c.Name as 'Company', l.LabelName as 'Label Name', count(a.Name) as 'Number of Artists'
from label l join artist a on l.LabelID = a.LabelID join company c on c.Name = l.CompanyName
group by c.Name, l.labelName;