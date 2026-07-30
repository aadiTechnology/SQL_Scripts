Update OSS
Set Is_Deleted='Y'
 from OptionalSubjects_Settings OSS
 Inner Join vw_standard_division VSD
 On VSD.SchoolWise_Standard_Division_Id=OSS.Standard_Division_Id
Where OSS.Academic_Year_Id=15
AND OSS.School_Id=11
AND Is_Deleted='N'
AND VSD.className='10-D'

Update SOS
Set Is_Deleted='Y'
   ,Updated_By_Id=2
   ,Updated_Date=dbo.GetLocalDate(default)
FROM StudentWiseOptionalSubjects SOS
Inner join YearWise_Student_Details YSD
ON YSd.YearWise_Student_Id=SOS.Student_Id
Inner Join vw_standard_division VSD
ON YSD.Standard_Id=VSD.Standard_Id
AND YSD.Division_id=VSD.Division_Id
WHERE VSD.className = '10-D'
  AND VSD.academic_year_id = 15
  AND VSD.School_Id = 11
  AND SOS.Is_Deleted = 'N'
  AND YSD.Is_Deleted='N';