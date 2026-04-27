Update USA
 set USA.Is_Deleted='Y'
    ,UpdatedById=2
	,UpdatedDate=dbo.GetLocalDate(default)
from UserShiftsAssociation USA
where AcademicYearID=14
And Is_Deleted='N'
AND ShiftId=0
AND SchoolId=11