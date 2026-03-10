update SchoolWise_Test_Master
set SchoolWise_Test_Name='Portfolio - I'
where SchoolWise_Test_Id=684
and Is_Deleted='N'
and academic_year_id=13


update SchoolWise_Test_Master
set SchoolWise_Test_Name='Portfolio - II'
where SchoolWise_Test_Id=685
and Is_Deleted='N'
and academic_year_id=13


Update SAY 
set SchoolReopeningDate='2026-03-24 00:00:00'
from Standardwise_Academic_Year SAY
inner join Standard_Master SM
on SM.Standard_Id=SAY.StandardId
where SM.academic_Year_Id=14
and SM.Standard_Name in('1','2','3','4','5','6','7','8','9','10')

Update StandardwiseProgressReportMaster
  set Is_Deleted='Y'
  where Report_Id=172
  AND StandrdwiseProgressReportId in (601,610)