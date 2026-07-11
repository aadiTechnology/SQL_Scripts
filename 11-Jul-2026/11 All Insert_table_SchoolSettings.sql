DECLARE @Key NVARCHAR(100),
		@Value NVARCHAR(100),
		@PossibleValues NVARCHAR(1000),
		@Description NVARCHAR(1000)
		
SET @Key = 'ForceStudentToSubmitMandatoryFields'	
SET @Value = 'false'	

SET @PossibleValues = 'true, false'
SET @Description = 'It is to force student to submit mandatory fields.'

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
		   GETDATE(),
		   1,
		   null,
		   null
	
	DELETE FROM @tblSettings
	WHERE SchoolId = @SchoolId and AcademicYearId = @AcademicYearId	
END

