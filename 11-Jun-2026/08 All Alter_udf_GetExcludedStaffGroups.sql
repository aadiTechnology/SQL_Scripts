-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION dbo.udf_GetExcludedStaffGroups 
(
	-- Add the parameters for the function here
	@SchoolId Int
)

RETURNS @tblStaffGroups Table
(
    StaffGroupsId INT
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	 INSERT INTO @tblStaffGroups( StaffGroupsId )
    SELECT
        SG.StaffGroupsId
    FROM StaffGroups SG
    WHERE SG.StaffGroupsName = 'Contract Employee'
          AND SG.Is_Deleted = 'N'
          AND SG.SchoolId = @SchoolId;
	
	RETURN 
END
GO