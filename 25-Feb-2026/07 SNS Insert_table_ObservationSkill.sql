BEGIN TRANSACTION
BEGIN TRY

DECLARE  @SchoolId INT = 122, 
		 @AcademicYearId INT = 11

DECLARE @tblStdDetails AS TABLE
(
	StandardId INT
)

INSERT INTO @tblStdDetails
select Standard_Id
from Standard_Master
where School_Id = @SchoolId
and academic_Year_Id = @AcademicYearId
and Is_Deleted = 'N'
and Standard_Name IN ('6','7','8')

DECLARE @tblSubjectDetails AS TABLE
(
	SubjectId INT,
	SubjectName NVARCHAR(100)
)

INSERT INTO @tblSubjectDetails
select Subject_Id, Subject_Name
from Subject_Master
where academic_Year_Id = @AcademicYearId
and School_Id = @SchoolId
and Subject_Name IN ('English','Hindi','Marathi','Sanskrit','Mathematics','Science','Social Science','ICT','Robotics','Coding','ATL & Work Experience','Art Education','Dance','Music','PE/Sports')
and Is_Deleted = 'N'

DECLARE @tblParameters AS TABLE
(
	ParameterName NVARCHAR(100),
	ParameterSortOrder INT
)

INSERT INTO @tblParameters
SELECT 'Awareness', 1

INSERT INTO @tblParameters
select 'Sensitivity',2

INSERT INTO @tblParameters
select 'Creativity',3

--select * from @tblStdDetails
--select * from @tblSubjectDetails
--select * from @tblParameters

declare @tblStandardwiseSubjects AS TABLE
(
	Id INT IDENTITY(1,1),
	StandardId int,
	SubjectId INT,
	SubjectName NVARCHAR(100)
)

INSERT INTO @tblStandardwiseSubjects
select STD.StandardId,SUB.SubjectId,SubjectName
from @tblStdDetails STD
CROSS JOIN @tblSubjectDetails SUB

DECLARE @Id INT,
		@SubjectId INT, 
		@StandardId INT, 
		@SkillId INT,
		@SubjectName NVARCHAR(100),
		@SkillSortOrder INT = 1

WHILE EXISTS
(
	SELECT TOP 1 1
	FROM @tblStandardwiseSubjects
)
BEGIN
	SELECT TOP 1 @Id = Id, @StandardId = StandardId, @SubjectId = SubjectId,@SubjectName = SubjectName
	FROM @tblStandardwiseSubjects
	ORDER BY Id

	insert into ObservationSkills
	select @SubjectName,0 , 1, @SkillSortOrder, @StandardId, @SubjectId, @SchoolId, @AcademicYearId, 0, 1, dbo.GetLocalDate(default), 1, dbo.GetLocalDate(default)

	SELECT @SkillId = SCOPE_IDENTITY()

	insert into ObservationParameters
	select ParameterName, @SkillId, ParameterSortOrder, 1, 1, @SchoolId, @AcademicYearId, 0, 1, dbo.GetLocalDate(default), 1, dbo.GetLocalDate(default)
	FROM @tblParameters
	ORDER BY ParameterSortOrder

	SET @SkillSortOrder = @SkillSortOrder + 1
	SET @SkillId = 0

	DELETE FROM @tblStandardwiseSubjects
	WHERE Id = @Id
END

PRINT 'SUCCESS!'
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
END CATCH