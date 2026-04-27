update reports
set Is_Deleted = 'N'
where report_id = 327

update Subject_Master
set Is_CoCurricularActivity = 1
where School_Id = 122
and academic_Year_Id = 11
and Is_Deleted = 'N'
and Subject_Name  = 'Physical Education'