Update TSA
  SET Is_Deleted='Y'
      ,Update_Date=dbo.GetLocalDate(default)
	  ,Updated_By_Id=2
from Teacher_Subject_Assignment TSA
Inner join vw_standard_division VSD
ON TSA.Standard_Division_Id=VSD.SchoolWise_Standard_Division_Id
Where Standard_Name in('1','2','3','4','5','6','7','8','9','10')
AND TSA.School_Id=122
AND VSD.academic_year_id=13
AND TSA.Is_Deleted='N'