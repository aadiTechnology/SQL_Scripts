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
-- Create date: 22/05/2026
-- Description:	these usp gives classwise student exam percentage and attendance details report.
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetClasswiseExamPercentageAttendanceDetails]
	-- Add the parameters for the stored procedure here
	@School_Id INT,
	@Academic_Year_Id INT,
	@StandardId NVARCHAR(500) = '',
	@DivisionId NVARCHAR(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @NewAcademicYear VARCHAR(20),
        @NewAcademicYearId int,
		@CurrentAcademicYear VARCHAR(20),
		@MarkHeader nvarchar(100),
		@NoOFDaysAttendedHeader nvarchar(100),
		@ProgressionStatusHeader nvarchar(100),
		@PromotedToClassHeader nvarchar(100),
		@SchoolingStatusHeader nvarchar(100)



	SELECT TOP 1
		 @NewAcademicYear = CAST(YEAR(Start_date) AS VARCHAR(4)) + '-' + CAST(YEAR(End_Date) AS VARCHAR(4)),
		 @NewAcademicYearId=Academic_Year_Id
	FROM SchoolWise_Academic_Year_Master
	WHERE School_Id = @School_Id
	AND Academic_Year_ID > @Academic_Year_Id
	AND Is_Deleted = 'N'
	ORDER BY Academic_Year_ID


	SELECT 
		@CurrentAcademicYear = CAST(YEAR(Start_date) AS VARCHAR(4)) + '-' + CAST(YEAR(End_Date) AS VARCHAR(4))
	FROM SchoolWise_Academic_Year_Master
	WHERE Academic_Year_ID = @Academic_Year_Id
	AND Is_Deleted = 'N'

SET @ProgressionStatusHeader = 'Progression Status' + CHAR(13) + CHAR(10) + '(' + @CurrentAcademicYear + ')'
SET @MarkHeader = 'Marks %' + CHAR(13) + CHAR(10) + '(' + @CurrentAcademicYear + ')'
SET @NoOFDaysAttendedHeader = 'No. Of Days Attended' + CHAR(13) + CHAR(10) + '(' + @CurrentAcademicYear + ')'
SET @SchoolingStatusHeader = 'Schooling Status' + CHAR(13) + CHAR(10) + '(' + @CurrentAcademicYear + ')'
SET @PromotedToClassHeader = CASE WHEN @NewAcademicYear IS NULL THEN 'Promoted To Class' ELSE 'Promoted To Class' + CHAR(13) + CHAR(10) + '(' + @NewAcademicYear + ')' END

	DECLARE @tblStandardIds AS TABLE
   (
		Id INT IDENTITY(1,1),
		StandardId INT
   )

   DECLARE @tblDivisionIds AS TABLE
   (
		Id INT IDENTITY(1,1),
		DivisionId INT
   )

   IF(@StandardId IS NULL OR @StandardId = '')
	  BEGIN
			INSERT INTO @tblStandardIds
				 SELECT Standard_Id
				   FROM Standard_Master
				  WHERE School_Id = @School_Id
				    AND academic_Year_Id = @Academic_Year_Id
					AND Is_Deleted = 'N'
	  END
  ELSE
	  BEGIN	  
			INSERT INTO @tblStandardIds
			   SELECT *
			     FROM dbo.udf_GetTableFromList(@StandardId)
	  END

	IF(@DivisionId IS NULL OR @DivisionId = '')
		BEGIN
			INSERT INTO @tblDivisionIds
				 SELECT Division_Id
				   FROM Division_Master
				  WHERE School_Id = @School_Id
				    AND academic_Year_Id = @Academic_Year_Id
					AND Is_Deleted = 'N'
		END
	ELSE
		BEGIN
			INSERT INTO @tblDivisionIds
			     SELECT *
			       FROM dbo.udf_GetTableFromList(@DivisionId)
		END

      DECLARE @tblStudentData AS TABLE
	(
		YearWise_Student_Id INT,
		SchoolWise_Student_Id INT,
		Roll_No INT,
		StudentName NVARCHAR(150),
		ClassName NVARCHAR(150),
		Original_Standard_Id INT,
		Original_Division_Id INT,
		SchoolLeftdate DATE,
		StandardName nvarchar(30)
	)

	INSERT INTO @tblStudentData
	SELECT ysd.YearWise_Student_Id, bsd.SchoolWise_Student_Id, YSD.Roll_No, bsd.StudentName, vsd.className, vsd.Original_Standard_Id, vsd.Original_Division_Id, BSD.SchoolLeft_Date,VSD.Standard_Name
	FROM vw_BaseStudentDetails BSD
	INNER JOIN YearWise_Student_Details YSD
	ON BSD.SchoolWise_Student_Id = YSD.Student_Id
	INNER JOIN vw_standard_division VSD
	ON YSD.Standard_Id = VSD.Standard_Id
	AND YSD.Division_Id = VSD.Division_Id
	Inner Join @tblStandardIds SIds
	On SIds.StandardId=VSD.Standard_Id
	Inner JOin @tblDivisionIds  DIds
	ON DIds.DivisionId =vsd.Division_Id

	WHERE YSD.School_Id = @School_Id
	AND YSD.Academic_Year_ID = @Academic_Year_Id
	AND YSD.Is_Deleted = 'N'

  DECLARE @tblStudentMarks AS TABLE
	(
		YearWise_Student_Id INT,
		Total_Marks_Scored DECIMAL(10,2),
		OutOfMarks INT,
		Percentage decimal(10,2)
	)

		INSERT INTO @tblStudentMarks
		SELECT Student_Id, SUM(Total_Marks_Scored) AS Total_Marks_Scored, SUM(OutOfMarks) AS OutOfMarks, 0
		FROM
		(
			SELECT sstm.Student_Id, sstm.Total_Marks_Scored, 
			CASE WHEN SSTM.Is_Absent IN (SELECT ShortName FROM Schoolwise_Exam_Status WHERE SchoolId = @School_Id AND AcademicYearId = @Academic_Year_Id AND IsDeleted = 0 AND ConsiderInTotal = 'N') THEN 0 ELSE
			CASE WHEN STSMM.OutOfMarks IS NOT NULL AND STSMM.OutOfMarks <> 0 THEN STSMM.OutOfMarks ELSE STSMM.Subject_Total_Marks END 
			END
			AS OutOfMarks
			FROM SchoolWise_Student_Test_Marks SSTM
			INNER JOIN @tblStudentData TSD
			ON SSTM.Student_Id = TSD.YearWise_Student_Id
			INNER JOIN SchoolWise_Test_Subject_Marks_Master STSMM
			ON SSTM.TestWise_Subject_Marks_Id = STSMM.TestWise_Subject_Marks_Id
			INNER JOIN SchoolWise_Test_Master STM
			ON STSMM.SchoolWise_Test_Id = STM.SchoolWise_Test_Id
			INNER JOIN Schoolwise_Division_Subject_Master SDSM
			ON STSMM.Standard_Division_Id = SDSM.Standard_Division_Id
			AND STSMM.Subject_Id = SDSM.Subject_Id
			WHERE SSTM.School_Id  =@School_Id
			AND SSTM.Academic_Year_Id = @Academic_Year_Id
			AND SSTM.Is_Deleted = 'N'
			AND STSMM.Is_Deleted = 'N'
			AND STM.Is_Deleted = 'N'
			AND ((TSD.StandardName IN ('1','2','3','4','5') and STM.SchoolWise_Test_Name  = 'Evaluation 3') OR (TSD.StandardName  NOT IN ('1','2','3','4','5')))
			AND STSMM.Is_Submitted = 'Y'
			AND SDSM.Is_Deleted = 'N'
			AND SDSM.Total_Consideration = 'Y'
		)S
		GROUP BY Student_Id

		UPDATE @tblStudentMarks
		SET Percentage = ROUND((Total_Marks_Scored / (CASE WHEN OutOfMarks = 0 THEN 1 ELSE OutOfMarks END))*100,2)

		SELECT TSD.ClassName,TSD.Roll_No, TSD.StudentName, CASE WHEN TSD.SchoolLeftdate IS NOT NULL THEN '-' WHEN NextClass.SchoolWise_Student_Id IS NOT NULL THEN 'Promoted' ELSE 'Not Promoted' END as ProgressionStatus,
		ISNULL(TSM.Percentage,0) AS Marks,
		ISNULL(ATT.PresentDays,0) AS NoOfDaysAttended,
		CASE WHEN tsd.SchoolLeftdate IS NOT NULL THEN 'Left' ELSE '-' END AS SchoolingStatus,
		ISNULL(NULLIF(NextClass.PromotedToClass, ''), '-') AS PromotedToClass,
		@ProgressionStatusHeader AS ProgressionStatusHeader,
		@MarkHeader AS MarkHeader,
		@NoOFDaysAttendedHeader AS AttendanceHeader,
		@SchoolingStatusHeader AS SchoolingStatusHeader,
		@PromotedToClassHeader AS PromotedToClassHeader
		FROM @tblStudentData TSD
		LEFT OUTER JOIN @tblStudentMarks TSM
		ON TSD.YearWise_Student_Id = TSM.YearWise_Student_Id
		LEFT OUTER JOIN
		(
			SELECT bsd.SchoolWise_Student_Id, bsd.StudentName, vsd.className AS PromotedToClass
			FROM vw_BaseStudentDetails BSD
			INNER JOIN YearWise_Student_Details YSD
			ON BSD.SchoolWise_Student_Id = YSD.Student_Id
			INNER JOIN vw_standard_division VSD
			ON YSD.Standard_Id = VSD.Standard_Id
			AND YSD.Division_Id = VSD.Division_Id
			INNER JOIN @tblStudentData TSD
			ON BSD.SchoolWise_Student_Id = TSD.SchoolWise_Student_Id
			WHERE YSD.School_Id = @School_Id
			 AND (@NewAcademicYearId IS NOT NULL 
			 AND YSD.Academic_Year_ID = @NewAcademicYearId)	
			 AND YSD.Is_Deleted = 'N'
			AND BSD.SchoolLeft_Date IS NULL
		)NextClass
		ON TSD.SchoolWise_Student_Id = NextClass.SchoolWise_Student_Id
		LEFT OUTER JOIN
		(
			SELECT Student_Id AS YearwiseStudentId, SUM(CASE WHEN Is_Present = 'Y' THEN 1 ELSE 0 END) AS PresentDays, COUNT(1) as TotalDays
			FROM
			(
				select DISTINCT SAD.Student_Id, Attendance_Date, Is_Present
				from SchoolWise_Attendance_Details SAD
				INNER JOIN @tblStudentData TSD
				ON SAD.Student_Id = TSD.YearWise_Student_Id
				WHERE SAD.School_Id = @School_Id
				AND SAD.Academic_Year_Id = @Academic_Year_Id
				AND SAD.Is_Deleted = 'N'
			)S
			GROUP BY Student_Id
		)ATT
		ON TSD.YearWise_Student_Id = ATT.YearwiseStudentId
		ORDER BY TSD.Original_Standard_Id, TSD.Original_Division_Id, TSD.Roll_No
END
GO