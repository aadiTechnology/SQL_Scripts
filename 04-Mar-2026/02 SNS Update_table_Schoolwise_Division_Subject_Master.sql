UPDATE SDSM
SET Total_Consideration = 'N'
from Schoolwise_Division_Subject_Master SDSM
inner join Subject_Master sm
on sdsm.Subject_Id = sm.Subject_Id
inner join vw_standard_division vsd
on sdsm.Standard_Division_Id = vsd.SchoolWise_Standard_Division_Id
where sm.School_Id = 122
and sm.academic_Year_Id = 11
and sm.Is_Deleted = 'n'
and sm.Subject_Name = 'Skill IT/AI'
and vsd.Standard_Name = '9'