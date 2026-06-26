UPDATE IFD
SET PaidDate = '2026-06-16',
    UpdateDate = dbo.GetLocalDate(DEFAULT),
    UpdatedById = 2
FROM InternalFeeDetails IFD
INNER JOIN vw_BaseStudentDetails BSD
    ON BSD.SchoolWise_Student_Id = IFD.SchoolWise_Student_Id
INNER JOIN YearWise_Student_Details YSD
    ON YSD.Student_Id = BSD.SchoolWise_Student_Id
	AND YSD.Academic_Year_ID = IFD.AcademicYearId
INNER JOIN vw_standard_division VSD
    ON VSD.Standard_Id = YSD.Standard_Id
   AND VSD.Division_Id = YSD.Division_Id   
WHERE VSD.Standard_Name IN ('5','6','7','8','9')
  AND YSD.Academic_Year_ID = 15
  AND IFD.Fee_Type = 'STEM Education registration fee'
  AND IFD.[Debit/Credit] = 'Debit'
  AND IFD.SchoolId = 11
  AND IFD.Is_Deleted = 0
  AND BSD.Is_Deleted = 'N'
  AND YSD.Is_Deleted = 'N';

Update SDEL
   SEt Paid_Date='2026-06-16'
       ,Update_Date=dbo.GetLocalDate(default)
	   ,Updated_By_Id=2
from Schoolwise_Debit_Entry_Log SDEL
INNER JOIN Standard_Master SM
On SM.Standard_Id =SDEL.Standard_Id
Where SDEL.Academic_Year_Id=15
And SDEL.School_Id=11
AND SDEL.Is_Deleted='N'
And Fee_Type='STEM Education registration fee'
AND Standard_Name IN ('5','6','7','8','9')