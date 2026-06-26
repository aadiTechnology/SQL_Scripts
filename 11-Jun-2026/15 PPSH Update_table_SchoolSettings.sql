update SchoolSettings
set Value = 'PPSH/ADMIN/'
where name like '%EmployeeNoPrefix%'
and AcademicYearId = 15