INSERT INTO SkillWiseRemarks
(
    SkillId,
    Remarks,
    IsDeleted,
    ParameterId,
    GradeId
)
SELECT
    NewSkill.Id,
    SKR.Remarks,
    SKR.IsDeleted,
    NewParam.Id,
    NewGrade.Id
FROM SkillWiseRemarks SKR
INNER JOIN ObservationSkills OldSkill
    ON SKR.SkillId = OldSkill.Id
INNER JOIN Standard_Master OldStd
    ON OldSkill.StandardId = OldStd.Standard_Id
INNER JOIN ObservationParameters OldParam
    ON OldParam.Id = SKR.ParameterId
INNER JOIN ObservationSummaryRemarkGrades OldGrade
    ON OldGrade.Id = SKR.GradeId
INNER JOIN Standard_Master NewStd
    ON NewStd.Original_Standard_Id = OldStd.Original_Standard_Id
INNER JOIN ObservationSkills NewSkill
    ON NewSkill.Name = OldSkill.Name
    AND NewSkill.OriginalSkillId = OldSkill.OriginalSkillId
    AND NewSkill.StandardId = NewStd.Standard_Id
    AND NewSkill.AcademicYearId = 13
INNER JOIN ObservationParameters NewParam
    ON NewParam.SkillId = NewSkill.Id
    AND NewParam.Parameter = OldParam.Parameter
INNER JOIN ObservationSummaryRemarkGrades NewGrade
    ON NewGrade.OriginalGradeId = OldGrade.OriginalGradeId
    AND NewGrade.AcademicYearId = 13
WHERE OldSkill.AcademicYearId = 11
AND SKR.IsDeleted = 0
and NewStd.academic_Year_Id = 13
AND OldSkill.IsDeleted = 0
AND NewSkill.IsDeleted = 0
AND OldParam.IsDeleted = 0
AND NewParam.IsDeleted = 0
AND OldGrade.IsDeleted = 0
AND NewGrade.IsDeleted = 0
AND OldStd.Is_Deleted = 'N'
AND NewStd.Is_Deleted = 'N';