BEGIN TRANSACTION;
BEGIN TRY

DECLARE @StudentIds TABLE (
    Id INT IDENTITY(1,1),
    SchoolWiseStudentId INT,
	YearWise_Student_Id INT
);

-- Insert correct data
INSERT INTO @StudentIds (SchoolWiseStudentId, YearWise_Student_Id)
SELECT bsd.SchoolWise_Student_Id, YSD.YearWise_Student_Id
FROM vw_BaseStudentDetails bsd
 Inner join  YearWise_Student_Details YSD
 on bsd.SchoolWise_Student_Id=YSD.Student_Id
INNER JOIN Standard_Master SM 
    ON YSD.Standard_Id = SM.Standard_Id
WHERE YSD.Is_Deleted = 'N'
  AND YSD.Academic_Year_ID = 57
  AND YSD.School_Id = 18
  AND SM.Is_Deleted = 'N'
  AND SM.Standard_Name = '9'
  AND YSD.Is_RTE_Student = 1
  AND YSD.Is_New_Student = 0;

DECLARE @Counter INT = 1;
DECLARE @Total INT;
DECLARE @SchoolWiseStudentId INT;
declare @YearWise_Student_Id INT

SELECT @Total = COUNT(*) FROM @StudentIds;

WHILE @Counter <= @Total
BEGIN
    SELECT @SchoolWiseStudentId = SchoolWiseStudentId, @YearWise_Student_Id = YearWise_Student_Id
    FROM @StudentIds
    WHERE Id = @Counter;

      IF EXISTS (
        SELECT 1 
        FROM Student_Caution_Money_Details
        WHERE Schoolwise_Student_Id = @SchoolWiseStudentId
		AND Is_Deleted=0
		AND School_Id=18
    )
    BEGIN
     
        UPDATE Student_Caution_Money_Details
        SET Amount = 80000, 
            Update_Date = GETDATE(),
			Updated_By_Id=2
        WHERE Schoolwise_Student_Id = @SchoolWiseStudentId
		AND Is_Deleted=0

    END
    ELSE
    BEGIN
        EXEC usp_InsertCautionMoneyDetails 
            @iSchoolId = 18,
            @iAcadmicYearId = 57,
            @iStandardId = 1109, 
            @iYearwiseStudentId = @YearWise_Student_Id,
            @iInsertedByid = 2;
    END

   Update YearWise_Student_Details
		  set Is_RTE_Student=0,
			  RTECategoryId = 0
		  Where Student_Id=@SchoolWiseStudentId
		  AND Is_Deleted='N'
		  AND Academic_Year_ID=57
		  and YearWise_Student_Id = @YearWise_Student_Id

    SET @Counter = @Counter + 1;
END

PRINT 'Success';
COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;