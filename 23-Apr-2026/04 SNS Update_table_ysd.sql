update ysd
set Is_Deleted = 'Y',
	Update_date = dbo.GetLocalDate(default),
	Updated_By_id = 1
from YearWise_Student_Details ysd
inner join vw_standard_division vsd
on ysd.Standard_Id = vsd.Standard_Id
and ysd.Division_id = vsd.Division_Id
where ysd.Is_Deleted = 'N'
and ysd.Academic_Year_ID = 13
and ysd.Student_Id IN
(
	select ysd.Student_Id
	from YearWise_Student_Details ysd
	inner join vw_standard_division vsd
	on ysd.Standard_Id = vsd.Standard_Id
	and ysd.Division_id = vsd.Division_Id
	where ysd.Is_Deleted = 'N'
	and ysd.Academic_Year_ID = 11
	and vsd.Standard_Name = '10'
	and Division_Name = 'Y'
)

update ysd
set Is_Deleted = 'Y',
	Update_date = dbo.GetLocalDate(default),
	Updated_By_id = 1
from YearWise_Student_Details ysd
inner join vw_standard_division vsd
on ysd.Standard_Id = vsd.Standard_Id
and ysd.Division_id = vsd.Division_Id
where ysd.Is_Deleted = 'N'
and ysd.Academic_Year_ID = 13
and ysd.Student_Id IN
(
	select ysd.Student_Id
	from YearWise_Student_Details ysd
	inner join vw_standard_division vsd
	on ysd.Standard_Id = vsd.Standard_Id
	and ysd.Division_id = vsd.Division_Id
	where ysd.Is_Deleted = 'N'
	and ysd.Academic_Year_ID = 11
	and vsd.Standard_Name like '12 %'
	and Division_Name = 'Y'
)