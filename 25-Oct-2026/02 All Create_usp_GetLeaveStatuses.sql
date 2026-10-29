-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Sweety
-- Create date: 15 /oct/2026
-- Description:	Leave status list for the Leave Details filter.
--              Status id 6 is excluded from the dropdown.
-- =============================================

CREATE PROCEDURE [dbo].[usp_GetLeaveStatuses]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT LS.Id,
           LS.Status
      FROM dbo.LeaveStatuses LS
     WHERE LS.IsDeleted = 0
       AND LS.Id <> 6
     ORDER BY LS.Id;
END
GO
