UPDATE OS
SET SubjectId = 2771,
Name = 'Physical Education'
from ObservationSkills OS
INNER JOIN Standard_Master SM
ON OS.StandardId = SM.Standard_Id
WHERE OS.AcademicYearId = 11
AND OS.SchoolId = 122
AND OS.IsDeleted = 0
AND SM.Is_Deleted = 'N'
AND OS.Name = 'PE/Sports'
AND SM.Standard_Name IN ('6','7','8')