/****** Object:  StoredProcedure [dbo].[usp_GetStudentDetailsForBonafideCertificate_Pioneer]    Script Date: 8/25/2025 11:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Sweety	
-- Create date: 23-jun-2026
-- Description:	This USP is used to get student details for bonafide Certificate.
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetBonafideStudentDetails_TSA]
@School_Id INT,
@Academic_Year_Id INT,
@Standard_Id INT=NULL,
@Division_Id INT=NULL,
@Student_Id INT

AS
BEGIN
    DECLARE @PrincipalName NVARCHAR(100) = ''

	DECLARE @BCCount INT=0  , @IsLeft BIT,  @AcademicYear NVARCHAR(50), @ReferenceNo INT
      
    SELECT @BCCount=COUNT(BonafideSerialNo)    
    FROM SchoolWise_Student_BonafideCertificate_Details  
  
   SET @BCCount=100
   IF @Student_Id IS NOT NULL AND @School_Id IS NOT NULL  
   BEGIN  
		 INSERT INTO SchoolWise_Student_BonafideCertificate_Details  
		 (  
			  Schoolwise_Student_Id,  
			  BonafideSerialNo,  
			  SchoolId,  
			  UpdateDate,
			  --PrintDate,
			  StandardDivisionId  
		 )  
		 VALUES   
		 (  
			  @Student_Id,  
			  100,  
			  @School_Id ,  
			  dbo.GetLocalDate(DEFAULT),
			  --CASE WHEN @PrintDate = N'1/1/0001' THEN dbo.GetLocalDate(DEFAULT) ELSE CONVERT(DATE ,@PrintDate) END,
			  @Division_Id   
		 )  
   END 
   
    SELECT @PrincipalName = BTD.TeacherFLName
	FROM vw_BaseTeacherDetails BTD
	INNER JOIN Teacher_Designation_Master TDM
	ON BTD.Designation_Id = TDM.Teacher_Designation_Id
	WHERE School_Id = @School_Id
	AND academic_year_id = @Academic_Year_Id
	AND BTD.Is_Deleted = 'N'
	AND TDM.Is_Deleted = 'N'
	AND TDM.Teacher_Designation_Name = 'PRINCIPAL'
	 
	 IF EXISTS(   
				  SELECT TOP 1 1 
				  FROM BonafideRequestNoDetails
				 WHERE SchoolId = @School_Id
				   AND AcademicYearId = @Academic_Year_Id
				   AND StudentId = @Student_Id
				   AND IsDeleted = 0
			   )
	 BEGIN
			
		    SELECT @ReferenceNo = ReferenceNo,
			       @AcademicYear = (CAST(YEAR(Start_date) AS NVARCHAR(4)) +N'-'+ CAST(RIGHT(YEAR(End_Date),2) AS NVARCHAR(4)))
			  FROM BonafideRequestNoDetails BRAD
		INNER JOIN SchoolWise_Academic_Year_Master SAYM
		        ON BRAD.AcademicYearId = SAYM.Academic_Year_ID
			 WHERE SchoolId = @School_Id
			   AND AcademicYearId = @Academic_Year_Id
			   AND StudentId = @Student_Id
			   AND IsDeleted = 0
	END
	  ELSE
	  BEGIN
			SELECT @AcademicYear = (CAST(YEAR(Start_date) AS NVARCHAR(4)) +N'-'+ CAST(RIGHT(YEAR(End_Date),2) AS NVARCHAR(4)))   
			  FROM SchoolWise_Academic_Year_Master    
		     WHERE (School_Id = @School_Id )
			   AND (Is_Deleted = N'N') 
			   AND (Is_NewlyCreated = N'N')	
			   AND Academic_Year_ID = @Academic_Year_Id
		  ORDER BY Academic_Year_ID DESC
			
			SELECT @ReferenceNo = MAX(ReferenceNo)
			  FROM BonafideRequestNoDetails
			 WHERE AcademicYearId = @Academic_Year_Id
			   AND IsDeleted = 0

			IF @ReferenceNo IS NOT null AND @ReferenceNo <> 0
				SET @ReferenceNo = @ReferenceNo + 1
			ELSE 
				SET @ReferenceNo = 1
			
			IF @Student_Id IS NOT NULL AND @Student_Id <> 0
				INSERT INTO BonafideRequestNoDetails
					 SELECT @Student_Id, @ReferenceNo, @Academic_Year_Id, @School_Id, 0, 1, dbo.GetLocalDate(DEFAULT), 1, dbo.GetLocalDate(DEFAULT)
      END
	
	SELECT StudentName, 
		   Enrolment_Number, 
		   Salutation_Name,
		   Parent_Name, 
		   Mother_Name, 
		   Joining_Date, 
		   CASE WHEN SM1.Is_PrePrimary = 'Y' THEN SM1.Standard_Name ELSE dbo.udf_ConvertIntToRoman(SM1.Standard_Name) END as Standard_Name,
		   CAST(VBSD.DOB AS DATE) AS DOB, 
		   DateOfBirthInText, 
		   ISNULL(VBSD.Birth_Place,'-') as Birth_Place,
		   State, 
		   Nationality,
		   SM.City,
		   SM.Pincode,
		   REPLACE(SM.School_Name,'vp ','') AS School_Name,
		   SM.School_Orgn_Name,
		   @PrincipalName AS PrincipalName,
		   School_Master.Logo,
		   @BCCount AS BonafideSerialNo,
		   VBSD.CasteAndSubCaste,
		   @ReferenceNo AS ReferenceNo,
		   @AcademicYear AS AcademicYear,
		   School_Master.Pincode,
		   SAD.Religion,
		   VBSD.Address AS StudentAddress,
		   VSD.ClassName
  FROM vw_BaseStudentDetails VBSD
inner join YearWise_Student_Details YSD
	    on VBSD.SchoolWise_Student_Id = YSD.Student_Id
inner join vw_standard_division VSD
	    on VSD.Standard_Id = YSD.Standard_Id
	   and VSD.Division_Id = YSD.Division_id
inner join School_Master SM
		on SM.School_Id = VBSD.School_Id
inner join Standard_Master SM1
		on SM1.Standard_Id = YSD.Standard_Id
inner join School_Master 
		on School_Master.School_Id = YSD.School_Id
INNER JOIN StudentAdditionalDetails SAD
	    ON YSD.Student_Id=SAD.SchoolwiseStudentId                   
	 where VBSD.School_Id = @School_Id
	   and YSD.Academic_Year_ID = @Academic_Year_Id
	   and VSD.Standard_Id = @Standard_Id
	   and SchoolWise_Standard_Division_Id = @Division_Id
	   and YSD.YearWise_Student_Id = @Student_Id
	   and VBSD.Is_Deleted = 'N'
	   and YSD.Is_Deleted = 'N'
	   and SM1.Is_Deleted = 'N'
   END

GO

