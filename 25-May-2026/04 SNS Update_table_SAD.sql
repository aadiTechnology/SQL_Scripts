UPDATE SAD
Set  SAD.RFID =''
FROM vw_BaseStudentDetails bsd
INNER JOIN YearWise_Student_Details YSD
    ON bsd.SchoolWise_Student_Id = YSD.Student_Id
INNER JOIN vw_standard_division vsd
    ON vsd.Standard_Id = YSD.Standard_Id
   AND vsd.Division_Id = YSD.Division_Id
INNER JOIN StudentAdditionalDetails SAD 
    ON SAD.SchoolwiseStudentId = bsd.SchoolWise_Student_Id
WHERE vsd.Standard_Name IN ('7','8','9','10', '11 Sci', '11 Com', '11 Art', '12 Sci', '12 Com', '12 Art')
AND YSD.Academic_Year_ID=13
AND YSD.Is_Deleted='N'
AND BSD.Is_Deleted='N'
AND SAD.IsDeleted=0