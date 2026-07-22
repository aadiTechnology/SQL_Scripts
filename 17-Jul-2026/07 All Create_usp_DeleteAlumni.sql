-- ============================================
-- Procedure: [Mobile].[usp_DeleteAlumni]
-- Purpose:   Soft-delete an alumni record (sets IsDeleted = 1).
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_DeleteAlumni]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_DeleteAlumni];
GO

CREATE PROCEDURE [Mobile].[usp_DeleteAlumni]
    @SchoolId   INT,
    @AlumniId   INT,
    @UserId     INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE  dbo.AlumniMaster
    SET     IsDeleted   = 1,
            UpdatedBy   = @UserId,
            UpdatedDate = dbo.GetLocalDate(DEFAULT)
    WHERE   AlumniId  = @AlumniId
      AND   SchoolId  = @SchoolId
      AND   IsDeleted = 0;
END
GO
