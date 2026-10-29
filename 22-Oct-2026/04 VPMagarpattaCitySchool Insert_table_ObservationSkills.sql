DECLARE @StandardId INT,
 @SchoolId INT = 166,
  @AcademicYearId INT = 4

SELECT @StandardId = Standard_Id
FROM Standard_Master
WHERE Standard_Name = N'1'
  AND School_Id = @SchoolId
  AND Academic_Year_Id = @AcademicYearId
  AND Is_Deleted = 'N';


INSERT INTO ObservationSkills
(
    Name, OriginalSkillId, DisplayOnReport, SortOrder, StandardId,
    SubjectId, SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate
)
SELECT
    'Remark', NULL, 1, 1, @StandardId,
    sm.Subject_Id, @SchoolId, @AcademicYearId, 0,
    1, dbo.getlocaldate(DEFAULT), NULL, NULL
FROM Subject_Master sm
WHERE sm.Subject_Name IN ('Financial Literacy', 'Moral Science')
  AND sm.School_Id = @SchoolId
  AND sm.Academic_Year_Id = @AcademicYearId
  AND sm.Is_Deleted = 'N'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ObservationSkills os
      WHERE os.Name = 'Remark'
        AND os.StandardId = @StandardId
        AND os.SubjectId = sm.Subject_Id
        AND os.SchoolId = @SchoolId
        AND os.AcademicYearId = @AcademicYearId
        AND os.IsDeleted = 0
  );


INSERT INTO ObservationParameters
(
    Parameter, SkillId, SortOrder, IsSubmitted, ControlTypeId,
    SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate
)
SELECT
    'Remark', os.Id, 2, 1, 1,
    @SchoolId, @AcademicYearId, 0,
    1, dbo.getlocaldate(DEFAULT), NULL, NULL
FROM Subject_Master sm
INNER JOIN ObservationSkills os
    ON os.SubjectId = sm.Subject_Id
    AND os.StandardId = @StandardId
    AND os.SchoolId = @SchoolId
    AND os.AcademicYearId = @AcademicYearId
    AND os.IsDeleted = 0
    AND os.Name = 'Remark'
WHERE sm.Subject_Name IN ('Financial Literacy', 'Moral Science')
  AND sm.School_Id = @SchoolId
  AND sm.Academic_Year_Id = @AcademicYearId
  AND sm.Is_Deleted = 'N'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ObservationParameters op
      WHERE op.Parameter = 'Remark'
        AND op.SkillId = os.Id
        AND op.SchoolId = @SchoolId
        AND op.AcademicYearId = @AcademicYearId
        AND op.IsDeleted = 0
  )


  INSERT INTO [dbo].[ObservationGrades]
           ([Name]
           ,[ShortName]
           ,[Description]
           ,[OriginalGradeId]
           ,[SortOrder]
           ,[SchoolId]
           ,[AcademicYearId]
           ,[IsDeleted]
           ,[InsertedById]
           ,[InsertDate])
     VALUES
           ('Satisfactory','Satisfactory','',9,5,166,4,0,1,dbo.GetLocalDate(default))

INSERT INTO StandardWiseGradeMaster(StandardId, GradeId, IsDeleted, IsParentEngagement)
SELECT
    SM.Standard_Id,
    OG.Id,
    0,
    0
FROM Standard_Master SM
CROSS JOIN ObservationGrades OG
WHERE SM.Academic_Year_Id = 4
    AND OG.AcademicYearId = 4
    AND SM.School_Id = 166
    AND SM.Standard_Name IN ('1','2','3','4')
    AND OG.Id IN(6,9);
--2 STD=========================================================

SELECT @StandardId = Standard_Id
FROM Standard_Master
WHERE Standard_Name = N'2'
  AND School_Id = @SchoolId
  AND Academic_Year_Id = @AcademicYearId
  AND Is_Deleted = 'N';


INSERT INTO ObservationSkills
(
    Name, OriginalSkillId, DisplayOnReport, SortOrder, StandardId,
    SubjectId, SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate
)
SELECT
    'Remark', NULL, 1, 1, @StandardId,
    sm.Subject_Id, @SchoolId, @AcademicYearId, 0,
    1, dbo.getlocaldate(DEFAULT), NULL, NULL
FROM Subject_Master sm
WHERE sm.Subject_Name IN ('Financial Literacy', 'Moral Science')
  AND sm.School_Id = @SchoolId
  AND sm.Academic_Year_Id = @AcademicYearId
  AND sm.Is_Deleted = 'N'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ObservationSkills os
      WHERE os.Name = 'Remark'
        AND os.StandardId = @StandardId
        AND os.SubjectId = sm.Subject_Id
        AND os.SchoolId = @SchoolId
        AND os.AcademicYearId = @AcademicYearId
        AND os.IsDeleted = 0
  );

INSERT INTO ObservationParameters
(
    Parameter, SkillId, SortOrder, IsSubmitted, ControlTypeId,
    SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate
)
SELECT
    'Remark', os.Id, 2, 1, 1,
    @SchoolId, @AcademicYearId, 0,
    1, dbo.getlocaldate(DEFAULT), NULL, NULL
FROM Subject_Master sm
INNER JOIN ObservationSkills os
    ON os.SubjectId = sm.Subject_Id
    AND os.StandardId = @StandardId
    AND os.SchoolId = @SchoolId
    AND os.AcademicYearId = @AcademicYearId
    AND os.IsDeleted = 0
    AND os.Name = 'Remark'
