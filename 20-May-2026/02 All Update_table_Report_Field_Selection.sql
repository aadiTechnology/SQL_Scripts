update Report_Field_Selection
set Is_Requried = 'N'
where Report_Id = 328
and Report_Field_Selection_Id = 1179

update Report_Fields
set Field_name = REPLACE(Field_name,'usp_GetStudentIdentityCardDetails_Report','usp_GetStudentIdentityCardDetails_Report_PPSN'),
Filter_Field_Name = REPLACE(Filter_Field_Name,'usp_GetStudentIdentityCardDetails_Report','usp_GetStudentIdentityCardDetails_Report_PPSN')
where Report_Field_Id IN
(
1178,
1179,
1180,
1181,
1182)