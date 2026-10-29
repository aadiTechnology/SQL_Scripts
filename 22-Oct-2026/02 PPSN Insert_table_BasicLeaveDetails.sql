update ULYC
set LeaveBalance = LeaveBalance + 3,
	UpdateDate = dbo.GetLocalDate(default),
	UpdatedById = 1
from UserLeavesYearwiseConfiguration ULYC
inner join UsersStaffGroupsAssociation usga
on ULYC.UserId = usga.UserId
WHERE ULYC.Is_Deleted = 'N'
AND LeaveId = 22
AND YEAR = 22
and usga.Is_Deleted = 'N'
and usga.Is_Locked = 0

insert into BasicLeaveDetails
select bld.BasicLeaveConfigId,null,22,3, case when monthid = 10 then 180 else 0 end,0
from BasicLeaveMaster blm
inner join BasicLeaveDetails bld
on blm.Id = bld.BasicLeaveConfigId
where blm.IsDeleted = 0
and bld.IsDeleted = 0
and bld.LeaveId = 9
and bld.UserId is null
order by StaffGroupsId