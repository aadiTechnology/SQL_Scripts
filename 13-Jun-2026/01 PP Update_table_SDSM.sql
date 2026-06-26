Update SDSM
 set Is_Deleted='Y'
     ,Updated_By_Id=1
	 ,Update_Date=dbo.GetLocalDate(default)
from Schoolwise_Division_Subject_Master SDSM
inner join vw_Standard_Division vwsd
on SDSM.Standard_Division_Id =SDSM.Standard_Division_Id
inner join Division_Master DM
on vwsd.Division_Id=DM.Division_Id 
 where SDSM.Is_Deleted='N'
  and SDSM.academic_year_id=57
  and vwsd.className in ('1-F','4-E','10-G')
  and DM.Is_Deleted='N'
  and SDSM.School_Id=18


Update SSDM
 set Is_Deleted='Y'
     ,Update_Date=dbo.GetLocalDate(default)
	 ,Updated_By_Id=1
from SchoolWise_Standard_Division_Master SSDM
inner join vw_standard_division vwsd
on vwsd.SchoolWise_Standard_Division_Id  =SSDM.SchoolWise_Standard_Division_Id  
where SSDM.academic_year_id=57
and SSDM.Is_Deleted='N'
and vwsd.className in ('1-F','4-E','10-G')
and SSDM.School_Id=18