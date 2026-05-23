UPDATE SSFD
SET SSFD.Is_Deleted = 'Y'
    ,Update_Date=dbo.GetLocalDate(default)
	,Updated_By_Id=2
FROM Schoolwise_Student_Fee_Details SSFD
INNER JOIN YearWise_Student_Details YSD 
    ON YSD.YearWise_Student_Id = SSFD.Student_Id
WHERE YSD.Academic_Year_ID = 4
  AND YSD.School_Id = 166
  AND YSD.Is_RTE_Student = 1
  AND YSD.Is_Deleted = 'N'
  AND SSFD.Is_Deleted = 'N';

insert into Schoolwise_Student_Fee_Details
 select Yearwise_Student_Id, 'Do Not Pay',SchoolWise_Standard_Division_Id, 0,'Do Not Pay',1,'Debit','2027-03-31 00:00:00.000',NULL,NULL,
 0,NULL,'N',NULL,NULL,0,0,0,166,4,'N','N',NULL,0,0,'N',dbo.GetLocalDate(default),2,NULL,NULL,NULL,NULL,0,'2026-04-01 00:00:00','2027-03-31 00:00:00'
 ,NULL,NULL,0,NULL,NULL
 from YearWise_Student_Details YSD
 inner join vw_standard_division vw_sd
 on vw_sd.Standard_Id=YSD.Standard_Id
 and vw_sd.Division_Id=YSD.Division_id
 where YSD.Academic_Year_ID=4
 and YSD.School_Id=166
 and Is_RTE_Student=1
 and YSD.Is_Deleted='N'
 
