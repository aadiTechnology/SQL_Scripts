UPDATE MGCD
SET Starting_Marks_Range = CASE Grade_Name
        WHEN 'A' THEN 90
        WHEN 'B' THEN 70
        WHEN 'C' THEN 50
        WHEN 'D' THEN 33
        WHEN 'E' THEN 0
    END,
    Ending_Marks_Range = CASE Grade_Name
        WHEN 'A' THEN 100
        WHEN 'B' THEN 89
        WHEN 'C' THEN 69
        WHEN 'D' THEN 49
        WHEN 'E' THEN 32
    END,
    Actual_Ending_Marks_Range = CASE Grade_Name
        WHEN 'A' THEN 100
        WHEN 'B' THEN 89.99
        WHEN 'C' THEN 69.99
        WHEN 'D' THEN 49.99
        WHEN 'E' THEN 32.99
    END
FROM Marks_Grades_Configuration_Details MGCD
INNER JOIN Marks_Grades_Configuration MGC
    ON MGC.Marks_Grades_Configuration_Id = MGCD.Marks_Grades_Configuration_Id
INNER JOIN Standard_Master SM
    ON SM.Standard_Id = MGC.Standard_Id
WHERE SM.Standard_Name IN ('1','2','3','4')
AND SM.School_Id = 166
AND SM.Academic_Year_Id = 3
AND MGCD.Is_Deleted = 'N'
AND MGC.Is_Deleted = 'N'
AND SM.Is_Deleted = 'N'