UPDATE OP
SET IsDeleted = 1,
	UpdateDate = dbo.GetLocalDate(DEFAULT),
	UpdatedById = 1
from ObservationSkills OS
INNER JOIN Standard_Master SM
ON OS.StandardId = SM.Standard_Id
inner join ObservationParameters op
on os.Id = op.SkillId
where os.AcademicYearId = 4
and os.IsDeleted = 0
AND SM.Standard_Name IN ('Nursery','Junior KG')
and op.IsDeleted = 0

UPDATE OS
SET IsDeleted = 1,
	UpdateDate = dbo.GetLocalDate(DEFAULT),
	UpdatedById = 1
from ObservationSkills OS
INNER JOIN Standard_Master SM
ON OS.StandardId = SM.Standard_Id
where os.AcademicYearId = 4
and os.IsDeleted = 0
AND SM.Standard_Name IN ('Nursery','Junior KG')