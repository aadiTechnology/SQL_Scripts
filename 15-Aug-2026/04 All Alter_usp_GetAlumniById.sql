/****** Object:  StoredProcedure [Mobile].[usp_GetAlumniById] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [Mobile].[usp_GetAlumniById]
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
            AM.City,
            AM.[State],
            AM.DepartmentId,
            AM.OtherDepartment,
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
