-- ============================================
-- Procedure: [Mobile].[usp_ToggleAlumniPublicToken]
-- Purpose:   Admin-triggered. Sets IsActive = 1 (open) or 0 (close)
--            for the active token of a given SchoolId.
--            If TokenId = 0, targets the most recent token for the school.
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_ToggleAlumniPublicToken]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_ToggleAlumniPublicToken];
GO

CREATE PROCEDURE [Mobile].[usp_ToggleAlumniPublicToken]
    @SchoolId   INT,
    @TokenId    INT,
    @IsActive   BIT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TargetTokenId INT;

    IF @TokenId = 0
    BEGIN
        SELECT TOP 1 @TargetTokenId = TokenId
        FROM    dbo.AlumniPublicTokens
        WHERE   SchoolId = @SchoolId
        ORDER BY CreatedDate DESC;
    END
    ELSE
    BEGIN
        SET @TargetTokenId = @TokenId;
    END

    IF @TargetTokenId IS NOT NULL
    BEGIN
        UPDATE  dbo.AlumniPublicTokens
        SET     IsActive = @IsActive
        WHERE   TokenId  = @TargetTokenId
          AND   SchoolId = @SchoolId;
    END
END
GO
