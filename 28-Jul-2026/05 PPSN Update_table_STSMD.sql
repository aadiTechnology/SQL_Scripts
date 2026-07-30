--Only English
update STSMD
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Details STSMD
inner join SchoolWise_Test_Subject_Marks_Master STSMM
on STSMM.TestWise_Subject_Marks_Id = STSMD.TestWise_Subject_Marks_Id
inner join Subject_Master SM
on SM.Subject_Id = STSMM.Subject_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 14
and Subject_Name = 'English'
and Standard_Name in ('6', '7', '8', '9')
and SM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMD.Is_Deleted = 'N'
and STSMM.School_Id = 71

update STSMM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Master STSMM
inner join Subject_Master SM
on STSMM.Subject_Id = SM.Subject_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 14
and Subject_Name = 'English'
and Standard_Name in ('6', '7', '8', '9')
and SM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMM.School_Id = 71

update SDSM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from Schoolwise_Division_Subject_Master SDSM 
inner join Subject_Master SM
on SM.Subject_Id = SDSM.Subject_Id
inner join vw_standard_division VSD
on SDSM.Standard_Division_Id = VSD.SchoolWise_Standard_Division_Id
where SDSM.academic_year_id = 14
and Subject_Name = 'English'
and Standard_Name in ('6', '7', '8', '9')
and SM.Is_Deleted = 'N'
and SDSM.Is_Deleted = 'N'
and SDSM.School_Id = 71


update SSSM   
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Standard_Subject_Master SSSM
inner join Subject_Master SM
on SM.Subject_Id = SSSM.Subject_Id
inner join Standard_Master STDM
on SSSM.Standard_Id = STDM.Standard_Id
where SSSM.academic_year_id = 14
and Subject_Name = 'English'
and Standard_Name in ('6', '7', '8', '9')
and SM.Is_Deleted = 'N'
and STDM.Is_Deleted = 'N'
and SSSM.Is_Deleted = 'N'
and SSSM.School_Id = 71

------------------------------------------------------------------------------------------------------
--Only Hindi
update STSMD
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Details STSMD
inner join SchoolWise_Test_Subject_Marks_Master STSMM
on STSMM.TestWise_Subject_Marks_Id = STSMD.TestWise_Subject_Marks_Id
inner join Subject_Master SM
on SM.Subject_Id = STSMM.Subject_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 14
and Subject_Name = 'Hindi'
and Standard_Name in ('6', '7', '8')
and SM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMD.Is_Deleted = 'N'
and STSMM.School_Id = 71

update STSMM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Master STSMM
inner join Subject_Master SM
on STSMM.Subject_Id = SM.Subject_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 14
and Subject_Name = 'Hindi'
and Standard_Name in ('6', '7', '8')
and SM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMM.School_Id = 71

update SDSM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from Schoolwise_Division_Subject_Master SDSM 
inner join Subject_Master SM
on SM.Subject_Id = SDSM.Subject_Id
inner join vw_standard_division VSD
on SDSM.Standard_Division_Id = VSD.SchoolWise_Standard_Division_Id
where SDSM.academic_year_id = 14
and Subject_Name = 'Hindi'
and Standard_Name in ('6', '7', '8')
and SM.Is_Deleted = 'N'
and SDSM.Is_Deleted = 'N'
and SDSM.School_Id = 71


update SSSM   
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Standard_Subject_Master SSSM
inner join Subject_Master SM
on SM.Subject_Id = SSSM.Subject_Id
inner join Standard_Master STDM
on SSSM.Standard_Id = STDM.Standard_Id
where SSSM.academic_year_id = 14
and Subject_Name = 'Hindi'
and Standard_Name in ('6', '7', '8')
and SM.Is_Deleted = 'N'
and STDM.Is_Deleted = 'N'
and SSSM.Is_Deleted = 'N'
and SSSM.School_Id = 71

