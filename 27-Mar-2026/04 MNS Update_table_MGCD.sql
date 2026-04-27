Update MGCD
SET MGCD.Grade_Name='E'
   ,MGCD.Remarks='Needs Significant Improvement'
from Marks_Grades_Configuration_Details MGCD
INNER JOIN Marks_Grades_Configuration MGC
ON MGC.Marks_Grades_Configuration_Id=MGCD.Marks_Grades_Configuration_Id
Where School_Id=123
And Academic_Year_Id=10
AND MGCD.Is_Deleted='N'
AND MGC.Is_Deleted='N'
 AND MGCD.Grade_Name IN ('Fail', 'E')