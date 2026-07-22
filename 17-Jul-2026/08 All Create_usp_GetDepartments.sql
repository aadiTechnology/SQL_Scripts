-- ============================================
-- Procedure: [Mobile].[usp_GetDepartments]
-- Purpose:   Returns department list for a given school.
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_GetDepartments]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_GetDepartments];
GO

CREATE PROCEDURE [Mobile].[usp_GetDepartments]
    @SchoolId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  DepartmentId,
            DepartmentName
    FROM    dbo.DepartmentMaster
    WHERE   SchoolId = @SchoolId
    ORDER BY DepartmentName;
END
GO
