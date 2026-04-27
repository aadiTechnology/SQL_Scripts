UPDATE BSD
SET BSD.Joining_Date = 
    CASE 
        WHEN CONVERT(DATE, BSD.Admission_Date) <= '2026-03-24' 
            THEN '2026-03-24'
        ELSE CONVERT(DATE, BSD.Admission_Date)
    END
FROM vw_BaseStudentDetails BSD
INNER JOIN YearWise_Student_Details YSD
    ON BSD.SchoolWise_Student_Id = YSD.Student_Id
WHERE YSD.Is_New_Student = 1
AND YSD.Academic_Year_ID = 14
AND YSD.Is_Deleted = 'N'
AND BSD.Is_Deleted = 'N'
AND YSD.School_Id = 71