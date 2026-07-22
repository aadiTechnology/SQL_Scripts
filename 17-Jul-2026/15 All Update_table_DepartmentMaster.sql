declare @SchoolId INT

SELECT @SchoolId = SchoolId
FROM SchoolSettings
WHERE IsDeleted = 0

UPDATE DepartmentMaster
SET SchoolId = @SchoolId

UPDATE AcademicProgrammeMaster
SET SchoolId = @SchoolId