WHERE sm.Subject_Name IN ('Financial Literacy', 'Moral Science')
  AND sm.School_Id = @SchoolId
  AND sm.Academic_Year_Id = @AcademicYearId
  AND sm.Is_Deleted = 'N'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ObservationParameters op
      WHERE op.Parameter = 'Remark'
        AND op.SkillId = os.Id
        AND op.SchoolId = @SchoolId
        AND op.AcademicYearId = @AcademicYearId
        AND op.IsDeleted = 0
  )
--3 STD---------------------------------------------------------

SELECT @StandardId = Standard_Id
FROM Standard_Master
WHERE Standard_Name = N'3'
  AND School_Id = @SchoolId
  AND Academic_Year_Id = @AcademicYearId
  AND Is_Deleted = 'N';


INSERT INTO ObservationSkills
(
    Name, OriginalSkillId, DisplayOnReport, SortOrder, StandardId,
    SubjectId, SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate
)
SELECT
    'Remark', NULL, 1, 1, @StandardId,
    sm.Subject_Id, @SchoolId, @AcademicYearId, 0,
    1, dbo.getlocaldate(DEFAULT), NULL, NULL
FROM Subject_Master sm
WHERE sm.Subject_Name IN ('Financial Literacy', 'Moral Science')
  AND sm.School_Id = @SchoolId
  AND sm.Academic_Year_Id = @AcademicYearId
  AND sm.Is_Deleted = 'N'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ObservationSkills os
      WHERE os.Name = 'Remark'
        AND os.StandardId = @StandardId
        AND os.SubjectId = sm.Subject_Id
        AND os.SchoolId = @SchoolId
        AND os.AcademicYearId = @AcademicYearId
        AND os.IsDeleted = 0
  );


INSERT INTO ObservationParameters
(
    Parameter, SkillId, SortOrder, IsSubmitted, ControlTypeId,
    SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate
)
SELECT
    'Remark', os.Id, 2, 1, 1,
    @SchoolId, @AcademicYearId, 0,
    1, dbo.getlocaldate(DEFAULT), NULL, NULL
FROM Subject_Master sm
INNER JOIN ObservationSkills os
    ON os.SubjectId = sm.Subject_Id
    AND os.StandardId = @StandardId
    AND os.SchoolId = @SchoolId
    AND os.AcademicYearId = @AcademicYearId
    AND os.IsDeleted = 0
    AND os.Name = 'Remark'
WHERE sm.Subject_Name IN ('Financial Literacy', 'Moral Science')
  AND sm.School_Id = @SchoolId
  AND sm.Academic_Year_Id = @AcademicYearId
  AND sm.Is_Deleted = 'N'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ObservationParameters op
      WHERE op.Parameter = 'Remark'
        AND op.SkillId = os.Id
        AND op.SchoolId = @SchoolId
        AND op.AcademicYearId = @AcademicYearId
        AND op.IsDeleted = 0
  )
---4 STD-----------------------------------------------------------------

SELECT @StandardId = Standard_Id
FROM Standard_Master
WHERE Standard_Name = N'4'
  AND School_Id = @SchoolId
  AND Academic_Year_Id = @AcademicYearId
  AND Is_Deleted = 'N';


INSERT INTO ObservationSkills
(
    Name, OriginalSkillId, DisplayOnReport, SortOrder, StandardId,
    SubjectId, SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate
)
SELECT
    'Remark', NULL, 1, 1, @StandardId,
    sm.Subject_Id, @SchoolId, @AcademicYearId, 0,
    1, dbo.getlocaldate(DEFAULT), NULL, NULL
FROM Subject_Master sm
WHERE sm.Subject_Name IN ('Financial Literacy', 'Moral Science')
  AND sm.School_Id = @SchoolId
  AND sm.Academic_Year_Id = @AcademicYearId
  AND sm.Is_Deleted = 'N'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ObservationSkills os
      WHERE os.Name = 'Remark'
        AND os.StandardId = @StandardId
        AND os.SubjectId = sm.Subject_Id
        AND os.SchoolId = @SchoolId
        AND os.AcademicYearId = @AcademicYearId
        AND os.IsDeleted = 0
  );


INSERT INTO ObservationParameters
(
    Parameter, SkillId, SortOrder, IsSubmitted, ControlTypeId,
    SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate
)
SELECT
    'Remark', os.Id, 2, 1, 1,
    @SchoolId, @AcademicYearId, 0,
    1, dbo.getlocaldate(DEFAULT), NULL, NULL
FROM Subject_Master sm
INNER JOIN ObservationSkills os
    ON os.SubjectId = sm.Subject_Id
    AND os.StandardId = @StandardId
    AND os.SchoolId = @SchoolId
    AND os.AcademicYearId = @AcademicYearId
    AND os.IsDeleted = 0
    AND os.Name = 'Remark'
WHERE sm.Subject_Name IN ('Financial Literacy', 'Moral Science')
  AND sm.School_Id = @SchoolId
  AND sm.Academic_Year_Id = @AcademicYearId
  AND sm.Is_Deleted = 'N'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ObservationParameters op
      WHERE op.Parameter = 'Remark'
        AND op.SkillId = os.Id
        AND op.SchoolId = @SchoolId
        AND op.AcademicYearId = @AcademicYearId
        AND op.IsDeleted = 0
  )
