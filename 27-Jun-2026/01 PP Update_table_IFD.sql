UPDATE IFD
SET IFD.IsConsiderForOnlinePayment=0
FROM InternalFeeDetails IFD
INner Join vw_BaseStudentDetails BSD
On BSD.SchoolWise_Student_Id=IFD.Schoolwise_Student_Id
INner Join YearWise_Student_Details YSD 
ON YSD.Student_Id=BSD.SchoolWise_Student_Id
AND IFD.AcademicYearId=YSD.Academic_Year_ID
Inner join Standard_Master SM
On SM.Standard_Id=YSD.Standard_Id
where SM.Is_Deleted='N'
AND YSD.Is_Deleted='N'
AND BSD.Is_Deleted='N'
AND YSD.Academic_Year_ID=57
AND YSD.School_Id=18
AND Standard_Name ='10'
AND [Debit/Credit]='Debit'
AND IFD.IsConsiderForOnlinePayment=1
AND Fee_Type in ('International Computer Science Olympiad(ICSO)','International English Olympiad (IEO)'
      , 'International General Knowledge Olympiad(IGKO)','International Hindi Olympiad (IHO)','International Maths Olympiad (IMO)','International Social Studies Olympiad(ISSO)'
	  ,'National Science Olympiad (NSO)')
 AND NOT EXISTS (
      SELECT 1
      FROM InternalFeeDetails IFD2
      WHERE IFD2.FeeDetailsID = IFD.InternalFeeDetailsId
	    AND IFD2.Schoolwise_Student_Id=IFD.Schoolwise_Student_Id
        AND IFD2.[Debit/Credit] = 'Credit'
        AND IFD2.Is_Deleted = 0
		AND IFD.AcademicYearId=57);