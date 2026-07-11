-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Sweety
-- Create date: 01-04-2026
-- Description:These method is used to submit mandatory fields.
-- =============================================
CREATE PROCEDURE [dbo].[usp_SubmitStudentMandatoryDetails]
	-- Add the parameters for the stored procedure here
@YearwiseStudentId INT,
@UpdatedById INT,
@SchoolId INT,
@AcademicYearId INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (
		SELECT 1 
		FROM StudentMandatoryFieldSubmitStatus
		WHERE YearwiseStudentId = @YearwiseStudentId
		AND SchoolId = @SchoolId
		AND AcademicYearId = @AcademicYearId
		AND IsDeleted = 0
	)
	BEGIN
		UPDATE StudentMandatoryFieldSubmitStatus
		SET 
			IsSubmit = 1,
			UpdatedById = @UpdatedById,
			UpdatedDate = GETDATE()
		WHERE YearwiseStudentId = @YearwiseStudentId
		AND SchoolId = @SchoolId
		AND AcademicYearId = @AcademicYearId;
	END
	ELSE
	BEGIN
		INSERT INTO StudentMandatoryFieldSubmitStatus
		(
			YearwiseStudentId,
			IsSubmit,
			SchoolId,
			AcademicYearId,
			InsertedById,
			InsertedDate,
			IsDeleted
		)
		VALUES
		(
			@YearwiseStudentId,
			1,
			@SchoolId,
			@AcademicYearId,
			@UpdatedById,
			GETDATE(),
			0
		);
	END


END
GO
