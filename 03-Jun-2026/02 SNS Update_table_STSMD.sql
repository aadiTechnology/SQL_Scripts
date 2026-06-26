Update STSMD
SET Is_Deleted='Y'
    ,Update_Date=dbo.GetLocalDate(default)
	,Updated_By_Id=2
from SchoolWise_Test_Subject_Marks_Details STSMD
Inner join SchoolWise_Test_Subject_Marks_Master STSMM
on STSMM.TestWise_Subject_Marks_Id=STSMD.TestWise_Subject_Marks_Id
Inner Join vw_standard_division VSD
ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
Where  STSMM.Is_Deleted='N'
AND VSD.School_Id=122
AND VSD.academic_year_id=13
AND Standard_Name='9'

Update STSMM
SET Is_Deleted='Y'
    ,Update_Date=dbo.GetLocalDate(default)
	,Updated_By_Id=2
from  SchoolWise_Test_Subject_Marks_Master STSMM
Inner Join vw_standard_division VSD
ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
Where  STSMM.Is_Deleted='N'
AND VSD.School_Id=122
AND VSD.academic_year_id=13
AND Standard_Name='9'


Update SDSM
  SET Total_Consideration='N'
      ,Update_Date=dbo.GetLocalDate(default)
	  ,Updated_By_Id=2
from Schoolwise_Division_Subject_Master SDSM 
Inner Join vw_standard_division VSD
on SDSM.Standard_Division_Id=VSD.SchoolWise_Standard_Division_Id
WHERE Standard_Name='9'
AND SDSM.academic_year_id=13
AND SDSM.Is_Deleted='N'
AND SDSM.School_Id=122
AND SDSM.Total_Consideration='Y'