Update USP
SET Can_Edit='Y'
    ,Update_By_Id=2
    ,Update_Date=dbo.GetLocalDate(default)
from UserScreenPermissions USP
where User_Id IN (321,743,2664,5175) 
and Screen_Id=101
AND UserScreenPermission_Id In(15215,15606,16568,15357)
AND Can_Edit='N'