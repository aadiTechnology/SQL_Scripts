Update ObservationGrades
Set IsDeleted=1
where AcademicYearId=4
AND SchoolId=165

INSERT INTO ObservationGrades
(
    Name,
    ShortName,
    Description,
    OriginalGradeId,
    SortOrder,
    SchoolId,
    AcademicYearId,
    IsDeleted,
    InsertedById,
    InsertDate,
    UpdatedById,
    UpdateDate
)
VALUES
('Proficient', '3-Proficient', '', 0, 1, 165, 4, 0, 1, dbo.GetLocalDate(default), 1, dbo.GetLocalDate(default)),
('Progressing', '2-Progressing', '', 0, 2, 165, 4, 0, 1, dbo.GetLocalDate(default), 1, dbo.GetLocalDate(default)),
('Beginner', '1-Beginner', '', 0, 3, 165, 4, 0, 1, dbo.GetLocalDate(default), 1, dbo.GetLocalDate(default));


