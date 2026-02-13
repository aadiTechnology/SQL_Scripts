update MGCD
set Remarks = 'Satisfactory'
from Marks_Grades_Configuration MGC
inner join Standard_Master SM
ON MGC.Standard_Id = SM.Standard_Id
INNER JOIN Marks_Grades_Configuration_Details MGCD
ON MGC.Marks_Grades_Configuration_Id = MGCD.Marks_Grades_Configuration_Id
where MGC.School_Id = 18
and mgc.Academic_Year_Id = 56
AND SM.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8','9')
AND MGCD.Is_Deleted = 'N'
AND MGCD.Starting_Marks_Range = 51
AND MGCD.Ending_Marks_Range = 60

update MGCD
set Remarks = 'Acceptable',
	Starting_Marks_Range = 41
from Marks_Grades_Configuration MGC
inner join Standard_Master SM
ON MGC.Standard_Id = SM.Standard_Id
INNER JOIN Marks_Grades_Configuration_Details MGCD
ON MGC.Marks_Grades_Configuration_Id = MGCD.Marks_Grades_Configuration_Id
where MGC.School_Id = 18
and mgc.Academic_Year_Id = 56
AND SM.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8','9')
AND MGCD.Is_Deleted = 'N'
AND MGCD.Starting_Marks_Range = 40
AND MGCD.Ending_Marks_Range = 50

update MGCD
set Starting_Marks_Range = 33,
	Ending_Marks_Range = 40,
	Actual_Ending_Marks_Range = 40.99
from Marks_Grades_Configuration MGC
inner join Standard_Master SM
ON MGC.Standard_Id = SM.Standard_Id
INNER JOIN Marks_Grades_Configuration_Details MGCD
ON MGC.Marks_Grades_Configuration_Id = MGCD.Marks_Grades_Configuration_Id
where MGC.School_Id = 18
and mgc.Academic_Year_Id = 56
AND SM.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8','9')
AND MGCD.Is_Deleted = 'N'
AND MGCD.Starting_Marks_Range = 0
AND MGCD.Ending_Marks_Range = 39

INSERT INTO Marks_Grades_Configuration_Details
SELECT MGC.Marks_Grades_Configuration_Id,598,0,33,33.99,'E','Fail',NULL,NULL,NULL,NULL,'N',DBO.GetLocalDate(DEFAULT),1,DBO.GetLocalDate(DEFAULT),1
from Marks_Grades_Configuration MGC
inner join Standard_Master SM
ON MGC.Standard_Id = SM.Standard_Id
INNER JOIN Marks_Grades_Configuration_Details MGCD
ON MGC.Marks_Grades_Configuration_Id = MGCD.Marks_Grades_Configuration_Id
where MGC.School_Id = 18
and mgc.Academic_Year_Id = 56
AND SM.Is_Deleted = 'N'
AND MGCD.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8','9')
AND MGC.IsForCoCurricularSubjects = 0
GROUP BY MGC.Standard_Id,MGC.Marks_Grades_Configuration_Id

INSERT INTO Marks_Grades_Configuration_Details
SELECT MGC.Marks_Grades_Configuration_Id,1126,0,33,33.99,'E','Fail',NULL,NULL,NULL,NULL,'N',DBO.GetLocalDate(DEFAULT),1,DBO.GetLocalDate(DEFAULT),1
from Marks_Grades_Configuration MGC
inner join Standard_Master SM
ON MGC.Standard_Id = SM.Standard_Id
INNER JOIN Marks_Grades_Configuration_Details MGCD
ON MGC.Marks_Grades_Configuration_Id = MGCD.Marks_Grades_Configuration_Id
where MGC.School_Id = 18
and mgc.Academic_Year_Id = 56
AND SM.Is_Deleted = 'N'
AND MGCD.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8','9')
AND MGC.IsForCoCurricularSubjects = 1
GROUP BY MGC.Standard_Id,MGC.Marks_Grades_Configuration_Id