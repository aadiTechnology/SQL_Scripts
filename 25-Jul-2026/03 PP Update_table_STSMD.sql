Update STSMD
SET Is_Deleted='Y'
    ,Update_Date=dbo.GetLocalDate(default)
	,Updated_By_Id=2
from SchoolWise_Test_Subject_Marks_Details STSMD
Inner join SchoolWise_Test_Subject_Marks_Master STSMM
on STSMM.TestWise_Subject_Marks_Id=STSMD.TestWise_Subject_Marks_Id
Inner Join vw_standard_division VSD
ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
Inner Join Subject_Master SM
on STSMM.Subject_Id=SM.Subject_Id
Where  STSMM.Is_Deleted='N'
AND VSD.School_Id=18
AND VSD.academic_year_id=57
AND SM.IS_Deleted='N'
AND VSD.className in ('9-B','9-D','10-B','10-D')
AND Subject_Name='E.V.S.'

Update STSMM
SET Is_Deleted='Y'
    ,Update_Date=dbo.GetLocalDate(default)
	,Updated_By_Id=2
from  SchoolWise_Test_Subject_Marks_Master STSMM
Inner Join vw_standard_division VSD
ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
Inner Join Subject_Master SM
on STSMM.Subject_Id=SM.Subject_Id
Where  STSMM.Is_Deleted='N'
AND VSD.School_Id=18
AND VSD.academic_year_id=57
AND SM.IS_Deleted='N'
AND VSD.className in ('9-B','9-D','10-B','10-D')
AND Subject_Name='E.V.S.'


Update SDSM
  SET Is_Deleted='Y'
      ,Update_Date=dbo.GetLocalDate(default)
	  ,Updated_By_Id=2
from Schoolwise_Division_Subject_Master SDSM 
Inner Join vw_standard_division VSD
on SDSM.Standard_Division_Id=VSD.SchoolWise_Standard_Division_Id
Inner Join Subject_Master SM
on SDSM.Subject_Id=SM.Subject_Id
WHERE SDSM.academic_year_id=57
AND SDSM.Is_Deleted='N'
AND SDSM.School_Id=18
AND SM.IS_Deleted='N'
AND VSD.className in ('9-B','9-D','10-B','10-D')
AND Subject_Name='E.V.S.'

