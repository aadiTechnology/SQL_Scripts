INSERT INTO StandardWiseGradeMaster
(
    StandardId,
    GradeId,
    IsDeleted,
    IsParentEngagement
)
SELECT
    SM.Standard_Id,
    OG.Id,
    0,
    0
FROM ObservationGrades OG
CROSS JOIN Standard_Master SM
INNER JOIN
(
    SELECT DISTINCT StandardId
    FROM ObservationSkills
    WHERE IsDeleted = 0
      AND SchoolId <> 122
) OS
    ON SM.Standard_Id = OS.StandardId
INNER JOIN SchoolWise_Academic_Year_Master AY
    ON AY.Academic_Year_ID = SM.Academic_Year_Id
   AND AY.School_Id = SM.School_Id
WHERE SM.Is_Deleted = 'N'
  AND OG.IsDeleted = 0
  AND SM.Academic_Year_Id = OG.AcademicYearId
  AND SM.School_Id <> 122;
