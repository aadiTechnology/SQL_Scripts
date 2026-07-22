-- ============================================
-- Procedure: [Mobile].[usp_GetAcademicProgrammes]
-- Purpose:   Returns academic programme list for a given school.
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_GetAcademicProgrammes]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_GetAcademicProgrammes];
GO

CREATE PROCEDURE [Mobile].[usp_GetAcademicProgrammes]
    @SchoolId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  ProgrammeId,
            ProgrammeName
    FROM    dbo.AcademicProgrammeMaster
    WHERE   SchoolId = @SchoolId
    ORDER BY ProgrammeName;
END
GO
