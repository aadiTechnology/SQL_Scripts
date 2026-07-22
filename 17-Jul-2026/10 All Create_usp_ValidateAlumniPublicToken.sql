-- ============================================
-- Procedure: [Mobile].[usp_ValidateAlumniPublicToken]
-- Purpose:   Validates a public token by checking if a matching record
--            exists in AlumniPublicTokens with IsActive = 1.
--            Returns IsValid, SchoolId, and ErrorMessage.
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_ValidateAlumniPublicToken]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_ValidateAlumniPublicToken];
GO

CREATE PROCEDURE [Mobile].[usp_ValidateAlumniPublicToken]
    @SchoolId    INT,
    @TokenValue  NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT  1
        FROM    dbo.AlumniPublicTokens
        WHERE   SchoolId   = @SchoolId
          AND   TokenValue = @TokenValue
          AND   IsActive   = 1
    )
    BEGIN
        SELECT  CAST(1 AS BIT)              AS IsValid,
                @SchoolId                   AS SchoolId,
                CAST(NULL AS NVARCHAR(500)) AS ErrorMessage;
    END
    ELSE IF EXISTS (
        SELECT  1
        FROM    dbo.AlumniPublicTokens
        WHERE   SchoolId   = @SchoolId
          AND   TokenValue = @TokenValue
          AND   IsActive   = 0
    )
    BEGIN
        SELECT  CAST(0 AS BIT)                       AS IsValid,
                @SchoolId                            AS SchoolId,
                N'Registration is currently closed.'  AS ErrorMessage;
    END
    ELSE
    BEGIN
        SELECT  CAST(0 AS BIT)                AS IsValid,
                CAST(0 AS INT)                AS SchoolId,
                N'Invalid or expired token.'  AS ErrorMessage;
    END
END
GO
