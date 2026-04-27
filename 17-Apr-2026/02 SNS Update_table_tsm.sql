DECLARE @SchoolId INT = 122; /* TODO: set your school */
DECLARE @AcademicYearId INT;

SELECT @AcademicYearId = SAYM.Academic_Year_ID
FROM dbo.SchoolWise_Academic_Year_Master AS SAYM
WHERE SAYM.School_Id = @SchoolId
  AND SAYM.Is_Deleted = N'N'
  AND YEAR(CONVERT(DATE, SAYM.Start_date)) = 2025
  AND YEAR(CONVERT(DATE, SAYM.End_Date)) = 2026;
  
UPDATE tsm
SET tsm.Result_Consideration = N'N',
    tsm.Update_Date = dbo.getlocaldate(DEFAULT),
    tsm.Updated_By_Id = 1
FROM dbo.SchoolWise_Test_Subject_Marks_Master AS tsm
INNER JOIN dbo.SchoolWise_Test_Master AS stm
    ON stm.SchoolWise_Test_Id = tsm.SchoolWise_Test_Id
   AND stm.academic_year_id = tsm.Academic_Year_Id
INNER JOIN dbo.vw_standard_division AS v
    ON v.SchoolWise_Standard_Division_Id = tsm.Standard_Division_Id
   AND v.academic_year_id = tsm.Academic_Year_Id
WHERE tsm.School_Id = @SchoolId
  AND tsm.Academic_Year_Id = @AcademicYearId
  AND tsm.Is_Deleted = N'N'
  AND stm.Is_Deleted = N'N'
  AND (stm.School_Id IS NULL OR stm.School_Id = @SchoolId)
  AND stm.SchoolWise_Test_Name LIKE N'MONTHLY ASSESSMENT%'
  AND v.School_Id = @SchoolId
  AND v.Standard_Name IN ('6','7','8')

  select * from SchoolWise_Student_Test_Marks