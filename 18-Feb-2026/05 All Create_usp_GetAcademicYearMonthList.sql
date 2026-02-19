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
-- Author:		sweety
-- Create date: 12-02-2026
-- Description:	these method is used to get months
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAcademicYearMonthList]
	-- Add the parameters for the stored procedure here
@School_Id INT,
@Academic_Year_Id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 DECLARE @StartDate DATE,
            @EndDate DATE,
            @CurrentDate DATE = CAST(GETDATE() AS DATE);

    SELECT  @StartDate = Start_Date,
            @EndDate = End_Date
    FROM SchoolWise_Academic_Year_Master
    WHERE Academic_Year_ID = @Academic_Year_Id
      AND School_Id = @School_Id
      AND Is_Deleted = 'N';

    -- If current date is less than EndDate, use current date
    IF (@CurrentDate < @EndDate)
        SET @EndDate = @CurrentDate;

    ;WITH MonthCTE AS
    (
        SELECT DATEFROMPARTS(YEAR(@StartDate), MONTH(@StartDate), 1) AS MonthDate
        UNION ALL
        SELECT DATEADD(MONTH, 1, MonthDate)
        FROM MonthCTE
        WHERE DATEADD(MONTH, 1, MonthDate) <= @EndDate
    )

    SELECT 
        MONTH(MonthDate) AS Value_Member,
        FORMAT(MonthDate, 'MMM-yyyy') AS Display_Member,
        MonthDate
    FROM MonthCTE
    ORDER BY MonthDate
    OPTION (MAXRECURSION 100);
END
GO
