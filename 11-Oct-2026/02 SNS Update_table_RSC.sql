 Update RSC
 Set Charges=7700,
     UpdateDate=dbo.GetLocalDate(default)
    ,UpdatedById=1
from RolewiseStopCharges RSC
Inner Join Transport.StopMaster SM
ON RSC.StopId=SM.StopId
where AcademicYearId=14
AND Sm.SchoolId=122
AND IsDeleted=0
AND RoleId=3
AND StopName IN ('City (SS)')
 
 Update RSC
    Set Charges=14500,
        UpdateDate=dbo.GetLocalDate(default)
       ,UpdatedById=1
from RolewiseStopCharges RSC
Inner Join Transport.StopMaster SM
ON RSC.StopId=SM.StopId
where AcademicYearId=14
AND Sm.SchoolId=122
AND IsDeleted=0
AND RoleId=3
AND StopName IN ('Gandhinagar (SS)','Hupari (SS)','Kagal (SS)')

Update RSC
   Set Charges=11500,
       UpdateDate=dbo.GetLocalDate(default)
      ,UpdatedById=1
from RolewiseStopCharges RSC
Inner Join Transport.StopMaster SM
ON RSC.StopId=SM.StopId
where AcademicYearId=14
AND Sm.SchoolId=122
AND IsDeleted=0
AND RoleId=3
AND StopName IN ('Outside City (SS)')
