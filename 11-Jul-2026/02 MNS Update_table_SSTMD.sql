update SSTMD
set Is_Deleted = 'Y',
Update_Date = dbo.GetLocalDate(default),
Updated_By_Id = 1
from SchoolWise_Student_Test_Marks SSTM
inner join SchoolWise_Student_Test_Marks_Detail SSTMD
on SSTM.SchoolWise_Student_Test_Marks_Id = SSTMD.SchoolWise_Student_Test_Marks_Id
inner join SchoolWise_Test_Subject_Marks_Master STSMM
on SSTM.TestWise_Subject_Marks_Id = STSMM.TestWise_Subject_Marks_Id
inner join SchoolWise_Test_Subject_Marks_Details STSMD
on SSTMD.TestType_Id = STSMD.TestType_Id
and STSMM.TestWise_Subject_Marks_Id = STSMD.TestWise_Subject_Marks_Id
inner join Subject_Master SM 
ON STSMM.Subject_Id = SM.Subject_Id
inner join SchoolWise_Test_Master STM
on STSMM.SchoolWise_Test_Id = STM.SchoolWise_Test_Id
inner join YearWise_Student_Details YSD
on YSD.YearWise_Student_Id = SSTM.Student_Id
inner join vw_BaseStudentDetails VBSD
on YSD.Student_Id = VBSD.SchoolWise_Student_Id
left outer join StudentWiseOptionalSubjects SOS
on SSTM.Student_Id = SOS.Student_Id
and SSTM.Subject_Id = SOS.Subject_Id
and SOS.Is_Deleted = 'N'
inner join vw_standard_division vsd
on ysd.Standard_Id = vsd.Standard_Id
and ysd.Division_id = vsd.Division_Id
inner join OptionalSubjects_Settings oss
on vsd.SchoolWise_Standard_Division_Id = oss.Standard_Division_Id
and sstm.Subject_Id = oss.Subject_Id
where SM.academic_Year_Id = 11
and STM.SchoolWise_Test_Name = 'CCE I'
and SSTMD.Is_Deleted = 'N'
and SSTM.Is_Deleted = 'N'
and STSMD.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and SM.Is_Deleted = 'N'
and STM.Is_Deleted = 'N'
and YSD.Is_Deleted = 'N' 
and VBSD.Is_Deleted = 'N'
and SSTM.Academic_Year_Id = 11
and SOS.Student_Id is null
and oss.Is_Deleted = 'N'
----------------------------------------------------------------------
 
update SSTM
set Is_Deleted = 'Y',
Update_Date = dbo.GetLocalDate(default),
Updated_By_Id = 1
from SchoolWise_Student_Test_Marks SSTM
inner join SchoolWise_Test_Subject_Marks_Master STSMM
on SSTM.TestWise_Subject_Marks_Id = STSMM.TestWise_Subject_Marks_Id
inner join Subject_Master SM 
ON STSMM.Subject_Id = SM.Subject_Id
inner join SchoolWise_Test_Master STM
on STSMM.SchoolWise_Test_Id = STM.SchoolWise_Test_Id
inner join YearWise_Student_Details YSD
on YSD.YearWise_Student_Id = SSTM.Student_Id
inner join vw_BaseStudentDetails VBSD
on YSD.Student_Id = VBSD.SchoolWise_Student_Id
left outer join StudentWiseOptionalSubjects SOS
on SSTM.Student_Id = SOS.Student_Id
and SSTM.Subject_Id = SOS.Subject_Id
and SOS.Is_Deleted = 'N'
inner join vw_standard_division vsd
on ysd.Standard_Id = vsd.Standard_Id
and ysd.Division_id = vsd.Division_Id
inner join OptionalSubjects_Settings oss
on vsd.SchoolWise_Standard_Division_Id = oss.Standard_Division_Id
and sstm.Subject_Id = oss.Subject_Id
where SM.academic_Year_Id = 11
and STM.SchoolWise_Test_Name = 'CCE I'
and SSTM.Is_Deleted = 'N'
and STSMM.Is_Deleted = 'N'
and SM.Is_Deleted = 'N'
and STM.Is_Deleted = 'N'
and YSD.Is_Deleted = 'N' 
and VBSD.Is_Deleted = 'N'
and SSTM.Academic_Year_Id = 11
and SOS.Student_Id is null
and oss.Is_Deleted = 'N'