-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sweety
-- Create date: 19/08/2026
-- Description:these usp is used to delete all exam configuration
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteAllExams]
    @SubjectId INT,
    @StandardDivisionId INT,
    @SchoolId INT,
    @AcademicYearId INT,
    @UserId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

   DECLARE @ExamDetails TABLE
(
	Id INT IDENTITY(1,1),
	TestWiseSubjectMarksId INT,
	IsStudentWiseProgressReportPublished CHAR(1)
);

INSERT INTO @ExamDetails
(
	TestWiseSubjectMarksId,
	IsStudentWiseProgressReportPublished
)
SELECT DISTINCT
	STSMM.TestWise_Subject_Marks_Id,
	CASE
		WHEN STPS.Is_Published IS NOT NULL
		THEN STPS.Is_Published
		ELSE N'N'
	END
FROM dbo.SchoolWise_Test_Subject_Marks_Master STSMM
LEFT OUTER JOIN dbo.StudentWiseTestPublishStatus STPS
	ON STPS.SchoolWise_Test_Id = STSMM.SchoolWise_Test_Id
	AND STPS.Standard_division_Id = STSMM.Standard_Division_Id
	AND STPS.Academic_Year_ID = @AcademicYearId
	AND STPS.School_Id = @SchoolId
	AND STPS.Is_Published = N'Y'
WHERE STSMM.School_Id = @SchoolId
  AND STSMM.Academic_Year_Id = @AcademicYearId
  AND STSMM.Subject_Id = @SubjectId
  AND STSMM.Standard_Division_Id = @StandardDivisionId
  AND STSMM.Is_Deleted = N'N';

DECLARE @Counter INT = 1;
DECLARE @Total INT;
DECLARE @TestWiseSubjectMarksId INT;
DECLARE @IsStudentWiseProgressReportPublished CHAR(1);
DECLARE @DeleteStudentwiseProgressReportMarks INT;

SELECT @Total = COUNT(*)
FROM @ExamDetails;

WHILE @Counter <= @Total
BEGIN

	SELECT
		@TestWiseSubjectMarksId = TestWiseSubjectMarksId,
		@IsStudentWiseProgressReportPublished =
			IsStudentWiseProgressReportPublished
	FROM @ExamDetails
	WHERE Id = @Counter;


	IF @IsStudentWiseProgressReportPublished = N'Y'
	BEGIN
		SET @DeleteStudentwiseProgressReportMarks = 0;
	END
	ELSE
	BEGIN
		SET @DeleteStudentwiseProgressReportMarks = 1;
	END

	
	EXEC [dbo].[usp_DeleteTestExamMarkDetails] @TestWiseSubjectMarksId = @TestWiseSubjectMarksId,@SubjectId = @SubjectId,@StandardDivisionId = @StandardDivisionId,
                                @SchoolId = @SchoolId,@AcademicYearId = @AcademicYearId,@DeleteStudentwiseProgressReportMarks =@DeleteStudentwiseProgressReportMarks;


	EXEC [dbo].[usp_DeleteTestSubjectMarks]
		@TestWise_Subject_Marks_Id = @TestWiseSubjectMarksId;



	SET @Counter = @Counter + 1;

END
END
go