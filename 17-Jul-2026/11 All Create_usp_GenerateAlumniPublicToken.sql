-- ============================================
-- Procedure: [Mobile].[usp_GenerateAlumniPublicToken]
-- Purpose:   Admin-triggered. Creates a new token record with IsActive = 1.
--            If a token already exists for the school, deactivates it first.
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_GenerateAlumniPublicToken]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_GenerateAlumniPublicToken];
GO

CREATE PROCEDURE [Mobile].[usp_GenerateAlumniPublicToken]
    @SchoolId          INT,
    @TokenValue        NVARCHAR(500),
    @EncryptedPayload  NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Deactivate any existing tokens for this school
    UPDATE  dbo.AlumniPublicTokens
    SET     IsActive = 0
    WHERE   SchoolId = @SchoolId
      AND   IsActive = 1;

    -- Insert new active token
    INSERT INTO dbo.AlumniPublicTokens
    (
        SchoolId,
        TokenValue,
        EncryptedPayload,
        IsActive,
        CreatedDate
    )
    VALUES
    (
        @SchoolId,
        @TokenValue,
        @EncryptedPayload,
        1,
        dbo.GetLocalDate(DEFAULT)
    );
END
GO