---------------------------------------------------------------------------------------------------------------
--Only Marathi / Sanskrit
update STSMD
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Details STSMD
inner join SchoolWise_Test_Subject_Marks_Master STSMM
on STSMM.TestWise_Subject_Marks_Id = STSMD.TestWise_Subject_Marks_Id
inner join Subject_Master SM
on SM.Subject_Id = STSMM.Subject_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 14
and Subject_Name = 'Marathi/Sanskrit'
and Standard_Name in ('6', '7', '8')
and SM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMD.Is_Deleted = 'N'
and STSMM.School_Id = 71

update STSMM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Master STSMM
inner join Subject_Master SM
on STSMM.Subject_Id = SM.Subject_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 14
and Subject_Name = 'Marathi/Sanskrit'
and Standard_Name in ('6', '7', '8')
and SM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMM.School_Id = 71

update SDSM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from Schoolwise_Division_Subject_Master SDSM 
inner join Subject_Master SM
on SM.Subject_Id = SDSM.Subject_Id
inner join vw_standard_division VSD
on SDSM.Standard_Division_Id = VSD.SchoolWise_Standard_Division_Id
where SDSM.academic_year_id = 14
and Subject_Name = 'Marathi/Sanskrit'
and Standard_Name in ('6', '7', '8')
and SM.Is_Deleted = 'N'
and SDSM.Is_Deleted = 'N'
and SDSM.School_Id = 71


update SSSM   
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Standard_Subject_Master SSSM
inner join Subject_Master SM
on SM.Subject_Id = SSSM.Subject_Id
inner join Standard_Master STDM
on SSSM.Standard_Id = STDM.Standard_Id
where SSSM.academic_year_id = 14
and Subject_Name = 'Marathi/Sanskrit'
and Standard_Name in ('6', '7', '8')
and SM.Is_Deleted = 'N'
and STDM.Is_Deleted = 'N'
and SSSM.Is_Deleted = 'N'
and SSSM.School_Id = 71

-------------------------------------------------------------------------------------------------------------------------
--Only Hindi / Sanskrit / Marathi

update STSMD
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Details STSMD
inner join SchoolWise_Test_Subject_Marks_Master STSMM
on STSMM.TestWise_Subject_Marks_Id = STSMD.TestWise_Subject_Marks_Id
inner join Subject_Master SM
on SM.Subject_Id = STSMM.Subject_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 14
and Subject_Name = 'Hindi/Marathi/Sanskrit'
and Standard_Name = '9'
and SM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMD.Is_Deleted = 'N'
and STSMM.School_Id = 71

update STSMM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Test_Subject_Marks_Master STSMM
inner join Subject_Master SM
on STSMM.Subject_Id = SM.Subject_Id
inner join vw_standard_division VSD
on VSD.SchoolWise_Standard_Division_Id = STSMM.Standard_Division_Id
where STSMM.Academic_Year_Id = 14
and Subject_Name = 'Hindi/Marathi/Sanskrit'
and Standard_Name = '9'
and SM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and STSMM.School_Id = 71

update SDSM
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from Schoolwise_Division_Subject_Master SDSM 
inner join Subject_Master SM
on SM.Subject_Id = SDSM.Subject_Id
inner join vw_standard_division VSD
on SDSM.Standard_Division_Id = VSD.SchoolWise_Standard_Division_Id
where SDSM.academic_year_id = 14
and Subject_Name = 'Hindi/Marathi/Sanskrit'
and Standard_Name = '9'
and SM.Is_Deleted = 'N'
and SDSM.Is_Deleted = 'N'
and SDSM.School_Id = 71


update SSSM   
set Is_Deleted = 'Y',
Updated_By_Id = 1,
Update_Date = dbo.GetLocalDate(default)
from SchoolWise_Standard_Subject_Master SSSM
inner join Subject_Master SM
on SM.Subject_Id = SSSM.Subject_Id
inner join Standard_Master STDM
on SSSM.Standard_Id = STDM.Standard_Id
where SSSM.academic_year_id = 14
and Subject_Name = 'Hindi/Marathi/Sanskrit'
and Standard_Name = '9'
and SM.Is_Deleted = 'N'
and STDM.Is_Deleted = 'N'
and SSSM.Is_Deleted = 'N'
and SSSM.School_Id = 71