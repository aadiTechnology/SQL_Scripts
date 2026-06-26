DECLARE @Key NVARCHAR(100),
		@Value NVARCHAR(100),
		@PossibleValues NVARCHAR(1000),
		@Description NVARCHAR(1000)
		
SET @Key = 'EnableLeaveMessageNotification'	
SET @Value = 'true'	

SET @PossibleValues = 'true,false'
SET @Description = 'Enable or disable message notifications for the Leave screen.'

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
