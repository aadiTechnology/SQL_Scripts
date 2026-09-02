/****** Object:  Stored Procedure [dbo].[usp_AssignScreenLevelAccess]    Script Date: 8/19/2026 4:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================
-- Author:      Shankar Gurav
-- Create date: 7-Feb-2009
-- Description: Assigns screen-level and report-level access for a target user.
-- ---------------------------------------------------------------------------
-- MODIFICATION LOG
-- ## Date       Author   Description
-- ---------------------------------------------------------------------------
-- 01 30-05-12  Vishal   Modified UserScreenPermissions procedure.
--                        Now, only those entries are deleted from the
--                        UserScreenPermissions table (and then re-added)
--                        which are present in the @UserScreens temp table.
-- 02 2025      Kiro     Added @iLoginUserId parameter to exclude restricted
--                        module screens/reports from soft-delete logic.
-- 03 2025      Kiro     Cleanup: proper formatting, TRY/CATCH transaction,
--                        removed dead code, removed READ UNCOMMITTED.
-- ============================================================================
ALTER PROCEDURE [dbo].[usp_AssignScreenLevelAccess]
    @iUserId INT,
    @sXmlScreenAccess XML,
    @iInsertById INT,
    @sXmlReportsAccess XML,
    @iLoginUserId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Default @iLoginUserId to @iInsertById for backward compatibility
    SET @iLoginUserId = ISNULL(@iLoginUserId, @iInsertById);

    -- Get School ID
    DECLARE @SchoolId INT;
    SELECT TOP 1 @SchoolId = SchoolId
    FROM SchoolSettings
    WHERE IsDeleted = 0;

    -- Determine which modules are restricted for the login user
    DECLARE @tblRestrictedModuleIds TABLE (ModuleId INT);

    INSERT INTO @tblRestrictedModuleIds
    SELECT SM.SchoolModulesId
    FROM SchoolModules SM
    WHERE IsActive = 1
        AND IsScreenAccessRestricted = 1
        AND SM.SchoolModulesId NOT IN (
            SELECT ISNULL(SchoolModuleId, 0)
            FROM UsersForRestrictedScreenAccessModules
            WHERE UserId = @iLoginUserId AND IsDeleted = 0
        );

    -- Determine which report folders belong to restricted modules
    DECLARE @tblRestrictedReportFolderIds TABLE (ReportFolderId INT);

    INSERT INTO @tblRestrictedReportFolderIds
    SELECT MWRF.Report_Folder_Id
    FROM ModulewiseReportFolders MWRF
    WHERE MWRF.SchoolModulesId IN (SELECT ModuleId FROM @tblRestrictedModuleIds);

    -- Parse screen access XML into table variable
    DECLARE @UserScreens TABLE
    (
        ScreenId INT,
        UserId INT,
        IsDeleted CHAR(1),
        CanEdit CHAR(1),
        InsertedById INT
    );

    INSERT INTO @UserScreens
    SELECT
        T.c.value('./@id', 'INT'),
        @iUserId,
        T.c.value('./@IsDeleted', 'CHAR(1)'),
        T.c.value('./@CanEdit', 'CHAR(1)'),
        @iInsertById
    FROM @sXmlScreenAccess.nodes('ScreenAccess/Screen') T(c);

    BEGIN TRY
        BEGIN TRANSACTION

        -- ================================================================
        -- Section 1: Soft-delete unchecked screen permissions
        -- ================================================================
        UPDATE UserScreenPermissions
        SET
            Is_Deleted = 1,
            Update_By_Id = @iInsertById,
            Update_Date = dbo.GetLocalDate(DEFAULT)
        WHERE User_Id = @iUserId
            AND Screen_Id <> 57  -- Reports screen excluded
            AND Screen_Id NOT IN (
                SELECT Configure_Id
                FROM Configuration_Master
                WHERE Is_Deleted = 'N'
                    AND SchoolModulesId IN (7, 2)  -- Accounts module excluded
            )
            AND Screen_Id NOT IN (
                SELECT Configure_Id
                FROM Configuration_Master
                WHERE Is_Deleted = 'N'
                    AND SchoolModulesId IN (SELECT ModuleId FROM @tblRestrictedModuleIds)
            )
            AND Screen_Id NOT IN (
                SELECT ScreenId
                FROM @UserScreens
                WHERE IsDeleted = 'N'
            );

        -- ================================================================
        -- Section 2: Insert new screen permissions
        -- ================================================================
        INSERT INTO UserScreenPermissions
        (
            Screen_Id,
            User_Id,
            Can_Edit,
            Inserted_By_Id,
            Insert_Date
        )
        SELECT
            ScreenId,
            UserId,
            CanEdit,
            InsertedById,
            dbo.GetLocalDate(DEFAULT)
        FROM @UserScreens
        WHERE IsDeleted = N'N'
            AND ScreenId NOT IN (
                SELECT Screen_Id
                FROM UserScreenPermissions
                WHERE User_Id = @iUserId
                    AND Is_Deleted = 0
            );

        -- ================================================================
        -- Section 3: Update CanEdit for existing screen permissions
        -- ================================================================
        UPDATE usp
        SET
            Can_Edit = us.CanEdit,
            Update_By_Id = @iInsertById,
            Update_Date = dbo.GetLocalDate(DEFAULT)
        FROM UserScreenPermissions usp
        INNER JOIN @UserScreens us
            ON usp.Screen_Id = us.ScreenId
        WHERE usp.User_Id = @iUserId
            AND usp.Is_Deleted = 0
            AND us.IsDeleted = 'N';

        -- ================================================================
        -- Section 4: Auto-grant Reports screen (57) if not exists
        -- ================================================================
        IF NOT EXISTS (
            SELECT TOP 1 1
            FROM UserScreenPermissions USP
            WHERE USP.User_Id = @iUserId
                AND USP.Screen_Id = 57
        )
        BEGIN
            INSERT INTO UserScreenPermissions
            (
                Screen_Id,
                User_Id,
                Can_Edit,
                Inserted_By_Id,
                Insert_Date
            )
            SELECT
                57,  -- Reports (SchoolReportUI.aspx) ScreenId
                @iUserId,
                N'Y',
                @iInsertById,
                dbo.GetLocalDate(DEFAULT);
        END

        -- ================================================================
        -- Section 5: Insert new report permissions
        -- ================================================================
        INSERT INTO Report_User_Details
        (
            Report_Id,
            User_Id,
            Is_Deleted,
            Insert_Date,
            Update_Date,
            HasFullAccess,
            IsViewAvailable
        )
        SELECT
            T.c.value('./@Report_Id', 'INT'),
            @iUserId,
            N'N',
            dbo.GetLocalDate(DEFAULT),
            dbo.GetLocalDate(DEFAULT),
            T.c.value('./@HasFullAccess', 'BIT'),
            T.c.value('./@IsViewAvailable', 'BIT')
        FROM @sXmlReportsAccess.nodes('ReportAccess/ReportAccess') T(c)
        WHERE T.c.value('./@Report_Id', 'INT') NOT IN (
            SELECT Report_Id
            FROM Report_User_Details
            WHERE User_Id = @iUserId
                AND Is_Deleted = 'N'
        );

        -- ================================================================
        -- Section 6: Soft-delete unchecked report permissions
        -- ================================================================
        UPDATE Report_User_Details
        SET
            Is_Deleted = 'Y',
            Update_Date = dbo.GetLocalDate(DEFAULT)
        WHERE User_Id = @iUserId
            AND Is_Deleted = 'N'
            AND Report_Id NOT IN (
                SELECT T.c.value('./@Report_Id', 'INT')
                FROM @sXmlReportsAccess.nodes('ReportAccess/ReportAccess') T(c)
            )
            AND Report_Id NOT IN (
                SELECT Report_Id
                FROM Reports
                WHERE Report_Folder_Id IN (SELECT ReportFolderId FROM @tblRestrictedReportFolderIds)
            )
            AND (@SchoolId <> 71 OR (@SchoolId = 71 AND Report_Id <> 74));  -- Salary slip

        -- ================================================================
        -- Section 7: Update HasFullAccess for existing reports
        -- ================================================================
        UPDATE RUD
        SET
            HasFullAccess = T.c.value('./@HasFullAccess', 'BIT'),
            Update_Date = dbo.GetLocalDate(DEFAULT)
        FROM Report_User_Details RUD
        INNER JOIN @sXmlReportsAccess.nodes('ReportAccess/ReportAccess') T(c)
            ON RUD.Report_Id = T.c.value('./@Report_Id', 'INT')
        WHERE User_Id = @iUserId
            AND Is_Deleted = 'N';

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO