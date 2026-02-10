/****** Object:  StoredProcedure [dbo].[usp_GetOldPendingFeeDetailsForAllYears]    Script Date: 31-01-2026 15:16:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- Optimized for performance - 2026
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetOldPendingFeeDetailsForAllYears] 
	-- Add the parameters for the stored procedure here
	@School_Id INT,
	@Academic_Year_Id INT,
	@Student_Id INT,
	@Standard_Id INT = NULL,
	@Division_Id INT = NULL,
	@FromYear INT = NULL,
	@ToYear INT = NULL,
	@IncludeLateFee NVARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;

	-- Normalize parameters
	IF @FromYear IS NULL
		SET @FromYear = 0;

	IF @ToYear IS NULL
		SET @ToYear = 0;

	DECLARE @TempYear INT;
	IF @FromYear > @ToYear
	BEGIN
		SET @TempYear = @FromYear;
		SET @FromYear = @ToYear;
		SET @ToYear = @TempYear;
	END;

	-- Use temp tables instead of table variables for better statistics and query optimization
	CREATE TABLE #tblreport
	(
		Academic_Year_ID INT PRIMARY KEY,
		Academic_Year_Name VARCHAR(10)
	);

	-- Populate academic years with optimized filtering
	INSERT INTO #tblreport
	SELECT
		Academic_Year_ID,
		CAST(YEAR(start_date) AS NVARCHAR(4)) + '-' + CAST(RIGHT(YEAR(End_Date), 2) AS NVARCHAR(4))
	FROM SchoolWise_Academic_Year_Master WITH (NOLOCK)
	WHERE School_Id = @School_Id
		AND Is_Deleted = 'N'
		AND Is_NewlyCreated = 'N'
		AND (@FromYear = 0 OR Academic_Year_ID >= @FromYear)
		AND (@ToYear = 0 OR Academic_Year_ID <= @ToYear)
	ORDER BY Academic_Year_ID DESC;

	-- Create temp table for student details with index
	CREATE TABLE #tblStudDetails
	(
		Student_Id INT PRIMARY KEY
	);

	-- Populate student details with optimized filtering
	INSERT INTO #tblStudDetails
	SELECT DISTINCT
		YSD.Student_Id
	FROM YearWise_Student_Details YSD WITH (NOLOCK)
	INNER JOIN vw_standard_division VSD WITH (NOLOCK)
		ON YSD.Standard_Id = VSD.Standard_Id
		AND YSD.Division_id = VSD.Division_Id
	WHERE YSD.Is_Deleted = 'N'
		AND (@Student_Id = 0 OR YSD.YearWise_Student_Id = @Student_Id)
		AND (@Standard_Id = 0 OR VSD.Standard_Id = @Standard_Id)
		AND (@Division_Id = 0 OR VSD.SchoolWise_Standard_Division_Id = @Division_Id);

	-- Create temp table for fee details
	CREATE TABLE #tblFeeDetails
	(
		Student_Id INT,
		Academic_Year_Name NVARCHAR(100),
		Academic_Year_ID INT,
		Amount INT,
		IncludeLateFee INT
	);

	-- Create clustered index for better join performance
	CREATE CLUSTERED INDEX IX_FeeDetails_Student_Year ON #tblFeeDetails (Student_Id, Academic_Year_ID);

	-- Optimized fee details query using NOT EXISTS instead of LEFT OUTER JOIN
	INSERT INTO #tblFeeDetails
	SELECT
		YSD.Student_Id,
		TMP.Academic_Year_Name,
		TMP.Academic_Year_ID,
		SUM(SSFD.amount) AS Amount,
		@IncludeLateFee AS IncludeLateFee
	FROM Schoolwise_Student_Fee_Details SSFD WITH (NOLOCK)
	INNER JOIN YearWise_Student_Details YSD WITH (NOLOCK)
		ON SSFD.Student_Id = YSD.YearWise_Student_Id
	INNER JOIN #tblreport TMP
		ON SSFD.Academic_Year_Id = TMP.Academic_Year_ID
	INNER JOIN #tblStudDetails STUD
		ON YSD.Student_Id = STUD.Student_Id
	WHERE SSFD.School_Id = @School_Id
		AND SSFD.[Debit/Credit] = 'Debit'
		AND SSFD.Is_Deleted = 'N'
		AND SSFD.Paid_Date <= dbo.GetLocalDate(DEFAULT)
		AND (@IncludeLateFee = '1' OR (@IncludeLateFee = '0' AND SSFD.Is_Late_Fee = 'N' AND SSFD.Fee_Type <> 'Late Fee'))
		AND NOT EXISTS
		(
			SELECT 1
			FROM Schoolwise_Student_Fee_Details SSFD2 WITH (NOLOCK)
			WHERE SSFD2.Student_Fee_Id = SSFD.Schoolwise_Student_Fee_Id
				AND SSFD2.School_Id = @School_Id
				AND SSFD2.[Debit/Credit] = 'Credit'
				AND SSFD2.Is_Deleted = 'N'
				AND SSFD2.Student_Fee_Id <> 0
				AND SSFD2.Student_Fee_Id IS NOT NULL
		)
	GROUP BY YSD.Student_Id, TMP.Academic_Year_Name, TMP.Academic_Year_ID
	HAVING SUM(SSFD.amount) > 0;

	-- First result set - Student details
	SELECT
		YSD.Student_Id AS Yearwise_Student_Id,
		VBSD.Enrolment_Number,
		VSD.className,
		YSD.Roll_No,
		VBSD.StudentName,
		VBSD.Mobile_Number,
		VSD.Original_Standard_Id,
		VSD.Original_Division_Id,
		@FromYear,
		@ToYear
	FROM vw_BaseStudentDetails VBSD WITH (NOLOCK)
	INNER JOIN YearWise_Student_Details YSD WITH (NOLOCK)
		ON VBSD.SchoolWise_Student_Id = YSD.Student_Id
	INNER JOIN vw_standard_division VSD WITH (NOLOCK)
		ON YSD.Division_id = VSD.Division_Id
		AND YSD.Standard_Id = VSD.Standard_Id
	INNER JOIN #tblFeeDetails TFD
		ON YSD.Student_Id = TFD.Student_Id
	WHERE VBSD.School_Id = @School_Id
		AND VSD.academic_year_id = @Academic_Year_Id
		AND YSD.Is_Deleted = 'N'
		AND (@Standard_Id = 0 OR VSD.Standard_Id = @Standard_Id)
		AND (@Division_Id = 0 OR VSD.SchoolWise_Standard_Division_Id = @Division_Id)
		AND (@Student_Id = 0 OR YSD.YearWise_Student_Id = @Student_Id)
	GROUP BY
		YSD.Student_Id,
		VBSD.Enrolment_Number,
		VSD.className,
		YSD.Roll_No,
		VBSD.StudentName,
		VBSD.Mobile_Number,
		VSD.Original_Standard_Id,
		VSD.Original_Division_Id
	ORDER BY VSD.Original_Standard_Id, VSD.Original_Division_Id, YSD.Roll_No;

	-- Second result set - Fee details
	SELECT
		VBSD.SchoolWise_Student_Id,
		TFD.Academic_Year_ID,
		TFD.Academic_Year_Name,
		TFD.Amount,
		@FromYear,
		@ToYear
	FROM vw_BaseStudentDetails VBSD WITH (NOLOCK)
	INNER JOIN YearWise_Student_Details YSD WITH (NOLOCK)
		ON VBSD.SchoolWise_Student_Id = YSD.Student_Id
	INNER JOIN #tblFeeDetails TFD
		ON YSD.Student_Id = TFD.Student_Id
		AND YSD.Academic_Year_ID = TFD.Academic_Year_ID
	WHERE VBSD.Is_Deleted = 'N'
		AND YSD.Is_Deleted = 'N'
	ORDER BY SchoolWise_Student_Id

	-- Cleanup temp tables
	IF OBJECT_ID('tempdb..#tblreport') IS NOT NULL
		DROP TABLE #tblreport;
	IF OBJECT_ID('tempdb..#tblStudDetails') IS NOT NULL
		DROP TABLE #tblStudDetails;
	IF OBJECT_ID('tempdb..#tblFeeDetails') IS NOT NULL
		DROP TABLE #tblFeeDetails;
END