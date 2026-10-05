update op
set Parameter = 'Activities that i find difficult to do'
from ObservationParameters op
inner join ObservationSkills os
on op.SkillId = os.Id
inner join Standard_Master sm
on os.StandardId = sm.Standard_Id
where Parameter = '2. Activities that i find difficult to do'
and sm.academic_Year_Id = 4
and os.IsDeleted = 0
and op.IsDeleted = 0
and sm.Standard_Name in ('Nursery','Junior KG')