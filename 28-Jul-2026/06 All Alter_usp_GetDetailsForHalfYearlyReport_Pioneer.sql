/****** Object:  StoredProcedure [dbo].[usp_GetDetailsForHalfYearlyReport_Pioneer]    Script Date: 11-07-2026 11:23:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetDetailsForHalfYearlyReport_Pioneer] 
	@School_Id				INT,  
	@Academic_Year_Id		INT,  
	@StudentId				INT = NULL,  
	@Standard_Id			INT,  
	@Division_Id			INT,
	@Term_Id				INT,
	@IsFromReportScreen     INT
AS
BEGIN
	IF @StudentId IS NULL  
    SET @StudentId = 0  
   
	DECLARE @TermId INT  
		 
	DECLARE @FinalTerm INT  
	 	 IF(@Term_Id IS NULL)  
		 BEGIN
			SET @Term_Id = 2
		 END
	 	
	DECLARE @AcademicYear	NVARCHAR(15),  
			@Standard_Name  NVARCHAR(15),
			@TermEndDate	SMALLDATETIME,
			@TermStartDate	SMALLDATETIME,  
			@Division_Name  NVARCHAR(15),
			@YearStartDate DATETIME,
			@YearEndDate DATETIME  
  
	DECLARE @StdStartDate DATETIME, 
		    @StdEndDate   DATETIME  
	 SELECT @StdStartDate = StartDate, 
	        @StdEndDate = EndDate  
	   FROM Standardwise_Academic_Year  
	  WHERE Is_Deleted = 0   
	    AND School_Id = @School_Id   
        AND Academic_Year_ID = @Academic_Year_Id  
		AND Standardwise_Academic_Year.StandardId=@Standard_Id  

	SELECT @AcademicYear=CAST(datepart(year,Start_date) AS VARCHAR) + '-' + CAST(datepart(year,Start_date) + 1 AS VARCHAR)   
	  FROM SchoolWise_Academic_Year_Master  
	 WHERE Is_Deleted = 'N'   
	   AND School_Id = @School_Id  
	   AND Academic_Year_ID = @Academic_Year_Id  

		IF @StdStartDate IS NULL  
			SELECT @YearStartDate = Start_date,
				   @YearEndDate = End_Date  
			  FROM SchoolWise_Academic_Year_Master  
		     WHERE Is_Deleted = 'N'   
			   AND School_Id = @School_Id  
		       AND Academic_Year_ID = @Academic_Year_Id  
		ELSE     
			SELECT @YearStartDate = StartDate,
			       @YearEndDate = EndDate  
			  FROM Standardwise_Academic_Year  
		     WHERE Is_Deleted = 0   
			   AND School_Id = @School_Id  
			   AND Academic_Year_ID = @Academic_Year_Id  
			   AND StandardId=@Standard_Id  
  
		SELECT @Standard_Name = Standard_Master.Standard_Name,  
			   @Division_Name = CASE WHEN SchoolWise_Standard_Division_Master.DisplayNameForDivision IS NOT NULL OR SchoolWise_Standard_Division_Master.DisplayNameForDivision <> ''  
									 THEN SchoolWise_Standard_Division_Master.DisplayNameForDivision  
									 ELSE Division_Master.Division_Name  
									 END  
		  FROM SchoolWise_Standard_Division_Master   
					INNER JOIN Standard_Master   
						ON SchoolWise_Standard_Division_Master.Standard_Id = Standard_Master.Standard_Id   
					INNER JOIN Division_Master   
						ON SchoolWise_Standard_Division_Master.Division_Id = Division_Master.Division_Id  
		 WHERE SchoolWise_Standard_Division_Master.SchoolWise_Standard_Division_Id = @Division_Id    

		 DECLARE @ClassTeacherName NVARCHAR(100) = '',
				 @PrincipalName NVARCHAR(100) = ''

		 select @ClassTeacherName = BTD.TeacherName
		 from SchoolWise_Standard_Division_Teacher_Assignment_Master SSDTAM
		 INNER JOIN vw_BaseTeacherDetails BTD
		 ON SSDTAM.Teacher_Id = BTD.Teacher_Id
		 AND SSDTAM.Academic_Year_Id = BTD.academic_year_id
		 INNER JOIN vw_standard_division VSD
		 ON SSDTAM.Standard_Id = VSD.Standard_Id
		 AND SSDTAM.Division_Id = VSD.Division_Id
		 WHERE SSDTAM.School_Id = @School_Id
		 AND SSDTAM.Academic_Year_Id = @Academic_Year_Id
		 AND SSDTAM.Is_Deleted = 'N'
		 AND BTD.Is_Deleted = 'N'
		 AND VSD.Standard_Id = @Standard_Id
		 AND VSD.SchoolWise_Standard_Division_Id = @Division_Id
		 AND SSDTAM.Is_ClassTeacher = 'Y'

		 SELECT @PrincipalName = TeacherName
		 FROM vw_BaseTeacherDetails
		 WHERE School_Id = @School_Id
		 AND academic_year_id = @Academic_Year_Id
		 AND Is_Deleted = 'N'
		 AND Designation_Id = 10 --PRINCIPAL

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  

		-- Get assigned remarks to the students.  
		CREATE TABLE #tblStudentRemarksInfo   
		(  
			Student_Id				INT,  
			Remark					NVARCHAR(2000),  
			Studentwise_Remark_Id	INT			
		)  
   
		INSERT INTO #tblStudentRemarksInfo  
		SELECT YearwiseStudentId, RemarkDetails, StudentRemarkId
		FROM StudentwiseRemarkConfigDetails SRCD
		INNER JOIN TermWiseRemarksDetails TRD
		ON SRCD.TermwiseRemarkDetailId = TRD.TermWiseRemarksDetailsId
		AND SRCD.AcademicYearId = TRD.Academic_Year_Id
		WHERE SRCD.SchoolId = @School_Id
		AND SRCD.AcademicYearId = @Academic_Year_Id
		AND SRCD.IsDeleted = 'N'
		AND TRD.Is_Deleted = 'N'
		AND TRD.Term_Id = @Term_Id
		AND (SRCD.YearwiseStudentId = @StudentId OR @StudentId = 0 OR @StudentId IS NULL)

		CREATE TABLE #tblRemarkDetail   
		(  
			RemarkId	INT,  
			TermId		INT,  
			StudentId	INT,  
			Remark		NVARCHAR(3000)  
		)  

		INSERT INTO #tblRemarkDetail  
			 SELECT StudentRemarksInfo.Studentwise_Remark_Id,  			
					@Term_Id,
				    YearWise_Student_Details.Student_Id,  
				    Remark  
		       FROM YearWise_Student_Details   
						INNER JOIN SchoolWise_Standard_Division_Master  
							ON YearWise_Student_Details.Standard_Id=SchoolWise_Standard_Division_Master.Standard_Id   
						   AND YearWise_Student_Details.Division_id=SchoolWise_Standard_Division_Master.Division_Id   
						LEFT OUTER JOIN #tblStudentRemarksInfo StudentRemarksInfo  
							ON YearWise_Student_Details.YearWise_Student_Id =StudentRemarksInfo.Student_Id   
		      WHERE SchoolWise_Standard_Division_Master.SchoolWise_Standard_Division_Id = @Division_Id    
			    AND YearWise_Student_Details.Standard_Id=@Standard_Id   
			    AND YearWise_Student_Details.Is_Deleted='N'  
			    AND SchoolWise_Standard_Division_Master.academic_year_id=@Academic_Year_Id   
			    AND SchoolWise_Standard_Division_Master.School_Id=@School_Id  
				and (YearWise_Student_Details.YearWise_Student_Id = @StudentId or @StudentId  = 0 or @StudentId is null)
		   ORDER BY YearWise_Student_Details.Student_Id  

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
		SELECT @TermStartDate = StudentTermwiseTestMaster.TermStartDate,  
			   @TermEndDate = StudentTermwiseTestMaster.TermEndDate  
		  FROM StudentTermwiseTestMaster   
		 WHERE StudentTermwiseTestMaster.SchoolwiseTermId = @Term_Id  
		   AND StandardId=@Standard_Id  
		   AND Is_Deleted=0  
   
		IF(@TermStartDate ='1900-01-01 00:00:00' OR @TermStartDate IS NULL)  
			SET @TermStartDate = @YearStartDate  
		IF(@TermEndDate ='1900-01-01 00:00:00' OR @TermEndDate IS NULL)  
			SET @TermEndDate = @YearEndDate  
  
		DECLARE @IsPublished BIT=0

		IF EXISTS 
		(
			select TOP 1 1
			from SchoolWise_StanderedDivision_Test_Master SSTM
			INNER JOIN SchoolWise_Test_Master STM
			on sstm.SchoolWise_Test_Id = stm.SchoolWise_Test_Id
			WHERE SSTM.School_id = @School_Id
			and SSTM.Academic_Year_ID = @Academic_Year_Id
			and SSTM.Is_Deleted = 'N'
			and STM.Is_Deleted = 'N'
			and Standerd_division_Id = @Division_Id
			and Is_Published = 'Y'
			and STM.Term_Id = 1
			and IsFinalExam = 1
		)
		BEGIN
			 SET @IsPublished = 1
		END
		
		CREATE TABLE #StudentDetails   
		(  
			Student_Id				INT,  
			Roll_Num				INT,  
			StudentName				NVARCHAR(100),
			MotherName				NVARCHAR(100),
			FatherName				NVARCHAR(100),
			GRNo					NVARCHAR(30),
			StudentPromotionName	NVARCHAR(100),  
			DOB						DATETIME,  
			Attendace				INT,  
			Total					INT,
			Enrolment_Number		NVARCHAR(50),  
			Remarks					NVARCHAR(3000),  
			Height					FLOAT,  
			Weight					FLOAT  
		)  

   
		INSERT INTO #StudentDetails  
		     SELECT SchoolWise_Student_Master.SchoolWise_Student_Id,  
			        YearWise_Student_Details.Roll_No,   
			        dbo.SchoolWise_Student_Master.First_Name 
						+ CASE WHEN SchoolWise_Student_Master.Middle_Name IS NULL OR SchoolWise_Student_Master.Middle_Name = '' 
						       THEN ' ' ELSE ' ' + SchoolWise_Student_Master.Middle_Name 
							   END 
						+ CASE WHEN SchoolWise_Student_Master.Last_Name IS NULL OR SchoolWise_Student_Master.Last_Name = '' 
						       THEN '' ELSE ' ' + SchoolWise_Student_Master.Last_Name 
							   END AS StudentName, 
					dbo.SchoolWise_Student_Master.Mother_Name AS MotherName,
					dbo.SchoolWise_Student_Master.Parent_Name AS FatherName,  
					dbo.SchoolWise_Student_Master.Enrolment_Number,
					dbo.SchoolWise_Student_Master.First_Name + CASE WHEN SchoolWise_Student_Master.Last_Name IS NULL OR  
					SchoolWise_Student_Master.Last_Name = '' THEN '' ELSE ' ' + SchoolWise_Student_Master.Last_Name END AS StudentPromotionName,            
					CONVERT(SMALLDATETIME,vw_BaseStudentDetails.DOB),  
					COUNT(CASE WHEN Is_Present = 'true' THEN 1 END) AS Present,   
					COUNT(vw_AttendanceMaster.Is_Present) AS Total,  		
					SchoolWise_Student_Master.Enrolment_Number,
					'',
					ISNULL(TSHWD.Height,0),  
					ISNULL(TSHWD.Weight,0)  
		       FROM 
			   vw_AttendanceMaster   
						INNER JOIN 
						YearWise_Student_Details   
							ON YearWise_Student_Details.YearWise_Student_Id = vw_AttendanceMaster.Student_Id    
						   AND vw_AttendanceMaster.School_Id = @School_Id  
						   AND YearWise_Student_Details.School_Id = @School_Id   
						   AND YearWise_Student_Details.Academic_Year_ID = @Academic_Year_Id  
						   AND YearWise_Student_Details.Standard_Id = @Standard_Id  
						   AND vw_AttendanceMaster.Academic_Year_Id = @Academic_Year_Id  						  
						   AND YearWise_Student_Details.Is_Deleted = 'N'  
						LEFT OUTER JOIN TermwiseStudentHeightWeightDetails TSHWD
							ON YearWise_Student_Details.Yearwise_Student_Id = TSHWD.YearwiseStudentId
						   AND TSHWD.TermId = 1
						INNER JOIN SchoolWise_Standard_Division_Master 
							ON SchoolWise_Standard_Division_Master.Standard_Id = YearWise_Student_Details.Standard_Id  
						   AND SchoolWise_Standard_Division_Master.Division_Id=YearWise_Student_Details.Division_id  
						   AND SchoolWise_Standard_Division_Master.SchoolWise_Standard_Division_Id=@Division_Id  
						   AND SchoolWise_Standard_Division_Master.academic_year_id = @Academic_Year_Id  
						   AND SchoolWise_Standard_Division_Master.School_Id = @School_Id  
						INNER JOIN SchoolWise_Student_Master   
							ON SchoolWise_Student_Master.SchoolWise_Student_Id=YearWise_Student_Details.Student_Id   
						   AND SchoolWise_Student_Master.School_Id = @School_Id  
						   AND SchoolWise_Student_Master.Is_Deleted='N'  
						INNER JOIN vw_BaseStudentDetails   
							ON vw_BaseStudentDetails.SchoolWise_Student_Id = SchoolWise_Student_Master.SchoolWise_Student_Id  
						   AND vw_BaseStudentDetails.School_Id = @School_Id  
						INNER JOIN dbo.Salutation_Master  
							ON dbo.SchoolWise_Student_Master.Salutation_Id = dbo.Salutation_Master.Salutation_Id  
			  WHERE YearWise_Student_Details.YearWise_Student_Id IN   
																	(  
																		SELECT DISTINCT CASE WHEN @StudentId = 0   
																			                 THEN YearWise_Student_Details.YearWise_Student_Id   
																							 ELSE @StudentId   
																							 END  
																		  FROM YearWise_Student_Details  
																		 WHERE YearWise_Student_Details.Academic_Year_ID = @Academic_Year_Id   
																	)  
		   GROUP BY SchoolWise_Student_Master.SchoolWise_Student_Id,  
				    YearWise_Student_Details.Roll_No,  
					dbo.Salutation_Master.Salutation_Name,  
					SchoolWise_Student_Master.First_Name, 
					SchoolWise_Student_Master.Parent_Name, 
					SchoolWise_Student_Master.Middle_Name,  
					SchoolWise_Student_Master.Last_Name,  
					SchoolWise_Student_Master.Mother_Name,
					vw_BaseStudentDetails.DOB,  
					SchoolWise_Student_Master.Enrolment_Number,  
					TSHWD.Height,  
					TSHWD.Weight  
					 
------------------------------------------------------------------------------------------------------------------------------------------------------------  

	--These tables are used to get subject and student details(Marks)    
	CREATE TABLE #tblSubjectDetails   
		(
			Subject_Name				NVARCHAR(50),  
			Subject_Id					INT,  
			Parent_Subject_Id			INT,  
			Sort_Order					INT,  
			Student_Id					INT,  
			Subject_Marks				INT,  
			PassingMarks				INT,  
			PassindGrade				INT,  
			GradeName					NVARCHAR(15),  
			Schoolwise_Test_Id			INT,  
			GradeOrMarks				NVARCHAR(15), 
			SchoolWise_Test_Name		NVARCHAR(50),  
			Total_Marks_Scored			DECIMAL(4,1), 
			Is_Absent					CHAR(1),
			Total_Consideration			CHAR(1),  
			Yearwise_Student_Id			INT,  
			Term_Id						INT  
		)  
   

		-- If term 1 or term 2 report then get details for all students. But if it is final report then get student details for which final result is generated.  

		INSERT INTO #tblSubjectDetails  
					 SELECT DISTINCT SM.Subject_Name,  
							SM.Subject_Id,   
							CONVERT(INT, '0') AS Parent_Subject_Id,  
							SSSM.Sort_Order,  
							SSM.SchoolWise_Student_Id,  
							CASE WHEN STSMM.OutOfMarks <> 0 AND STSMM.OutOfMarks <> STSMM.Subject_Total_Marks  
								 THEN STSMM.OutOfMarks  
								 WHEN SchoolWise_Test_Subject_Marks_Details.TestTypeOutOfMarks <> 0  
								 THEN SchoolWise_Test_Subject_Marks_Details.TestTypeOutOfMarks  
								 ELSE STSMM.Subject_Total_Marks  
							     END Subject_Total_Marks,  
							STSMM.Passing_Total_Marks,  
							STSMM.Passing_Grade_Id,'' AS GradeName,  
							STSMM.SchoolWise_Test_Id,  
							STSMM.Grade_Or_Marks,  
							STM.SchoolWise_Test_Name,  
							SSTM.Total_Marks_Scored,  
							SSTM.Is_Absent,  
							Schoolwise_Division_Subject_Master.Total_Consideration,  
							YSD.YearWise_Student_Id,  
							STM.Term_Id  
					   FROM SchoolWise_Test_Subject_Marks_Master AS STSMM  
								INNER JOIN SchoolWise_Test_Master AS STM   
										ON STSMM.SchoolWise_Test_Id=STM.SchoolWise_Test_Id  
									   AND STSMM.School_Id = @School_Id  
									   AND STSMM.Academic_Year_Id = @Academic_Year_Id  
									   AND STSMM.Standard_Division_Id = @Division_Id  
									   AND STSMM.Is_Deleted = 'N'  
								INNER JOIN Schoolwise_Division_Subject_Master  
										ON Schoolwise_Division_Subject_Master.Standard_Division_Id = STSMM.Standard_Division_Id  
									   AND STSMM.Subject_Id = Schoolwise_Division_Subject_Master.Subject_Id  
									   AND STSMM.Academic_Year_Id = @Academic_Year_Id  
									   AND STSMM.School_Id = @School_Id  
								INNER JOIN Subject_Master AS SM 
										ON STSMM.Subject_Id=SM.Subject_Id   
									   AND SM.academic_Year_Id = @Academic_Year_Id  
									   AND SM.School_Id = @School_Id  
								INNER JOIN SchoolWise_Standard_Subject_Master AS SSSM  
										ON SSSM.Subject_Id = SM.Subject_Id   
									   AND SSSM.academic_year_id = @Academic_Year_Id  
									   AND SSSM.School_Id = @School_Id  
									   AND SSSM.Standard_Id=@Standard_Id   
								INNER JOIN SchoolWise_Student_Test_Marks AS SSTM  
										ON SSTM.TestWise_Subject_Marks_Id = STSMM.TestWise_Subject_Marks_Id  
									   AND SSTM.Is_Deleted = 'N'  
									   AND SSTM.Academic_Year_Id = @Academic_Year_Id  
									   AND SSTM.School_Id = @School_Id  
								INNER JOIN YearWise_Student_Details AS YSD  
										ON YSD.YearWise_Student_Id = SSTM.Student_Id   
								INNER JOIN SchoolWise_Student_Master AS SSM  
										ON SSM.SchoolWise_Student_Id=YSD.Student_Id   
								LEFT OUTER JOIN StudentWiseTestPublishStatus STPS   
										ON STPS.SchoolWise_Test_Id = STSMM.SchoolWise_Test_Id  
									   AND STPS.StudentId = YSD.YearWise_Student_Id  
									   AND STPS.Standard_division_Id = STSMM.Standard_Division_Id  
									   AND STPS.Is_Deleted = 'N'  
								LEFT OUTER JOIN (  
													SELECT TestWise_Subject_Marks_Id,  
														   SUM(OutOfMarks) AS TestTypeOutOfMarks  
													  FROM SchoolWise_Test_Subject_Marks_Details  
												  GROUP BY TestWise_Subject_Marks_Id  
												) AS SchoolWise_Test_Subject_Marks_Details  
										ON STSMM.TestWise_Subject_Marks_Id = SchoolWise_Test_Subject_Marks_Details.TestWise_Subject_Marks_Id  
				      WHERE STSMM.Standard_Division_Id = @Division_Id   
					    AND YSD.YearWise_Student_Id IN   
														(  
															SELECT DISTINCT CASE WHEN @StudentId = 0   
																				 THEN YearWise_Student_Details.YearWise_Student_Id   
																				 ELSE @StudentId   
																				 END  
															FROM YearWise_Student_Details  
															WHERE YearWise_Student_Details.Academic_Year_ID=@Academic_Year_Id  
														)  
					    AND Schoolwise_Division_Subject_Master.Is_Deleted = 'N'   
					    AND (STSMM.Is_Submitted='Y' OR STPS.Is_Published = 'Y')  
					    AND SM.Is_CoCurricularActivity = 0  
					    AND Schoolwise_Division_Subject_Master.Total_Consideration = 'Y'  
						and Term_Id = @Term_Id
		
	DECLARE @Term_Name NVARCHAR(50)  
	 SELECT @Term_Name = CASE WHEN TermName = 'Term-I' THEN 'Term-1 (100 Marks)'  
		                      WHEN TermName = 'Term-II' THEN 'Term-2'  
							  END  
	   FROM SchoolwiseTermMaster  
	  WHERE SchoolId=@School_Id  
		AND Is_Deleted=0   
		AND SchoolwiseTermId=@Term_Id  
    
	IF @Term_Name IS NULL  
		SET @Term_Name = 'FINAL TERM'  

	CREATE TABLE #tblTotalSubjectGrade   
		(  
			Subject_Id					INT,  
			StudentId					INT,  
			Subject_Name				NVARCHAR(50),  
			StudentTotalMarksScored		DECIMAL(5,1),  
			TotalExamMarks				INT,  
			TotalPercentageMarks		FLOAT,  
			Sort_Order					INT,  
			FinalTerm					BIT,
			TermId						INT  
		)  

		-- Insert term 1 or term 2 report's subject total.  
	INSERT INTO #tblTotalSubjectGrade  
		 SELECT tblSubjectDetails.Subject_Id,
				tblSubjectDetails.Student_Id,
				tblSubjectDetails.Subject_Name,  
				SUM(tblSubjectDetails.Total_Marks_Scored),SUM(tblSubjectDetails.Subject_Marks),  
				CASE WHEN CONVERT(FLOAT,SUM(tblSubjectDetails.Subject_Marks)) = 0 
					 THEN 0  
					 ELSE ROUND((CONVERT(FLOAT,SUM(tblSubjectDetails.Total_Marks_Scored)) / CONVERT(FLOAT,SUM(tblSubjectDetails.Subject_Marks)))*100,2)   
					 END AS Percentage,  
				tblSubjectDetails.Sort_Order,  
				0,
				tblSubjectDetails.Term_Id  
		   FROM #tblSubjectDetails tblSubjectDetails   
		  WHERE tblSubjectDetails.GradeOrMarks='M' 
		    AND tblSubjectDetails.Total_Consideration='Y'   
			AND (Is_Absent IN 
							(
								SELECT ShortName 
								  FROM Schoolwise_Exam_Status 
								 WHERE IsDeleted = 0 
								   AND ConsiderInTotal = 'Y'
								   AND SchoolId = @School_Id
								   AND AcademicYearId = @Academic_Year_Id
							) 
							OR Is_Absent = 'N')  
		--AND (tblSubjectDetails.Term_Id = @Term_Id OR tblSubjectDetails.Term_Id = @FinalTerm)  
	   GROUP BY tblSubjectDetails.Term_Id,
		        tblSubjectDetails.Subject_Id,
				tblSubjectDetails.Subject_Name,
				tblSubjectDetails.Student_Id,
				tblSubjectDetails.Sort_Order  

		-- Insert default entries for term 1 and term 2 report's subject total in case if student is on Leave or Medical Leave for every test.  
	INSERT INTO #tblTotalSubjectGrade  
		 SELECT DISTINCT SubjectDetails.Subject_Id, 
				SubjectDetails.Student_Id,
				SubjectDetails.Subject_Name,
				0,
				0,
				0,
				SubjectDetails.Sort_Order,
				0,
				Term_Id 
		   FROM (
					SELECT AllRecords.Student_Id,
					       AllRecords.Subject_Id,
						   AllRecords.Subject_Name, 
						   AllRecords.Sort_Order, 
						   PresentRecords.id PresentRecordsId, 
						   Term_Id   
					  FROM (  
							  SELECT Yearwise_Student_Id, 
									 Student_Id, Subject_Id, 
									 Subject_Name, 
									 Sort_Order, 
									 ROW_NUMBER() OVER(ORDER BY Yearwise_Student_Id,Subject_Id) AS id, 
									 Term_Id 
							    FROM #tblSubjectDetails  
						   ) AS AllRecords  
								LEFT OUTER JOIN (SELECT StudentId, 
														Subject_Id, 
														ROW_NUMBER() OVER(order by StudentId,Subject_Id) AS id 
												   FROM #tblTotalSubjectGrade 
												  WHERE FinalTerm = 0) AS PresentRecords  
									ON AllRecords.Subject_Id = PresentRecords.Subject_Id  
							       AND AllRecords.Student_Id = PresentRecords.StudentId  
		           ) AS SubjectDetails  
		  WHERE SubjectDetails.PresentRecordsId IS NULL  
  
	CREATE TABLE #tblTotalTestGrade   
		(  
			StudentId					INT,  
			SchoolWise_Test_Id			INT,  
			Test_Name					NVARCHAR(50),  
			StudentTotalMarksScored		DECIMAL(5,1),  
			TotalExamMarks				INT,  
			TotalPercentageMarks		FLOAT  
		)  
  
	INSERT INTO #tblTotalTestGrade  
		 SELECT tblSubjectDetails.Student_Id, 
		        tblSubjectDetails.Schoolwise_Test_Id,
				tblSubjectDetails.SchoolWise_Test_Name,
				SUM(tblSubjectDetails.Total_Marks_Scored),
				SUM(tblSubjectDetails.Subject_Marks),   
		        CASE WHEN CONVERT(FLOAT,SUM(tblSubjectDetails.Subject_Marks)) = 0 
				     THEN 0  
					 ELSE ROUND((CONVERT(FLOAT,SUM(tblSubjectDetails.Total_Marks_Scored)) / CONVERT(FLOAT,SUM(tblSubjectDetails.Subject_Marks)))*100,2)   
					 END AS Percentage  
		   FROM #tblSubjectDetails AS tblSubjectDetails   
		  WHERE tblSubjectDetails.GradeOrMarks='M' AND tblSubjectDetails.Total_Consideration='Y'   
		    AND (tblSubjectDetails.Is_Absent IN 
												(
													SELECT ShortName	
													  FROM Schoolwise_Exam_Status 
													 WHERE IsDeleted = 0 
													   AND ConsiderInTotal = 'Y'
													   AND SchoolId = @School_Id
													   AND AcademicYearId = @Academic_Year_Id
												) 
												OR tblSubjectDetails.Is_Absent = 'N')  
	   GROUP BY tblSubjectDetails.Student_Id, 
	            tblSubjectDetails.SchoolWise_Test_Id,
				tblSubjectDetails.SchoolWise_Test_Name  
  
	-- Insert default entries for term 1 and term 2 report's test total in case if student is on Leave or Medical Leave for all subjects.  
	INSERT INTO #tblTotalTestGrade  
	     SELECT DISTINCT S.Student_Id,
		        S.Schoolwise_Test_Id,
				S.SchoolWise_Test_Name,
				0, 
				0,
				0
		   FROM (SELECT AllRecords.Student_Id,
						AllRecords.Schoolwise_Test_Id,
						AllRecords.SchoolWise_Test_Name, 
						PresentRecords.id AS PresentRecordsId   
				   FROM (  
							SELECT Student_Id, 
							       Schoolwise_Test_Id, 
								   SchoolWise_Test_Name, 
								   ROW_NUMBER() OVER(order by Yearwise_Student_Id,Schoolwise_Test_Id) AS id   
							  FROM #tblSubjectDetails  
						) AS AllRecords  
						LEFT OUTER JOIN (
											SELECT StudentId, 
												   SchoolWise_Test_Id, 
												   ROW_NUMBER() OVER(ORDER BY StudentId,Schoolwise_Test_Id) AS id 
											  FROM #tblTotalTestGrade
										) AS PresentRecords  
							ON AllRecords.Schoolwise_Test_Id = PresentRecords.SchoolWise_Test_Id  
						   AND AllRecords.Student_Id = PresentRecords.StudentId  
			    ) AS S  
	      WHERE S.PresentRecordsId IS NULL  
  
	-- Ths table is used to get Grand Total(Testwise + Subjectwise)  
	CREATE TABLE #tblStudentGrandTotal   
		(  
			StudentId					INT,  
			StudentTotalMarksScored		DECIMAL(5,1),  
			TotalExamMarks				INT,  
			TotalPercentageMarks		FLOAT,  
			FinalTerm					BIT,
			TermId						INT
		)  
   
	INSERT INTO #tblStudentGrandTotal  
		 SELECT tblSubjectDetails.Student_Id ,  
			    SUM(tblSubjectDetails.Total_Marks_Scored),
				SUM(tblSubjectDetails.Subject_Marks),  
				CASE WHEN CONVERT(FLOAT,SUM(tblSubjectDetails.Subject_Marks)) = 0 
					 THEN 0  
					 ELSE ROUND((CONVERT(FLOAT,SUM(tblSubjectDetails.Total_Marks_Scored)) / CONVERT(FLOAT,SUM(tblSubjectDetails.Subject_Marks)))*100,2)   
					 END AS Percentage,  
				0,
				tblSubjectDetails.Term_Id  
		   FROM #tblSubjectDetails AS tblSubjectDetails  
		  WHERE tblSubjectDetails.GradeOrMarks='M' 
		    AND tblSubjectDetails.Total_Consideration='Y'    
		    AND (tblSubjectDetails.Is_Absent IN (
													SELECT ShortName 
													  FROM Schoolwise_Exam_Status 
													 WHERE IsDeleted = 0 
													   AND ConsiderInTotal = 'Y'
													   AND SchoolId = @School_Id
													   AND AcademicYearId = @Academic_Year_Id			
												) 
												OR tblSubjectDetails.Is_Absent = 'N')  
		--AND (tblSubjectDetails.Term_Id = @Term_Id OR tblSubjectDetails.Term_Id = @FinalTerm)  
	   GROUP BY tblSubjectDetails.Term_Id, 
	            tblSubjectDetails.Student_Id  

		-- Insert default entries for term 1 or trem 2 report's grand total in case if student is on Leave or Medical Leave for every test.  
		INSERT INTO #tblStudentGrandTotal  
		     SELECT tblSubjectDetails.Student_Id ,  
			        0,0,0,0,
					tblSubjectDetails.Term_Id
		       FROM #tblSubjectDetails AS tblSubjectDetails  
			  WHERE Student_Id NOT IN (SELECT StudentId FROM #tblStudentGrandTotal WHERE FinalTerm = 0)  
   
		-- To insert grand total for the final report.  
		INSERT INTO #tblStudentGrandTotal  
		     SELECT tblSubjectDetails.Student_Id ,  
			        SUM(tblSubjectDetails.Total_Marks_Scored),
					SUM(tblSubjectDetails.Subject_Marks),  
					CASE WHEN CONVERT(FLOAT,SUM(tblSubjectDetails.Subject_Marks)) = 0 
						 THEN 0  
						 ELSE ROUND((CONVERT(FLOAT,SUM(tblSubjectDetails.Total_Marks_Scored)) / CONVERT(FLOAT,SUM(tblSubjectDetails.Subject_Marks)))*100,2)   
						 END AS Percentage,  
					1,
					0 
			   FROM #tblSubjectDetails AS tblSubjectDetails  
		      WHERE tblSubjectDetails.GradeOrMarks = 'M' 
				AND tblSubjectDetails.Total_Consideration = 'Y'    
			    AND (tblSubjectDetails.Is_Absent IN	
													(
														SELECT ShortName 
														  FROM Schoolwise_Exam_Status 
														 WHERE IsDeleted = 0 
														   AND ConsiderInTotal = 'Y'
														   AND SchoolId = @School_Id
														   AND AcademicYearId = @Academic_Year_Id
													)
													OR tblSubjectDetails.Is_Absent = 'N')  
		GROUP BY tblSubjectDetails.Student_Id 
   
		-- Insert default entries for final report's grand total in case if student is on Leave or Medical Leave for every test.  
		INSERT INTO #tblStudentGrandTotal  
		     SELECT tblSubjectDetails.Student_Id ,  
			        0,0,0,1  , tblSubjectDetails.Term_Id  
		       FROM #tblSubjectDetails tblSubjectDetails  
		      WHERE Student_Id NOT IN (SELECT StudentId FROM #tblStudentGrandTotal WHERE FinalTerm = 1)  

-------------------------------------------------------------------------------------------------------------------------------------------------------  

	--This table is used to get the subjects of grades with assigned grades.  
	CREATE TABLE #tblAssignedGradeDetails   
		(     
			Test_Id				INT,  
			Subject_Id			INT,  
			Student_Id			INT,  
			AssignedGradeId		INT,  
			AssignedGrade		NVARCHAR(15)  
		)  
  
	INSERT INTO #tblAssignedGradeDetails  
		 SELECT tblSubjectDetails.SchoolWise_Test_Id,tblSubjectDetails.Subject_Id,  
				tblSubjectDetails.Student_Id,  
				MGCD.Marks_Grades_Configuration_Detail_ID,  
				MGCD.Grade_Name  
		   FROM #tblSubjectDetails AS tblSubjectDetails   
					INNER JOIN SchoolWise_Test_Subject_Marks_Master AS STSMM
						ON tblSubjectDetails.SchoolWise_Test_Id = STSMM.SchoolWise_Test_Id  
					   AND STSMM.Subject_Id = tblSubjectDetails.Subject_Id  
					INNER JOIN SchoolWise_Student_Test_Marks AS SSTM
						ON SSTM.TestWise_Subject_Marks_Id = STSMM.TestWise_Subject_Marks_Id  
					INNER JOIN SchoolWise_Student_Test_Marks_Detail AS SSTMD
						ON SSTMD.SchoolWise_Student_Test_Marks_Id = SSTM.SchoolWise_Student_Test_Marks_Id  
					LEFT OUTER JOIN Marks_Grades_Configuration_Details AS MGCD 
						ON SSTMD.Assigned_Grade_Id = MGCD.Marks_Grades_Configuration_Detail_ID  
		  WHERE SSTM.Student_Id=tblSubjectDetails.Yearwise_Student_Id   
			AND STSMM.Academic_Year_Id = @Academic_Year_Id 
			AND STSMM.School_Id = @School_Id  
			AND STSMM.Is_Deleted = 'N'
			AND SSTM.Academic_Year_Id = @Academic_Year_Id 
			AND SSTM.School_Id = @School_Id 
			AND SSTM.Is_Deleted ='N'
			AND SSTMD.Is_Deleted ='N'
			AND tblSubjectDetails.GradeOrMarks = 'G'   
       GROUP BY tblSubjectDetails.SchoolWise_Test_Id,
				tblSubjectDetails.Subject_Id,
				tblSubjectDetails.Is_Absent,  
				tblSubjectDetails.Student_Id,
				MGCD.Marks_Grades_Configuration_Detail_ID,
				MGCD.Grade_Name  

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  

	-- Get the attendance of student.  
	DECLARE @Percentage AS TABLE  
		(   
			Student_Id		INT,  
			Percentage		FLOAT  
		)  
		INSERT INTO @Percentage  
		     SELECT tblAttendance.Student_Id,
				    ROUND(CONVERT(FLOAT,tblAttendance.Attendace)/CONVERT(FLOAT,tblAttendance.Total)* 100,2) AS Percentage   
			   FROM #StudentDetails AS tblAttendance  

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  

	-- Get all details of subjects with marks.  
	CREATE TABLE #tblStudentMarksDetails   
		(  
			Student_Id				INT,  
			Roll_Num				INT,  
			Standard_Name			NVARCHAR(15),  
			Division_Name			NVARCHAR(15),   
			StudentName				NVARCHAR(100),
			MotherName				NVARCHAR(100),
			FatherName				NVARCHAR(100),
			GRNo					NVARCHAR(30),
			StudentPromotionName	NVARCHAR(100),  
			Remark					NVARCHAR(3000),   
			DOB						DATETIME,  
			Enrolment_Number		NVARCHAR(50),  
			Attendace				INT,  
			Total					INT,  
			AttPercentage			FLOAT,  
			Test_Name				NVARCHAR(50),  
			Test_Id					INT,  
			Subject_Name			NVARCHAR(50),   
			Marks					NVARCHAR(15),  
			Percentage				FLOAT,  
			Grade					NVARCHAR(15),    
			TotalMarks				DECIMAL(5,1),  
			PassingMarks			INT,  
			PassingGrade			NVARCHAR(15),  
			AssignedGrade			NVARCHAR(15),  
			Subject_Id				INT,  
			Sort_Order				INT,  
			--Remark				NVARCHAR(3000)  
			Height					FLOAT,  
			Weight					FLOAT,  
			Term_Id					INT  
		)  


	INSERT INTO #tblStudentMarksDetails  
		 SELECT StudentDetails.Student_Id, 
		        StudentDetails.Roll_Num,
				@Standard_Name,
				@Division_Name,   
			    StudentDetails.StudentName, 
				StudentDetails.MotherName,
				StudentDetails.FatherName,
				StudentDetails.GRNo,
				studentdetails.StudentPromotionName, 
				StudentDetails.Remarks,
				StudentDetails.DOB,
				StudentDetails.Enrolment_Number,  
				StudentDetails.Attendace,StudentDetails.Total, Percentage.Percentage,tblSubjectDetails.SchoolWise_Test_Name,  
				tblSubjectDetails.SchoolWise_Test_Id,tblSubjectDetails.Subject_Name,   
				CASE WHEN Is_Absent <> 'N' THEN (
				SELECT DisplayValue 
				FROM Schoolwise_Exam_Status 
				WHERE IsDeleted = 0 
				AND SchoolId = @School_Id
				AND AcademicYearId = @Academic_Year_Id
				AND ShortName = Is_Absent)  
				ELSE CONVERT(NVARCHAR,tblSubjectDetails.Total_Marks_Scored)        
				END Marks ,  
				CASE WHEN tblSubjectDetails.Is_Absent IN (
					SELECT ShortName 
					FROM Schoolwise_Exam_Status 
					WHERE IsDeleted = 0
					  AND SchoolId = @School_Id
					  AND AcademicYearId = @Academic_Year_Id			
				) THEN ' '   
				ELSE ROUND((CONVERT(FLOAT,(tblSubjectDetails.Total_Marks_Scored)) / CONVERT(FLOAT,(CASE WHEN tblSubjectDetails.Subject_Marks=0 THEN 1 ELSE tblSubjectDetails.Subject_Marks END)))*100,2)          
				END as Percentage,  
				CASE WHEN Is_Absent <> 'N' THEN (
					SELECT DisplayValue
					FROM Schoolwise_Exam_Status 
					WHERE IsDeleted = 0 
					  AND SchoolId = @School_Id
					  AND AcademicYearId = @Academic_Year_Id
					  AND ShortName = Is_Absent
				)  
			    ELSE [dbo].[Udf_GetGrade](@School_Id,@Academic_Year_Id,@Standard_Id,(Total_Marks_Scored*100)/Subject_Marks,tblSubjectDetails.Subject_Id)         
			    END as Grade,  
			    tblSubjectDetails.Subject_Marks,tblSubjectDetails.PassingMarks,tblSubjectDetails.GradeName,  
			    '' AS AssignedGrade,tblSubjectDetails.Subject_Id,tblSubjectDetails.Sort_Order  ,
			    StudentDetails.Height  ,
			    StudentDetails.Weight  ,
			    tblSubjectDetails.Term_Id  
		   FROM #StudentDetails AS StudentDetails   
					INNER JOIN @Percentage AS Percentage 
						ON Percentage.Student_Id=StudentDetails.Student_Id   
					INNER JOIN #tblSubjectDetails AS tblSubjectDetails 
						ON Percentage.Student_Id=tblSubjectDetails.Student_Id  
		  WHERE tblSubjectDetails.GradeOrMarks='M'  
       ORDER BY tblSubjectDetails.SchoolWise_Test_Id,Sort_Order  

---------------------------------------------------------------------------------------------------------------------------------------------------------- 
	 
	-- Get maximum sort number from previous table.  
		DECLARE @Sort_Order INT,@TotalSubjectMarks INT  
		 SELECT @Sort_Order = MAX(tblStudentMarksDetails.Sort_Order)+3   
		   FROM #tblStudentMarksDetails AS tblStudentMarksDetails  
    
		 SELECT @TotalSubjectMarks = MAX(tblTotalSubjectGrade.TotalExamMarks)   
		   FROM #tblTotalSubjectGrade AS tblTotalSubjectGrade  
		  WHERE FinalTerm = 0    
    
	INSERT INTO #tblStudentMarksDetails  
		 SELECT DISTINCT tblStudentMarksDetails.Student_Id,
				tblStudentMarksDetails.Roll_Num,
				tblStudentMarksDetails.Standard_Name,  
				tblStudentMarksDetails.Division_Name, 
				tblStudentMarksDetails.StudentName,  
				tblStudentMarksDetails.MotherName,
				tblStudentMarksDetails.FatherName,
				tblStudentMarksDetails.GRNo,
				tblstudentmarksdetails.StudentPromotionName, 
				tblStudentMarksDetails.Remark,  
				tblStudentMarksDetails.DOB,
				tblStudentMarksDetails.Enrolment_Number,
				tblStudentMarksDetails.Attendace,  
				tblStudentMarksDetails.Total,
				tblStudentMarksDetails.AttPercentage,
				CASE WHEN tblStudentMarksDetails.Term_Id=1 THEN 'Total' ELSE 'Total' END Test_Name,
				CASE WHEN tblStudentMarksDetails.Term_Id=1 THEN 6666661 ELSE 6666662 END,
				tblStudentMarksDetails.Subject_Name AS Subject_Name,
				CONVERT(NVARCHAR,tblTotalSubjectGrade.StudentTotalMarksScored) AS Marks,
				tblTotalSubjectGrade.TotalPercentageMarks,  
				CASE WHEN TotalExamMarks = 0   
					 THEN [dbo].[Udf_GetGrade](@School_Id,@Academic_Year_Id,@Standard_Id,0,-99)  
					 ELSE [dbo].[Udf_GetGrade](@School_Id,@Academic_Year_Id,@Standard_Id,(tblTotalSubjectGrade.StudentTotalMarksScored*100)/tblTotalSubjectGrade.TotalExamMarks,-99)  
					 END,  
				@TotalSubjectMarks,
				' ' PassingMarks,
				' ' GradeName,
				' ' AS AssignedGrade,
				tblTotalSubjectGrade.Subject_Id,  
				tblTotalSubjectGrade.Sort_Order,
				tblStudentMarksDetails.Height,
				tblStudentMarksDetails.Weight,
				tblStudentMarksDetails.Term_Id  
		   FROM #tblTotalSubjectGrade AS tblTotalSubjectGrade 
					INNER JOIN #tblStudentMarksDetails AS tblStudentMarksDetails  
						ON tblTotalSubjectGrade.Subject_Id=tblStudentMarksDetails.Subject_Id 
					   AND tblTotalSubjectGrade.StudentId=tblStudentMarksDetails.Student_Id 
					   AND tblTotalSubjectGrade.TermId = tblStudentMarksDetails.Term_Id
					   AND tblTotalSubjectGrade.FinalTerm = 0  
	   GROUP BY tblStudentMarksDetails.Student_Id, 
				tblStudentMarksDetails.Roll_Num, 
				tblStudentMarksDetails.Standard_Name, 
				tblStudentMarksDetails.Division_Name,   
			    tblStudentMarksDetails.StudentName, 
				tblStudentMarksDetails.MotherName, 
				tblStudentMarksDetails.FatherName, 
				tblStudentMarksDetails.GRNo,
				tblStudentMarksDetails.StudentPromotionName, 
				tblStudentMarksDetails.DOB, 
				tblStudentMarksDetails.Attendace,
				tblStudentMarksDetails.Total,tblStudentMarksDetails.Remark, 
				tblStudentMarksDetails.AttPercentage,
				tblStudentMarksDetails.Enrolment_Number, 
				tblTotalSubjectGrade.Subject_Id,
				tblTotalSubjectGrade.StudentTotalMarksScored,  
			    tblTotalSubjectGrade.TotalExamMarks, 
				tblTotalSubjectGrade.TotalPercentageMarks,
				tblTotalSubjectGrade.Sort_Order,
				tblStudentMarksDetails.Subject_Name,
				--tblStudentMarksDetails.Marks, 
				tblStudentMarksDetails.Height,
				tblStudentMarksDetails.Weight,
				tblStudentMarksDetails.Term_Id  
	   ORDER BY tblTotalSubjectGrade.Subject_Id  

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
	
	--This table is used to get all the details of subjects(Grade subjects) with assigned grades.  
  
	CREATE TABLE #tblStudentGradeDetails   
		(  
			Student_Id				INT,  
			Roll_Num				INT,  
			Standard_Name			NVARCHAR(15),  
			Division_Name			NVARCHAR(15),   
			StudentName				NVARCHAR(100),
			MotherName				NVARCHAR(100),
			FatherName				NVARCHAR(100),
			GrNo					NVARCHAR(30),
			StudentPromotionName	NVARCHAR(100),
			Remark					NVARCHAR(3000),  
			DOB						NVARCHAR(50),  
			Enrolment_Number		NVARCHAR(50),  
			Attendace				INT,  
			Total					INT,  
			AttPercentage			FLOAT,  
			Test_Name				NVARCHAR(50),  
			Test_Id					INT,  
			Subject_Name			NVARCHAR(50),   
			Marks					NVARCHAR(15),  
			Percentage				FLOAT,  
			Grade					NVARCHAR(15),    
			TotalMarks				INT,  
			PassingMarks			INT,  
			PassingGrade			NVARCHAR(15),  
			AssignedGradeId			INT,  
			AssignedGrade			NVARCHAR(15),  
			Subject_Id				INT,  
			Sort_Order				INT,  
			SubjectName				NVARCHAR(50),  
			Height					FLOAT,  
			Weight					FLOAT,
			Term_Id					INT  
		)  
  
		INSERT INTO #tblStudentGradeDetails   
		     SELECT StudentDetails.Student_Id,  
				    StudentDetails.Roll_Num,  
				    @Standard_Name,  
				    @Division_Name,   
				    StudentDetails.StudentName,
				    StudentDetails.MotherName,
				    StudentDetails.FatherName,
					StudentDetails.GRNo,
				    StudentDetails.StudentPromotionName,  
				    StudentDetails.Remarks,  
				    StudentDetails.DOB,  
				    StudentDetails.Enrolment_Number,  
				    StudentDetails.Attendace,  
				    StudentDetails.Total,   
				    Percentage.Percentage,  
				    tblSubjectDetails.SchoolWise_Test_Name,  
				    tblSubjectDetails.SchoolWise_Test_Id,  
				    tblSubjectDetails.Subject_Name,   
				    ' ' AS Marks,  
				    ' ' AS Percentage,  
				    ' ' AS Grade ,    
				    tblSubjectDetails.Total_Marks_Scored,  
				    tblSubjectDetails.PassingMarks,  
				    '' PassingGrade,  
				    tblAssignedGradeDetails.AssignedGradeId,  
				    CASE WHEN Is_Absent <> 'N' 
						 THEN (
				    				SELECT DisplayValue 
				    				  FROM Schoolwise_Exam_Status 
				    				 WHERE IsDeleted = 0 
				    				   AND SchoolId = @School_Id
				    				   AND AcademicYearId = @Academic_Year_Id
				    				   AND ShortName = Is_Absent
							  )  
						 ELSE CONVERT(NVARCHAR,tblAssignedGradeDetails.AssignedGrade)      
				         END AS AssignedGrade,  
				    tblSubjectDetails.Subject_Id,  				    
					MAX(tblSubjectDetails.Sort_Order),
				    ' ' AS Subject_Name,  
				    StudentDetails.Height,  
				    StudentDetails.Weight,
				    tblSubjectDetails.Term_Id  
			   FROM #StudentDetails AS StudentDetails   
						INNER JOIN @Percentage AS Percentage 
							ON Percentage.Student_Id = StudentDetails.Student_Id  
						INNER JOIN #tblSubjectDetails AS tblSubjectDetails 
							ON tblSubjectDetails.Student_Id = Percentage.Student_Id  
						INNER JOIN #tblAssignedGradeDetails AS tblAssignedGradeDetails 
							ON tblSubjectDetails.Subject_Id = tblAssignedGradeDetails.Subject_Id  
					       AND tblSubjectDetails.Student_Id = tblAssignedGradeDetails.Student_Id 
					       AND tblSubjectDetails.Schoolwise_Test_Id = tblAssignedGradeDetails.Test_Id  
			  WHERE tblSubjectDetails.GradeOrMarks='G' 
				AND tblSubjectDetails.Subject_Id NOT IN (
															SELECT Subject_Id  
														      FROM Subject_Master  
														     WHERE academic_Year_Id = @Academic_Year_Id 
															   AND School_Id = @School_Id  
															   AND Is_CoCurricularActivity = 1
														)  
		   GROUP BY tblSubjectDetails.SchoolWise_Test_Id,
					StudentDetails.Student_Id,
					StudentDetails.Roll_Num,  
					StudentDetails.StudentName, 
					StudentDetails.MotherName,
				    StudentDetails.FatherName,
					StudentDetails.GRNo,
					StudentDetails.StudentPromotionName, 
					StudentDetails.DOB,
					StudentDetails.Attendace,
					StudentDetails.Total,   
					Percentage.Percentage,
					tblSubjectDetails.SchoolWise_Test_Name,
					tblSubjectDetails.Total_Marks_Scored,  
					tblSubjectDetails.PassingMarks,  
					tblAssignedGradeDetails.AssignedGrade,
					tblSubjectDetails.Subject_Id,  
					tblSubjectDetails.Sort_Order,
					tblAssignedGradeDetails.AssignedGradeId,
					StudentDetails.Remarks,  
					tblSubjectDetails.Subject_Name,
					StudentDetails.Enrolment_Number,
					tblSubjectDetails.Is_Absent,  
					StudentDetails.Height,  
					StudentDetails.Weight,
					tblSubjectDetails.Term_Id  
		   ORDER BY tblSubjectDetails.SchoolWise_Test_Id,
					tblSubjectDetails.Sort_Order,
					tblSubjectDetails.Subject_Id  
  
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
  
	--These tables are used to get all the details of grade subjects which are activity subjects(only exam conducted grade subjects)    
	CREATE TABLE #tblActivitySubjectGradeDetails   
		(     
			Subject_Name			NVARCHAR(50),  
			Subject_Id				INT,  
			Sort_Order				INT,  
			Student_Id				INT,  
			Subject_Marks			INT,  
			PassingMarks			INT,  
			PassindGradeId			INT,  
			PassingGrade			NVARCHAR(15),  
			Schoolwise_Test_Id		INT,  
			SchoolWise_Test_Name	NVARCHAR(50),
			Is_Absent				CHAR(1),  
			Yearwise_Student_Id		INT  
		)  
	
	-----------------------------------------------------------------------------------------------------------------------------------------------  
	--These tables are used to get all the details of grade subjects which are activity subjects(only exam conducted grade subjects with assigned grades)   
  
	CREATE TABLE #tblAssignedActivityGradeDetails   
		(     
			Subject_Name		NVARCHAR(50),  
			Test_Id				INT,  
			Subject_Id			INT,  
			Sort_Order			INT,  
			Student_Id			INT,  
			AssignedGradeId		INT,  
			AssignedGrade		NVARCHAR(15)  
		)  
		INSERT INTO #tblAssignedActivityGradeDetails  
		     SELECT tblActivitySubjectGradeDetails.Subject_Name, 
			        tblActivitySubjectGradeDetails.SchoolWise_Test_Id,
					tblActivitySubjectGradeDetails.Subject_Id,  
					tblActivitySubjectGradeDetails.Sort_Order,
					tblActivitySubjectGradeDetails.Student_Id,  
					MGCD.Marks_Grades_Configuration_Detail_ID,  
					MGCD.Grade_Name   
		       FROM #tblActivitySubjectGradeDetails AS tblActivitySubjectGradeDetails   
						INNER JOIN SchoolWise_Test_Subject_Marks_Master AS STSMM
							ON tblActivitySubjectGradeDetails.SchoolWise_Test_Id = STSMM.SchoolWise_Test_Id  
					       AND STSMM.Subject_Id=tblActivitySubjectGradeDetails.Subject_Id  
						INNER JOIN SchoolWise_Student_Test_Marks AS SSTM
							ON SSTM.TestWise_Subject_Marks_Id = STSMM.TestWise_Subject_Marks_Id  
						INNER JOIN SchoolWise_Student_Test_Marks_Detail AS SSTMD
							ON SSTMD.SchoolWise_Student_Test_Marks_Id = SSTM.SchoolWise_Student_Test_Marks_Id  
						LEFT OUTER JOIN Marks_Grades_Configuration_Details AS MGCD
							ON SSTMD.Assigned_Grade_Id = MGCD.Marks_Grades_Configuration_Detail_ID  
						LEFT OUTER JOIN StudentWiseTestPublishStatus AS STPS 
							ON STPS.SchoolWise_Test_Id = STSMM.SchoolWise_Test_Id  
						   AND STPS.StudentId = @StudentId  
						   AND STPS.Standard_division_Id = STSMM.Standard_Division_Id  
						   AND STPS.Is_Deleted = 'N'  
			  WHERE SSTM.Student_Id = tblActivitySubjectGradeDetails.Yearwise_Student_Id 
				AND STSMM.Academic_Year_Id = @Academic_Year_Id 
				AND STSMM.School_Id = @School_Id  
				AND STSMM.Is_Deleted = 'N'
				AND SSTM.Academic_Year_Id = @Academic_Year_Id 
				AND SSTM.School_Id = @School_Id 
				AND SSTM.Is_Deleted = 'N'
				AND SSTMD.Is_Deleted = 'N'  
				AND (STSMM.Is_Submitted='Y' OR STPS.Is_Published = 'Y')  
	       GROUP BY tblActivitySubjectGradeDetails.Subject_Name, 
		            tblActivitySubjectGradeDetails.SchoolWise_Test_Id,
					tblActivitySubjectGradeDetails.Subject_Id,  
			        tblActivitySubjectGradeDetails.Sort_Order,
					tblActivitySubjectGradeDetails.Student_Id,
					MGCD.Marks_Grades_Configuration_Detail_ID,
					MGCD.Grade_Name   
  
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
	CREATE TABLE #FinalGradeDetails   
		(  
				Student_Id				INT,  
				Roll_Num				INT,  
				Standard_Name			NVARCHAR(15),  
				Division_Name			NVARCHAR(15),   
				StudentName				NVARCHAR(100),
				MotherName				NVARCHAR(100),
				FatherName				NVARCHAR(100),
				GRNo					NVARCHAR(30),
				StudentPromotionName	NVARCHAR(100),  
				DOB						DATETIME,  
				Enrolment_Number		NVARCHAR(50),  
				Attendace				INT,  
				Total					INT,  
				AttPercentage			FLOAT,  
				Test_Name				NVARCHAR(50),  
				Test_Id					INT,  
				Subject_Name			NVARCHAR(50),   
				Result					NVARCHAR(15),  
				Percentage				FLOAT,  
				Marks					NVARCHAR(15),    
				TotalMarks				INT,  
				PassingMarks			INT,  
				PassingGrade			NVARCHAR(15),  
				AssignedGrade			NVARCHAR(15),  
				Subject_Id				INT,  
				Sort_Order				INT,  
				AcademicYear			NVARCHAR(15),  
				Remarks					NVARCHAR(3000),  
				Height					INT,  
				Weight					INT,
				Term					NVARCHAR(30),
				TermHeader				NVARCHAR(100),
				TermHeaderId			INT,
				TermId					INT
		)	
		
	IF (@Standard_Id NOT IN ( select Standard_Id from StandardsWithOnlyGradesSettings where School_Id=@School_Id and Academic_Year_Id=@Academic_Year_Id AND Is_Deleted = 'N'))  
		BEGIN  

			INSERT INTO #FinalGradeDetails  
			     SELECT tblStudentMarksDetails.Student_Id,  
			            tblStudentMarksDetails.Roll_Num,  
			            tblStudentMarksDetails.Standard_Name,  
			            tblStudentMarksDetails.Division_Name,  
			            tblStudentMarksDetails.StudentName, 
			            tblStudentMarksDetails.MotherName,
			            tblStudentMarksDetails.FatherName,
						tblStudentMarksDetails.GRNo,
			            tblStudentMarksDetails.StudentPromotionName, 
			            tblStudentMarksDetails.DOB,  
			            tblStudentMarksDetails.Enrolment_Number,  
			            tblStudentMarksDetails.Attendace,  
			            tblStudentMarksDetails.Total,  
			            tblStudentMarksDetails.AttPercentage,  
			            tblStudentMarksDetails.Test_Name,  
			            tblStudentMarksDetails.Test_Id,  
			            tblStudentMarksDetails.Subject_Name,  
			            '' AS Result,     
			            tblStudentMarksDetails.Percentage,  
			            tblStudentMarksDetails.Marks,  
			            tblStudentMarksDetails.TotalMarks,  
			            tblStudentMarksDetails.PassingMarks,  
			            ' ' AS PassingGrade,  
			            tblStudentMarksDetails.AssignedGrade,  
			            tblStudentMarksDetails.Subject_Id,  
			            tblStudentMarksDetails.Sort_Order,  
			            @AcademicYear AS AcademicYear,  
			            tblStudentMarksDetails.Remark AS Remarks,  
			            tblStudentMarksDetails.Height,  
			            tblStudentMarksDetails.Weight,
						'',
						'',
						0,
						Term_Id
		           FROM #tblStudentMarksDetails AS tblStudentMarksDetails   
				 UNION  
			     SELECT tblStudentGradeDetails.Student_Id,  
						tblStudentGradeDetails.Roll_Num,  
						tblStudentGradeDetails.Standard_Name,  
						tblStudentGradeDetails.Division_Name,   
						tblStudentGradeDetails.StudentName,
						tblStudentGradeDetails.MotherName,
						tblStudentGradeDetails.FatherName,
						tblStudentGradeDetails.GrNo,
						tblStudentGradeDetails.StudentPromotionName,  
						tblStudentGradeDetails.DOB,  
						tblStudentGradeDetails.Enrolment_Number,  
						tblStudentGradeDetails.Attendace,  
						tblStudentGradeDetails.Total,   
						tblStudentGradeDetails.Percentage,  
						tblStudentGradeDetails.Test_Name,  
						tblStudentGradeDetails.Test_Id,  
						tblStudentGradeDetails.Subject_Name,   
						''AS Result,     
						' ' AS Percentage,  
						tblStudentGradeDetails.AssignedGrade,  
						tblStudentGradeDetails.TotalMarks,  
						tblStudentGradeDetails.PassingMarks,  
						tblStudentGradeDetails.PassingGrade,  
						tblStudentGradeDetails.AssignedGrade,  
						tblStudentGradeDetails.Subject_Id,  
						tblStudentGradeDetails.Sort_Order -- + 25  
						,@AcademicYear  
						,tblStudentGradeDetails.Remark,  
						tblStudentGradeDetails.Height,  
						tblStudentGradeDetails.Weight,
						'',
						'',
						0,
						Term_Id
			       FROM #tblStudentGradeDetails AS tblStudentGradeDetails  
		       ORDER BY Sort_Order,tblStudentMarksDetails.Test_Id,tblStudentMarksDetails.Subject_Id 
			   
		END  
	ELSE  
		BEGIN
			INSERT INTO #FinalGradeDetails  
			     SELECT tblStudentMarksDetails.Student_Id,  
						tblStudentMarksDetails.Roll_Num,  
						tblStudentMarksDetails.Standard_Name,  
						tblStudentMarksDetails.Division_Name,  
						tblStudentMarksDetails.StudentName,
						tblStudentMarksDetails.MotherName,
						tblStudentMarksDetails.FatherName,
						tblStudentMarksDetails.GRNo,
						tblStudentMarksDetails.StudentPromotionName,  
						tblStudentMarksDetails.DOB,  
						tblStudentMarksDetails.Enrolment_Number,  
						tblStudentMarksDetails.Attendace,  
						tblStudentMarksDetails.Total,  
						tblStudentMarksDetails.AttPercentage,  
						tblStudentMarksDetails.Test_Name,  
						tblStudentMarksDetails.Test_Id,  
						tblStudentMarksDetails.Subject_Name,  
						''AS Result,  
						tblStudentMarksDetails.Percentage,  
						tblStudentMarksDetails.Grade AS Marks,  
						tblStudentMarksDetails.TotalMarks,  
						tblStudentMarksDetails.PassingMarks,  
						' ' AS PassingGrade,  
						tblStudentMarksDetails.AssignedGrade,  
						tblStudentMarksDetails.Subject_Id,  
						tblStudentMarksDetails.Sort_Order,  
						@AcademicYear AS AcademicYear,  
						tblStudentMarksDetails.Remark AS Remarks,  
						tblStudentMarksDetails.Height,  
						tblStudentMarksDetails.Weight,
						'',
						'',
						0,
						Term_Id    
		           FROM #tblStudentMarksDetails AS tblStudentMarksDetails   
				 UNION  
				 SELECT tblStudentGradeDetails.Student_Id,  
			            tblStudentGradeDetails.Roll_Num,  
						tblStudentGradeDetails.Standard_Name,  
						tblStudentGradeDetails.Division_Name,   
						tblStudentGradeDetails.StudentName, 
						tblStudentGradeDetails.MotherName,
						tblStudentGradeDetails.FatherName,
						tblStudentGradeDetails.GrNo,
						tblStudentGradeDetails.StudentPromotionName, 
						tblStudentGradeDetails.DOB,  
						tblStudentGradeDetails.Enrolment_Number,  
						tblStudentGradeDetails.Attendace,  
						tblStudentGradeDetails.Total,   
						tblStudentGradeDetails.Percentage,  
						tblStudentGradeDetails.Test_Name,  
						tblStudentGradeDetails.Test_Id,  
						tblStudentGradeDetails.Subject_Name,   
						tblStudentGradeDetails.AssignedGrade,  
						' ' AS Percentage,  
						tblStudentGradeDetails.AssignedGrade,    
						tblStudentGradeDetails.TotalMarks,  
						tblStudentGradeDetails.PassingMarks,  
						tblStudentGradeDetails.PassingGrade,  
						' 'AS AssignedGrade,  
						tblStudentGradeDetails.Subject_Id,  
						tblStudentGradeDetails.Sort_Order, --+ 25,  
						@AcademicYear,  
						tblStudentGradeDetails.Remark,  
						tblStudentGradeDetails.Height,  
						tblStudentGradeDetails.Weight,
						'',
						'',
						0,
						Term_Id  
		           FROM #tblStudentGradeDetails AS tblStudentGradeDetails  
	           ORDER BY Sort_Order,tblStudentMarksDetails.Test_Id,tblStudentMarksDetails.Subject_Id  
		END  
						

		CREATE TABLE  #AbsentTestDetails   
		(  
			Subject_Id		INT,  
			Student_Id		INT,  
			Test_Id			INT,  
			Is_Absent		CHAR(1)  
		)  
		
		INSERT INTO #AbsentTestDetails  
		     SELECT Subject_Id,
					Student_Id,
					Schoolwise_Test_Id,
					Is_Absent 
			   FROM #tblSubjectDetails AS tblSubjectDetails  
			  WHERE Is_Absent IN (
									SELECT ShortName 
									  FROM Schoolwise_Exam_Status 
									 WHERE IsDeleted = 0 
									   AND DisplayTotal = 'N'
									   AND SchoolId = @School_Id
									   AND AcademicYearId = @Academic_Year_Id
								  ) 
   
		UPDATE #FinalGradeDetails 
		   SET Marks = ' - '  
		  FROM #FinalGradeDetails AS FinalGradeDetails 
					INNER JOIN #AbsentTestDetails AS AbsentTestDetails 
						ON FinalGradeDetails.Student_Id = AbsentTestDetails.Student_Id 
						AND FinalGradeDetails.Test_Id = AbsentTestDetails.Test_Id   
		 WHERE FinalGradeDetails.Subject_Name = 'Total' 
		    OR FinalGradeDetails.Subject_Name = 'Grade' 
			OR FinalGradeDetails.Subject_Name = 'Grand Total' 
			OR FinalGradeDetails.Subject_Name = 'Grade(Grand)'   
     
		UPDATE #FinalGradeDetails  
		   SET Marks = ' - '  
		  FROM #FinalGradeDetails AS FinalGradeDetails 
					INNER JOIN #AbsentTestDetails AS AbsentTestDetails 
						ON FinalGradeDetails.Student_Id = AbsentTestDetails.Student_Id    
		 WHERE (
					FinalGradeDetails.Subject_Name = 'Total' 
				 OR FinalGradeDetails.Subject_Name = 'Grade' 
				 OR FinalGradeDetails.Subject_Name = 'Grand Total' 
				 OR FinalGradeDetails.Subject_Name = 'Grade(Grand)'
			   )    
		   AND (FinalGradeDetails.Test_Name LIKE '%Total (%' OR FinalGradeDetails.Test_Name='Final' )  
	
		DECLARE @NextAcademicYearId INT

		SELECT TOP 1 @NextAcademicYearId = Academic_Year_ID
			    FROM SchoolWise_Academic_Year_Master
			   WHERE Is_Deleted = 'N'
			     AND Is_NewlyCreated = 'Y'

		DECLARE @promotedstandardName NVARCHAR(15) = '', @SchoolReopenDay DATETIME, @OriginalStandardID INT, @IsPreprimaryStandard BIT, @NextStdId INT
	 
			  SELECT TOP 1 @promotedstandardName = Standard_Name, 
					 @OriginalStandardID = Original_Standard_Id, 
					 @IsPreprimaryStandard = CASE WHEN Is_Preprimary = 'Y' THEN 1 ELSE 0 END,
					 @NextStdId = Standard_Id
				FROM Standard_Master 
			   WHERE Original_Standard_Id > (
												SELECT Original_Standard_Id
												  FROM Standard_Master
												 WHERE Standard_Master.Standard_Id = @Standard_Id
												   AND academic_Year_Id = @Academic_Year_Id
												   AND School_Id = @School_Id
												   AND Is_Deleted = N'N'
											) 
				 AND academic_Year_Id IS NULL
		    ORDER BY Original_Standard_Id

		-- Get school reopen date
		SELECT @SchoolReopenDay = SchoolReopeningDate
		  FROM Standardwise_Academic_Year
		 WHERE (Is_Deleted = 0)
		   AND (School_Id = @School_Id)
		   AND (Academic_Year_ID = @NextAcademicYearId)
		   AND StandardId = (
								SELECT Standard_Id
								  FROM Standard_Master
								 WHERE Original_Standard_Id = @OriginalStandardID
								   AND Is_Deleted = N'N'
								   AND academic_Year_Id = @NextAcademicYearId
							)

			INSERT INTO #FinalGradeDetails
			     SELECT Student_Id,  
						Roll_Num ,  
						Standard_Name ,  
						Division_Name ,   
						StudentName,
						MotherName,
						FatherName,
						GRNo,
						StudentPromotionName ,  
						DOB  ,  
						Enrolment_Number ,  
						Attendace ,  
						Total ,  
						AttPercentage ,  
						'Grade' ,  
						CASE WHEN TermId = 1 THEN 7777777 ELSE 7777778 END,  
						Subject_Name ,   
						Result ,  
						100 ,  
						--Marks ,    
						(
							SELECT MGCD.Grade_Name
							  FROM Marks_Grades_Configuration MGC
										INNER JOIN Marks_Grades_Configuration_Details MGCD
											ON MGC.Marks_Grades_Configuration_Id = MGCD.Marks_Grades_Configuration_Id
							 WHERE MGC.School_Id = @School_Id  
							   AND MGC.Academic_Year_Id = @Academic_Year_Id
							   AND MGC.Is_Deleted = 'N'
							   AND MGC.IsForCoCurricularSubjects = 0
							   AND MGC.Standard_Id = @Standard_Id
							   AND MGCD.Is_Deleted = 'N'		   
							   AND Percentage >= MGCD.Starting_Marks_Range 
							   AND Percentage <= MGCD.Actual_Ending_Marks_Range
						),
						TotalMarks ,  
						PassingMarks ,  
						PassingGrade ,  
						AssignedGrade ,  
						Subject_Id ,  
						Sort_Order ,  
						AcademicYear   
						,Remarks ,  
						Height ,  
						Weight ,
						Term  ,
						'',
						0,
						TermId
			       FROM #FinalGradeDetails	
			      WHERE Test_Name = 'Total'
			         OR (Subject_Name = 'Percentage' AND test_name LIKE '%Total%')

	DECLARE @NextStandardName NVARCHAR(50) = ''
	

		SELECT TOP 1 @NextStandardName = Standard_Name
		  FROM Standard_Master
		 WHERE School_Id = @School_Id
		   AND Academic_Year_Id = @NextAcademicYearId
		   AND Is_Deleted = 'N'
		   AND Original_Standard_Id =
									(
										SELECT NextOriginalStandardId
										  FROM Standard_Master
										 WHERE Standard_Id = @Standard_Id
										   AND School_Id = @School_Id
										   AND Academic_Year_Id = @Academic_Year_Id
										   AND Is_Deleted = 'N'
									)
      ORDER BY Original_Standard_Id

		 -- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
		UPDATE #FinalGradeDetails  
		SET Marks = ' - '  
		FROM #FinalGradeDetails AS FinalGradeDetails 
				INNER JOIN #AbsentTestDetails AS AbsentTestDetails 
					ON FinalGradeDetails.Student_Id = AbsentTestDetails.Student_Id    
					and FinalGradeDetails.Subject_Id = AbsentTestDetails.Subject_Id    
		WHERE (FinalGradeDetails.Test_Name='Final'  OR FinalGradeDetails.Test_Name='Grade' OR FinalGradeDetails.Test_Name LIKE'%Total%')
		
		  UPDATE #FinalGradeDetails  
		   SET Marks = ' - '  
		  FROM #FinalGradeDetails AS FinalGradeDetails 
				INNER JOIN #AbsentTestDetails AS AbsentTestDetails 
					ON FinalGradeDetails.Student_Id = AbsentTestDetails.Student_Id    
					and FinalGradeDetails.Subject_Id = AbsentTestDetails.Subject_Id    
				INNER JOIN SchoolWise_Test_Master stm
				on AbsentTestDetails.Test_Id = stm.SchoolWise_Test_Id
		WHERE (FinalGradeDetails.Test_Name='Final'  OR FinalGradeDetails.Test_Name='Grade')
		and stm.academic_year_id = @Academic_Year_Id
		and stm.School_Id = @School_Id
		and stm.Is_Deleted = 'N'
		and stm.Term_Id = 1
		and FinalGradeDetails.Test_Id = 6666661
		
		 UPDATE #FinalGradeDetails  
		   SET Marks = ' - '  
		  FROM #FinalGradeDetails AS FinalGradeDetails 
				INNER JOIN #AbsentTestDetails AS AbsentTestDetails 
					ON FinalGradeDetails.Student_Id = AbsentTestDetails.Student_Id    
					and FinalGradeDetails.Subject_Id = AbsentTestDetails.Subject_Id    
				INNER JOIN SchoolWise_Test_Master stm
				on AbsentTestDetails.Test_Id = stm.SchoolWise_Test_Id
		WHERE (FinalGradeDetails.Test_Name='Final'  OR FinalGradeDetails.Test_Name='Grade')
		and stm.academic_year_id = @Academic_Year_Id
		and stm.School_Id = @School_Id
		and stm.Is_Deleted = 'N'
		and stm.Term_Id = 2
		and FinalGradeDetails.Test_Id = 6666662

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO #FinalGradeDetails
SELECT FGD.Student_Id, 
	   FGD.Roll_Num, 
	   FGD.Standard_Name, 
	   FGD.Division_Name, 
	   FGD.StudentName, 
	   FGD.MotherName, 
	   FGD.FatherName, 
	   FGD.GRNo, 
	   FGD.StudentPromotionName, 
	   FGD.DOB,
	   FGD.Enrolment_Number,
	   FGD.Attendace,
	   FGD.Total,
	   FGD.AttPercentage,
	   'Total',
	   6666666,
	   FGD.Subject_Name,
	   FGD.Result,
	   FGD.Percentage,
	   FGD.Marks,
	   FGD.TotalMarks,
	   FGD.PassingMarks,
	   FGD.PassingGrade,
	   FGD.AssignedGrade,
	   FGD.Subject_Id,
	   FGD.Sort_Order,
	   FGD.AcademicYear,
	   FGD.Remarks,
	   FGD.Height,
	   FGD.Weight,
	   FGD.Term,
		'',
		0,
		TermId
FROM #FinalGradeDetails FGD
INNER JOIN #tblStudentGradeDetails TSGD
ON FGD.Student_Id = TSGD.Student_Id
AND FGD.Test_Id = TSGD.Test_Id
AND FGD.Subject_Id = TSGD.Subject_Id
INNER JOIN SchoolWise_Test_Master STM
on fgd.Test_Id = stm.SchoolWise_Test_Id
WHERE STM.academic_year_id = @Academic_Year_Id
AND STM.Is_Deleted = 'N'
and stm.IsFinalExam = 1
AND TSGD.Subject_Id NOT IN
(
	SELECT RSGD.Subject_Id
	FROM #tblStudentGradeDetails RSGD
	INNER JOIN SchoolWise_Test_Master STM
	ON RSGD.Test_Id = STM.SchoolWise_Test_Id
	WHERE STM.School_Id = @School_Id
	AND STM.academic_year_id = @Academic_Year_Id
	AND STM.Is_Deleted = 'N'
	AND STM.IsFinalExam = 0
	GROUP BY RSGD.Subject_Id
)

UPDATE FGD
SET Test_Id = stm.Original_SchoolWise_Test_Id
FROM #FinalGradeDetails FGD
INNER JOIN SchoolWise_Test_Master STM
ON FGD.Test_Name = STM.SchoolWise_Test_Name
WHERE STM.School_Id  =@School_Id
AND STM.academic_year_id = @Academic_Year_Id
AND STM.Is_Deleted = 'N'
and stm.Term_Id = 1

UPDATE FGD
SET Test_Id = stm.Original_SchoolWise_Test_Id + 100
FROM #FinalGradeDetails FGD
INNER JOIN SchoolWise_Test_Master STM
ON FGD.Test_Name = STM.SchoolWise_Test_Name
WHERE STM.School_Id  =@School_Id
AND STM.academic_year_id = @Academic_Year_Id
AND STM.Is_Deleted = 'N'
and stm.Term_Id = 2


UPDATE FGD
SET Test_Id = (SELECT Original_SchoolWise_Test_Id FROM SchoolWise_Test_Master where School_Id = @School_Id and academic_year_id = @Academic_Year_Id and Is_Deleted = 'N' and Term_Id = 1 and IsFinalExam = 1) + 10
from #FinalGradeDetails FGD
WHERE Test_Id = 6666661


UPDATE FGD
SET TermHeader = 'Term 1 Grade',
	TermHeaderId = 1
FROM #FinalGradeDetails FGD
INNER JOIN SchoolWise_Test_Master STM
ON FGD.Test_Name = STM.SchoolWise_Test_Name
WHERE STM.School_Id  =@School_Id
AND STM.academic_year_id = @Academic_Year_Id
AND STM.Is_Deleted = 'N'
and stm.Term_Id = 1

UPDATE FGD
SET TermHeader = 'Term 1 Grade',
	TermHeaderId = 1
FROM #FinalGradeDetails FGD
WHERE Test_Name = 'Total'

UPDATE FGD
SET TermHeader = 'Term 2 Grade',
	TermHeaderId = 2
FROM #FinalGradeDetails FGD
WHERE Test_Name = 'Total'
and Test_Id = 6666662

UPDATE FGD
SET TermHeader = 'Term 2 Grade',
	TermHeaderId = 2
FROM #FinalGradeDetails FGD
INNER JOIN SchoolWise_Test_Master STM
ON FGD.Test_Name = STM.SchoolWise_Test_Name
WHERE STM.School_Id  =@School_Id
AND STM.academic_year_id = @Academic_Year_Id
AND STM.Is_Deleted = 'N'
and stm.Term_Id = 2

UPDATE FGD
SET Remarks = TRD.Remark
FROM #FinalGradeDetails FGD
INNER JOIN #tblRemarkDetail TRD
ON FGD.Student_Id = TRD.StudentId

UPDATE  FGD
SET Test_Id = S.Sort_Order
FROM #FinalGradeDetails FGD
INNER JOIN
(
	SELECT STM.SchoolWise_Test_Name, SSTM.Sort_Order
	FROM Schoolwise_Standard_Test_Master SSTM
	INNER JOIN SchoolWise_Test_Master STM
	ON SSTM.SchoolWise_Test_Id = STM.SchoolWise_Test_Id
	AND SSTM.academic_Year_Id = STM.academic_year_id
	WHERE SSTM.School_Id = @School_Id
	AND SSTM.academic_Year_Id = @Academic_Year_Id
	AND SSTM.Is_Deleted = 'N'
	AND SSTM.Standard_Id = @Standard_Id
	AND STM.Is_Deleted = 'N'
)S
ON FGD.Test_Name = S.SchoolWise_Test_Name

DECLARE @tblLegends AS TABLE
(
	Student_Id INT, 
	Subject_Id INT
)

INSERT INTO @tblLegends
SELECT Student_Id, Subject_Id
FROM #FinalGradeDetails
WHERE Marks = 'Ab'
and Marks IN 
(
	SELECT DisplayValue 
	FROM Schoolwise_Exam_Status 
	WHERE IsDeleted = 0
	AND SchoolId = @School_Id
	AND AcademicYearId = @Academic_Year_Id
	and DisplayTotal = 'Y'
	and ConsiderInTotal = 'N'
)
GROUP BY Student_Id, Subject_Id

DECLARE @ShowLegend BIT = 0
IF EXISTS
(
	SELECT TOP 1 1
	FROM @tblLegends
)
BEGIN
	SET @ShowLegend = 1
END

	-- Term 1
	UPDATE #FinalGradeDetails
	SET Test_Id = 1,
		Test_Name = 'Periodic Test              '
	WHERE Test_Name = 'Per Test - I'
	AND TermId = 1

	UPDATE #FinalGradeDetails
	SET Test_Id = 2,
		Test_Name = 'Note Book              '
	WHERE Test_Name  = 'Note Book - I'
	AND TermId = 1

	UPDATE #FinalGradeDetails
	SET Test_Id = 3,
		Test_Name = 'Sub Enrichment'
	WHERE Test_Name = 'Sub Enrichment - I'
	AND TermId = 1

	UPDATE #FinalGradeDetails
	SET Test_Id = 4,
		Test_Name = 'Half Yearly Exam         '
	WHERE Test_Name = 'Half Yearly'
	AND TermId = 1
	
	UPDATE #FinalGradeDetails
	SET Test_Id = 6,
		Test_Name = 'Marks Obtained'
	WHERE Test_Name = 'Total'
	AND TermId = 1

	UPDATE #FinalGradeDetails
	SET Test_Id = 7
	WHERE Test_Name = 'Grade'
	AND TermId = 1	
	   
			SELECT Student_Id,  
				   Roll_Num,  
				   Standard_Name,  
				   dbo.udf_ConvertIntToRoman(Standard_Name) as StandardInRoman,
				   Division_Name,   
				   StudentName,
				   MotherName,
				   FatherName,
				   GRNo,
				   CASE WHEN @IsPreprimaryStandard = 1 THEN @promotedstandardName 
				   													   ELSE DBO.udf_ConvertIntToRoman(CONVERT(INT, @promotedstandardName)) END AS StudentPromotionName,  
				   DOB,  
				   Enrolment_Number,  
				   Attendace,  
				   Total,  
				   AttPercentage ,
				   case when UPPER(Test_Name) = 'GRADE' THEN Test_Name ELSE Test_Name + ' ('+CAST(TotalMarks as NVARCHAR(10)) +')' END AS Test_Name,				
				   Test_Id ,  
				   Subject_Name ,   
				   Result ,  
				   Percentage ,  				   
				   Marks AS Marks,
				   TotalMarks ,  
				   PassingMarks ,  
				   PassingGrade ,  
				   AssignedGrade,  
				   Subject_Id ,  
				   Sort_Order,  
				   Remarks,  
				   @Term_Name AS TermName,  
				   AcademicYear,   
				   TermHeader,
				   TermHeaderId,
				   CASE WHEN Height = CAST (0 AS FLOAT) THEN '  -' ELSE Height END AS Height,
				   CASE WHEN Weight = CAST (0 AS FLOAT) THEN '  -' ELSE Weight END AS Weight,
				   Term,
				   CASE WHEN @FinalTerm IS NULL THEN 1 ELSE 0 END AS IsFinalTerm,
				   @NextStandardName AS NextStandardName,
				   @SchoolReopenDay AS SchoolReopenDay,   
				   @ClassTeacherName AS ClassTeacherName, 
				   @PrincipalName AS PrincipalName,
				   @ShowLegend ShowLegend,
				   SM.Logo AS SchoolLogo,
				   UPPER(SM.School_Name) AS School_Name,
				   SM.Address1 AS SchoolAddress,
				   SM.City as SchoolCity,
				   SM.Pincode as SchoolPinCode,
				   SM.SignPathImage
			  FROM #FinalGradeDetails  
						INNER JOIN School_Master SM
							ON SM.School_Id = @School_Id
						   AND SM.Is_Deleted = 'N'
	      ORDER BY Student_Id,Sort_Order,Test_Id   
END
