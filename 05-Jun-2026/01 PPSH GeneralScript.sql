BEGIN TRANSACTION;
BEGIN TRY
DECLARE @StudentIds TABLE(Id INT IDENTITY(1,1),SchoolwiseStudentId INT);

INSERT INTO @StudentIds(SchoolwiseStudentId)
SELECT BSD.SchoolWise_Student_Id
FROM YearWise_Student_Details YSD
INNER JOIN vw_BaseStudentDetails BSD 
ON BSD.SchoolWise_Student_Id=YSD.Student_Id
INNER JOIN vw_standard_division VSD 
ON YSD.Standard_Id=VSD.Standard_Id AND YSD.Division_Id=VSD.Division_Id
WHERE YSD.Academic_Year_ID=15
AND YSD.School_Id=11
AND BSD.Is_Deleted='N'
AND YSD.Is_Deleted='N'
AND VSD.Standard_Name='1'
AND BSD.Enrolment_Number in  ( '4235' ,'4236','4237','4238','4239','4240','4241','4242','4243','4244','4245', '4246');

DECLARE @Counter INT=1;
DECLARE @Total INT;
DECLARE @SchoolwiseStudentId INT;

SELECT @Total=COUNT(*) FROM @StudentIds;

WHILE @Counter<=@Total
BEGIN
SELECT @SchoolwiseStudentId=SchoolwiseStudentId
FROM @StudentIds
WHERE Id=@Counter;

EXEC usp_SaveRTEStudents
@SchoolId=11,
@AcademicYearId=15,
@UpdatedById=1155,
@StudentId=@SchoolwiseStudentId,
@Is_RTE_Student=1;

SET @Counter=@Counter+1;
END

PRINT 'Success';
COMMIT TRANSACTION;
END TRY
BEGIN CATCH
PRINT ERROR_MESSAGE();
ROLLBACK TRANSACTION;
THROW;
END CATCH;