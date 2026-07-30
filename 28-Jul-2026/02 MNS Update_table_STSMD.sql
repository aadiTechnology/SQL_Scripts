update STSMD
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Details STSMD
inner join SchoolWise_Test_Subject_Marks_Master STSMM
on STSMM.TestWise_Subject_Marks_Id = STSMD.TestWise_Subject_Marks_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 11
and STSMD.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMM.School_Id = 123
and Standard_Name = 'Play Group'

update STSMM	--TO remove exam configuration.
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Master STSMM
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 11
and Is_Deleted = 'N'
and Standard_Name = 'Play Group'
and STSMM.School_Id = 123

update SDSM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from Schoolwise_Division_Subject_Master SDSM
inner join vw_standard_division VSD
on SDSM.Standard_Division_Id = VSD.SchoolWise_Standard_Division_Id
where SDSM.academic_year_id = 11
and SDSM.Is_Deleted = 'N'
and Standard_Name = 'Play Group'
and SDSM.School_Id = 123

update SSSM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Standard_Subject_Master SSSM
inner join Standard_Master SM
on SSSM.Standard_Id = SM.Standard_Id
where SSSM.academic_year_id = 11
and SSSM.Is_Deleted = 'N'
and SM.Is_Deleted = 'N'
and Standard_Name = 'Play Group'
and SSSM.School_Id = 123

update Standard_Master	--To remove class
set Is_Deleted = 'Y'
where academic_Year_Id = 11
and Is_Deleted = 'N'
and Standard_Name = 'Play Group'
and School_Id = 123