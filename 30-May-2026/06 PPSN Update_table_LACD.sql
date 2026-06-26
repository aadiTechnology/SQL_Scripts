Update LACD
    Set IsDeleted=1
       ,UpdateDate=dbo.GetLocalDate(default)
	   ,UpdatedById=2
   from LeaveApprovalConfigurationDetails LACD
Inner Join vw_AllPayrollUsers APU
	 ON LACD.UserId=APU.USerId
 Where APU.UserRoleId=2
	AND APU.SchoolId=71
	AND APU.AcademicYearId=14
	AND APU.Is_Deleted='N'
	AND LACD.IsDeleted=0

