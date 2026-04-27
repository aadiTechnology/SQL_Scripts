Declare @Division_ID int

Select @Division_ID=Division_Id
from vw_standard_division 
where className ='10-G' 
And academic_year_id=57

UPDATE YSD2
SET 
    YSD2.Division_Id = @Division_ID,
    YSD2.Is_Deleted = 'N'
FROM YearWise_Student_Details YSD2
INNER JOIN (
    SELECT 
        YSD.Student_Id,
        YSD.Division_Id
    FROM YearWise_Student_Details YSD
    INNER JOIN vw_standard_division VSD
        ON VSD.Standard_Id = YSD.Standard_Id
		AND VSD.Division_Id=YSD.Division_id
    WHERE YSD.Academic_Year_ID = 56
    AND VSD.Standard_Name = '10'
    AND YSD.Is_Deleted = 'N'
    AND YSD.School_Id = 18
) YSD1
ON YSD2.Student_Id = YSD1.Student_Id 
WHERE YSD2.Academic_Year_ID =  57 
AND YSD2.School_Id = 18;

