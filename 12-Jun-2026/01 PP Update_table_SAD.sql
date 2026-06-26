Update SAD
   set    Is_Deleted='Y'
          ,Update_Date=dbo.GetLocalDate()
		  ,Updated_By_Id=2
FROM SchoolWise_Attendance_Details SAD
INNER JOIN
(
    SELECT
        Student_Id,
        CAST(Attendance_Date AS DATE) AS Attendance_Date
        ,MAX(SchoolWise_Attendance_Id) AS MinAttendanceId
    FROM SchoolWise_Attendance_Details SAD1
    WHERE SAD1.Is_Deleted = 'N'
      AND SAD1.Standard_Division_Id = 1459
      AND SAD1.School_Id = 18
      AND SAD1.Academic_Year_Id = 57
    GROUP BY
        Student_Id,
        CAST(Attendance_Date AS DATE)
    HAVING COUNT(*) > 1
) S
ON  SAD.Student_Id = S.Student_Id
AND CAST(SAD.Attendance_Date AS DATE) = S.Attendance_Date
WHERE SAD.Is_Deleted = 'N'
AND SAD.School_Id=18
AND SAD.Academic_Year_Id=57
AND SAD.SchoolWise_Attendance_Id <> S.MinAttendanceId
