Update UM
SET Is_Locked='N'
    ,Update_Date=dbo.GetLocalDate(default)
	,Updated_By_Id=2
from User_Master UM
inner join OtherStaff OS
on UM.User_Id=OS.UserId
inner join UserBasicDetails UBD
on UM.User_Id=UBD.UserId
where UM.Is_Deleted='N'
AND OS.Is_Deleted='N'
AND UBD.IsDeleted=0
AND UM.Is_Locked='Y'

 
