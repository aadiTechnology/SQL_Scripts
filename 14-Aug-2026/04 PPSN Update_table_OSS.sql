Update OSS
Set Is_Deleted='Y'
 from OptionalSubjects_Settings OSS
 Inner Join vw_standard_division VSD
 On VSD.SchoolWise_Standard_Division_Id=OSS.Standard_Division_Id
 INner Join Subject_Master SM
 On SM.Subject_Id=OSS.Subject_Id
Where OSS.Academic_Year_Id=14
AND OSS.School_Id=71
AND OSS.Is_Deleted='N'
AND VSD.className='10-F'
AND SM.Is_Deleted='N'
AND Subject_Name In ('Home Science','Science')
AND Name='Grp2'
AND OptionalSubjects_Settings_Id in (255,256)


Update SOS
Set Is_Deleted='Y'
,Updated_By_Id=2
,Updated_Date=dbo.GetLocalDate(default)
FROM StudentWiseOptionalSubjects SOS
Inner join YearWise_Student_Details YSD
ON YSD.Yearwise_Student_Id=SOS.Student_Id
Inner Join vw_standard_division VSD
ON YSD.Standard_Id=VSD.Standard_Id
AND YSD.Division_Id=VSD.Division_Id
INner Join Subject_Master SM
 On SM.Subject_Id=SOS.Subject_Id
WHERE VSD.className = '10-F'
AND VSD.academic_year_id = 14
AND VSD.School_Id = 71
AND SOS.Is_Deleted='N'
AND YSD.Is_Deleted='N'
AND SM.Is_Deleted='N'
AND Subject_Name In ('Home Science','Science')
