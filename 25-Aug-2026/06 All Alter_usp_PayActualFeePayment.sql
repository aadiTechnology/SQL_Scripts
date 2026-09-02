/****** Object:  StoredProcedure [dbo].[usp_PayActualFeePayment]    Script Date: 8/25/2025 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Pravin Shinde
-- Create date: 1-Jul-2013
-- Description:	This procedure is used to pay actual fee payments excepting Late,Concession and extra fee payment.
--				This procedure should only get called from usp_PayStudentFee
-- =============================================
ALTER PROCEDURE [dbo].[usp_PayActualFeePayment]
@StudentPayFeeXML XML,
@FeewiseActulAmt INT,
@FeewisePayable INT,
@SchoolwiseStudentFeeId INT,
@ReceiptNumber INT,
@MaxSerialNumber INT,
@PaymentType INT,
@SchoolId INT,
@AcademicYearId INT,
@InsertedById INT,
@LastInsertedStudentFeeId INT OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StudentId INT,			
			@Remarks NVARCHAR(MAX),
			@AdditionalRemark NVARCHAR(1000),
			@PaymentDate DATETIME,						
			@IsDirectlyDeposited NVARCHAR(10),
			@BankId INT,
			@DepositeBankId INT,			
			@ChallanNumber NVARCHAR(50),								
			@IsCardPayment INT=0,
			@IsElectronicPayment INT=0,
			@IsCautionMoneyAdjusted NVARCHAR(10),
			@IsJournalVoucherPayment INT = 0
					
	IF(@PaymentType = 3) -- Swapcard payment
		SET @IsCardPayment = 1			
	IF(@PaymentType = 4) -- Electronic payment
		SET @IsElectronicPayment = 1
	ELSE IF @PaymentType = 5 -- Journl Voucher
		SET @IsJournalVoucherPayment = 1

	SELECT @StudentId = T.c.value('(StudentId)[1]','INT')		
		  ,@Remarks	= T.c.value('(Remarks)[1]','NVARCHAR(MAX)')
		  ,@AdditionalRemark = T.c.value('(AdditionalRemark)[1]','NVARCHAR(1000)')
		  ,@PaymentDate	= T.c.value('(PaymentDate)[1]','DATETIME')		  
		  ,@IsDirectlyDeposited = T.c.value('(IsDirectlyDeposited)[1]','VARCHAR(10)')
		  ,@BankId = T.c.value('(BankId)[1]','INT')
		  ,@DepositeBankId = T.c.value('(DepositeBankId)[1]','INT')		  
		  ,@ChallanNumber = T.c.value('(ChallanNumber)[1]','NVARCHAR(50)')
		  ,@IsCautionMoneyAdjusted = T.c.value('(IsCautionMoneyAdjusted)[1]','NVARCHAR(10)')
	  FROM @StudentPayFeeXML.nodes('StudentPayFeeDetails') T(c)
	
	IF(@IsDirectlyDeposited = N'false')
		SET @IsDirectlyDeposited = N'N'
	ELSE
		SET @IsDirectlyDeposited = N'Y'
		  
	IF(@PaymentType <> 0  AND @PaymentType <> 2) --cash payment,PDC
	BEGIN
		SET @DepositeBankId = NULL
		SET @IsDirectlyDeposited = N'N'
	END
	
	IF(@DepositeBankId = 0)
		SET @DepositeBankId = NULL  
		
	  IF(@FeewisePayable = 0 AND @FeewiseActulAmt > @FeewisePayable)
			SET @FeewisePayable = @FeewiseActulAmt
		
		--Here we are getting Account Header Id for given fee id.
		DECLARE @AccountHeaderId INT
		
		SELECT @AccountHeaderId = AccountHeaderId 
		  FROM Schoolwise_Student_Fee_Details WITH(NOLOCK)
		 WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
		   AND School_Id = @SchoolId
		   AND Academic_Year_Id = @AcademicYearId
		--
		
		--If actual amount and amt to be paid is same, then insert credit entry for given studentfeeid.  
		IF (@FeewiseActulAmt = @FeewisePayable)
		BEGIN
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
				Is_Arrears,
				IsElectronicPayment,
				AccountHeaderId,
				AdditionalRemark,
				IsJournalVoucherPayment
			)
			SELECT Student_Id,
				   Payable_For,
				   Standard_Div_Id,
				   Std_FeeType_Id,
				   Fee_Type,
				   Amount,
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
				   Is_Arrears,
				   @IsElectronicPayment,
				   @AccountHeaderId,
				   @AdditionalRemark,
				   @IsJournalVoucherPayment
			  FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)   
			 WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
			   AND School_Id = @SchoolId
			   AND Academic_Year_Id = @AcademicYearId

			SELECT @LastInsertedStudentFeeId = SCOPE_IDENTITY();
			
			INSERT INTO  FeeUpdationTrackingDetails
			SELECT Student_Id,'I',Fee_Type,Payable_For,Amount,@ReceiptNumber,@SchoolId,@AcademicYearId,@InsertedById,dbo.GetLocalDate(DEFAULT),'R','Insert student regular fee'
			FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)   
			WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
			AND School_Id = @SchoolId
			AND Academic_Year_Id = @AcademicYearId

		END
		ELSE IF(@FeewiseActulAmt < @FeewisePayable AND @FeewiseActulAmt <> 0)
		BEGIN
			DECLARE @NewDebitAmount INT=0

			SET @NewDebitAmount = @FeewisePayable - @FeewiseActulAmt

			-- Updating Amount with the origional amount
			UPDATE Schoolwise_Student_Fee_Details
			   SET Amount = @FeewiseActulAmt
			 WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
			   AND School_Id = @SchoolId
			   AND Academic_Year_Id = @AcademicYearId
			   AND Is_Deleted = N'N'
			   AND Student_Id = @StudentId
			   AND [Debit/Credit] = N'Debit'

			-- Inserting credit entry for the actual amount   
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
				Is_Arrears,
				IsElectronicPayment,
				AccountHeaderId,
				AdditionalRemark,
				IsJournalVoucherPayment
			)
			SELECT Student_Id,
				   Payable_For,
				   Standard_Div_Id,
				   Std_FeeType_Id,
				   Fee_Type,
				   Amount,
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
				   Is_Arrears,
				   @IsElectronicPayment,
				   @AccountHeaderId,
				   @AdditionalRemark,
				   @IsJournalVoucherPayment
			  FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)   
			 WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
			   AND School_Id = @SchoolId
			   AND Academic_Year_Id = @AcademicYearId
			 
			SELECT @LastInsertedStudentFeeId= SCOPE_IDENTITY();

			INSERT INTO FeeUpdationTrackingDetails
			SELECT Student_Id,'I',Fee_Type,Payable_For,Amount,@ReceiptNumber,@SchoolId,@AcademicYearId,@InsertedById,dbo.GetLocalDate(DEFAULT),'R','Insert student regular fee'
			FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)   
			WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
			AND School_Id = @SchoolId
			AND Academic_Year_Id = @AcademicYearId

			-- Inserting new debit entry for remaining amount against the same fee type. 
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
				School_Id,
				Academic_Year_Id,
				Serial_Number,
				Is_Cheque_Bounce,
				DebitStudentFee_Id,
				Insert_Date,
				Update_Date,
				IntervalStartDate,
				IntervalEndDate,
				AccountHeaderId,
				ChallanNo
			)
			SELECT Student_Id,
				   Payable_For,
				   Standard_Div_Id,
				   Std_FeeType_Id,
				   Fee_Type,
				   @NewDebitAmount,
				   N'Debit',
				   CASE WHEN @SchoolId = 122 THEN CASE WHEN (Paid_Date < @PaymentDate) THEN @PaymentDate 
												  ELSE Paid_Date END 
						ELSE Paid_Date END AS Paid_Date,
				   NULL,
				   School_Id,
				   Academic_Year_Id,
				   @MaxSerialNumber,
				   N'N', 
				   @SchoolwiseStudentFeeId,
				   dbo.GetLocalDate(DEFAULT),
				   dbo.GetLocalDate(DEFAULT),
				   IntervalStartDate,
				   IntervalEndDate,
				   @AccountHeaderId,
				   ChallanNo
			  FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)   
			 WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId
			   AND Is_Deleted = N'N'
			   AND School_Id = @SchoolId
			   AND Academic_Year_Id = @AcademicYearId
		END		

		IF(lower(@IsCautionMoneyAdjusted) = 'true')
		BEGIN
			
			IF NOT EXISTS
			(
				SELECT TOP 1 1
				FROM AdjustCautionMoneyDetails
				WHERE YearwiseStudentId = @StudentId
				AND ReceiptNumber = @ReceiptNumber
				AND SchoolId = @SchoolId
				AND AcademicYearId = @AcademicYearId
				AND IsDeleted = 0
			)
			BEGIN
				INSERT dbo.AdjustCautionMoneyDetails
				(
					YearwiseStudentId,
					ReceiptNumber,
					IsDeleted,
					SchoolId,
					AcademicYearId,
					UpdatedById,
					UpdateDate,
					InsertedById,
					InsertDate
				)
				SELECT @StudentId,
					   @ReceiptNumber,
					   0,
					   @SchoolId,
					   @AcademicYearId,
					   @InsertedById,
					   dbo.GetLocalDate(default),
					   @InsertedById,
					   dbo.GetLocalDate(default)
			END
		END
		ELSE
		BEGIN
			UPDATE AdjustCautionMoneyDetails
			SET IsDeleted = 1,
			UpdatedById = @InsertedById,
			UpdateDate = dbo.GetLocalDate(default)
			WHERE YearwiseStudentId = @StudentId
			  AND SchoolId = @SchoolId
			  AND AcademicYearId = @AcademicYearId
			  AND IsDeleted = 0
			  AND ReceiptNumber = @ReceiptNumber
		END

END
GO
