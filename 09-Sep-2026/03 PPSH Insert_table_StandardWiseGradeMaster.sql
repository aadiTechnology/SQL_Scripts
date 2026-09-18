INSERT INTO StandardWiseGradeMaster(StandardId, GradeId, IsDeleted, IsParentEngagement)
SELECT
    SM.Standard_Id,
    OG.Id,
    0,
    0
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 15
    AND OG.AcademicYearId = 15
    AND SM.School_Id = 11
    AND SM.Standard_Name IN ('6','7','8')
    AND OG.Id BETWEEN 57 AND 61;