Update LACD
set ReportingUserId=2719
    ,UpdatedById=2
	,UpdateDate=dbo.GetLocalDate(default)
From LeaveApprovalConfigurationDetails LACD
where ReportingUserId=326 
AND IsDeleted=0
AND LACD.IsDeleted=0
And academicyearid=57
AND LACD.SchoolId=18

