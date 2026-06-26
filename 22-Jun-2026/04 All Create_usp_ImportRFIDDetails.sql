-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Sweety Jadhav
-- Create date: 12/06/2026
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ImportRFIDDetails]
	-- Add the parameters for the stored procedure here
	 @SchoolId INT,
     @UpdatedById Int,
     @StudentDetails XML,
	 @AcademicYearId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

   DECLARE @tblRFIDDetails TABLE
    (
        Id INT IDENTITY(1,1),
        EnrolmentNo NVARCHAR(50),
        RFID NVARCHAR(500)
    )

    INSERT INTO @tblRFIDDetails
    (
        EnrolmentNo,
        RFID
    )
    SELECT
        T.c.value('./@EnrolmentNo','NVARCHAR(50)'),
        T.c.value('./@RFID','NVARCHAR(500)')
    FROM @StudentDetails.nodes('StudentRFIDDetails/StudentRFIDDetails') T(c)

    BEGIN TRANSACTION
    BEGIN TRY

        
        UPDATE SAD
           SET SAD.RFID = RFIDDetails.RFID
		       ,SAD.UpdatedById=@UpdatedById
        FROM StudentAdditionalDetails SAD
        INNER JOIN SchoolWise_Student_Master SWSM
                ON SAD.SchoolwiseStudentId = SWSM.SchoolWise_Student_Id
               AND SAD.SchoolId = SWSM.School_Id
		Inner JOIN YearWise_Student_Details YSD
		       ON YSD.Student_Id= SWSM.SchoolWise_Student_Id
        INNER JOIN @tblRFIDDetails RFIDDetails
                ON SWSM.Enrolment_Number = RFIDDetails.EnrolmentNo
        WHERE SWSM.Is_Deleted = 'N'
          AND SAD.IsDeleted = 0
          AND SWSM.School_Id = @SchoolId
		  And YSd.Academic_Year_id=@AcademicYearId

 COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
  END CATCH   

END
GO
