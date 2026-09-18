DECLARE @Key NVARCHAR(100),
		@Value NVARCHAR(100),
		@PossibleValues NVARCHAR(1000),
		@Description NVARCHAR(1000)
		
SET @Key = 'NewUIAPIURL'	
SET @Value = 'http://localhost:44307/School/GenerateReport'	

SET @PossibleValues = ''
SET @Description = 'This key is used set web API URL.'

DECLARE @tblSettings AS TABLE
(
	SchoolId INT,
	AcademicYearId INT
)

DECLARE @SchoolId INT,
		@AcademicYearId INT 

INSERT INTO @tblSettings
select distinct SchoolId, AcademicYearId
from schoolsettings
where isdeleted = 0

WHILE EXISTS
(
	SELECT TOP 1 1
	FROM @tblSettings
)
BEGIN
	SELECT TOP 1 @SchoolId = SchoolId, @AcademicYearId = AcademicYearId
	FROM @tblSettings
	ORDER BY AcademicYearId
	
	INSERT INTO SchoolSettings
	SELECT @Key,
		   @Value,
		   0,
		   @SchoolId,
		   @AcademicYearId,
		   @PossibleValues,
		   @Description,
		   dbo.GetLocalDate(DEFAULT),
		   1,
		   null,
		   null
	
	DELETE FROM @tblSettings
	WHERE SchoolId = @SchoolId and AcademicYearId = @AcademicYearId	
END

