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
INNER JOIN SchoolWise_Academic_Year_Master AY
    ON AY.Academic_Year_ID = SM.academic_Year_Id
   AND AY.School_Id = SM.School_Id
WHERE SM.Is_Deleted = 'N'
  AND OG.IsDeleted = 0
  AND SM.academic_Year_Id = OG.AcademicYearId
  AND ( SM.School_Id <> 122 OR (SM.School_Id = 122 AND SM.academic_Year_Id NOT IN (11,13))  );

  -----AcademicyearId=11 and SchoolId-122

  INSERT INTO StandardWiseGradeMaster(StandardId, GradeId,IsDeleted,IsParentEngagement)
SELECT
    SM.Standard_Id,
    OG.Id,
    0,
    0
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 11
  AND OG.AcademicYearId = 11
  AND SM.School_Id=122
  AND SM.Standard_Name IN ('1','2','3','4','5')
  AND OG.Id BETWEEN 24 AND 28;

  INSERT INTO StandardWiseGradeMaster(StandardId, GradeId,IsDeleted,IsParentEngagement)
 SELECT
    SM.Standard_Id,
    OG.Id,
    0,
    1
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 11
  AND OG.AcademicYearId = 11
  AND SM.School_Id=122
  AND SM.Standard_Name IN ('1','2','3','4','5')
  AND OG.Id BETWEEN 29 AND 33
   AND SM.Is_Deleted='N';


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
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 11
  AND OG.AcademicYearId = 11
  AND SM.School_Id=122
  AND SM.Standard_Name IN ('6','7','8')
  AND OG.Id BETWEEN 34 AND 40
  AND SM.Is_Deleted='N';

  
  -----AcademicyearId=13 and SchoolId-122


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
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 13
  AND OG.AcademicYearId = 13
  AND SM.Standard_Name IN ('1','2','3','4','5')
  AND OG.Id BETWEEN 41 AND 44;


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
    1
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 13
  AND OG.AcademicYearId = 13
  AND SM.Standard_Name IN ('1','2','3','4','5')
  AND OG.Id BETWEEN 45 AND 49;


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
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 13
  AND OG.AcademicYearId = 13
  AND SM.Standard_Name IN ('6','7','8')
  AND OG.Id BETWEEN 50 AND 56;