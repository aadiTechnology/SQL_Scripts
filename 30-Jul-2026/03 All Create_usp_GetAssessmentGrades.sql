SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author:		Sachin
-- Create date: 16-Apr-2026
-- Description:	This USP is used to get assessment grades.
-- =================================================================
CREATE PROCEDURE [mobile].[usp_GetAssessmentGrades]
	@SchoolId INT,
	@AcademicYearId INT,
	@StandardId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @SchoolId = 71
	BEGIN
		 SELECT Id 
				,NewGradeName as Name
         FROM vw_AlternateObservationGrades WITH(NOLOCK)
	END
	ELSE IF @SchoolId = 122
	BEGIN
		SELECT Id
			   ,Name
        FROM ObservationGrades WITH(NOLOCK)
		WHERE  IsDeleted = 0
		AND AcademicYearId= @AcademicYearId
		AND SchoolId= @SchoolId
		AND Id <= 28
	END
	ELSE
	BEGIN
		SELECT Id
			   ,Name
        FROM ObservationGrades WITH(NOLOCK)
		WHERE  IsDeleted = 0
		AND AcademicYearId= @AcademicYearId
		AND SchoolId= @SchoolId
	END
END
GO