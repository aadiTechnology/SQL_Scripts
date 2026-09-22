INSERT INTO StandardWiseGradeMaster(StandardId, GradeId, IsDeleted, IsParentEngagement)
SELECT
    SM.Standard_Id,
    OG.Id,
    0,
    0
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 4
    AND OG.AcademicYearId = 4
    AND SM.School_Id = 165
	AND OG.IsDeleted=0
    AND SM.Standard_Name IN ('Play Group','Nursery','Junior KG','Senior KG','1','2')
    AND OG.Id BETWEEN 11 AND 13;
