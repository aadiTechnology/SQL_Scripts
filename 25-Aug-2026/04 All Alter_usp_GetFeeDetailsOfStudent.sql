/****** Object:  StoredProcedure [dbo].[usp_GetFeeDetailsOfStudent]    Script Date: 8/25/2025 11:29:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- ================================================================================================      
-- Author  : Anu        
-- Create date : 23 Sep 2008        
-- Description : Retrieves fee details for a student as of a particular day.      
-- ================================================================================================      
ALTER PROCEDURE [dbo].[usp_GetFeeDetailsOfStudent]    
 @StudentId INT,    
 @CurrentDate DATETIME,
 @ShowOnlyDebits BIT,
 @ReceiptNumber INT = 0,
 @SchoolId INT,
 @AcademicYearId INT,
 @PaymentType INT
AS    
BEGIN    
 SET NOCOUNT ON;    
 SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED    

 
 DECLARE @CautionMoneyRemainingAmount INT = 0

 IF EXISTS
 (
	SELECT TOP 1 1
	FROM SchoolSettings
	WHERE SchoolId = @SchoolId
	AND AcademicYearId = @AcademicYearId
	AND IsDeleted = 0
	AND Name = 'AllowCautionMoneyAdjustmentInRegularFee'
	and lower(Value) = 'true'
 )
 BEGIN
	DECLARE @CautionMoneyAmount INT = 0,
			@ReturnAmount INT = 0,
			@AlreadyAdjustedAmount INT = 0,			
			@SchoolLeftDate DATE,
			@SchoolwiseStudentId INT

	SELECT @CautionMoneyAmount = Amount,
		   @ReturnAmount = ReturnAmount,
		   @SchoolLeftDate = BSD.SchoolLeft_Date,
		   @SchoolwiseStudentId = YSD.Student_Id
	  from Student_Caution_Money_Details SCMD
	 inner join YearWise_Student_Details YSD
	 on SCMD.Schoolwise_Student_Id = YSD.Student_Id
	 INNER JOIN vw_BaseStudentDetails BSD
	 ON YSD.Student_Id = BSD.SchoolWise_Student_Id
	 where SCMD.Is_Deleted = 0
	 and YSD.Is_Deleted = 'N'
	 and YSD.YearWise_Student_Id = @StudentId


	 IF @SchoolLeftDate IS NOT NULL and @ReturnAmount is not null and @ReturnAmount IS NOT NULL
	 BEGIN

		-- To get all adjusted amount from all academic year, here academic year id filter is not used.
		 select @AlreadyAdjustedAmount = sum(Amount)
		 from Schoolwise_Student_Fee_Details SSFD
		 INNER JOIN AdjustCautionMoneyDetails ACD
		  ON SSFD.Student_Id = ACD.YearwiseStudentId
		  AND SSFD.Receipt_Number = ACD.ReceiptNumber	
		 INNER JOIN YearWise_Student_Details YSD
		 ON SSFD.Student_Id = YSD.YearWise_Student_Id	 
		 where SSFD.Is_Deleted = 'N'		
		 and Is_Cheque_Bounce = 'N'
		 and [Debit/Credit] = 'credit'		  
		 and (RefundFeeDetailsID is null or RefundFeeDetailsID = 0)
		 AND ACD.IsDeleted = 0
		 AND YSD.Student_Id = @SchoolwiseStudentId

		 declare @AlreadyPaidAmountInThisReceipt INT = 0

		 select @AlreadyPaidAmountInThisReceipt = sum(Amount)
		 from Schoolwise_Student_Fee_Details SSFD
		 INNER JOIN AdjustCautionMoneyDetails ACD
		  ON SSFD.Student_Id = ACD.YearwiseStudentId
		  AND SSFD.Receipt_Number = ACD.ReceiptNumber	
		 INNER JOIN YearWise_Student_Details YSD
		 ON SSFD.Student_Id = YSD.YearWise_Student_Id	 
		 where SSFD.Is_Deleted = 'N'		
		 and Is_Cheque_Bounce = 'N'
		 and [Debit/Credit] = 'credit'		  
		 and (RefundFeeDetailsID is null or RefundFeeDetailsID = 0)
		 AND ACD.IsDeleted = 0
		 AND YSD.YearWise_Student_Id = @StudentId
		 and Receipt_Number  =@ReceiptNumber


		
		 SET @CautionMoneyRemainingAmount = ISNULL(@CautionMoneyAmount,0) - ISNULL(@ReturnAmount,0) - ISNULL(@AlreadyAdjustedAmount,0) + ISNULL(@AlreadyPaidAmountInThisReceipt,0)
	 END
END

    
 DECLARE @AmtPaid INT,    
		 @AmtPayable INT,    		 
		 @TotalLateFee INT,    
		 @TotalConcessionAmt INT,    
		 @TotalPaidlatefee INT  

	DECLARE @AllowLateFeeAtQuarterLevel BIT = 0

	DECLARE @tblFeePayables TABLE
	(
		PayableFor NVARCHAR(100)
	)

	insert into @tblFeePayables
	select PayableFor
	from [dbo].[udf_GetFeePayablesForLateFee] (@SchoolId,@AcademicYearId)

	IF exists(select top 1 1 from @tblFeePayables)
	BEGIN
		SET @AllowLateFeeAtQuarterLevel = 1
	END


 --Declare temp. table for particular student's fee details.        
 CREATE TABLE #TemptblFeeDetails    
 (    
   Schoolwise_Student_Fee_Id INT,    
   Payable_For NVARCHAR(200),    
   Amount INT,    
   Paid_Date DATETIME,    
   Fee_Type NVARCHAR(50),    
   Amount_Paid INT,    
   Amount_Payable INT,    
   [D/C] NVARCHAR(10),    
   Receipt_Number NVARCHAR(50),    
   Serial_Number INT,    
   Is_Cheque_Bounce NVARCHAR(1),    
   Std_Fee_Type_Id INT,    
   Late_Fee_Amt INT,    
   Is_Concession NVARCHAR(1),    
   RefundFeeDetailsID INT,    
   Is_LastRefund BIT NULL,    
   TotalAmount INT,    
   Is_Arrears BIT,    
   DebitStudentFeeID INT,    
   IsTransactionCleared BIT,
   AccountHeaderId INT,
   FileName NVARCHAR(200)
 )    
    
 -- Temporary table to exactly replicate the view - vw_Student_Debit_Details      
 CREATE TABLE #tempStudent_Debit_Details    
 (    
   Payable_For NVARCHAR(200),    
   Amount INT,    
   [Debit/Credit] NVARCHAR(10),    
   Paid_Date DATETIME,    
   Remarks NVARCHAR(MAX),    
   AdditionalRemark NVARCHAR(1000),    
   Standard_Div_Id INT,    
   School_Id INT,    
   Academic_Year_Id INT,    
   Schoolwise_Student_Fee_Id INT,    
   Fee_Type NVARCHAR(50),    
   Std_FeeType_Id INT,    
   Serial_Number INT,    
   Student_Fee_Id INT,    
   Receipt_Number NVARCHAR(50),    
   DebitLevel NVARCHAR(7),    
   Is_Cheque_Bounce CHAR(1),    
   Is_Late_Fee CHAR(1),    
   Is_Concession_Fee CHAR(1),    
   Is_Deleted CHAR(1),    
   PDC_Id INT,    
   Cheque_Number NVARCHAR(15),    
   Cheque_Passed_Date SMALLDATETIME,    
   Cheque_Date DATETIME,    
   Bank_Name NVARCHAR(100),    
   Student_Id INT,    
   Is_Arrears BIT,    
   NetBankingPaymentTransactionID INT,    
   DebitStudentFee_Id INT,
   AccountHeaderId INT    
 )    
    
 INSERT #tempStudent_Debit_Details    
 (    
  Payable_For,    
  Amount,    
  [Debit/Credit],    
  Paid_Date,    
  Remarks,    
  AdditionalRemark,
  Standard_Div_Id,    
  School_Id,    
  Academic_Year_Id,    
  Schoolwise_Student_Fee_Id,    
  Fee_Type,    
  Std_FeeType_Id,    
  Serial_Number,    
  Student_Fee_Id,    
  Receipt_Number,    
  DebitLevel,    
  Is_Cheque_Bounce,    
  Is_Late_Fee,    
  Is_Concession_Fee,    
  Is_Deleted,    
  PDC_Id,    
  Cheque_Number,    
  Cheque_Passed_Date,    
  Cheque_Date,    
  Bank_Name,    
  Student_Id,    
  Is_Arrears,    
  NetBankingPaymentTransactionID,    
  DebitStudentFee_Id ,
  AccountHeaderId   
 )    
		SELECT SSFD.Payable_For,    
			   SSFD.Amount,    
			   SSFD.[Debit/Credit],
			   SSFD.Paid_Date,    
			   SSFD.Remarks,    
			   SSFD.AdditionalRemark,
			   SSFD.Standard_Div_Id,    
			   SSFD.School_Id,    
			   SSFD.Academic_Year_Id,    
			   SSFD.Schoolwise_Student_Fee_Id,    
			   SSFD.Fee_Type,    
			   SSFD.Std_FeeType_Id,    
			   SSFD.Serial_Number,    
			   SSFD.Student_Fee_Id,    
			   SSFD.Receipt_Number,    
			   N'Student' AS DebitLevel,    
			   SSFD.Is_Cheque_Bounce,    
			   SSFD.Is_Late_Fee,    
			   SSFD.Is_Concession_Fee,    
			   SSFD.Is_Deleted,    
			   SFPDCD.PDC_Id,    
			   SSPDC.Cheque_Number,    
			   SSPDC.Cheque_Passed_Date,    
			   SSPDC.Cheque_Date,    
			   SBM.Bank_Name,    
			   SSFD.Student_Id,    
			   SSFD.Is_Arrears,    
			   SSFD.NetBankingPaymentTransactionID,    
			   SSFD.DebitStudentFee_Id,
			   SSFD.AccountHeaderId    
		   FROM Schoolwise_Student_Fee_Details SSFD WITH(NOLOCK)      
LEFT OUTER JOIN Schoolwise_Student_PostDatedCheques SSPDC WITH(NOLOCK)      
LEFT OUTER JOIN Schoolwise_Bank_Master SBM WITH(NOLOCK)      
			 ON SSPDC.Bank_Id = SBM.Schoolwise_Bank_Id    
LEFT OUTER JOIN Student_Fee_PDC_Details SFPDCD WITH(NOLOCK)      
			 ON SSPDC.PostDated_Cheque_Id = SFPDCD.PDC_Id    
			 ON SSFD.Schoolwise_Student_Fee_Id = SFPDCD.Schoolwise_Student_Fee_Id    
	  	  WHERE SSFD.Is_Deleted = N'N'    
			AND (SSFD.RefundFeeDetailsID IS NULL OR SSFD.RefundFeeDetailsID = 0)    
			AND SSFD.Amount > =0    
			AND SSFD.Academic_Year_Id = @AcademicYearId    
			AND SSFD.Student_Id = @StudentId    
			AND SSFD.Is_Cheque_Bounce=N'N'
			
 --Insert fee details into temp. table and also get late fee amount against given date.        
 INSERT INTO #TemptblFeeDetails    
 (    
  Schoolwise_Student_Fee_Id,    
  Payable_For,    
  Amount,    
  Paid_Date,    
  Fee_Type,    
  Amount_Paid,    
  Amount_Payable,    
  [D/C],    
  Receipt_Number,    
  Serial_Number,    
  Is_Cheque_Bounce,    
  Std_Fee_Type_Id,    
  Late_Fee_Amt,    
  Is_Concession,    
  RefundFeeDetailsID,    
  Is_LastRefund,    
  Is_Arrears,    
  DebitStudentFeeID,    
  IsTransactionCleared,
  AccountHeaderId,
  FileName
 )    
    SELECT Debit.Schoolwise_Student_Fee_Id,    
		   ISNULL(B.Payable_For, Debit.Payable_For) [Payable_For],    
		   Debit.Amount,    
		   Debit.Paid_Date,    
		   ISNULL(B.Fee_Type, Debit.Fee_Type) [Fee_Type],    
		   ISNULL((SELECT Amount    
			         FROM #tempStudent_Debit_Details AS X    
			        WHERE Student_Fee_Id = Debit.Schoolwise_Student_Fee_Id    
			          AND Student_Id = @StudentId    
					UNION    
					SELECT Amount    
					  FROM #tempStudent_Debit_Details AS B    
					 WHERE Receipt_Number = Debit.Receipt_Number    
					   AND Student_Id = @StudentId    
					   AND Is_Concession_Fee = Debit.Is_Concession_Fee    
					   AND Student_Fee_Id IS NULL), 0) 
				AS Amount_Paid,    
			0 AS Amount_Payable,    
			Debit.[Debit/Credit] AS Debit,    
			ISNULL((SELECT Receipt_Number    
					  FROM #tempStudent_Debit_Details AS C    
					 WHERE Student_Fee_Id = Debit.Schoolwise_Student_Fee_Id    
					 UNION    
					SELECT Receipt_Number    
					  FROM #tempStudent_Debit_Details AS D    
					 WHERE Receipt_Number = Debit.Receipt_Number    
					   AND Is_Concession_Fee = N'N'    
					   AND Student_Fee_Id IS NULL), 0) 
				AS Receipt_Number,    
			Debit.Serial_Number,    
			Debit.Is_Cheque_Bounce,    
			CASE    
			   WHEN B.Student_Fee_Id IS NULL THEN Debit.Std_FeeType_Id    
			   ELSE B.Std_FeeType_Id    
			   END AS [Std_FeeType_Id],    
			 --dbo.UDF_GetLateFeeAmt(Debit.Std_FeeType_Id, Debit.Paid_Date, @CurrentDate) AS LateFeeAmt,    		
			  CASE WHEN @AllowLateFeeAtQuarterLevel = 1 THEN 
					CASE WHEN Debit.Payable_For IN (select PayableFor from @tblFeePayables) THEN dbo.UDF_GetLateFeeAmt(Debit.Std_FeeType_Id, Debit.Paid_Date, @CurrentDate)
					ELSE 0 
					END 
				ELSE
					dbo.UDF_GetLateFeeAmt(Debit.Std_FeeType_Id, Debit.Paid_Date, @CurrentDate)
				END AS LateFeeAmt,
			 Debit.Is_Concession_Fee,    
			 0 AS Expr1,    
			 0 AS Expr2,    
			 Debit.Is_Arrears,    
			 ISNULL(Debit.DebitStudentFee_Id, 0),    
			 1,
			 Debit.AccountHeaderId,
			 ISNULL(FileName,'') AS FileName
        FROM #tempStudent_Debit_Details Debit    
LEFT OUTER JOIN #tempStudent_Debit_Details B    
		  ON Debit.Schoolwise_Student_Fee_Id = B.Student_Fee_Id    
  LEFT OUTER JOIN FeePaymentDocumentDetails FPDC
		  ON Debit.Student_Id = FPDC.StudentId
		 AND Debit.Receipt_Number = FPDC.ReceiptNo
		   AND FPDC.IsDeleted = 0
       WHERE (Debit.Student_Fee_Id = 0 OR Debit.Student_Fee_Id IS NULL)    
         AND Debit.Student_Id = @StudentId       

 -- Take total concession amount for given student excluding bounced cheque amount.        
 SELECT @TotalConcessionAmt = SUM(Amount)    
   FROM Schoolwise_Student_Fee_Details  WITH(NOLOCK)        
  WHERE Is_Concession_Fee = N'Y'    
    AND Is_Cheque_Bounce = N'N'    
    AND Is_Deleted = N'N'    
    AND [Debit/Credit] = N'Credit'    
    AND Student_Id = @StudentId    
    
 -- if total concession amount is null set to 0.        
 IF (@TotalConcessionAmt IS NULL)    
	SET @TotalConcessionAmt = 0    
    
 -- set amount payable as substracting amount paid from amount        
 UPDATE #TemptblFeeDetails    
    SET Amount_Payable = Amount - Amount_Paid    
  WHERE Amount_Paid = 0    

    
 -- if amount paid is greater than zero then set [D/C] as 'credit' and late fee amount to 0.        
 UPDATE #TemptblFeeDetails    
    SET [D/C] = N'Credit',    
     Late_Fee_Amt = 0    
  WHERE Amount_Paid >= 0  
  AND Is_Cheque_Bounce <> N'Y'    
  and Receipt_Number IS NOT NULL
  AND Receipt_Number <> 0
    
 -- Set late fee amount to 0 if studentfeeid's entry into Schoolwise_Late_Fee_Details table.        
 UPDATE #TemptblFeeDetails    
    SET Late_Fee_Amt = 0    
  WHERE Schoolwise_Student_Fee_Id IN (SELECT Student_Fee_Id    
										FROM Schoolwise_Late_Fee_Details WITH(NOLOCK)        
									   WHERE Is_Deleted = N'N'    
									     AND Late_Fee_Amt <> 0.00)    
 
 -- #03 --   
 

	  INSERT INTO #TemptblFeeDetails    
	  SELECT SSFD1.Schoolwise_Student_Fee_Id    
			 ,CASE    
			 WHEN SSFD1.Fee_Type <> N'Monthly' THEN SSFD1.Payable_For + N' (' + SSFD1.Fee_Type + N')'    
			 ELSE SSFD1.Payable_For    
			 END AS Payable_For    
			 ,SSFD1.Amount    
			 ,SSFD1.Paid_Date    
			 ,N'Refund' AS Fee_Type    
			 ,SSFD1.Amount AS Amount_Paid    
			 ,0 AS Amount_Payable    
			 ,SSFD1.[Debit/Credit] AS [D/C]    
			 ,ISNULL(SSFD1.Receipt_Number, 0)    
			 ,SSFD1.Serial_Number    
			 ,SSFD1.Is_Cheque_Bounce    
			 ,SSFD1.Std_FeeType_Id    
			 ,0 AS Late_Fee_Amt    
			 ,SSFD1.Is_Concession_Fee    
			 ,SSFD1.RefundFeeDetailsID    
			 ,0    
			 ,SSFD2.Amount    
			 ,SSFD1.Is_Arrears    
			 ,ISNULL(SSFD1.DebitStudentFee_Id, 0)    
			 ,1  
			 ,SSFD1.AccountHeaderId,
			 ISNULL(FileName,'') AS FileName
		FROM dbo.Schoolwise_Student_Fee_Details SSFD1 WITH(NOLOCK)      
  INNER JOIN dbo.Schoolwise_Student_Fee_Details SSFD2 WITH(NOLOCK)      
  	      ON SSFD1.Student_Fee_Id = SSFD2.Schoolwise_Student_Fee_Id
  LEFT OUTER JOIN FeePaymentDocumentDetails FPDC 
		  ON SSFD1.Student_Id = FPDC.StudentId
		 AND SSFD1.Receipt_Number = FPDC.ReceiptNo 
		   ANd FPDC.IsDeleted = 0
	   WHERE SSFD1.Student_Id = @StudentId    
		 AND SSFD1.Is_Deleted = N'N'    
		 AND SSFD1.RefundFeeDetailsID IS NOT NULL    
		 AND SSFD1.RefundFeeDetailsID <> 0    
		 AND SSFD1.Is_Cheque_Bounce=N'N'
 
 -- Set IsLastRefund flag for last fee refund entry        
 UPDATE #TemptblFeeDetails    
    SET Is_LastRefund = 1    
  WHERE Schoolwise_Student_Fee_Id IN (SELECT MAX(Schoolwise_Student_Fee_Id)    
									    FROM #TemptblFeeDetails    
									   WHERE RefundFeeDetailsID IS NOT NULL    
									     AND RefundFeeDetailsID <> 0    
									GROUP BY RefundFeeDetailsID)    
    
 -- PArtial fee refund entries        
 UPDATE #TemptblFeeDetails    
    SET Payable_For = Payable_For + N' - Partial'    
  WHERE RefundFeeDetailsID IS NOT NULL    
    AND RefundFeeDetailsID <> 0    
    AND Amount <> TotalAmount    
 
 -- Update those entries which are paid by chq and not yet cleared.      
 UPDATE #TemptblFeeDetails    
    SET IsTransactionCleared = 0    
   FROM #TemptblFeeDetails TFD    
  WHERE TFD.[D/C] = N'Credit'    
    AND TFD.Receipt_Number IN ( SELECT SSFD.Receipt_Number    
								  FROM dbo.Schoolwise_Student_Fee_Details SSFD  WITH(NOLOCK)         
							INNER JOIN dbo.Student_Fee_PDC_Details SFPDCD  WITH(NOLOCK)        
									ON SSFD.Schoolwise_Student_Fee_Id = SFPDCD.Schoolwise_Student_Fee_Id    
							INNER JOIN dbo.Schoolwise_Student_PostDatedCheques SSPDC  WITH(NOLOCK)        
									ON SFPDCD.PDC_Id = SSPDC.PostDated_Cheque_Id    
							  	 WHERE SSFD.Student_Id = @StudentId    
								   AND SSFD.Is_Cheque_Bounce = N'N'    
								   AND SSFD.Is_Deleted = N'N'    
								   AND SFPDCD.Is_Deleted = N'N'    
								   AND SSPDC.Is_Deleted = N'N'    
								   AND SSPDC.Is_Cheque_Bounce = N'N'    
								   AND (SSPDC.Cheque_Passed_Date IS NULL OR SSPDC.Cheque_Passed_Date = N'')
							 )    
    
 -- Update those entries which are paid by cash @ bank & not yet cleared.      
	 UPDATE #TemptblFeeDetails    
		SET IsTransactionCleared = 0    
	   FROM #TemptblFeeDetails TFD    
 INNER JOIN dbo.Schoolwise_Student_Fee_Details SSFD  WITH(NOLOCK)        
		 ON TFD.Schoolwise_Student_Fee_Id = SSFD.Student_Fee_Id    
	  WHERE TFD.[D/C] = N'Credit'    
		AND SSFD.Is_Directly_Deposited = N'Y'    
		AND SSFD.Is_Deleted = N'N'    
		AND TFD.Receipt_Number NOT IN (SELECT CCP.ReceiptNo    
										 FROM dbo.ClearedCashPayment CCP  WITH(NOLOCK)        
										WHERE CCP.SchoolId = @SchoolId    
										  AND CCP.Academic_Year_Id = @AcademicYearId    
										  AND CCP.Is_Deleted = 0)    
 
 -- Update those entries which are paid online & not yet cleared.      
	 UPDATE #TemptblFeeDetails    
		SET IsTransactionCleared = 0    
	   FROM #TemptblFeeDetails TFD    
 INNER JOIN dbo.Schoolwise_Student_Fee_Details SSFD  WITH(NOLOCK)         
  	     ON TFD.Schoolwise_Student_Fee_Id = SSFD.Student_Fee_Id    
	  WHERE TFD.[D/C] = N'Credit'    
		AND SSFD.NetBankingPaymentTransactionID IS NOT NULL    
		AND SSFD.NetBankingPaymentTransactionID <> 0    
		AND SSFD.Is_Deleted = N'N'    
		AND TFD.Receipt_Number IN (SELECT SSFD.Receipt_Number    
		  						     FROM dbo.Schoolwise_Student_Fee_Details SSFD  WITH(NOLOCK)         
							   INNER JOIN dbo.NetBankingPaymentTransactions NBPT  WITH(NOLOCK)        
									   ON SSFD.NetBankingPaymentTransactionID = NBPT.NetBankingPaymentTransactionID    
									WHERE SSFD.Student_Id = @StudentId    
									  AND SSFD.Is_Deleted = N'N'    
									  AND SSFD.[Debit/Credit] = N'Credit'    
									  AND NBPT.Is_Deleted = 0    
									  AND NBPT.ClearanceDate IS NULL)    

 -- Update those entries which are paid by card & not yet cleared.      
	 UPDATE #TemptblFeeDetails    
		SET IsTransactionCleared = 0    
	   FROM #TemptblFeeDetails TFD    
 INNER JOIN dbo.Schoolwise_Student_Fee_Details SSFD  WITH(NOLOCK)        
	     ON TFD.Schoolwise_Student_Fee_Id = SSFD.Student_Fee_Id    
	  WHERE TFD.[D/C] = N'Credit'    
		AND SSFD.IsCardPayment = 1    
		AND SSFD.Is_Deleted = N'N'    
		AND TFD.Receipt_Number IN ( SELECT SSFD.Receipt_Number    
									  FROM dbo.Schoolwise_Student_Fee_Details SSFD  WITH(NOLOCK)        
								INNER JOIN dbo.StudentCardPaymentDetails SCPD  WITH(NOLOCK)        
										ON SSFD.Schoolwise_Student_Fee_Id = SCPD.SchoolWise_Student_Fee_Id    
								 	 WHERE SSFD.Student_Id = @StudentId    
									   AND SSFD.Is_Deleted = N'N'    
									   AND SSFD.[Debit/Credit] = N'Credit'    
									   AND SCPD.Is_Deleted = 0    
									   AND SCPD.Passed_Date IS NULL)        

DECLARE @tblFeeDetailsAsPerMode AS TABLE
(
   Schoolwise_Student_Fee_Id INT,    
   Payable_For NVARCHAR(200),    
   Amount INT,    
   DueDate DATETIME,    
   Fee_Type NVARCHAR(50),       
   Amount_Payable INT,    
   [D/C] NVARCHAR(10),    
   Receipt_Number NVARCHAR(50),    
   Serial_Number  INT,       
   Std_Fee_Type_Id INT,    
   Late_Fee_Amt INT,
   OrigionalLateFeeAmount INT,
   ActualFee INT,
   AccountHeaderId INT      
)

DECLARE @PartialDebitCredit AS TABLE
(
	SchoolwiseStudentFeeId INT,
	Amount INT,
	DebitStudentFeeId INT
)
INSERT INTO @PartialDebitCredit
SELECT Schoolwise_Student_Fee_Id    	  	  
	  ,Amount_Payable    	  
	  ,DebitStudentFeeID
 FROM #TemptblFeeDetails AS TemptblFeeDetails    
WHERE Amount >= 0    
  AND [D/C]=N'Debit'    
  AND DebitStudentFeeID IS NOT NULL AND DebitStudentFeeID <> 0
 
 --take all records from temp. table.        
 IF(@ShowOnlyDebits=1)  
 BEGIN   
 INSERT INTO #TemptblFeeDetails VALUES(-9999,N'0',1,N'9999-12-31 23:59:59.997',N'0',0,0,N'Debit',N'0',0,N'0',0,0,N'0',0,0,0,0,0,0,0,'')  
 INSERT INTO #TemptblFeeDetails VALUES(-9998,N'0',1,N'9999-12-31 23:59:59.997',N'0',0,0,N'Debit',N'0',0,N'0',0,0,N'0',0,0,0,0,0,0,0,'')
 
 INSERT INTO @tblFeeDetailsAsPerMode  
 SELECT Schoolwise_Student_Fee_Id    
	  ,Payable_For    
	  ,Amount    
	  ,Paid_Date as DueDate   
	  ,Fee_Type     
	  ,Amount_Payable    
	  ,[D/C]    
	  ,Receipt_Number    
	  ,Serial_Number      
	  ,Std_Fee_Type_Id    
	  ,Late_Fee_Amt       
	  ,0
	  ,0
	  ,AccountHeaderId
   FROM #TemptblFeeDetails AS TemptblFeeDetails    
  WHERE Amount >= 0    
    AND [D/C]=N'Debit'    
    AND Schoolwise_Student_Fee_Id NOT IN(SELECT Schoolwise_Student_Fee_Id 
											FROM Schoolwise_Student_Fee_Details
											WHERE School_Id = @SchoolId
											 AND Academic_Year_Id = @AcademicYearId
											 AND Student_Id = @StudentId
											 AND Is_Deleted = 'N'
											 AND [Debit/Credit]='Debit'
											 AND RefundFeeDetailsID IS NOT NULL
											 AND RefundFeeDetailsID <> 0
										)										

IF(@ReceiptNumber <> 0)
BEGIN

	INSERT INTO @tblFeeDetailsAsPerMode  
	SELECT DISTINCT TemptblFeeDetails.Schoolwise_Student_Fee_Id,    
		   TemptblFeeDetails.Payable_For,    
		   TemptblFeeDetails.Amount,    
           TemptblFeeDetails.Paid_Date as DueDate,   
           TemptblFeeDetails.Fee_Type,     
		   TemptblFeeDetails.Amount_Payable,    
		   [D/C],    
		   TemptblFeeDetails.Receipt_Number,    
		   TemptblFeeDetails.Serial_Number,    		  
		   Std_Fee_Type_Id,    		  
		   dbo.UDF_GetLateFeeAmt(TemptblFeeDetails.Std_Fee_Type_Id, TemptblFeeDetails.Paid_Date, @CurrentDate) AS Late_Fee_Amt,		  
		   0,
		   0,
		   TemptblFeeDetails.AccountHeaderId
	  FROM #TemptblFeeDetails AS TemptblFeeDetails    
INNER JOIN Schoolwise_Student_Fee_Details SSFD WITH(NOLOCK)   
		ON TemptblFeeDetails.Schoolwise_Student_Fee_Id=SSFD.Student_Fee_Id
	   AND TemptblFeeDetails.Receipt_Number=SSFD.Receipt_Number
	 WHERE TemptblFeeDetails.Amount >= 0    
	   AND [D/C]=N'Credit'  
	   AND TemptblFeeDetails.Receipt_Number = @ReceiptNumber
	   AND SSFD.Is_Late_Fee=N'N'
	   AND SSFD.Is_Deleted=N'N'	


DECLARE @SerialNum INT	= 0
SELECT TOP 1 @SerialNum = Serial_Number 
  FROM Schoolwise_Student_Fee_Details
 WHERE Receipt_Number = @ReceiptNumber
   AND Academic_Year_Id = @AcademicYearId
   AND Student_Id = @StudentId
   AND Is_Deleted=N'N'
   AND [Debit/Credit]=N'Credit'

DECLARE @TotalCnt INT=0,
		@StudFeeId INT,
		@DebitAmount INT,
		@DebitStudentFeeID INT

	SELECT @TotalCnt = COUNT(1) FROM @PartialDebitCredit
	WHILE(@TotalCnt > 0)
	BEGIN		
		SELECT TOP 1 @StudFeeId= SchoolwiseStudentFeeId,
			   @DebitAmount = Amount,
			   @DebitStudentFeeID =  DebitStudentFeeID  					
		  FROM @PartialDebitCredit	   
		 
		UPDATE @tblFeeDetailsAsPerMode
		   SET Amount_Payable = (Amount + @DebitAmount)			   			   
		 WHERE Schoolwise_Student_Fee_Id = @DebitStudentFeeID
		
		DELETE FROM @PartialDebitCredit WHERE SchoolwiseStudentFeeId = @StudFeeId
		
		IF(@SerialNum <> 0) 		  
		BEGIN
		DELETE FROM @tblFeeDetailsAsPerMode 
		 WHERE Schoolwise_Student_Fee_Id = @StudFeeId
		   AND [D/C]=N'Debit'
		   AND Serial_Number = @SerialNum			
		END
		SELECT @TotalCnt = COUNT(1) FROM @PartialDebitCredit	
	END	 

	INSERT INTO @PartialDebitCredit
	SELECT Schoolwise_Student_Fee_Id    	  	  
		  ,Amount    	  
		  ,0
	 FROM @tblFeeDetailsAsPerMode AS TemptblFeeDetails    
	WHERE Amount >=0
	  AND [D/C]=N'Credit'    
	  AND Receipt_Number = @ReceiptNumber
	  AND Amount_Payable = 0  	
  
  	SELECT @TotalCnt = COUNT(1) FROM @PartialDebitCredit
	WHILE(@TotalCnt > 0)
	BEGIN		
		SELECT TOP 1 @StudFeeId= SchoolwiseStudentFeeId			   
		  FROM @PartialDebitCredit	   
		 
		UPDATE @tblFeeDetailsAsPerMode
		   SET Amount_Payable = Amount
		 WHERE Schoolwise_Student_Fee_Id = @StudFeeId
		  
		DELETE FROM @PartialDebitCredit WHERE SchoolwiseStudentFeeId = @StudFeeId		
		SELECT @TotalCnt = COUNT(1) FROM @PartialDebitCredit	
	END	 

	DECLARE @tblFeeDetails AS TABLE
	 (
		StudentFeeId INT,
		PaidAmount INT
	 )
	INSERT INTO @tblFeeDetails
	SELECT DISTINCT Schoolwise_Student_Fee_Id,Amount_Paid
   	  FROM #TemptblFeeDetails    
	 WHERE Is_Cheque_Bounce = N'N'    
	   AND Is_Concession = N'N'    
	   AND (RefundFeeDetailsID IS NULL OR RefundFeeDetailsID = 0)    
	   AND Receipt_Number = @ReceiptNumber
	   
	 SELECT @AmtPaid = SUM(PaidAmount) 
	   FROM @tblFeeDetails  	    
		
	SELECT @TotalPaidlatefee= Amount 
	  FROM Schoolwise_Student_Fee_Details
	 WHERE Receipt_Number = @ReceiptNumber
	   AND Is_Late_Fee = N'Y'
	   AND Is_Deleted = N'N'
	   AND [Debit/Credit]=N'Credit'
	   AND Student_Id = @StudentId
	   AND Academic_Year_Id = @AcademicYearId

	 --Take sum of amount payable        
	 SELECT @AmtPayable = SUM(tbl2.Amount_Payable)    
	   FROM #TemptblFeeDetails tbl1    
INNER JOIN @tblFeeDetailsAsPerMode tbl2
		 ON tbl1.Schoolwise_Student_Fee_Id = tbl2.Schoolwise_Student_Fee_Id
	  WHERE Is_Cheque_Bounce = N'N'    
		AND (RefundFeeDetailsID IS NULL OR RefundFeeDetailsID = 0)    
		AND tbl2.Receipt_Number = @ReceiptNumber

	IF(@PaymentType = 2)
	BEGIN
		 SELECT @AmtPayable = SUM(Amount_Payable)    
		   FROM @tblFeeDetailsAsPerMode 			 
		  WHERE Receipt_Number = @ReceiptNumber
		    AND [D/C]=N'Credit'
	END
			    	    
	 --Take sum of late fee amount         
	 SELECT @TotalLateFee = SUM(tbl1.Late_Fee_Amt)    
	   FROM #TemptblFeeDetails tbl1    
 INNER JOIN @tblFeeDetailsAsPerMode tbl2
		 ON tbl1.Schoolwise_Student_Fee_Id = tbl2.Schoolwise_Student_Fee_Id   
	  WHERE Is_Cheque_Bounce = N'N'    
		AND (RefundFeeDetailsID IS NULL	OR RefundFeeDetailsID = 0)    
		AND tbl2.Receipt_Number = @ReceiptNumber
		
	 --Concession Amount
	SELECT @TotalConcessionAmt = SUM(tbl1.Amount)    
      FROM #TemptblFeeDetails tbl1    
INNER JOIN Schoolwise_Student_Fee_Details tbl2  WITH(NOLOCK)     
     	ON tbl1.Schoolwise_Student_Fee_Id = tbl2.Schoolwise_Student_Fee_Id   
     WHERE tbl2.Is_Concession_Fee = N'Y'    
	   AND tbl2.Is_Cheque_Bounce = N'N'    
	   AND Is_Deleted = N'N'    
	   AND [Debit/Credit] = N'Credit'    
	   AND tbl2.Receipt_Number = @ReceiptNumber	   
 
END  
-------------------------------------------------- Here we get the last used bank for cheque payments----------------------------------------------------------

	DECLARE @LastChequeBank INT = 0
	IF(@ShowOnlyDebits = 1)
	BEGIN
		IF EXISTS(SELECT TOP 1 1
				    FROM Schoolwise_Student_Fee_Details SSFD WITH(NOLOCK)      
			  INNER JOIN Schoolwise_Student_PostDatedCheques SSPDC WITH(NOLOCK)      
			  INNER JOIN Schoolwise_Bank_Master SBM WITH(NOLOCK)      
			 		  ON SSPDC.Bank_Id = SBM.Schoolwise_Bank_Id    
			  INNER JOIN Student_Fee_PDC_Details SFPDCD WITH(NOLOCK)      
					  ON SSPDC.PostDated_Cheque_Id = SFPDCD.PDC_Id    
					  ON SSFD.Schoolwise_Student_Fee_Id = SFPDCD.Schoolwise_Student_Fee_Id    
	  			   WHERE SSFD.Is_Deleted = N'N'    			
					 AND SSFD.Academic_Year_Id = @AcademicYearId
					 AND SSFD.Student_Id = @StudentId
			     )
		BEGIN
			SELECT TOP 1 @LastChequeBank = SBM.Schoolwise_Bank_Id
				    FROM Schoolwise_Student_Fee_Details SSFD WITH(NOLOCK)      
			  INNER JOIN Schoolwise_Student_PostDatedCheques SSPDC WITH(NOLOCK)      
			  INNER JOIN Schoolwise_Bank_Master SBM WITH(NOLOCK)      
			 		  ON SSPDC.Bank_Id = SBM.Schoolwise_Bank_Id    
			  INNER JOIN Student_Fee_PDC_Details SFPDCD WITH(NOLOCK)      
					  ON SSPDC.PostDated_Cheque_Id = SFPDCD.PDC_Id    
					  ON SSFD.Schoolwise_Student_Fee_Id = SFPDCD.Schoolwise_Student_Fee_Id    
	  			   WHERE SSFD.Is_Deleted = N'N'    			
					 AND SSFD.Academic_Year_Id = @AcademicYearId
					 AND SSFD.Student_Id = @StudentId
			    ORDER BY SSFD.Receipt_Number desc 
		END
	END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @RuleId INT, @IsNewStudent BIT

SELECT @RuleId = Rule_Id, @IsNewStudent = Is_New_Student
FROM Yearwise_Student_Details
WHERE Academic_Year_Id = @AcademicYearId
AND Yearwise_Student_Id = @StudentId
AND IS_Deleted = 'N'

SELECT DISTINCT Schoolwise_Student_Fee_Id,    
	   Payable_For,    
	   Amount,    
	   DueDate,   
	   Fee_Type,    	 
	   Amount_Payable,    
	   [D/C],    
	   Receipt_Number,     
	   ISNULL(Serial_Number,0) as Serial_Number,    	  
	   ISNULL(Std_Fee_Type_Id,0) as Std_Fee_Type_Id,    
	    case when ExcludeLateFeeDetails.YearwiseStudentId is not null then 0 else Late_Fee_Amt  End  AS  Late_Fee_Amt,
	   DBO.UDF_GetTotalAmtForDefaultDebitEntryWithConcession(ISNULL(Std_Fee_Type_Id,0),@IsNewStudent, @RuleId, Amount) AS ConcessionAmount,
	   ISNULL(AccountHeaderId,0) AS AccountHeaderId	,	   
	   ISNULL(@CautionMoneyRemainingAmount,0) AS  CautionMoneyRemainingAmount   
  FROM @tblFeeDetailsAsPerMode AS tblFeeDetailsAsPerMode
   LEFT OUTER JOIN ExcludeLateFeeDetails ON ExcludeLateFeeDetails.YearWiseStudentId=@StudentId
	 AND ExcludeLateFeeDetails.FeeType=tblFeeDetailsAsPerMode.Fee_Type
	 AND ExcludeLateFeeDetails.PayableFor=tblFeeDetailsAsPerMode.Payable_For
	 AND ExcludeLateFeeDetails.IsDeleted=0
ORDER BY DueDate,    
	   Schoolwise_Student_Fee_Id,    
	   Serial_Number,    
	   Fee_Type       
	 
SELECT TOP 1 ISNULL(@AmtPaid,0) as Paid ,		   
		   ISNULL(@TotalPaidlatefee,0) as PaidLateFee,
		   ISNULL(@AmtPayable,0) as Payble,
		   ISNULL(@TotalLateFee,0) as ApplicableLateFee,
		   ISNULL(@TotalConcessionAmt,0) as Concession,
		   (CASE WHEN ISNULL(Is_Directly_Deposited,N'N') = N'N' THEN 0 ELSE 1 END) as IsDirectlyDeposited,		   
		   ISNULL(DepositBankId,0) as DepositBankId,
		   Bank_Id,
		   ISNULL(ChallanNo,0) as ChallanNo,
		   Remarks,
		   AdditionalRemark,
		   Paid_Date,
		   case when ACD.ReceiptNumber is null then 0 else 1 end as IsCautionMoneyAdjusted,
		   ISNULL(SJVP.LedgerId,0) AS JournalVoucherLedgerId,
		   ISNULL(FileName,'') AS FileName
	FROM Schoolwise_Student_Fee_Details SSFD WITH(NOLOCK)	  
	  LEFT OUTER JOIN AdjustCautionMoneyDetails ACD
	  ON SSFD.Student_Id = ACD.YearwiseStudentId
	  AND SSFD.Receipt_Number = ACD.ReceiptNumber
	  AND ACD.IsDeleted = 0
	  AND ACD.AcademicYearId = @AcademicYearId
	  LEFT OUTER JOIN StudentJournalVoucherPayments SJVP
	  ON SSFD.Student_Id = SJVP.StudentId
	  AND SSFD.Receipt_Number = SJVP.ReceiptNumber
	  AND SJVP.IsDeleted = 0
	  LEFT OUTER JOIN FeePaymentDocumentDetails FPDC
	  ON SSFD.Student_Id = FPDC.StudentId
	  AND SSFD.Receipt_Number = FPDC.ReceiptNo
	  AND FPDC.IsDeleted = 0

	 WHERE Receipt_Number = @ReceiptNumber
	   AND Is_Deleted = N'N'
	   AND Academic_Year_Id = @AcademicYearId
	   AND [Debit/Credit] = 'Credit'
	 ORDER BY Schoolwise_Student_Fee_Id desc
	 
 END      
 
 -- Following procedure is called to get the payment details as per the mode of payment
 EXEC [dbo].[usp_GetFeeDetailsByPaymentMode] @StudentId,@AcademicYearID,@ReceiptNumber,@PaymentType
 
 SELECT @LastChequeBank as LastChequeBank     
 DROP TABLE #tempStudent_Debit_Details    
 DROP TABLE #TemptblFeeDetails    
END
GO
