Update OSS
Set Is_Deleted='Y'
 from OptionalSubjects_Settings OSS
 Inner Join vw_standard_division VSD
 On VSD.SchoolWise_Standard_Division_Id=OSS.Standard_Division_Id
Where OSS.Academic_Year_Id=15
AND OSS.School_Id=11
AND Is_Deleted='N'
AND VSD.Standard_Name='9'


