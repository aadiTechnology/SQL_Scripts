/****** Object:  StoredProcedure [dbo].[usp_GetProgressReportForPrePrimaryPioneer]    Script Date: 9/23/2026 2:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Sweety
-- Create date: 11-09-2026
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetProgressReportForPrePrimaryPioneer]
	-- Add the parameters for the stored procedure here
	@School_Id INT,
	@Academic_Year_Id INT,
	@Standard_Id INT,
	@Division_Id INT,
	@Student_Id INT,
	@Term_Id INT,
	@IsFromReportScreen bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @tempAssessmentSkillTable TABLE
(
    Id INT,
    SkillName NVARCHAR(100)
)

INSERT INTO @tempAssessmentSkillTable
(
    Id,
    SkillName
)
VALUES
(1, 'Self Assessment'),
(2, 'Parent Feedback'),
(3, 'Peer Feedback')
	
	  DECLARE @tblStudentDetails AS TABLE
	(
		YearwiseStudentId INT,
		RollNo INT,
        StudentName NVARCHAR(100),
        Address NVARCHAR(200),
		DOB NVARCHAR(50),
		Class NVARCHAR(100),
		AcademicYear NVARCHAR(50),
		SchoolName NVARCHAR(100),
		ThingsILike NVARCHAR(200),
		MyFriends NVARCHAR(200),
		Colours NVARCHAR(100),
		Foods NVARCHAR(100),
	    Games NVARCHAR(100),
		Animals NVARCHAR(100),
		Term1Height INT,
		Term1Weight DECIMAL(10,2),
		Term2Height INT,
		Term2Weight DECIMAL(10,2)		
	)

	IF @Student_Id IS NULL
		SET @Student_Id = 0

	DECLARE @StdDivId INT
	SET @StdDivId = @Division_Id

	INSERT INTO @tblStudentDetails
	SELECT YSD.YearWise_Student_Id,
		    YSD.Roll_No,
			UPPER(CASE  WHEN BSD.SchoolWise_Student_Id in (469,644,769,628 )
                THEN BSD.StudentFLName ELSE  BSD.StudentName END) AS StudentName,
			BSD.Address,
	   	 CONVERT(VARCHAR(11), BSD.DOB, 106) AS DOB,
		 VSD.className,
		 CAST(YEAR(SAYM.Start_date) AS NVARCHAR(4)) +'-'+ CAST(YEAR(SAYM.End_Date) AS NVARCHAR(4)),
		 UPPER(SM.School_Name),
			'',
			'',
			'',
			'',
			'',
			'',
			0,
			0,
			0,
			0
	 --VSD.SchoolWise_Standard_Division_Id
	FROM vw_BaseStudentDetails BSD
	INNER JOIN YearWise_Student_Details YSD
	ON BSD.SchoolWise_Student_Id = YSD.Student_Id
	INNER JOIN vw_standard_division VSD
	ON YSD.Standard_Id = VSD.Standard_Id
	AND YSD.Division_id = VSD.Division_Id
	INNER JOIN SchoolWise_Academic_Year_Master SAYM
	ON YSD.Academic_Year_ID = SAYM.Academic_Year_ID
	INNER JOIN School_Master SM
	on saym.School_Id = sm.School_Id
	WHERE YSD.School_Id = @School_Id
	AND YSD.Academic_Year_ID = @Academic_Year_Id
	AND YSD.Is_Deleted = 'N'
	AND SAYM.Is_Deleted = 'N'
	and SM.Is_Deleted = 'N'
	AND YSD.Standard_Id = @Standard_Id
	AND VSD.SchoolWise_Standard_Division_Id = @StdDivId
	and (YSD.YearWise_Student_Id = @Student_Id OR @Student_Id = 0)

 
 Update SD
   Set ThingsILike =SOD.Comment
 from  @tblStudentDetails SD
 Inner Join StudentObservationDetails SOD
 On SD.YearwiseStudentId=SOD.StudentId
 Inner Join ObservationParameters OP
 On OP.Id=SOD.ParameterId
 Inner Join ObservationSkills OS
 On OS.Id=OP.SkillId
 WHERE SOD.AcademicYearId=@Academic_Year_Id
 AND SOD.SchoolId=@School_Id
 AND SOD.IsDeleted=0
 AND Parameter='Things I like'
 AND  Name ='All about me' 



  Update SD
   Set MyFriends =SOD.Comment
 from  @tblStudentDetails SD
 Inner Join StudentObservationDetails SOD
 On SD.YearwiseStudentId=SOD.StudentId
 Inner Join ObservationParameters OP
 On OP.Id=SOD.ParameterId
 Inner Join ObservationSkills OS
 On OS.Id=OP.SkillId
 WHERE SOD.AcademicYearId=@Academic_Year_Id
 AND SOD.SchoolId=@School_Id
 AND SOD.IsDeleted=0
 AND Parameter='My friends are'
 AND  Name ='All about me' 

   Update SD
   Set Colours =SOD.Comment
 from  @tblStudentDetails SD
 Inner Join StudentObservationDetails SOD
 On SD.YearwiseStudentId=SOD.StudentId
 Inner Join ObservationParameters OP
 On OP.Id=SOD.ParameterId
 Inner Join ObservationSkills OS
 On OS.Id=OP.SkillId
 WHERE SOD.AcademicYearId=@Academic_Year_Id
 AND SOD.SchoolId=@School_Id
 AND SOD.IsDeleted=0
 AND OP.Parameter like '%My Favourite colours are%'
 AND  Name ='All about me' 

 Update SD
   Set Foods =SOD.Comment
 from  @tblStudentDetails SD
 Inner Join StudentObservationDetails SOD
 On SD.YearwiseStudentId=SOD.StudentId
 Inner Join ObservationParameters OP
 On OP.Id=SOD.ParameterId
 Inner Join ObservationSkills OS
 On OS.Id=OP.SkillId
 WHERE SOD.AcademicYearId=@Academic_Year_Id
 AND SOD.SchoolId=@School_Id
 AND SOD.IsDeleted=0
 AND Parameter='My Favourite Foods are'
 AND  Name ='All about me' 

 Update SD
   Set Games =SOD.Comment
 from  @tblStudentDetails SD
 Inner Join StudentObservationDetails SOD
 On SD.YearwiseStudentId=SOD.StudentId
 Inner Join ObservationParameters OP
 On OP.Id=SOD.ParameterId
 Inner Join ObservationSkills OS
 On OS.Id=OP.SkillId
 WHERE SOD.AcademicYearId=@Academic_Year_Id
 AND SOD.SchoolId=@School_Id
 AND SOD.IsDeleted=0
 AND Parameter='My Favourite games are'
 AND  Name ='All about me' 

 Update SD
   Set Animals =SOD.Comment
 from  @tblStudentDetails SD
 Inner Join StudentObservationDetails SOD
 On SD.YearwiseStudentId=SOD.StudentId
 Inner Join ObservationParameters OP
 On OP.Id=SOD.ParameterId
 Inner Join ObservationSkills OS
 On OS.Id=OP.SkillId
 WHERE SOD.AcademicYearId=@Academic_Year_Id
 AND SOD.SchoolId=@School_Id
 AND SOD.IsDeleted=0
 AND Parameter='My Favourite animals are'
 AND  Name ='All about me'

 DECLARE @TermId INT,
		 @TermStartDate DATE,
		 @TermEndDate DATE

			IF EXISTS
	(
		SELECT TOP 1 1
		FROM SchoolWise_Test_Master 
		WHERE School_Id = @School_Id
		AND academic_year_id = @Academic_Year_Id
		AND Is_Deleted = 'N'
		AND SchoolWise_Test_Id = @Term_Id
		AND SchoolWise_Test_Name = 'Half Yearly'
	)
	BEGIN		
		SET @TermId = 1
	END
	ELSE
	BEGIN
		SET @TermId = 2
	END

	

	SELECT @TermStartDate = TermStartDate,
		   @TermEndDate = TermEndDate
	FROM StudentTermwiseTestMaster
	WHERE School_Id = @School_Id
	AND Academic_Year_Id = @Academic_Year_Id
	AND Is_Deleted = 0
	AND SchoolwiseTermId = @TermId
	AND StandardId = @Standard_Id

		UPDATE TSD
		SET Term1Height = ISNULL(THWS1.Height,0),
			Term1Weight = ISNULL(THWS1.Weight,0),
			Term2Height = ISNULL(THWS2.Height,0),
			Term2Weight = ISNULL(THWS2.Weight,0)
		FROM @tblStudentDetails TSD
		LEFT JOIN TermwiseStudentHeightWeightDetails THWS1
		ON THWS1.YearwiseStudentId = TSD.YearwiseStudentId
		AND THWS1.SchoolId = @School_Id
		AND THWS1.AcademicYearId = @Academic_Year_Id
		AND THWS1.TermId = 1
		LEFT JOIN TermwiseStudentHeightWeightDetails THWS2
		ON THWS2.YearwiseStudentId = TSD.YearwiseStudentId
		AND THWS2.SchoolId = @School_Id
		AND THWS2.AcademicYearId = @Academic_Year_Id
		AND THWS2.TermId = 2

		Select * from @tblStudentDetails
	
	SELECT  
		YSD.YearWise_Student_Id, 
		SSSM.Sort_Order AS SubjectSortOrder,
		UPPER( SM.Subject_Name )AS Subject_Name,
        OS.SortOrder AS SkillSortOrder, 
        --LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(OS.Name, '  ', ' '), '  ', ' '), '  ', ' '))) AS SkillName,	
		LTRIM(RTRIM(REPLACE(REPLACE(OS.Name, CHAR(13), ' '), CHAR(10), ' ' ))) AS SkillName  ,      
	
        OP.SortOrder AS ParameterSortOrder, 
		LTRIM(RTRIM(REPLACE(REPLACE(OP.Parameter, CHAR(13), ' '), CHAR(10), ' ' ))) AS ParameterName  ,      
		 (OG.Name) AS Grade,
		 (OG.Name) AS TermGrade, 
		
		OP.SkillId,
		SOD.ParameterId,
		STM.Term_Id
	INTO #StudentObservations
	FROM YearWise_Student_Details YSD
	INNER JOIN @tblStudentDetails TSD
		ON YSD.YearWise_Student_Id = TSD.YearWiseStudentId
	INNER JOIN ObservationSkills OS
		ON YSD.Standard_Id = OS.StandardId
	INNER JOIN ObservationParameters OP
		ON OP.SkillId = OS.Id
	INNER JOIN StudentObservationDetails SOD
		ON SOD.StudentId = YSD.YearWise_Student_Id
		AND OP.Id = SOD.ParameterId
	INNER JOIN ObservationGrades OG
		ON SOD.GradeId = OG.Id
	INNER JOIN StandardWiseGradeMaster SGM
		ON OG.Id = SGM.GradeId
	INNER JOIN vw_standard_division VSD
		ON YSD.Standard_Id = VSD.Standard_Id
		AND YSD.Division_id = VSD.Division_Id
	LEFT JOIN ObservationSubmissionStatus OSS
    ON OS.SubjectId = OSS.SubjectId
	AND OSS.IsDeleted = 0
    AND VSD.SchoolWise_Standard_Division_Id = OSS.StdDivId
    AND SOD.TestId = OSS.TestId
   LEFT JOIN SubmitStudentAssessmentDetails SASD
    ON SASD.YearwiseStudentId = YSD.YearWise_Student_Id
    AND SASD.SkillId = OS.Id
    --AND SASD.TestId = @Term_Id
    AND SASD.SchoolId = @School_Id
    AND SASD.AcademicYearId = @Academic_Year_Id
    AND SASD.IsDeleted = 0
	INNER JOIN Subject_Master SM
		ON SM.Subject_Id = OS.SubjectId
	INNER JOIN SchoolWise_Standard_Subject_Master SSSM
		ON SM.Subject_Id = SSSM.Subject_Id
		AND YSD.Standard_Id = SSSM.Standard_Id
	LEFT JOIN SchoolWise_Test_Master STM
    ON SOD.TestId = STM.SchoolWise_Test_Id
    AND SOD.AcademicYearId = STM.academic_year_id
   
	WHERE OS.AcademicYearId = @Academic_Year_Id
		AND OS.SchoolId = @School_Id
		AND OS.StandardId = @Standard_Id
		AND YSD.Is_Deleted = 'N'
		AND OS.IsDeleted = 0
		AND OP.IsDeleted = 0
		AND SOD.IsDeleted = 0
		AND OG.IsDeleted = 0
	    AND( ( NOT EXISTS ( SELECT 1 FROM @tempAssessmentSkillTable T WHERE T.SkillName = OS.Name ) AND OSS.IsSubmitted = 1 )
        OR (EXISTS( SELECT 1 FROM @tempAssessmentSkillTable T WHERE T.SkillName = OS.Name)AND SASD.IsSubmitted = 1 ))
       AND SM.Is_Deleted = 'N' AND SSSM.Is_Deleted = 'N'
       AND(STM.Term_Id IN (1,2)OR EXISTS (SELECT 1  FROM @tempAssessmentSkillTable T WHERE T.SkillName = OS.Name))       
       AND( STM.Is_Deleted = 'N' OR EXISTS ( SELECT 1 FROM @tempAssessmentSkillTable T WHERE T.SkillName = OS.Name ))	  
	   AND SGM.IsDeleted = 0
	   AND SGM.StandardId = @Standard_Id	
	   AND OS.Name NOT IN ('Self Assessment','Peer Feedback','Parent Feedback')	   
	OPTION (RECOMPILE);

	CREATE CLUSTERED INDEX IX_StudentObservations
		ON #StudentObservations (YearWise_Student_Id, SkillId, ParameterId, Term_Id);

	SELECT SO1.YearWise_Student_Id,
		  SO1.SubjectSortOrder,
		  SO1.Subject_Name,
          SO1.SkillSortOrder, 
		  --SO1.SkillName, 
		  REPLACE(REPLACE(SO1.SkillName, CHAR(13), ' '), CHAR(10), ' ') as SkillName,
		  SO1.ParameterSortOrder, 
		  --SO1.ParameterName, 
		  REPLACE(REPLACE(SO1.ParameterName, CHAR(13), ''), CHAR(10), '') as ParameterName,
		  SO1.TermGrade AS Term1Grade,
		  ISNULL(SO2.TermGrade, '-') AS Term2Grade,
		CASE
			WHEN A.Id = 2 THEN 2
			WHEN A.Id = 1 THEN 3
			WHEN A.Id = 3 THEN 4
			ELSE 1
		END AS HeaderSortOrder,

		CASE
			WHEN A.Id = 2 THEN 'Parents Feedback'
			WHEN A.Id = 1 THEN 'Self Assessment'
			WHEN A.Id = 3 THEN 'Peer Assessment'
			ELSE ''
		END AS HeaderSortOrderName,
		CASE
			WHEN SO1.SkillName = 'Self Assessment' THEN 'Self reflection on inter-disciplinary activity done by the child. Example: Clay work, drawing, playing a game, colouring, puppet-making, model making, etc.' 
			ELSE '' END AS HeaderNote
	FROM #StudentObservations SO1
	LEFT JOIN #StudentObservations SO2
		ON SO1.YearWise_Student_Id = SO2.YearWise_Student_Id
		AND SO1.SkillId = SO2.SkillId
		AND SO1.ParameterId = SO2.ParameterId
		AND SO2.Term_Id = 2
		LEFT JOIN @tempAssessmentSkillTable A
    ON A.SkillName = SO1.SkillName
	WHERE SO1.Term_Id = 1;
END