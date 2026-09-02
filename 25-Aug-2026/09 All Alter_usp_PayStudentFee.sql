/****** Object:  StoredProcedure [dbo].[usp_PayStudentFee]    Script Date: 8/25/2025 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ================================================================================================  
-- Author  : Pravin Shinde  
-- Create date : 21-Jun-2013  
-- Description : This procedure contains common logic for paying student fees. It should not be run individually.   
--      It should only be called from one of the following procedures:  
--      1. usp_PayFeeWithCash  
--      2. usp_PayFeeWithCheque  
--      3. usp_PayFeeWithCard  
--      4. usp_PayFeeWithPDC   
-- ================================================================================================  
ALTER PROCEDURE [dbo].[usp_PayStudentFee]  
@StudentPayFeeXML XML,  
@CreditDetailsXML XML,  
@IsLateFeeApplicable BIT,  
@SchoolId INT,  
@AcademicYearId INT,  
@PaymentType INT=0,  
@InsertedById INT,  
@LastInsertedFeedId INT OUTPUT
AS  
BEGIN

    BEGIN TRANSACTION
	BEGIN TRY

	--return   
 -- Payment Types :: CashPayment = ~0, ChequePayment = 1, PDC = 2, Swapcard = 3    
 DECLARE @StudentId INT,           
   @PaymentDate DATETIME,  
   @ConcessionAmount INT,  
   @SchoolwiseStudentFeeId INT,        
   @Remarks NVARCHAR(MAX),  
   @BankId INT,     
   @IsDirectlyDeposited NVARCHAR(10),     
   @DepositeBankId INT,  
   @ReceiptNumberOutput INT,  
   @ChallanNumber NVARCHAR(50),        
   @ReceiptNumber INT = 0,     
   @MaxSerialNumber INT,  
   @SerialNumber INT,   
   @FeewiseActulAmt INT,  
   @FeewisePayable  INT,  
   @IsCardPayment INT=0,  
   @Id INT,    
   @LastInsertedStudentFeeId INT,
   @FinancialYearId INT,
   @FileName NVARCHAR(200)

   BEGIN TRANSACTION
	BEGIN TRY

		UPDATE TransactionCounter
		SET Id = Id + 1

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
   
 -- This table is used to collect all the fees selected to pay.    
 DECLARE @tblPayFeeDetails AS TABLE  
 (  
   Id INT IDENTITY(1, 1),  
   SchoolwiseStudentFeeId INT,  
   PaybleAmount INT,  
   ActualAmount INT,  
   LateFee INT  
 )  
   
 DECLARE @tblPayFeeDetailsTemp AS TABLE  
 (  
   Id INT IDENTITY(1, 1),  
   SchoolwiseStudentFeeId INT,  
   PaybleAmount INT,  
   ActualAmount INT,  
   LateFee INT  
 )  
     
 SET @SchoolwiseStudentFeeId = 0  
 IF(@PaymentType = 3)  -- Card payment 
  SET @IsCardPayment = 1     
      
 SELECT @StudentId = T.c.value('(StudentId)[1]','INT')      
    ,@Remarks = T.c.value('(Remarks)[1]','NVARCHAR(MAX)')      
    ,@PaymentDate = T.c.value('(PaymentDate)[1]','DATETIME')  
    ,@ConcessionAmount = T.c.value('(ConcessionAmount)[1]','INT')          
    ,@IsDirectlyDeposited = T.c.value('(IsDirectlyDeposited)[1]','NVARCHAR(10)')  
    ,@BankId = T.c.value('(BankId)[1]','INT')  
    ,@DepositeBankId = T.c.value('(DepositeBankId)[1]','INT')  
    ,@ReceiptNumberOutput = T.c.value('(ReceiptNumberOutput)[1]','INT')  
    ,@ChallanNumber = T.c.value('(ChallanNumber)[1]','NVARCHAR(50)')
	,@FinancialYearId = T.c.value('(FinancialYearId)[1]','INT') 
	,@FileName = T.c.value('(FileName)[1]','NVARCHAR(50)')
   FROM @StudentPayFeeXML.nodes('StudentPayFeeDetails') T(c)    
   
 INSERT INTO @tblPayFeeDetails  
 SELECT T.c.value('(StudentFeeId)[1]','INT')  
    ,T.c.value('(PaybleAmount)[1]','INT')  
    ,T.c.value('(ActualAmount)[1]','INT')  
    ,T.c.value('(LateFee)[1]','INT')  
   FROM @StudentPayFeeXML.nodes('StudentPayFeeDetails/lstStudentFeeList/StudentFeeDetails') T(c)  

 IF(@IsDirectlyDeposited = N'false')  
	SET @IsDirectlyDeposited = N'N'  
 ELSE  
	SET @IsDirectlyDeposited = N'Y'  

 IF(@PaymentType <> 0) --cash payment  
 BEGIN  
	SET @DepositeBankId = 0  
	SET @IsDirectlyDeposited = NULL  
 END  

   
  DECLARE @AccountHeaderId INT 

 -- Here we checked that the given transaction is new/edited. If receipt numeber is other than 0
 -- then we will exicute following code.
 IF (@ReceiptNumberOutput IS NOT NULL AND @ReceiptNumberOutput <> 0)  
	 BEGIN  
		SELECT @ReceiptNumber = @ReceiptNumberOutput    
		
		DECLARE @HeaderId INT = 0
		IF @SchoolId = 122 -- SNS
		BEGIN
			SELECT @HeaderId = AccountHeaderId
			FROM Schoolwise_Student_Fee_Details
			WHERE Academic_Year_Id = @AcademicYearId
			AND Is_Deleted = 'N'
			AND School_Id = @SchoolId
			AND Schoolwise_Student_Fee_Id = 
			(
				select top 1 SchoolwiseStudentFeeId
				from @tblPayFeeDetails
			)
		END		

		EXEC usp_DeleteStudentFeeDetails @StudentId, @ReceiptNumber,@HeaderId,@InsertedById
	
		UPDATE Schoolwise_Student_Fee_Details  
		   SET IsReceiptConsidered = 1,  
			   Update_Date = dbo.GetLocalDate(DEFAULT),  
			   Updated_By_Id = @InsertedById  
		 WHERE Receipt_Number = @ReceiptNumber  
		   AND Is_Deleted = N'Y'  
	 END  
 ELSE   
	 BEGIN 
	 	-- Here we have generated a new receipt numer for new transaction. 
 				SELECT @ReceiptNumber = dbo.udf_GetReceiptNo(@SchoolId, @AcademicYearId)  	
	 END  

 SELECT @ReceiptNumber AS ReceiptNumber
 --Take new serial number to set all the records in this transaction.    
 SELECT @MaxSerialNumber = MAX(ISNULL(Serial_Number, 0)) + 1  
   FROM Schoolwise_Student_Fee_Details  

   IF(@SchoolId = 122) -- Only For SNS school
	BEGIN

	IF(@ReceiptNumberOutput IS NOT NULL AND @ReceiptNumberOutput <> 0)
		BEGIN
			SET @ReceiptNumber = @ReceiptNumberOutput
		END
	ELSE
		BEGIN		
			IF EXISTS(SELECT TOP 1 1
						FROM @tblPayFeeDetails)
					BEGIN
							DECLARE @FinancialYearStartDate DATETIME,
									@FinancialYearEndDate DATETIME

								SELECT @FinancialYearStartDate = StartDate,
								       @FinancialYearEndDate = EndDate
								  FROM Accounts.FinancialYearMaster
								 WHERE FinancialYearId = @FinancialYearId
								   AND IsDeleted = 0
								   AND SchoolId = @SchoolId
	
						  SELECT TOP 1 @SchoolwiseStudentFeeId = SchoolwiseStudentFeeId
								  FROM @tblPayFeeDetails

								SELECT @AccountHeaderId = AccountHeaderId
								  FROM Schoolwise_Student_Fee_Details
								 WHERE Academic_Year_Id = @AcademicYearId
								   AND Is_Deleted = 'N'
								   AND School_Id = @SchoolId
								   AND Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId

								SELECT @ReceiptNumber = MAX(CONVERT(int,Receipt_Number))
								  FROM Schoolwise_Student_Fee_Details
								 WHERE Is_Deleted = 'N'
								   AND School_Id = @SchoolId
								   AND [Debit/Credit] = 'Credit'
								   AND Is_Cheque_Bounce = 'N'		   		   
								   AND AccountHeaderId = @AccountHeaderId
								   AND CONVERT(date,@FinancialYearStartDate) <= CONVERT(date,Paid_Date)
								   AND CONVERT(date,Paid_Date) <= CONVERT(date,@FinancialYearEndDate)
								   --AND CONVERT(date,Paid_Date) >= CONVERT(date,'2017-04-01 00:00:00.000')		


								IF(@AccountHeaderId <> 4 AND @AccountHeaderId <> 5 AND @AccountHeaderId <> 10)
									BEGIN
										  if(@ReceiptNumber IS NULL OR @ReceiptNumber = '' OR @ReceiptNumber = 0)
											SET @ReceiptNumber = 999
									 END
								ELSE	-- This block is execute when account header id is 4(PRIME EDU) & 5(EDUORBIT) & 10(Mess Fee)
									BEGIN
										IF(@AccountHeaderId = 10)
											BEGIN
												if(@ReceiptNumber IS NULL OR @ReceiptNumber = '' OR @ReceiptNumber = 0)
												   SET @ReceiptNumber = 0
											END
										ELSE
											BEGIN
												if(@ReceiptNumber IS NULL OR @ReceiptNumber = '' OR @ReceiptNumber = 0)
												   SET @ReceiptNumber = 999

												 --  IF (@ReceiptNumber >= 4200)
													--BEGIN
													--	SELECT @ReceiptNumber = MAX(CONVERT(int,Receipt_Number))
													--	  FROM Schoolwise_Student_Fee_Details
													--	 WHERE Is_Deleted = 'N'
													--	   AND School_Id = @SchoolId
													--	   AND [Debit/Credit] = 'Credit'
													--	   AND Is_Cheque_Bounce = 'N'		   		   
													--	   AND AccountHeaderId = @AccountHeaderId
													--	   AND CONVERT(date,@FinancialYearStartDate) <= CONVERT(date,Paid_Date)
													--	   AND CONVERT(date,Paid_Date) <= CONVERT(date,@FinancialYearEndDate)
													--	   AND CONVERT(INT,Receipt_Number) < 3000

													--if(@ReceiptNumber IS NULL OR @ReceiptNumber = '')
													--	SET @ReceiptNumber = 0
													--END
											END
									END
								   SET @ReceiptNumber = @ReceiptNumber + 1
					END		
			END
	END 

 -- If Late Fee is applicable, we execute the following code block. Late fee is applicable for all payment modes except PDC (Post Dated Cheque)  
 IF (@IsLateFeeApplicable = 1)  
  EXEC usp_PayLateFee @StudentPayFeeXML,@ReceiptNumber,@SchoolId,@AcademicYearId,@InsertedById,@PaymentType,@MaxSerialNumber,@LastInsertedStudentFeeId OUTPUT 



 -- If any concession is applicable to that student then following code will execute.  
 IF(@ConcessionAmount > 0)  
 BEGIN  
	  SELECT TOP 1 @SchoolwiseStudentFeeId = SchoolwiseStudentFeeId  
		FROM @tblPayFeeDetails  
		
	  -- Here we calculates the concession remark for given concession fee.
	  DECLARE @ConcessionRemarks NVARCHAR(1000)  
	  SET @ConcessionRemarks = N'Concession Fee Rs.' + CONVERT(NVARCHAR(5), @ConcessionAmount) + '/-';  
	  
	  --SELECT @ConcessionRemarks AS con  

	  IF(@SchoolId = 122) -- Only For SNS school
		BEGIN
			SELECT @ReceiptNumber = MIN(CONVERT(INT,Receipt_Number))
			  FROM Schoolwise_Student_Fee_Details
			 WHERE School_Id = @SchoolId
			   --AND Academic_Year_Id = @AcademicYearId
			   AND Is_Deleted = 'N'
			   AND [Debit/Credit] = 'Credit'
			   AND Is_Cheque_Bounce = 'N'
			   AND Is_Concession_Fee = 'Y'

			   SET @ReceiptNumber = @ReceiptNumber - 1
		END
	  
	  --Insert one credit entry for given concession amount.    
	  INSERT dbo.Schoolwise_Student_Fee_Details  
	  (  
		   Student_Id,  
		   Payable_For,  
		   Standard_Div_Id,  
		   Fee_Type,  
		   Amount,  
		   [Debit/Credit],  
		   Paid_Date,  
		   Receipt_Number,  
		   Remarks,  
		   School_Id,  
		   Academic_Year_Id,  
		   Is_Concession_Fee,  
		   Serial_Number,  
		   Is_Directly_Deposited,  
		   Bank_Id,  
		   DepositBankId,  
		   Inserted_By_id,  
		   Updated_By_Id,  
		   ChallanNo,  
		   IntervalStartDate,  
		   IntervalEndDate,  
		   IsCardPayment  
	  )  
	  SELECT Student_Id,  
			 N'Concession Fee',  
			 Standard_Div_Id,  
			 N'Concession Fee',  
			 @ConcessionAmount,  
			 N'Credit',  
			 @PaymentDate,  
			 @ReceiptNumber,  
			 @ConcessionRemarks,  
			 School_Id,  
			 Academic_Year_Id,  
			 N'Y',  
			 @MaxSerialNumber,  
			 @IsDirectlyDeposited,  
			 @BankId,  
			 @DepositeBankId,  
			 @InsertedById,  
			 @InsertedById,  
			 @ChallanNumber,  
			 IntervalStartDate,  
			 IntervalEndDate,  
			 @IsCardPayment  
		FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)     
	   WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId  
	   
	   INSERT INTO  FeeUpdationTrackingDetails
		SELECT Student_Id,'I','Concession Fee','Concession Fee',@ConcessionAmount,@ReceiptNumber,@SchoolId,@AcademicYearId,@InsertedById,dbo.GetLocalDate(DEFAULT),'R','Insert student regular concession fee'
		FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)     
	   WHERE Schoolwise_Student_Fee_Id = @SchoolwiseStudentFeeId  
	  
	  DECLARE @ActualAmt INT,
			  @PaidAmount INT    
	  SET @Id=1      
	  -- Here we reduce actual fee payment by that of concession paid above. If total concession amount is
	  -- greter than or equal to actual fee amout then we will delete that fee payment in temparay table.	  
	  WHILE((SELECT COUNT(1) FROM @tblPayFeeDetails WHERE Id=@Id)>0)    
	  BEGIN    

		  SELECT @SchoolwiseStudentFeeId=SchoolwiseStudentFeeId,  
				 --@ActualAmt=ActualAmount   
				@ActualAmt=PaybleAmount,
				@PaidAmount = ActualAmount   
			FROM @tblPayFeeDetails  
		   WHERE Id=@Id       
		   IF (@ConcessionAmount > 0)  
		   BEGIN
				-- We will cover actual fee under concession if actual amount is less than conseesion given.
				IF (@ConcessionAmount >= @ActualAmt AND @ActualAmt = @PaidAmount)  
				BEGIN  
					EXEC usp_PayConcessionFee @StudentPayFeeXML,@ReceiptNumber,@SchoolId,@AcademicYearId,@InsertedById,@PaymentType,
						 @MaxSerialNumber,@SchoolwiseStudentFeeId,@ActualAmt,@LastInsertedStudentFeeId OUTPUT    
			 			   
					DELETE FROM @tblPayFeeDetails  
					 WHERE SchoolwiseStudentFeeId = @SchoolwiseStudentFeeId  
			  
					SET @ConcessionAmount = @ConcessionAmount - @ActualAmt  
				END  
		  END  
		   SET @Id = @Id + 1  
	  END    
 END -- End of IF (@ConcessionAmt>0) 
     
 INSERT INTO @tblPayFeeDetailsTemp(SchoolwiseStudentFeeId ,PaybleAmount ,ActualAmount ,LateFee)  
 SELECT SchoolwiseStudentFeeId ,PaybleAmount ,ActualAmount ,LateFee FROM @tblPayFeeDetails  
 

 -- Following procedure is only called to pay extra fee payments.  
 IF(@CreditDetailsXML IS NOT NULL)  
  EXEC usp_PayExtraFeePayment @StudentPayFeeXML,@CreditDetailsXML,@MaxSerialNumber,@ReceiptNumber,@PaymentType,@SchoolId,@AcademicYearId,@InsertedById   
  
 -- Following procedure is used to pay actual fee payments excepting Late,Concession and extra fee payment.
 -- This procedure should only get called from usp_PayStudentFee. Here we insert only those fee payments which
 -- which are remained after paying concession.   
 
     
 SET @Id=1    
 WHILE((SELECT COUNT(1) FROM @tblPayFeeDetailsTemp WHERE Id=@Id) > 0)    
 BEGIN    
 SELECT @SchoolwiseStudentFeeId=SchoolwiseStudentFeeId,  
		@FeewiseActulAmt=ActualAmount,  
		@FeewisePayable = PaybleAmount   
   FROM @tblPayFeeDetailsTemp  
  WHERE Id=@Id    

  SELECT @ReceiptNumber ReceiptNumber

  -- Following procedure is used to pay actual fee payments excepting Late,Concession and extra fee payment.  
  -- This procedure should only get called from usp_PayStudentFee  
	EXEC usp_PayActualFeePayment @StudentPayFeeXML,@FeewiseActulAmt,@FeewisePayable,@SchoolwiseStudentFeeId,@ReceiptNumber,@MaxSerialNumber,@PaymentType,  
           @SchoolId,@AcademicYearId,@InsertedById,@LastInsertedStudentFeeId OUTPUT     
    
	SET @Id = @Id + 1    
 END    
    
 SET @LastInsertedFeedId = @LastInsertedStudentFeeId  
   
 -- This is an exceptional case. As in case of cash payment we need to return a receipt number to added fee transaction.
 IF(@PaymentType = 0)  -- Cash Payment
	SET @LastInsertedFeedId = @ReceiptNumber   

 EXEC usp_UpdateBalanceFeeDetails @SchoolId, @AcademicYearId, @ReceiptNumber

 IF @FileName IS NOT NULL AND @FileName <> ''
 BEGIN
		IF EXISTS(
			SELECT TOP 1 1
			from FeePaymentDocumentDetails
			where StudentId = @StudentId
			and IsDeleted = 0
			and ReceiptNo = @ReceiptNumber
		)
		BEGIN
			UPDATE FeePaymentDocumentDetails
			SET FileName = @FileName,
				UpdatedById = @InsertedById,
				UpdateDate = dbo.GetLocalDate(default)
			where StudentId = @StudentId
			and IsDeleted = 0
			and ReceiptNo = @ReceiptNumber
		END
		ELSE
		BEGIN
			INSERT INTO [dbo].[FeePaymentDocumentDetails]
				(
					StudentId
					,ReceiptNo
					,FileName
					,IsDeleted
					,InsertedById
					,InsertDate
					,UpdatedById
					,UpdateDate
				)
				SELECT 
					@StudentId
					,@ReceiptNumber
					,@FileName
					,0
					,@InsertedById
					,dbo.GetLocalDate(default)
					,@InsertedById
					,dbo.GetLocalDate(default)				 
		END
	END

--raiserror('Test Error',16,1

  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
	
	DECLARE @ErrorMessage NVARCHAR(MAX)
	SET @ErrorMessage = ERROR_MESSAGE()
	RAISERROR(@ErrorMessage,17,1)

	ROLLBACK TRANSACTION
  END CATCH  
END
GO
