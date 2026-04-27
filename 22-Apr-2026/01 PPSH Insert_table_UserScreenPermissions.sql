DECLARE @tblUsers AS TABLE
(
	User_Id int
)

INSERT INTO @tblUsers
select btd.User_Id
from vw_BaseTeacherDetails btd
inner join User_Master um
on btd.User_Id = um.User_Id
where academic_year_id = 15
and btd.Is_Deleted = 'N'
and btd.school_id = 11
and um.Is_Deleted = 'N'
and um.Is_Locked = 'N'
and um.IsInternalUser = 0
UNION
select btd.User_Id
from vw_BaseSupervisorDetails btd
inner join User_Master um
on btd.User_Id = um.User_Id
where btd.Is_Deleted = 'N'
and btd.school_id = 11
and um.Is_Deleted = 'N'
and um.Is_Locked = 'N'
and um.IsInternalUser = 0

INSERT INTO UserScreenPermissions
SELECT 107,User_Id,'N',0,1,DBO.GetLocalDate(DEFAULT),NULL,NULL
FROM @tblUsers TU
WHERE User_Id NOT IN
(
	SELECT User_Id
	FROM UserScreenPermissions
	WHERE Is_Deleted = 0
	AND Screen_Id = 107
)
