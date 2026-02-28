DECLARE @SchoolId INT,
		@AcademicYearId INT

select @SchoolId=SchoolId 
from SchoolSettings
where IsDeleted = 0

SELECT @AcademicYearId = Academic_Year_ID
FROM SchoolWise_Academic_Year_Master
WHERE School_Id = @SchoolId
AND Is_Current_Year = 'Y'
AND Is_Deleted = 'N'

INSERT INTO ConfigMenuAssociatedClasses
select Original_Standard_Id,Original_Division_Id, cm.ConfigureMenuId,0,@SchoolId,1,DBO.GetLocalDate(DEFAULT)
FROM ConfigureMenu CM
INNER JOIN UserRolewiseConfiguredMenuDetails URCMD
ON CM.ConfigureMenuId = URCMD.ConfiguredMenuId
cross join
(
	select Original_Standard_Id, Original_Division_Id
	from vw_standard_division
	where School_Id = @SchoolId
	and academic_year_id = @AcademicYearId
)S
WHERE CM.Is_Active = 'Y'
  AND CM.IsDeleted = 0
  AND URCMD.UserRoleId = 3