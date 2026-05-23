BEGIN TRANSACTION;
BEGIN TRY
DECLARE @StudentIds TABLE (
    Id INT IDENTITY(1,1),
    SchoolWiseStudentId INT
);

INSERT INTO @StudentIds (SchoolWiseStudentId)
SELECT bsd.SchoolWise_Student_Id
From vw_BaseStudentDetails BSD 
Inner join YearWise_Student_Details YSD
ON BSD.SchoolWise_Student_Id=YSD.Student_Id
Inner JOIn vw_standard_division VSD
ON VSD.Standard_Id=YSD.Standard_Id
AND YSD.Division_id=VSD.Division_Id
WHERE VSD.Standard_Name='10'
AND YSD.Academic_Year_ID=11
AND YSD.School_Id=122
AND BSD.Is_Deleted='N'
AND YSD.Is_Deleted='N'
AND SchoolLeft_Date is null;

DECLARE @Counter INT = 1;
DECLARE @Total INT;
DECLARE @SchoolWiseStudentId INT;

SELECT @Total = COUNT(*) FROM @StudentIds;

WHILE @Counter <= @Total
BEGIN
    SELECT @SchoolWiseStudentId = SchoolWiseStudentId
    FROM @StudentIds
    WHERE Id = @Counter;

       EXEC [dbo].[usp_DeleteStudent]
        @SchoolId = 122,
        @AcademicYearId = 11,
        @SchoolWise_Student_ID = @SchoolWiseStudentId,
        @Left_Date = '2026-04-28',
        @Permanent_Delete = 'N',
        @IsForm = 0,
        @CancellationFormNo = null,
        @UpdatedById = 2,
        @IsIncludeinBlackList = 0,
        @Comment = '';
	 SET @Counter = @Counter + 1;
 END
 print 'Success'
 COMMIT TRANSACTION;
END TRY

BEGIN CATCH
    PRINT ERROR_Message() 
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
