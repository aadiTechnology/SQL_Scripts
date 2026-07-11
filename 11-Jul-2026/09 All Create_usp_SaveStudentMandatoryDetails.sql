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
-- Description: These method is used save details
-- =============================================
CREATE PROCEDURE [dbo].[usp_SaveStudentMandatoryDetails] 
	-- Add the parameters for the stored procedure here
@YearwiseStudentId INT,
@FatherMobileNumber NVARCHAR(15),
@MotherMobileNumber NVARCHAR(15),
@EmergencyContact NVARCHAR(15),
@BloodGroup NVARCHAR(10),
@TransportMode INT,
@RouteNo NVARCHAR(20) null,
@StopName NVARCHAR(100) null,
@ContractorName NVARCHAR(100) null,
@ContractorContactNo NVARCHAR(15) null,
@UpdatedById INT,
@SchoolId INT,
@AcademicYearId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	UPDATE SWSM
	SET 
		SWSM.Mobile_Number = @FatherMobileNumber,
		SWSM.Mobile_Number2 = @MotherMobileNumber,
		SWSM.Blood_Group = @BloodGroup
	FROM SchoolWise_Student_Master SWSM
	inner Join YearWise_Student_Details YSD
	on YSD.Student_Id=SWSM.SchoolWise_Student_Id
	WHERE YSD.YearWise_Student_Id = @YearwiseStudentId
	AND SWSM.School_Id = @SchoolId
	AND YSD.Academic_Year_ID = @AcademicYearId
	AND YSD.Is_Deleted='N'
	AND SWSM.Is_Deleted='N';

  UPDATE SAD
	SET 
		SAD.EmergencyContactNo = @EmergencyContact
	FROM StudentAdditionalDetails SAD
	inner Join YearWise_Student_Details YSD
	on YSD.Student_Id=SAD.SchoolWiseStudentId
	WHERE YSD.YearWise_Student_Id = @YearwiseStudentId
	AND YSD.Academic_Year_ID = @AcademicYearId
	AND YSD.Is_Deleted='N'
	AND SAD.IsDeleted=0;

	IF EXISTS (
		SELECT 1 
		FROM StudentMandatoryFieldDetails
		WHERE YearwiseStudentId = @YearwiseStudentId
		AND SchoolId = @SchoolId
		AND AcademicYearId = @AcademicYearId
		AND IsDeleted = 0
	)
	BEGIN
		UPDATE StudentMandatoryFieldDetails
		SET 
			TransportModeId = @TransportMode,
			RouteNo = @RouteNo,
			StopName = @StopName,
			ContractorName = @ContractorName,
			ContractorMobileNo = @ContractorContactNo,
			UpdatedById = @UpdatedById,
			UpdatedDate = GETDATE()
		WHERE YearwiseStudentId = @YearwiseStudentId
		AND SchoolId = @SchoolId
		AND AcademicYearId = @AcademicYearId;
	END
	ELSE
	BEGIN
		INSERT INTO StudentMandatoryFieldDetails
		(
			YearwiseStudentId,
			TransportModeId,
			RouteNo,
			StopName,
			ContractorName,
			ContractorMobileNo,
			SchoolId,
			AcademicYearId,
			InsertedById,
			InsertedDate,
			IsDeleted
		)
		VALUES
		(
			@YearwiseStudentId,
			@TransportMode,
			@RouteNo,
			@StopName,
			@ContractorName,
			@ContractorContactNo,
			@SchoolId,
			@AcademicYearId,
			@UpdatedById,
			GETDATE(),
			0
		);
	END
	
END
GO
