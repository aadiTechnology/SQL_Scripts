Update SS
Set Value='true'
 FROM SchoolSettings SS
WHERE Name = 'AutoCalculateEnrolmentNo'
AND SchoolId IN (172,173)
AND AcademicYearId = 1

