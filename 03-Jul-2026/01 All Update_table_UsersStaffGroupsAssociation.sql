update UsersStaffGroupsAssociation
set Is_Deleted = 'Y'
where StaffGroupsId = 0
and Is_Deleted = 'N'