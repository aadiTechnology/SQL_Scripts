UPDATE YSD2
SET 
    YSD2.Is_Deleted='Y'
	,YSD2.Update_date=dbo.GetLocalDate(default)
	,Updated_By_id=2
FROM YearWise_Student_Details YSD2
INNER JOIN (
    SELECT 
        YSD.Student_Id,
        YSD.Division_Id
    FROM YearWise_Student_Details YSD
    INNER JOIN vw_standard_division VSD
        ON VSD.Standard_Id = YSD.Standard_Id
		AND VSD.Division_Id=YSD.Division_id
    WHERE YSD.Academic_Year_ID = 10
    AND VSD.Standard_Name = '10'
    AND YSD.Is_Deleted = 'N'
    AND YSD.School_Id =137
) YSD1
ON YSD2.Student_Id = YSD1.Student_Id 
WHERE YSD2.Academic_Year_ID =  11
AND YSD2.School_Id = 137
AND YSD2.Is_Deleted='N'

