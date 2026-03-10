INSERT INTO UserScreenPermissions
(
Screen_Id,
User_Id,
Can_Edit,
Is_Deleted,
Inserted_By_Id,
Insert_Date
)

SELECT DISTINCT
303,
USGA.UserId,
'N',
0,
2,
dbo.GetLocalDate(DEFAULT)
FROM UsersStaffGroupsAssociation USGA
WHERE USGA.Is_Deleted = 'N'
AND USGA.SchoolId = 71
AND USGA.Is_Locked = 0
AND NOT EXISTS
(
    SELECT 1
    FROM UserScreenPermissions USP
    WHERE USP.User_Id = USGA.UserId
    AND USP.Screen_Id = 303
    AND USP.Is_Deleted = 0
)