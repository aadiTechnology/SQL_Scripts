DECLARE @SchoolId INT = 18;  -- TODO: set your school id
DECLARE @AcademicYearId INT = 56

DECLARE @tblStudentData AS TABLE
(
	Student_Id INT,
	SecondLanguageSubjectId INT,
	ThirdLanguageSubjectId INT
)

INSERT INTO @tblStudentData
SELECT YWSD.Student_Id,
	YWSD.SecondLanguageSubjectId,
	YWSD.ThirdLanguageSubjectId
FROM dbo.YearWise_Student_Details AS YWSD
INNER JOIN dbo.vw_basestudentdetails AS BSD
    ON BSD.SchoolWise_Student_Id = YWSD.Student_Id
INNER JOIN dbo.vw_standard_division AS VSD
    ON VSD.Standard_Id = YWSD.Standard_Id
   AND VSD.Division_Id = YWSD.Division_Id
   AND VSD.academic_year_id = YWSD.Academic_Year_ID      -- Rule 2
INNER JOIN dbo.SchoolWise_Academic_Year_Master AS SAYM
    ON SAYM.Academic_Year_ID = YWSD.Academic_Year_ID     -- Rule 2
LEFT JOIN dbo.Subject_Master AS SM2
    ON SM2.Original_Subject_Id = YWSD.SecondLanguageSubjectId
   AND SM2.academic_Year_Id = YWSD.Academic_Year_ID      -- Rule 2
   AND SM2.Is_Deleted = 'N'                              -- Rule 1
LEFT JOIN dbo.Subject_Master AS SM3
    ON SM3.Original_Subject_Id = YWSD.ThirdLanguageSubjectId
   AND SM3.academic_Year_Id = YWSD.Academic_Year_ID      -- Rule 2
   AND SM3.Is_Deleted = 'N'                              -- Rule 1
WHERE
    YWSD.Is_Deleted = 'N'                                 -- Rule 1
    AND BSD.Is_Deleted = 'N'                              -- Rule 1
    AND SAYM.Is_Deleted = 'N'                             -- Rule 1
    AND YWSD.Academic_Year_ID = @AcademicYearId           -- Rule 2 + 25
    AND YWSD.School_Id = @SchoolId                        -- Rule 4 + 15
    AND BSD.School_Id = @SchoolId                         -- Rule 4 + 15
    AND SAYM.School_Id = @SchoolId                        -- Rule 4 + 15
    AND VSD.School_Id = @SchoolId                         -- Rule 4 + 15
    AND (SM2.School_Id IS NULL OR SM2.School_Id = @SchoolId)  -- Rule 4 + 15
    AND (SM3.School_Id IS NULL OR SM3.School_Id = @SchoolId)  -- Rule 4 + 15
	and vsd.Is_PrePrimary = 'N'	
ORDER BY
    VSD.Original_Standard_Id,
    VSD.Original_Division_Id,
    YWSD.Roll_No;                                         -- Rule 3

	UPDATE YSD
	SET SecondLanguageSubjectId = TSD.SecondLanguageSubjectId,
		ThirdLanguageSubjectId = TSD.ThirdLanguageSubjectId
	FROM YearWise_Student_Details YSD
	INNER JOIN @tblStudentData TSD
	ON YSD.Student_Id = TSD.Student_Id
	WHERE School_Id = @SchoolId
	AND Academic_Year_ID = 57
	AND Is_Deleted = 'N'