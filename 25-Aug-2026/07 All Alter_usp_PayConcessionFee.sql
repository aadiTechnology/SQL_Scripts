/****** Object:  StoredProcedure [dbo].[usp_PayConcessionFee]    Script Date: 8/25/2025 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Pravin Shinde
-- Create date: 17-Jul-13
-- Description:	This procedure is used to pay concession fee of student. And will be called from usp_PayStudentFee
-- =============================================
ALTER PROCEDURE [dbo].[usp_PayConcessionFee]
@StudentPayFeeXML XML,	
@ReceiptNumber INT,
@SchoolId INT,
@AcademicYearId INT,
@InsertedById INT,
@PaymentType INT,
@MaxSerialNumber INT,
@SchoolwiseStudentFeeId INT,
@ActualAmt INT,
@LastInsertedStudentFeeId INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Payment Types :: CashPayment = ~0, ChequePayment = 1, PDC = 2, Swipcard = 3, Electronic Payment = 4		
	DECLARE @StudentId INT,						
			@Remarks NVARCHAR(MAX),
			@PaymentDate DATETIME,			
			@IsDirectlyDeposited NVARCHAR(10),
			@BankId INT,
			@DepositeBankId INT,			
			@ChallanNumber NVARCHAR(50),									
			@IsCardPayment INT=0,			
			@IsElectronicPayment INT = 0,
			@Id INT=0		
			
			IF(@PaymentType = 3) -- Swapcard Payment
				SET @IsCardPayment = 1		
			
			IF(@PaymentType = 4) -- Electronic Payment
				SET @IsElectronicPayment = 1		
	
	SELECT @StudentId = T.c.value('(StudentId)[1]','INT')		  
		  ,@Remarks	= T.c.value('(Remarks)[1]','NVARCHAR(MAX)')
		  ,@PaymentDate	= T.c.value('(PaymentDate)[1]','DATETIME')		  
		  ,@IsDirectlyDeposited = T.c.value('(IsDirectlyDeposited)[1]','NVARCHAR(10)')
		  ,@BankId = T.c.value('(BankId)[1]','INT')
		  ,@DepositeBankId = T.c.value('(DepositeBankId)[1]','INT')		  
		  ,@ChallanNumber = T.c.value('(ChallanNumber)[1]','NVARCHAR(50)')
	  FROM @StudentPayFeeXML.nodes('StudentPayFeeDetails') T(c)
	  
	IF(@IsDirectlyDeposited = N'false')
		SET @IsDirectlyDeposited = N'N'
	ELSE
		SET @IsDirectlyDeposited = N'Y'
	
	IF(@PaymentType <> 0 AND @PaymentType <> 2) --cash payment,PDC
	BEGIN
		SET @DepositeBankId = NULL
		SET @IsDirectlyDeposited = NULL
	END
	
	 INSERT dbo.Schoolwise_Student_Fee_Details  
    (  
     Student_Id,  
     Payable_For,  
     Standard_Div_Id,  
     Std_FeeType_Id,  
     Fee_Type,  
     Amount,  
     [Debit/Credit],  
     Paid_Date,  
     Receipt_Number,  
     Remarks,  
     Student_Fee_Id,  
     School_Id,  
     Academic_Year_Id,  
     Serial_Number,  
     Is_Directly_Deposited,  
     Bank_Id,  
     DepositBankId,  
     Inserted_By_id,  
     Updated_By_Id,  
     ChallanNo,  
     IntervalStartDate,  
     IntervalEndDate,  
     IsCardPayment,
     IsElectronicPayment,
	 AccountHeaderId
    )  
    SELECT Student_Id,  
        Payable_For,  
        Standard_Div_Id,  
        Std_FeeType_Id,  
        Fee_Type,  
        @ActualAmt,  
        N'Credit',  
        @PaymentDate,  
        @ReceiptNumber,  
        @Remarks,  
        @SchoolwiseStudentFeeId,  
        School_Id,  
        Academic_Year_Id,  
        @MaxSerialNumber,  
        @IsDirectlyDeposited,  
        @BankId,  
        @DepositeBankId,  
        @InsertedById,  
        @InsertedById,  
        @ChallanNumber,  
        IntervalStartDate,  
        IntervalEndDate,  
        @IsCardPayment,
        @IsElectronicPayment,
		AccountHeaderId  
      FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)     
     WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId  
	   AND School_Id = @SchoolId
	   AND Academic_Year_Id = @AcademicYearId
	   
    SELECT @LastInsertedStudentFeeId = SCOPE_IDENTITY();  
	
	--DECLARE @NewDebitAmount INT=0
	
	--SELECT @NewDebitAmount = (Amount - @ActualAmt)
	--  FROM Schoolwise_Student_Fee_Details	   
	-- WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
	--   AND School_Id = @SchoolId
	--   AND Academic_Year_Id = @AcademicYearId
	--   AND Is_Deleted = N'N'
	--   AND Student_Id = @StudentId
	--   AND [Debit/Credit] = N'Debit'

	---- Updating Amount with the origional amount
	--UPDATE Schoolwise_Student_Fee_Details
	--   SET Amount = @ActualAmt
	-- WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
	--   AND School_Id = @SchoolId
	--   AND Academic_Year_Id = @AcademicYearId
	--   AND Is_Deleted = N'N'
	--   AND Student_Id = @StudentId
	--   AND [Debit/Credit] = N'Debit'
	
	---- Inserting new debit entry for remaining amount against the same fee type. 
	--	INSERT dbo.Schoolwise_Student_Fee_Details
	--	(
	--		Student_Id,
	--		Payable_For,
	--		Standard_Div_Id,
	--		Std_FeeType_Id,
	--		Fee_Type,
	--		Amount,
	--		[Debit/Credit],
	--		Paid_Date,
	--		Receipt_Number,
	--		School_Id,
	--		Academic_Year_Id,
	--		Serial_Number,
	--		Is_Cheque_Bounce,
	--		DebitStudentFee_Id,
	--		Insert_Date,
	--		Update_Date,
	--		IntervalStartDate,
	--		IntervalEndDate
	--	)
	--	SELECT Student_Id,
	--		   Payable_For,
	--		   Standard_Div_Id,
	--		   Std_FeeType_Id,
	--		   Fee_Type,
	--		   @NewDebitAmount,
	--		   N'Debit',
	--		   Paid_Date,
	--		   NULL,
	--		   School_Id,
	--		   Academic_Year_Id,
	--		   @MaxSerialNumber,
	--		   N'N',
	--		   @SchoolwiseStudentFeeId,
	--		   dbo.GetLocalDate(DEFAULT),
	--		   dbo.GetLocalDate(DEFAULT),
	--		   IntervalStartDate,
	--		   IntervalEndDate
	--	  FROM Schoolwise_Student_Fee_Details WITH(NOLOCK)   
	--	 WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
	--	   AND Is_Deleted = N'N'
END
GO
