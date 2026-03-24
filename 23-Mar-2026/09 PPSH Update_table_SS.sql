Update  SS
set Value='true'
    ,Update_Date=dbo.GetLocalDate(default)
	,Updated_By_Id=2
from SchoolSettings  SS
where Name like '%IsBiometriceEnabled%'
and  AcademicYearId=14
AND IsDeleted=0
AND SchoolId=11