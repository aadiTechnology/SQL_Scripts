update um
set SignImage = ss.signimage
from User_Master UM
inner join
(
select userid, signimage 
from SignImages_temp
where userid <> 420
)ss
on um.User_Id = ss.UserId