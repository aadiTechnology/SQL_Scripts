  Update SSFD 
       set Amount= 4620
	      ,Updated_By_Id=2
		  ,Update_Date=dbo.GetLocalDate(default)
       from  Schoolwise_Student_Fee_Details SSFD
		 inner Join YearWise_Student_Details YSD
		 on SSFD.Student_Id =YSD.YearWise_Student_Id 
		 inner join Standard_Master SM
		 on SM.Standard_Id=YSD.Standard_Id
		 where SM.Is_Deleted='N'
		  and SSFD.Is_Deleted='N'
		  and YSD.Is_Deleted ='N'
		  AND Payable_For='Installment - 1'
		  and  [Debit/Credit]='Debit'
		  and SSFD.Fee_Type='Tuition Fees'
		  and  YSD.Academic_Year_Id=4
		  and  YSD.School_Id=165
		  and SM.Standard_Name  IN ('1','2','3','4','5','6','7','8','9','10')

INSERT INTO StandardwiseFeeInstallmentDetails
(
    StandardId,
    OriginalFeeTypeId,
    IntervalName,
    Amount,
    IsForNewStudent,
    SchoolId,
    AcademicYearId,
    IsDeleted,
    InsertDate,
    InsertedById
)
SELECT 
      SM.Standard_Id,
      4,
      'Installment - 1' AS IntervalName,
      4620 AS Amount,
      1 ,
      165 ,
      4 ,
      0,
      dbo.GetLocalDate(default),
      2
FROM Standard_Master SM
WHERE SM.Standard_Name IN ('1','2','3','4','5','6','7','8','9','10')
  AND SM.Is_Deleted = 'N'
  AND SM.academic_Year_Id=4
  And SM.School_Id=165


