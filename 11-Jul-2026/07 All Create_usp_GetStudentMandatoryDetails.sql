
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Sweety
-- Create date:01-04-2026
-- Description:these method is used get student Mandatory fields
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetStudentMandatoryDetails]
-- Add the parameters for the stored procedure here
@SchoolId INT,
@AcademicYearId INT,
@UpdatedById Int,
@YearwiseStudentId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT 
		YSD.YearWise_Student_Id,
        SWSM.Mobile_Number AS FatherMobileNumber,
		SWSM.Mobile_Number2 AS MotherMobileNumber,
		ISNULL(SAD.EmergencyContactNo,'') AS EmergencyContact,
		SWSM.Blood_Group AS BloodGroup,
        ISNULL(SMFD.TransportModeId,0) AS TransportModeId,
		--TM.ModeName AS TransportMode,
		ISNULL(SMFD.RouteNo,'') AS RouteNo,
		ISNULL(SMFD.StopName,'') AS StopName,
		ISNULL(SMFD.ContractorName,'') AS ContractorName,
		ISNULL(SMFD.ContractorMobileNo,'') as ContractorContactNo,
		ISNULL(SMFSS.IsSubmit, 0) AS IsSubmitted,
		CASE 
			WHEN SMFD.YearwiseStudentId IS NOT NULL THEN 1 
			ELSE 0 END AS IsSaved
	FROM SchoolWise_Student_Master SWSM
	inner join Yearwise_Student_Details YSD
	ON YSD.Student_Id=SWSM.SchoolWise_Student_Id
    LEFT JOIN StudentAdditionalDetails SAD
		ON SAD.SchoolwiseStudentId = SWSM.SchoolWise_Student_Id
		And SAD.IsDeleted=0
	LEFT JOIN StudentMandatoryFieldDetails SMFD
		ON SMFD.YearwiseStudentId = YSD.YearWise_Student_Id
		AND SMFD.IsDeleted = 0
   LEFT JOIN TransportModes TM
		ON  TM.Id = SMFD.TransportModeId
		AND TM.IsDeleted = 0
  LEFT JOIN StudentMandatoryFieldSubmitStatus SMFSS
		ON SMFSS.YearwiseStudentId = YSD.YearWise_Student_Id
	   AND SMFSS.IsDeleted = 0
	WHERE 
		YSD.YearWise_Student_Id = @YearwiseStudentId
		AND SWSM.School_Id = @SchoolId
		AND YSD.Academic_Year_ID = @AcademicYearId
		AND YSD.Is_Deleted='N'
		AND SWSM.Is_Deleted='N'
END