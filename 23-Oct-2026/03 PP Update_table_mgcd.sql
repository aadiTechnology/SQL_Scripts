update mgcd
set Ending_Marks_Range = 32,
	Actual_Ending_Marks_Range = 32.99,
	Update_Date = dbo.GetLocalDate(default),
	Updated_By_Id = 1
from Marks_Grades_Configuration mgc
inner join Marks_Grades_Configuration_Details mgcd
on mgc.Marks_Grades_Configuration_Id = mgcd.Marks_Grades_Configuration_Id
where mgc.School_Id = 18
and mgc.Academic_Year_Id = 57
and mgc.Is_Deleted = 'N'
and mgcd.Is_Deleted = 'N'
and Starting_Marks_Range = 0
and Ending_Marks_Range = 33