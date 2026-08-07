UPDATE OP
SET IsDeleted = 1,
	UpdateDate = dbo.GetLocalDate(default),
	UpdatedById = 1
from ObservationParameters OP
inner join
(
	select SkillId,Parameter, MIN(Id) AS MinId
	from ObservationParameters
	where AcademicYearId = 13
	and IsDeleted = 0
	group by SkillId,Parameter
	having count(1) > 1
)s
on op.SkillId = s.SkillId
and op.Parameter = s.Parameter
where AcademicYearId = 13
and IsDeleted = 0
and op.Id <> s.MinId
