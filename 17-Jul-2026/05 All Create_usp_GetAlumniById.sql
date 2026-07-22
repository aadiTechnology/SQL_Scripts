-- ============================================
-- Procedure: [Mobile].[usp_GetAlumniById]
-- Purpose:   Returns a single alumni record with linked active programmes.
--            Returns two result sets:
--              1) Alumni master record (with binary image columns)
--              2) Active programme associations
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_GetAlumniById]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_GetAlumniById];
GO

CREATE PROCEDURE [Mobile].[usp_GetAlumniById]
    @SchoolId   INT,
    @AlumniId   INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Result Set 1: Alumni master record
    SELECT  AM.AlumniId,
            AM.SchoolId,
            AM.FirstName,
            AM.MiddleName,
            AM.LastName,
            AM.MobileNumber,
            AM.Email,
            AM.Gender,
            AM.BirthDate,
            AM.Nationality,
            AM.ResidingIn,
            AM.Country,
            AM.PassportNumber,
            AM.PermanentAddress,
            AM.CorrespondenceAddress,
            AM.IsSameAddress,
            AM.DepartmentId,
            AM.SchoolPassingYear,
            AM.CurrentStatus,
            AM.InstituteName,
            AM.SelfEmployedDetails,
            AM.CurrentDesignation,
            AM.CompanyName,
            AM.SpecialMentions,
            AM.AchievementImage,
            AM.AlumniPhoto,
            AM.PhotoPermissionGranted,
            AM.HowCanHelp,
            AM.SubmissionMode
    FROM    dbo.AlumniMaster AM
    WHERE   AM.AlumniId  = @AlumniId
      AND   AM.SchoolId  = @SchoolId
      AND   AM.IsDeleted = 0;

    -- Result Set 2: Active programme associations
    SELECT  ProgrammeId
    FROM    dbo.AlumniAcademicProgrammes
    WHERE   AlumniId  = @AlumniId
      AND   IsDeleted = 0;
END
GO
