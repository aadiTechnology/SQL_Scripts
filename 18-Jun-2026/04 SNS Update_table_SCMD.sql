Update SCMD
Set SCMD.Is_Deleted=1
    ,Update_Date=dbo.GetLocalDate(default)
    ,Updated_By_Id=2
from Student_Caution_Money_Details SCMD
Inner join vw_BaseStudentDetails BSD
ON SCMD.Schoolwise_Student_Id=BSD.SchoolWise_Student_Id
Inner Join YearWise_Student_Details YSD
ON YSD.Student_Id=BSD.SchoolWise_Student_Id
Inner join vw_standard_division vsd
On vsd.Standard_Id=ysd.Standard_Id
And vsd.Division_Id=ysd.Division_id
where YSd.Academic_Year_ID=13
AND YSD.School_Id=122
AND SCMD.Is_Deleted=0
AND BSD.Is_Deleted='N'
AND YSD.Is_Deleted='N'
AND Standard_Name In('11 Sci','11 Com','11 Art')