
UPDATE STM
SET Term_Id=1
    ,Update_Date=dbo.GetLocalDate(default)
    ,Updated_By_Id=2
from SchoolWise_Test_Master STM
where academic_year_id=13
And School_Id=122
And Is_Deleted='N'
AND SchoolWise_Test_Name IN ('PA - II')