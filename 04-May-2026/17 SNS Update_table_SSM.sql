    UPDATE SSM
       SET SSM.Joining_Date = '2026-04-01'
      FROM SchoolWise_Student_Master SSM
INNER JOIN YearWise_Student_Details YSD
    ON SSM.SchoolWise_Student_Id = YSD.Student_Id
Inner join vw_standard_division vsd
    ON vsd.Standard_Id=YSD.Standard_Id
	AND vsd.Division_Id=YSD.Division_id
WHERE YSD.Is_New_Student = 1
AND YSD.Academic_Year_ID = 13
AND YSD.Is_Deleted = 'N'
AND SSM.Is_Deleted = 'N'
AND YSD.School_Id = 122
AND Standard_Name in('10','11 Sci','11 Com','12 Com','12 Sci','11 Art','12 Art')
