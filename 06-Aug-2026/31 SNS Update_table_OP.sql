UPDATE OP
SET IsDeleted = 1,
UpdateDate = dbo.GetLocalDate(default),
UpdatedById  =1
from ObservationSkills os
INNER JOIN Standard_Master SM
ON OS.StandardId = SM.Standard_Id
INNER JOIN Subject_Master SUB
ON OS.SubjectId = SUB.Subject_Id
INNER JOIN ObservationParameters OP
ON OS.Id = OP.SkillId
LEFT OUTER JOIN
(
	select SM.Standard_Name,SUB.Subject_Name, os.Name AS SkillName, op.Parameter
	from ObservationSkills os
	INNER JOIN Standard_Master SM
	ON OS.StandardId = SM.Standard_Id
	INNER JOIN Subject_Master SUB
	ON OS.SubjectId = SUB.Subject_Id
	INNER JOIN ObservationParameters OP
	ON OS.Id = OP.SkillId
	where OS.AcademicYearId = 11
	and OS.IsDeleted = 0
	AND SUB.Is_Deleted = 'N'
	AND SM.Is_Deleted = 'N'
	AND OP.IsDeleted = 0
)S
ON SM.Standard_Name = S.Standard_Name
AND SUB.Subject_Name = S.Subject_Name
AND OS.Name = S.SkillName
AND OP.Parameter = S.Parameter
where OS.AcademicYearId = 13
and OS.IsDeleted = 0
AND SUB.Is_Deleted = 'N'
AND SM.Is_Deleted = 'N'
AND OP.IsDeleted = 0
AND S.Parameter IS NULL

UPDATE StudentObservationDetails
SET IsDeleted = 1,
	UpdateDate = dbo.GetLocalDate(default),
	UpdatedById  =1
where AcademicYearId = 13
and IsDeleted = 0
and ParameterId IN
(
	select ParameterId 
	from ObservationParameters
	where IsDeleted = 1
	and AcademicYearId = 13
)