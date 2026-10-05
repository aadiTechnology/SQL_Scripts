INSERT INTO StandardWiseGradeMaster(StandardId, GradeId, IsDeleted, IsParentEngagement)
SELECT
    SM.Standard_Id,
    OG.Id,
    0,
    0
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 1
    AND OG.AcademicYearId = 1
    AND SM.School_Id In (172,173)
	AND OG.IsDeleted=0
    AND SM.Standard_Name IN ('Nursery','Junior KG')
    AND OG.Id BETWEEN 1 AND 5;

