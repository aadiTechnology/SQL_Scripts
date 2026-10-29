Update SAD
   set    Is_Deleted='Y'
          ,Update_Date=dbo.GetLocalDate(default)
		  ,Updated_By_Id=2
FROM SchoolWise_Attendance_Details SAD
INNER JOIN
(
    SELECT
        Student_Id,
        CAST(Attendance_Date AS DATE) AS Attendance_Date,
        Is_Present,
        MIN(SchoolWise_Attendance_Id) AS MinAttendanceId
    FROM SchoolWise_Attendance_Details SAD1
    WHERE SAD1.Is_Deleted = 'N'
      AND SAD1.Standard_Division_Id = 1250
      AND SAD1.School_Id = 71
      AND SAD1.Academic_Year_Id = 14
    GROUP BY
        Student_Id,
        CAST(Attendance_Date AS DATE),
        Is_Present
    HAVING COUNT(*) > 1
) S
ON  SAD.Student_Id = S.Student_Id
AND CAST(SAD.Attendance_Date AS DATE) = S.Attendance_Date
AND SAD.Is_Present = S.Is_Present
WHERE SAD.Is_Deleted = 'N'
AND SAD.School_Id=71
AND SAD.Academic_Year_Id=14
AND SAD.Standard_Division_Id = 1250
AND SAD.SchoolWise_Attendance_Id <> S.MinAttendanceId