Declare @SchoolId int

select top 1 @SchoolId=SchoolId
 from SchoolSettings
 where IsDeleted = 0

INSERT INTO ReportingParameters
(
    Name,
    IsDeleted,
    SchoolId,
    AcademicYearId
)
VALUES
(
    'Staff Kid Removal Notifications',
    0,
    @SchoolId,
    0
);


