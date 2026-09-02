BEGIN TRANSACTION;

BEGIN TRY

    DECLARE @StudentIds TABLE
    (
        Id INT IDENTITY(1,1),
        SchoolwiseStudentId INT
    );

    INSERT INTO @StudentIds(SchoolwiseStudentId)
    SELECT BSD.SchoolWise_Student_Id
    FROM YearWise_Student_Details YSD
    INNER JOIN vw_BaseStudentDetails BSD 
        ON BSD.SchoolWise_Student_Id = YSD.Student_Id
    INNER JOIN vw_standard_division VSD 
        ON YSD.Standard_Id = VSD.Standard_Id 
        AND YSD.Division_Id = VSD.Division_Id
    WHERE YSD.Academic_Year_ID = 1
        AND YSD.School_Id = 173
        AND BSD.Is_Deleted = 'N'
        AND YSD.Is_Deleted = 'N'
        AND(StudentName LIKE '%Miss Advika Mahendra Gaikwad%'
            OR StudentName LIKE '%Miss Shivanya Ganesh Gaikwad%'
            OR StudentName LIKE '%Master Krushnaraj Vinayak Gaikwad%'
            OR StudentName LIKE '%Master Nilraj Ramchandra Gaikwad%'
            OR StudentName LIKE '%Master Shreyansh Mahesh Jagtap%'
            OR StudentName LIKE '%Miss Preesha Sham Kadam%'
            OR StudentName LIKE '%Miss Shivanya Rajendra Petkar%'
            OR StudentName LIKE '%Master Junaid Enus Pathan%'
            OR StudentName LIKE '%Master Shrinil Bajirao Kanawade%'
            OR StudentName LIKE '%Master Yadwik Mangesh Gaikwad%'
            OR StudentName LIKE '%Master Kartik Shyamrao Markad%'
            OR StudentName LIKE '%Master Shlok Dhananjay Gaikwad%'
            OR StudentName LIKE '%Master Arush Ganesh Godage%'
            OR StudentName LIKE '%Miss Avira Akash Gaikwad%'
            OR StudentName LIKE '%Master Abhay Baliram Sagar%'
            OR StudentName LIKE '%Master Shrihari Ravi Chakali%'
            OR StudentName LIKE '%Miss Trisha Dhammaraj Gawai%'
            OR StudentName LIKE '%Master Devansh Tukaram Jagtap%'
            OR StudentName LIKE '%Master Harshad Eknath Solankar%'
            OR StudentName LIKE '%Master Rajvir Amol Shinde%'
            OR StudentName LIKE '%Master Advik Machhindra Undre%'
            OR StudentName LIKE '%Miss Aiza Sahil Pathan%'
            OR StudentName LIKE '%Miss Anvi Navnath Bhalsing%'
            OR StudentName LIKE '%Miss Shirsha Nilesh Gaikwad%'
            OR StudentName LIKE '%Miss Durva Dipak Phatangare%'
            OR StudentName LIKE '%Master Anshuman Tanaji Modak%'
            OR StudentName LIKE '%Master Samarth Nilesh Gaikwad%'
            OR StudentName LIKE '%Master Shambhu Mhasku Gaikwad%'
            OR StudentName LIKE '%Master Anuraj Nagnath Nagane%'
        );

    DECLARE @Counter INT = 1;
    DECLARE @Total INT;
    DECLARE @SchoolwiseStudentId INT;

    SELECT @Total = COUNT(*) FROM @StudentIds;

    PRINT 'Total Students Found: ' + CAST(@Total AS VARCHAR(10));

    WHILE @Counter <= @Total
    BEGIN
        SELECT @SchoolwiseStudentId = SchoolwiseStudentId
        FROM @StudentIds
        WHERE Id = @Counter;

        EXEC usp_SaveRTEStudents
            @SchoolId = 173,
            @AcademicYearId = 1,
            @UpdatedById = 1,
            @StudentId = @SchoolwiseStudentId,
            @Is_RTE_Student = 1;

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