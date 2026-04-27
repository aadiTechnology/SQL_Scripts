UPDATE STM
 SET IsAcademicYrApplicable='Y'
     ,Update_Date=dbo.GetLocalDate(default)
	 ,Updated_By_Id=2
from SchoolWise_Teacher_Master  STM
INNER JOIN SchoolWise_Standard_Division_Teacher_Assignment_Master SSDTAM
ON STM.Teacher_Id=SSDTAM.Teacher_Id
where STM.academic_year_id=14
And STM.Is_Deleted='N'
AND SSDTAM.Is_Deleted='N'
AND Is_ClassTeacher='Y'
AND STM.School_Id=71
