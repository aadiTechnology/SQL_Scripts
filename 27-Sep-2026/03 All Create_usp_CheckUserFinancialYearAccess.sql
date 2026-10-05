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
-- Author:		Sweety
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CheckUserFinancialYearAccess]
	-- Add the parameters for the stored procedure here
@User_Id INT,
@School_Id INT,
@Academic_Year_Id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @UserRoleId INT;
    DECLARE @Designation VARCHAR(200);

    SELECT
        @UserRoleId = UserRoleId,
        @Designation = Designation
    FROM vw_AllPayrollUsers
    WHERE UserId = @User_Id
      AND Is_Deleted = 'N'
      --AND AcademicYearId = @Academic_Year_Id
      AND SchoolId = @School_Id;

  

      --Select @UserRoleId

    -- Admin
    IF @UserRoleId = 1
    BEGIN
        SELECT 1 AS HasAccess;
        RETURN;
    END

    -- Teacher
    IF @UserRoleId = 2
    BEGIN
        SELECT 0 AS HasAccess;
        RETURN;
    END

    -- Admin Staff
    IF @UserRoleId = 6
    BEGIN
   
        IF EXISTS
        (
            SELECT 1
            FROM SchoolWise_Supervisor_Master
            WHERE User_Id = @User_Id
              AND School_Id = @School_Id
              AND Is_Deleted = 'N'
              AND IsFinancialYearApplicable = 1
        )
        BEGIN
            SELECT 1 AS HasAccess;
        END
        ELSE
        BEGIN
  
            SELECT 0 AS HasAccess;
        END

        RETURN;
    END

    
END
GO

