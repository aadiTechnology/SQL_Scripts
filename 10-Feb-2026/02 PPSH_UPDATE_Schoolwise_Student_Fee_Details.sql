UPDATE SSFD
SET Is_Deleted = 'Y',
	Update_Date = DBO.GetLocalDate(DEFAULT),
	Updated_By_Id = 1
FROM vw_BaseStudentDetails BSD
INNER JOIN YearWise_Student_Details YSD
ON BSD.SchoolWise_Student_Id = YSD.Student_Id
INNER JOIN Schoolwise_Student_Fee_Details SSFD
ON YSD.YearWise_Student_Id = SSFD.Student_Id
INNER JOIN SchoolWise_Academic_Year_Master SAYM
ON YSD.Academic_Year_ID =SAYM.Academic_Year_ID
WHERE YSD.Is_Deleted = 'N'
AND BSD.SchoolLeft_Date IS NOT NULL
AND SSFD.Is_Deleted = 'N'
AND SSFD.[Debit/Credit] = 'DEBIT'
AND SAYM.Is_Deleted = 'N'
AND SSFD.Schoolwise_Student_Fee_Id NOT IN
(
	SELECT SSFD.Student_Fee_Id
	FROM vw_BaseStudentDetails BSD
	INNER JOIN YearWise_Student_Details YSD
	ON BSD.SchoolWise_Student_Id = YSD.Student_Id
	INNER JOIN Schoolwise_Student_Fee_Details SSFD
	ON YSD.YearWise_Student_Id = SSFD.Student_Id
	WHERE YSD.Is_Deleted = 'N'
	AND BSD.SchoolLeft_Date IS NOT NULL
	AND SSFD.Is_Deleted = 'N'
	AND SSFD.[Debit/Credit] = 'CREDIT'
	AND SSFD.Student_Fee_Id <> 0
	AND SSFD.Student_Fee_Id IS NOT NULL
)
