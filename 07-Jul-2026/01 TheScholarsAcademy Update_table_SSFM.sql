Update SSFM
Set Is_Deleted='Y' 
 from Schoolwise_Standard_FeeType_Master SSFM
 where SSFM.Academic_Year_Id=1
	   and SSFM.School_Id=173
	   and SSFM.Is_Deleted='N'

Update  SSFCD
  SET Is_Deleted='Y'
 from dbo.Schoolwise_Standard_Fee_Configuration_Details SSFCD
  WHERE SSFCD.academic_Year_Id=1 
 AND SSFCD.School_Id=173
 AND SSFCD.Is_Deleted='N'

 Update  SSFCM
  SET Is_Deleted='Y'
 from dbo.Schoolwise_Standard_Fee_Configuration_Master  SSFCM
 WHERE SSFCM.academic_Year_Id=1 
 AND SSFCM.School_Id=173
 AND SSFCM.Is_Deleted='N'

Update SSLDD
 set IsDeleted=1
from SchoolWise_Standard_LateFee_DueDates_Details SSLDD
inner join SchoolWise_Standard_LateFee_DueDates_Master SSLDM
on  SSLDM.SchoolWise_Standard_LateFee_DueDates_Id=SSLDD.SchoolWise_Standard_LateFee_DueDates_Id
Where IsDeleted=0
AND SSLDM.Academic_Year_Id=1
AND School_Id=173

Update SSLDM
set SSLDM.Is_Deleted='Y'
from SchoolWise_Standard_LateFee_DueDates_Master SSLDM
Where Is_Deleted='N'
AND SSLDM.Academic_Year_Id=1
AND School_Id=173


Update Schoolwise_Fee_Type_Configuration 
SET Is_Deleted='Y'
Where Is_Deleted='N'
AND Academic_Year_Id=1
AND School_Id=173
							
		
Update Schoolwise_Fee_SubType_Configuration 
SET Is_Deleted='Y'
Where Is_Deleted='N'
AND Academic_Year_Id=1
AND School_Id=173
							