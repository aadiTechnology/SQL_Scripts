UPDATE SOD
SET IsDeleted = 1,
	UpdatedById = 1,
	UpdateDate = DBO.GetLocalDate(DEFAULT)
from StudentObservationDetails SOD
inner join ObservationParameters op
on sod.ParameterId = op.Id
inner join ObservationSkills os
on op.SkillId = os.Id
inner join YearWise_Student_Details ysd
on sod.StudentId = ysd.YearWise_Student_Id
and os.StandardId = ysd.Standard_Id
inner join vw_standard_division VSD
on ysd.Standard_Id = VSD.Standard_Id
and ysd.Division_id = VSD.Division_Id
inner join Subject_Master sub
on os.SubjectId = sub.Subject_Id
where SOD.SchoolId = 122
and sod.AcademicYearId = 11
and sod.IsDeleted = 0
and op.IsDeleted = 0
and os.IsDeleted = 0
AND VSD.className IN ('8-D','8-E')
and sub.Is_Deleted = 'N'
and sub.Subject_Name IN ('ICT','Robotics','Coding')

UPDATE OSS
SET IsSubmitted = 0,
	UpdateDate = dbo.GetLocalDate(default),
	UpdatedById = 1
from ObservationSubmissionStatus OSS
inner join vw_standard_division vsd
on OSS.StdDivId = vsd.SchoolWise_Standard_Division_Id
inner join Subject_Master sm
on oss.SubjectId = sm.Subject_Id
where OSS.SchoolId = 122
and OSS.AcademicYearId = 11
and OSS.IsDeleted = 0
AND VSD.className IN ('8-D','8-E')
and sm.Is_Deleted = 'N'
and sm.Subject_Name IN ('ICT','Robotics','Coding')