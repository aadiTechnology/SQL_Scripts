INSERT INTO SkillWiseRemarks
(
    SkillId,
    Remarks,
    IsDeleted,
    ParameterId,
    GradeId
)
SELECT NewSkill.Id, SKR.Remarks, SKR.IsDeleted, NUll, Null
FROM SkillWiseRemarks SKR
INNER JOIN ObservationSkills OldSkill
    ON SKR.SkillId = OldSkill.Id
INNER JOIN Standard_Master OldStd
    ON OldSkill.StandardId = OldStd.Standard_Id
Inner Join Subject_Master OLDSM
ON OLDSM.Subject_Id=OldSkill.SubjectId
INNER JOIN Standard_Master NewStd
    ON NewStd.Original_Standard_Id = OldStd.Original_Standard_Id
Inner Join Subject_Master NEWSM
ON NEWSM.Original_Subject_Id=OLDSM.Original_Subject_Id
INNER JOIN ObservationSkills NewSkill
    ON NewSkill.Name = OldSkill.Name
    AND NewSkill.OriginalSkillId = OldSkill.OriginalSkillId
    AND NewSkill.StandardId = NewStd.Standard_Id
	AND NewSkill.SubjectId = NEWSM.Subject_Id
    AND NewSkill.AcademicYearId = 4
WHERE OldSkill.AcademicYearId = 3
AND SKR.IsDeleted = 0
and NewStd.academic_Year_Id = 4
AND OldSkill.IsDeleted = 0
AND NewSkill.IsDeleted = 0
AND OldStd.Is_Deleted = 'N'
AND NewStd.Is_Deleted = 'N'
AND NEWSM.Is_Deleted='N'
AND OLDSM.Is_Deleted='N'





