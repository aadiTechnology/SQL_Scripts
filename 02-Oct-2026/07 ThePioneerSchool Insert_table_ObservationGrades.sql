INSERT INTO ObservationGrades
SELECT 'Proficient','3-Proficient','',0,1,172,1,0,1,DBO.GetLocalDate(DEFAULT),1,DBO.GetLocalDate(DEFAULT)

INSERT INTO ObservationGrades
SELECT 'Progressing','2-Progressing','',0,2,172,1,0,1,DBO.GetLocalDate(DEFAULT),1,DBO.GetLocalDate(DEFAULT)

INSERT INTO ObservationGrades
SELECT 'Beginner','1-Beginner','',0,3,172,1,0,1,DBO.GetLocalDate(DEFAULT),1,DBO.GetLocalDate(DEFAULT)

declare @tblStd AS TABLE
(
	StdId INT
)

INSERT INTO @tblStd
SELECT Standard_Id
FROM Standard_Master
WHERE academic_Year_Id = 1
AND Standard_Name IN ('Nursery','Junior KG')

UPDATE StandardWiseGradeMaster
SET IsDeleted = 1
WHERE StandardId IN (SELECT StdId FROM @tblStd)

INSERT INTO StandardWiseGradeMaster
select StdId,GradeId,0,0
from
(
	SELECT Id AS GradeId 
	FROM ObservationGrades
	WHERE AcademicYearId = 1
	AND IsDeleted = 0
	AND Name IN ('Proficient','Progressing','Beginner')
)s1
cross join @tblStd STD
