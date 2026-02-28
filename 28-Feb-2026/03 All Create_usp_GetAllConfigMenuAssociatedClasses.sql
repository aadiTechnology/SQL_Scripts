SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sweety
-- Create date: 10/02/2026
-- Description: these method is used to get associated classes
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAllConfigMenuAssociatedClasses]
	-- Add the parameters for the stored procedure here
	@SchoolId INT,
	@AcademicYearId INT,
	@MenuId Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SchoolWise_Standard_Division_Id,
			   Standard_Id,
			   Standard_Name,
			   Division_Id,
			   Division_Name,
			  ISNULL(VSD.SchoolWise_Standard_Division_Id,0) as SavedStandardDivisionId ,
             CASE WHEN CM.OriginalStandardId IS NULL THEN 0 ELSE 1 END AS IsRecordSaved		  
			 FROM vw_standard_division VSD WITH(NOLOCK)
		   LEFT JOIN ConfigMenuAssociatedClasses CM WITH (NOLOCK)
			   ON cm.[OriginalStandardId] = VSD.Original_Standard_Id
			   and cm.[OriginalDivisionId] = VSD.Original_Division_Id
			  AND cm.ConfigMenuId = @MenuId
			  AND cm.SchoolId = @SchoolId
			  AND cm.IsDeleted = 0
			  AND VSD.academic_year_id = @AcademicYearId
		 WHERE School_Id = @SchoolId
		   AND academic_year_id = @AcademicYearId		   
	  ORDER BY Original_Standard_Id, 
	           Original_Division_Id
END
GO
go
