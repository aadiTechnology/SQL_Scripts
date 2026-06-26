UPDATE SSM
SET SSM.Joining_Date = '2026-04-06'
FROM SchoolWise_Student_Master SSM
INNER JOIN YearWise_Student_Details YSD
    ON SSM.SchoolWise_Student_Id = YSD.Student_Id
INNER JOIN Standard_Master SM
    ON YSD.Standard_Id = SM.Standard_Id
WHERE YSD.Is_New_Student = 1
AND YSD.Academic_Year_ID = 14
AND SM.Standard_Name = 'Nursery'
AND CONVERT(DATE, SSM.Admission_Date) <= CONVERT(Date,'2026-04-06')
AND YSD.Is_Deleted = 'N'
AND SSM.Is_Deleted = 'N'
AND YSD.School_Id = 71
AND SM.Is_Deleted='N'