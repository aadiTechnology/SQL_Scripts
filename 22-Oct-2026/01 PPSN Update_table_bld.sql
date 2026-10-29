update bld
set BasicLeaves = 3,
AccumulateLeaves = 180
from BasicLeaveMaster blm
inner join BasicLeaveDetails bld
on blm.Id = bld.BasicLeaveConfigId
where blm.IsDeleted = 0
and bld.IsDeleted = 0
and blm.MonthId = 10
and bld.LeaveId = 22
and bld.BasicLeaves <> 3

update bld
set BasicLeaves = 3
from BasicLeaveMaster blm
inner join BasicLeaveDetails bld
on blm.Id = bld.BasicLeaveConfigId
where blm.IsDeleted = 0
and bld.IsDeleted = 0
and blm.MonthId = 4
and bld.LeaveId = 22
and bld.BasicLeaves <> 3