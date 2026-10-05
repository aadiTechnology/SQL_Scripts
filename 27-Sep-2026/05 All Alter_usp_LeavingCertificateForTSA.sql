SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vishakha
-- Create date: 4 Aug 2026
-- Description:	This USP is used to get details of LC.
-- =============================================
ALTER PROCEDURE [dbo].[usp_LeavingCertificateForTSA]
@School_Id INT,                  
@Enrolment_Number NVARCHAR(50)=NULL,
@PrintDate nvarchar(100)=NULL     
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Academic_Year_Id INT
		
		SELECT TOP 1 
			@Academic_Year_Id = YSD.Academic_Year_ID
		FROM YearWise_Student_Details YSD
		INNER JOIN vw_BaseStudentDetails VBSD
			ON YSD.Student_Id = VBSD.SchoolWise_Student_Id
		WHERE VBSD.Enrolment_Number = @Enrolment_Number
		  AND YSD.Is_Deleted = 'N'
		  AND VBSD.Is_Deleted = 'N'
		  AND EXISTS (
				SELECT 1
				FROM SchoolWise_Attendance_Details SAD
				WHERE SAD.Student_Id = YSD.YearWise_Student_Id
				  AND SAD.Academic_Year_Id = YSD.Academic_Year_ID
				  AND SAD.Is_Deleted = 'N'
			)
		ORDER BY YSD.Academic_Year_ID DESC;

		DECLARE @StudentId INT,
				@PresentDays INT = 0,
				@WorkingDays INT = 0

		SELECT @StudentId = YearWise_Student_Id
		FROM YearWise_Student_Details YSD
		INNER JOIN vw_BaseStudentDetails VBSD
		ON YSD.Student_Id = VBSD.SchoolWise_Student_Id
		where Enrolment_Number = @Enrolment_Number
		and Academic_Year_ID = @Academic_Year_Id
		and YSD.Is_Deleted = 'N'
		and VBSD.Is_Deleted = 'N'

		select @PresentDays = SUM(CASE WHEN Is_Present = 'Y' THEN 1 ELSE 0 END),
			@WorkingDays = COUNT(1)
		from 
		(
			select convert(date,Attendance_Date) as AttDate, Is_Present
			from SchoolWise_Attendance_Details
			where Academic_Year_Id = @Academic_Year_Id
			and Is_Deleted = 'N'
			and Student_Id = @StudentId
			AND School_Id = @School_Id
		    group by convert(date,Attendance_Date), Is_Present
		)S
		
		
    select Upper(School_Name) AS School_Name,
		   Address1,
		   '27250503423' AS UDISENumber,
		   SM.City,
		   SM.Pincode,
		   LCEnrolmentNumber as GRNumber, 
		   StudentUIDNo,
		   PenNo,
		   StudentName,
		   FatherName,
		   LD.Mother_Name,
		   Religion,
		   LD.CasteAndSubCaste,
		   LD.Nationality,
		   MotherTongue,
		   cast(FORMAT(LD.DOB,'dd-MMM-yyyy') as nvarchar(20)) as DOB,
		   LD.DateOfBirthInText,
		   Birthplace,
		   Last_school_attended,
		   cast(FORMAT(LD.Admission_Date,'dd-MMM-yyyy') as nvarchar(20)) as Admission_Date,
		   AdmissionStandard,
		   Last_School_Standard,
		   case when ExamStatusId = 0 then 'Pass' else 'Fail' end as LastResult,
		   WhetherIsFailed,
		   IsPromotedToHigherClass,
           @WorkingDays as WorkingDays,
		   @PresentDays as PresentDays,
		   Reason_Of_Leaving,
		   Conduct,
		   Remarks,
		   cast(FORMAT(ApplicationDate,'dd-MMM-yyyy') as nvarchar(20)) as ApplicationDate,
		   CASE WHEN @PrintDate = N'1/1/0001' OR @PrintDate IS  NULL THEN dbo.GetLocalDate(DEFAULT) ELSE CONVERT(DATE, @PrintDate) END AS PrintDate
		  ,ISNULL(NULLIF(LTRIM(RTRIM(ApaarId)), ''), '-') AS ApaarId
		  ,SerialNumber 
	from School_Master SM
	inner join LC_Details LD
	on SM.School_Id = LD.School_Id
	where LD.School_Id = @School_Id
	and LD.Enrolment_Number = @Enrolment_Number
	and SM.Is_Deleted = 'N'
	and LD.School_Id = @School_Id
	and LD.Is_Deleted = 'N'

	END
GO

