Update USP
SET Can_Edit='Y'
    ,Update_By_Id=2
    ,Update_Date=dbo.GetLocalDate(default)
from UserScreenPermissions USP
where User_Id=266 
and Screen_Id=101
AND UserScreenPermission_Id=15767