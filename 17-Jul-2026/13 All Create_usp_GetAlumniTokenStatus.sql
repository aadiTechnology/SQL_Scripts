-- ============================================
-- Procedure: [Mobile].[usp_GetAlumniTokenStatus]
-- Purpose:   Returns the current token status (IsActive, EncryptedPayload)
--            for a school. Called on AlumniList screen load.
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_GetAlumniTokenStatus]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_GetAlumniTokenStatus];
GO

CREATE PROCEDURE [Mobile].[usp_GetAlumniTokenStatus]
    @SchoolId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 1
            IsActive,
            EncryptedPayload
    FROM    dbo.AlumniPublicTokens
    WHERE   SchoolId = @SchoolId
    ORDER BY CreatedDate DESC;
END
GO
