begin transaction
begin try

DECLARE @SchoolId INT = 11; -- TODO: set school id
DECLARE @AcademicYearId INT;      -- AY 2026-27 (target year: class 9)
DECLARE @PrevAcademicYearId INT;  -- AY 2025-26 (RTE year)

-- Rule 25 + Rule 6: resolve requested academic years from SAYM
SELECT @AcademicYearId = SAYM.Academic_Year_ID
FROM dbo.SchoolWise_Academic_Year_Master AS SAYM
WHERE SAYM.School_Id = @SchoolId
  AND YEAR(SAYM.Start_Date) = 2026
  AND YEAR(SAYM.End_Date) = 2027
  AND SAYM.Is_Deleted = N'N';

SELECT @PrevAcademicYearId = SAYM.Academic_Year_ID
FROM dbo.SchoolWise_Academic_Year_Master AS SAYM
WHERE SAYM.School_Id = @SchoolId
  AND YEAR(SAYM.Start_Date) = 2025
  AND YEAR(SAYM.End_Date) = 2026
  AND SAYM.Is_Deleted = N'N';

IF @AcademicYearId IS NULL OR @PrevAcademicYearId IS NULL
BEGIN
    RAISERROR('Academic year not found for AY 2026-27 or AY 2025-26 for given school.', 16, 1);
    RETURN;
END;

declare @tblStudentDetails AS TABLE
(
	SchoolWise_Student_Id INT,
	YearwiseStudentId INT
)

DECLARE @SchoolWise_Student_Id INT,
		@YearwiseStudentId INT

INSERT INTO @tblStudentDetails
SELECT BSD.SchoolWise_Student_Id,YWSD26.YearWise_Student_Id
FROM dbo.YearWise_Student_Details AS YWSD26
INNER JOIN dbo.YearWise_Student_Details AS YWSD25
    ON YWSD25.Student_Id = YWSD26.Student_Id
   AND YWSD25.Academic_Year_ID = @PrevAcademicYearId
INNER JOIN dbo.vw_basestudentdetails AS BSD
    ON BSD.SchoolWise_Student_Id = YWSD26.Student_Id
INNER JOIN dbo.vw_standard_division AS vwd
    ON vwd.Standard_Id = YWSD26.Standard_Id
   AND vwd.Division_id = YWSD26.Division_id
   AND vwd.academic_year_id = YWSD26.Academic_Year_ID
WHERE
    -- Rule 4 + 15: school filter only in WHERE
    YWSD26.School_Id = @SchoolId
    AND YWSD25.School_Id = @SchoolId
    AND BSD.School_Id = @SchoolId
    AND vwd.School_Id = @SchoolId

    -- Rule 2: academic year in ON (above) and WHERE (below)
    AND YWSD26.Academic_Year_ID = @AcademicYearId

    -- Students in 9th standard in AY 2026-27
    AND vwd.Standard_Name IN (N'9')

    -- RTE in AY 2025-26
    AND YWSD25.Is_RTE_Student = 1

    -- Rule 1 + 8: soft-delete filters, no IS NULL checks
    AND YWSD26.Is_Deleted = N'N'
    AND YWSD25.Is_Deleted = N'N'
    AND BSD.Is_Deleted = N'N'
ORDER BY vwd.ClassName, BSD.StudentName;

select * from @tblStudentDetails

WHILE EXISTS
(
	SELECT TOP 1 1
	FROM @tblStudentDetails
)
BEGIN
	SELECT TOP 1 @SchoolWise_Student_Id = SchoolWise_Student_Id, @YearwiseStudentId = YearwiseStudentId
	FROM @tblStudentDetails

	UPDATE Schoolwise_Student_Fee_Details
	SET Is_Deleted = 'Y',
		Update_Date = DBO.GetLocalDate(DEFAULT),
		Updated_By_Id = 1
	WHERE student_id = @YearwiseStudentId
	and School_Id = @SchoolId
	and Academic_Year_Id = @AcademicYearId
	and Is_Deleted = 'N'

	UPDATE InternalFeeDetails
	SET Is_Deleted = 1,
		UpdateDate = DBO.GetLocalDate(DEFAULT),
		UpdatedById = 1
	WHERE SchoolId = @SchoolId
	AND AcademicYearId = @AcademicYearId
	AND Schoolwise_Student_Id = @SchoolWise_Student_Id
	AND Is_Deleted = 0

	UPDATE YearWise_Student_Details
	SET Is_Deleted = 'Y',
		Update_Date = DBO.GetLocalDate(DEFAULT),
		Updated_By_Id = 1
	WHERE YearWise_Student_Id = @YearwiseStudentId
	AND School_Id = @SchoolId
	AND Academic_Year_ID = @AcademicYearId

	DELETE FROM @tblStudentDetails
	WHERE SchoolWise_Student_Id = @SchoolWise_Student_Id
END

print 'Success!'
commit transaction
end try
begin catch
	print error_message()
	rollback transaction
end catch