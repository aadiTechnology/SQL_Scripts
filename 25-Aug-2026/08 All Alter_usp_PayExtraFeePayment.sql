/****** Object:  StoredProcedure [dbo].[usp_PayExtraFeePayment]    Script Date: 8/25/2025 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Pravin Shinde
-- Create date: 1-Jul-2013
-- Description:	This procedure is used to Pay extra payments added from last 2 rows of PayFeePoup.
--				This should be called from usp_PayStudentFee
-- =============================================
ALTER PROCEDURE [dbo].[usp_PayExtraFeePayment] 
@StudentPayFeeXML XML,
@CreditDetailsXML XML,
@MaxSerialNumber INT,
@ReceiptNumber INT,
@PaymentType INT,
@SchoolId INT,
@AcademicYearId INT,
@InsertedById INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @LastInsertedStudentFeeId INT,
			@StudentId INT,			
			@ChallanNumber NVARCHAR(50),
			@Remarks NVARCHAR(MAX),
			@IsCardPayment INT = 0,
			@IsElectronicPayment INT=0
			
	IF(@PaymentType = 3) -- Swapcard payment
		SET @IsCardPayment = 1		
		
	IF(@PaymentType = 4) -- Electronic Payment
		SET @IsElectronicPayment = 1
				
	-- This table is used to collect all the extra credited details.		
	DECLARE @tblCreditedDetails AS TABLE
	(
		StdFeeTypeId INT,
        FeeType NVARCHAR(20),
        PayableFor NVARCHAR(20),
        ChequeDate DATETIME,
        CreditedAmount INT        
	)
	
	SELECT @StudentId = T.c.value('(StudentId)[1]','INT')		  
		  ,@Remarks	= T.c.value('(Remarks)[1]','NVARCHAR(MAX)')		  		  
		  ,@ChallanNumber = T.c.value('(ChallanNumber)[1]','NVARCHAR(50)')
	  FROM @StudentPayFeeXML.nodes('StudentPayFeeDetails') T(c)
	  
	INSERT INTO @tblCreditedDetails	
	SELECT T.c.value('(StdFeeTypeId)[1]','INT'),		   		   		   		   		   		   
		   T.c.value('(FeeType)[1]','NVARCHAR(20)'),
		   T.c.value('(PayableFor)[1]','NVARCHAR(20)'),
		   T.c.value('(ChequeDate)[1]','DATETIME'),
		   T.c.value('(CreditedAmount)[1]','INT')		   		   		   		   		   		   
	  FROM @CreditDetailsXML.nodes('ArrayOfCreditDetails/CreditDetails') T(c)	 
	  
	-- This block is only added to insert credited details only. there is no relation of this amount with the payable amount.
	IF(@CreditDetailsXML IS NOT NULL)
	BEGIN	
		DECLARE @CreditCnt INT=0,
				@CreditedId INT=0,
				@StandardDivisionId INT,
				@StandardId INT,
				@Std_Fee_Id INT,
				@Fee_Type NVARCHAR(50),
				@Schoolwise_Student_Fee_Id INT				
					
		SELECT TOP 1 @StandardDivisionId = SSFD.Standard_Div_Id,
			   @StandardId =SSDM.Standard_Id
		  FROM Schoolwise_Student_Fee_Details SSFD WITH (NOLOCK)
	INNER JOIN SchoolWise_Standard_Division_Master SSDM WITH (NOLOCK)
			ON SSFD.Standard_Div_Id = SSDM.SchoolWise_Standard_Division_Id
		   AND SSFD.Academic_Year_Id = SSDM.academic_year_id
		 WHERE SSFD.Student_Id = @StudentId
		   AND SSFD.Is_Deleted = N'N'		
		SELECT @CreditCnt = COUNT(1) FROM @tblCreditedDetails	
		
		WHILE(@CreditCnt > 0)
		BEGIN
			SELECT TOP 1 @Fee_Type = FeeType,
				   @Schoolwise_Student_Fee_Id = StdFeeTypeId				   
			  FROM @tblCreditedDetails
			 
			 SET @CreditedId = @Schoolwise_Student_Fee_Id
			 
			IF(@Schoolwise_Student_Fee_Id = -9999)
			BEGIN
				SELECT @Std_Fee_Id = SF.SchoolWise_Standard_FeeType_Id 
				  FROM vw_standard_FeeType_Config SF WITH (NOLOCK)
			INNER JOIN Standard_Master SM WITH (NOLOCK)
					ON SF.Standard_Id=SM.Standard_Id
				   AND SF.academic_Year_Id=SM.academic_Year_Id
				   AND SF.School_Id=SM.School_Id
				 WHERE SF.Is_Deleted=N'N'
				   AND SM.Standard_Id=@StandardId
				   AND SM.academic_Year_Id=@AcademicYearId
				   AND SF.Fee_Type =@Fee_Type
			END
			ELSE
				SET @Std_Fee_Id = 0

			--One debit entry is inserted for late fee.  
			INSERT INTO dbo.Schoolwise_Student_Fee_Details
			(
				Student_Id,
				Payable_For,
				Standard_Div_Id,
				Fee_Type,
				Std_FeeType_Id,
				Amount,
				[Debit/Credit],
				Paid_Date,				
				School_Id,
				Academic_Year_Id,
				Is_Late_Fee,
				Serial_Number,
				Inserted_By_id,
				Insert_Date,
				Updated_By_Id,
				Update_Date
			)
			SELECT @StudentId,
				   PayableFor,
				   @StandardDivisionId,
				   FeeType,
				   @Std_Fee_Id,
				   CreditedAmount,
				   N'Debit',
				   ChequeDate,				   
				   @SchoolId,
				   @AcademicYearId,
				   N'N',
				   NULL,
				   @InsertedById,
				   dbo.GetLocalDate(DEFAULT),
				   @InsertedById,
				   dbo.GetLocalDate(DEFAULT)				   
			  FROM @tblCreditedDetails
			 WHERE StdFeeTypeId  = @CreditedId
			 
			SELECT @LastInsertedStudentFeeId = SCOPE_IDENTITY();
			
			
		--One credit entry is inserted for above debit entry.  
		INSERT dbo.Schoolwise_Student_Fee_Details
		(
			Student_Id,
			Payable_For,
			Standard_Div_Id,
			Fee_Type,
			Std_FeeType_Id,
			Amount,
			[Debit/Credit],
			Paid_Date,
			Receipt_Number,
			Remarks,
			School_Id,
			Academic_Year_Id,
			Is_Late_Fee,
			Student_Fee_Id,
			Serial_Number,
			Is_Directly_Deposited,
			Bank_Id,
			DepositBankId,
			Inserted_By_id,
			Updated_By_Id,
			ChallanNo,
			IsCardPayment,
			IsElectronicPayment
		)
		SELECT Student_Id,
			   Payable_For,
			   Standard_Div_Id,
			   Fee_Type,
			   Std_FeeType_Id,
			   Amount,
			   N'Credit',
			   Paid_Date,
			   @ReceiptNumber,
			   @Remarks,
			   School_Id,
			   Academic_Year_Id,
			   N'N',
			   @LastInsertedStudentFeeId,
			   @MaxSerialNumber,
			   N'N',
			   0,
			   null,
			   @InsertedById,
			   @InsertedById,
			   @ChallanNumber,
			   @IsCardPayment,
			   @IsElectronicPayment			   
		  FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)   
		 WHERE Schoolwise_Student_Fee_Id = @LastInsertedStudentFeeId
		
		DELETE FROM @tblCreditedDetails WHERE StdFeeTypeId  = @CreditedId
		SELECT @CreditCnt = COUNT(1) FROM @tblCreditedDetails	 
		
		END	
	END
    
END
GO
