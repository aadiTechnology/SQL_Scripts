-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sweety
-- Create date: 10/02/2026
-- Description:these method is used to save configure associated classes.
-- =============================================
CREATE PROCEDURE [dbo].[usp_SaveConfigMenuAssociatedClasses]
	-- Add the parameters for the stored procedure here
    @ConfigureMenuId INT ,    
	@UpdatedById INT,	
    @AssociatedStdDivIds nvarchar(MAX),
	@SchoolId Int,
	@AcademicYearId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS
	(
		SELECT TOP 1 1
		from UserRolewiseConfiguredMenuDetails
		where IsDeleted = 0
		and ConfiguredMenuId = @ConfigureMenuId
		and UserRoleId = 3
	)
	BEGIN
		UPDATE ConfigMenuAssociatedClasses
		SET IsDeleted = 1,
			UpdatedById = @UpdatedById,
			UpdatedDate = dbo.GetLocalDate(default)
		WHERE SchoolId = @SchoolId
		and IsDeleted = 0
		and ConfigMenuId = @ConfigureMenuId
	END
	ELSE
	BEGIN		
		  DECLARE @tblStdDivIds TABLE 
		  (
			StdDivId INT,
			OriginalStdId INT,
			OriginalDivId INT
		  );

		INSERT INTO @tblStdDivIds
		SELECT Ids, vsd.Original_Standard_Id, vsd.Original_Division_Id
		FROM dbo.udf_GetTableFromList(@AssociatedStdDivIds) StdDiv
		INNER JOIN vw_standard_division VSD
		ON StdDiv.Ids = VSD.SchoolWise_Standard_Division_Id
		WHERE VSD.School_Id = @SchoolId
		and vsd.academic_year_id = @AcademicYearId
	  
		UPDATE CM
		SET CM.IsDeleted = 1,
			CM.UpdatedById = @UpdatedById,
			CM.UpdatedDate = dbo.GetLocalDate(DEFAULT)
		FROM ConfigMenuAssociatedClasses CM
		LEFT OUTER JOIN @tblStdDivIds StdDiv
		ON CM.OriginalStandardId = StdDiv.OriginalStdId
		AND CM.OriginalDivisionId = StdDiv.OriginalDivId
		WHERE CM.ConfigMenuId = @ConfigureMenuId
		  AND CM.SchoolId = @SchoolId
		  AND CM.IsDeleted = 0
		  AND StdDiv.OriginalStdId IS NULL

		INSERT INTO ConfigMenuAssociatedClasses
		(
			OriginalStandardId,
			OriginalDivisionId,
			ConfigMenuId,        
			IsDeleted,
			SchoolId,
			UpdatedById,
			UpdatedDate
		)
		SELECT StdDiv.OriginalStdId,
			StdDiv.OriginalDivId,
			@ConfigureMenuId,
			0,
			@SchoolId,
			@UpdatedById,
			dbo.GetLocalDate(DEFAULT)
		FROM @tblStdDivIds StdDiv
		LEFT OUTER JOIN ConfigMenuAssociatedClasses CM
		ON CM.OriginalStandardId = StdDiv.OriginalStdId
		AND CM.OriginalDivisionId = StdDiv.OriginalDivId
		AND CM.ConfigMenuId = @ConfigureMenuId
		AND CM.SchoolId = @SchoolId
		AND CM.IsDeleted = 0
		WHERE CM.ConfigMenuId IS NULL
	END	
END