/****** Object:  StoredProcedure [dbo].[usp_GetStudentPaidFeeDetailsToEdit]    Script Date: 8/25/2025 11:29:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
ALTER PROCEDURE [dbo].[usp_GetStudentPaidFeeDetailsToEdit]   
  @Student_Id INT  
 ,@Receipt_Number INT  
 ,@AcademicYearId INT  
 ,@SchoolId INT  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.  
 SET NOCOUNT ON;  
 DECLARE @tblCheckDetails AS TABLE  
 (  
   Receipt_Number NVARCHAR(20)  
  ,StudentId INT  
  ,Cheque_Number NVARCHAR(50)  
  ,Cheque_Date Datetime  
  ,Bank_Name NVARCHAR(50)  
  ,Cheque_Amount INT  
  ,Is_PDC CHAR(1)  
  ,Bank_Id INT  
  ,IsCardPayment bit  
  ,DepositBankId INT  
 )  
   
   
 DECLARE @tblCardOrOnlineDetails AS TABLE  
 (  
  ReceiptNo NVARCHAR(50),  
  StudentId INT,  
  DepositBankId INT  
 )  
   
 INSERT @tblCheckDetails  
 SELECT B.Receipt_Number  
    ,B.Student_Id  
    ,C.Cheque_Number  
    ,C.Cheque_Date  
    ,D.Bank_Name  
    ,C.Cheque_Amount  
    ,C.Is_PDC  
    ,D.Schoolwise_Bank_Id  
    ,IsCardPayment  
    ,C.DepositBankId  
   FROM Student_Fee_PDC_Details A  
INNER JOIN Schoolwise_Student_Fee_Details B  
  ON A.Schoolwise_Student_Fee_Id = B.Schoolwise_Student_Fee_Id  
    AND A.School_Id = B.School_Id  
    AND A.Academic_Year_Id = B.Academic_Year_Id  
INNER JOIN Schoolwise_Student_PostDatedCheques C  
  ON A.PDC_Id = C.PostDated_Cheque_Id  
    AND B.Student_Id = C.Student_Id  
INNER JOIN Schoolwise_Bank_Master D  
  ON C.Bank_Id = D.Schoolwise_Bank_Id  
    AND C.School_Id = D.School_Id   
  WHERE B.Is_Deleted = N'N'  
    AND A.Is_Deleted = N'N'  
    AND C.Is_Deleted = N'N'  
    AND B.Receipt_Number = @Receipt_Number  
    AND B.[Debit/Credit] = N'Credit'  
    AND D.Is_Deleted = N'N'  
    AND B.Academic_Year_Id = @AcademicYearID  
    AND C.Student_Id = @Student_Id  
  
  
   
   
 DECLARE @PaymentMode NVARCHAR(20)  
   
 IF (@Receipt_Number IN (SELECT Receipt_Number  
         FROM @tblCheckDetails))  
  SET @PaymentMode =N'By Cheque'  
 ELSE IF (@Receipt_Number IN (SELECT A.Receipt_Number  
           FROM dbo.Schoolwise_Student_Fee_Details A  
          WHERE A.IsCardPayment = 1  
            AND A.School_Id = @SchoolId  
            AND A.Academic_Year_Id = @AcademicYearId  
            AND A.Is_Deleted = N'N'  
            AND A.Is_Late_Fee = N'N'  
            AND A.Receipt_Number = @Receipt_Number))  
  SET @PaymentMode=N'By Card'  
 ELSE   
  SET @PaymentMode=N'By Cash'  
  
  
 IF @PaymentMode = N'By Card'  
  INSERT @tblCardOrOnlineDetails  
  SELECT A.Receipt_Number  
     ,A.Student_Id  
     ,B.DepositBankId  
    FROM dbo.Schoolwise_Student_Fee_Details A  
 INNER JOIN dbo.StudentCardPaymentDetails B  
   ON A.Schoolwise_Student_Fee_Id = B.SchoolWise_Student_Fee_Id  
   WHERE A.School_Id = @SchoolId  
     AND A.Academic_Year_Id = @AcademicYearId  
     AND A.Receipt_Number = @Receipt_Number  
     AND A.Student_Id = @Student_Id  
     AND A.[Debit/Credit] = N'Credit'  
     AND A.Is_Deleted = N'N'  
     AND B.Is_Deleted = 0  
 ELSE IF @PaymentMode = N'By Cash'  
  INSERT @tblCardOrOnlineDetails  
  SELECT A.Receipt_Number  
     ,A.Student_Id  
     ,C.DepositBankId  
    FROM dbo.Schoolwise_Student_Fee_Details A  
 INNER JOIN dbo.NetBankingPaymentTransactions B  
   ON A.NetBankingPaymentTransactionID = B.NetBankingPaymentTransactionID  
 INNER JOIN dbo.NetBankingPaymentTransactions C  
   ON B.PaymentReferenceNumber = C.NetBankingPaymentTransactionID  
     AND B.TransactionStatus <> N'C'  
   WHERE A.School_Id = @SchoolId  
     AND A.Academic_Year_Id = @AcademicYearId  
     AND A.Receipt_Number = @Receipt_Number  
     AND A.Student_Id = @Student_Id  
     AND A.[Debit/Credit] = N'Credit'  
     AND A.Is_Deleted = N'N'  
     AND B.Is_Deleted = 0  
     AND C.Is_Deleted = 0  
    
  
  
 DECLARE @PaidFeeDetails AS TABLE  
 (  
  Schoolwise_Student_Fee_Id INT  
  ,Student_Id INT  
  ,Payable_For NVARCHAR(200)  
  ,Std_Fee_Type_Id INT  
  ,Fee_Type NVARCHAR(50)  
  ,AmtPaid INT  
  ,AmtPayable INT  
  ,FeeMode NVARCHAR(50)  
  ,Paid_Date datetime  
  ,ReceiptNo NVARCHAR(20)  
  ,Remarks NVARCHAR(MAX)  
  ,Student_Fee_Id INT  
  ,Serial_Number INT  
  ,Is_Concession_Fee INT  
  ,DebitStudentFeeId INT  
  ,IsCardPayment BIT  
  ,Cheque_Date DATETIME  
  ,DepositBankId INT  
  ,IsDirectlyDeposited BIT  
  ,BankId INT  
  ,ChallanNo NVARCHAR(15)  
 )  
  
 INSERT @PaidFeeDetails  
    SELECT A.Schoolwise_Student_Fee_Id  
    ,A.Student_Id  
    ,A.Payable_For  
    ,A.Std_FeeType_Id  
    ,A.Fee_Type  
    ,A.Amount AS AmtPaid  
    ,0 AS AmtPayable  
    ,A.[Debit/Credit] AS FeeMode  
    ,A.Paid_Date  
    ,A.Receipt_Number  
    ,A.Remarks  
    ,A.Student_Fee_Id  
    ,A.Serial_Number  
    ,CASE WHEN A.Is_Concession_Fee =N'N'  
    THEN 0  
    ELSE 1  
   END AS Is_Concession_Fee  
    ,A.DebitStudentFee_Id  
    ,A.IsCardPayment  
    ,ISNULL(B.Cheque_Date,dbo.GetLocalDate(DEFAULT)) AS Cheque_Date  
    ,ISNULL(A.DepositBankId,  
      ISNULL(B.DepositBankId,  
       ISNULL(C.DepositBankId,0)))  
    ,CASE WHEN A.Is_Directly_Deposited = N'N'  
    THEN 0  
    ELSE 1  
   END AS IsDirectlyDeposited  
    ,A.Bank_Id  
    ,A.ChallanNo  
      FROM dbo.Schoolwise_Student_Fee_Details A  
LEFT OUTER JOIN @tblCheckDetails B  
  ON B.Receipt_Number = A.Receipt_Number  
    AND B.StudentId = A.Student_Id  
LEFT OUTER JOIN @tblCardOrOnlineDetails C  
  ON C.ReceiptNo = A.Receipt_Number  
    AND C.StudentId = A.Student_Id  
  WHERE A.Student_Id = @Student_Id  
    AND A.Is_Deleted = N'N'  
    AND A.Receipt_Number = @Receipt_Number  
    AND A.Is_Late_Fee = N'N'  
    AND A.Is_Concession_Fee = N'N'  
  
  UNION  
  
 SELECT A.Schoolwise_Student_Fee_Id  
    ,A.Student_Id  
    ,A.Payable_For  
    ,A.Std_FeeType_Id  
    ,A.Fee_Type  
    ,0 AS AmtPaid  
    ,A.Amount AS AmtPayable  
    ,A.[Debit/Credit] As FeeMode  
    ,A.Paid_Date  
    ,A.Receipt_Number  
    ,A.Remarks  
    ,A.Student_Fee_Id  
    ,A.Serial_Number  
    ,CASE WHEN A.Is_Concession_Fee = N'N'  
    THEN 0  
    ELSE 1  
   END AS Is_Concession_Fee  
    ,A.DebitStudentFee_Id  
    ,A.IsCardPayment  
    ,dbo.GetLocalDate(DEFAULT) AS Cheque_Date  
    ,A.DepositBankId  
    ,0 as IsDirectlyDeposited  
    ,A.Bank_Id  
    ,A.ChallanNo  
   FROM dbo.Schoolwise_Student_Fee_Details A  
  WHERE A.Student_Id = @Student_Id  
    AND A.Is_Deleted = N'N'  
    AND A.Schoolwise_Student_Fee_Id NOT IN (SELECT IA.Student_Fee_Id  
             FROM dbo.Schoolwise_Student_Fee_Details IA  
            WHERE IA.Student_Id = @Student_Id  
              AND IA.Is_Deleted = N'N'  
              AND IA.[Debit/Credit] = N'Credit')  
    AND A.[Debit/Credit] = N'Debit'  
  ORDER BY A.[Debit/Credit]  
    ,A.Paid_Date  
    --ORDER BY Paid_Date,Serial_Number  
  
 DECLARE @ActualAmt INT,  
   @DebitAmtToPay INT,  
   @MaxAmtForTheTransaction INT,  
   @LateFee INT,  
   @ConcessionAmt INT,  
   @PaidDate DATETIME  
   
 SELECT @ActualAmt = SUM(AmtPaid)  
   FROM @PaidFeeDetails  
  WHERE FeeMode = N'Credit'  
  
 SELECT @ConcessionAmt = ISNULL(SUM(A.AMOUNT),0)  
   FROM dbo.Schoolwise_Student_Fee_Details A  
  WHERE A.Receipt_Number = @Receipt_Number  
    AND A.Academic_Year_Id = @AcademicYearId  
    AND A.Is_Deleted = N'N'  
    AND A.Is_Cheque_Bounce = N'N'  
    AND A.Is_Concession_Fee = N'Y'  
          
 SELECT @DebitAmtToPay = ISNULL (SUM(AmtPayable),0)  
   FROM @PaidFeeDetails  
  WHERE FeeMode = N'Debit'  
   
 --SELECT @ActualAmt,@DebitAmtToPay  
   
 SET @MaxAmtForTheTransaction = @ActualAmt + @DebitAmtToPay   
  
 SELECT @LateFee = ISNULL(SUM(A.AMOUNT),0)  
   FROM dbo.Schoolwise_Student_Fee_Details A  
  WHERE A.Receipt_Number = @Receipt_Number  
    AND A.Academic_Year_Id = @AcademicYearId  
    AND A.Is_Deleted = N'N'  
    AND A.Is_Cheque_Bounce = N'N'  
    AND A.Is_Late_Fee = N'Y'  
  
 DECLARE @LateFeeRemark NVARCHAR(200)  
   
 IF @LateFee <> 0  
  BEGIN  
   SELECT @LateFeeRemark = (SELECT A.Payable_For  
            FROM dbo.Schoolwise_Student_Fee_Details A  
           WHERE A.Receipt_Number = @Receipt_Number  
             AND A.Academic_Year_Id = @AcademicYearId  
             AND A.Is_Deleted = N'N'  
             AND A.Is_Cheque_Bounce = N'N'  
             AND A.Is_Late_Fee =N'Y')  
  
  END   
  
 --select @LateFeeRemark  
 SELECT TOP (1)  
     @PaidDate = A.Paid_Date  
   FROM dbo.Schoolwise_Student_Fee_Details A  
  WHERE A.Receipt_Number = @Receipt_Number  
    AND A.Academic_Year_Id = @AcademicYearId  
    AND A.Is_Deleted = N'N'  
    AND A.Is_Cheque_Bounce = N'N'   
  
 --SELECT @MaxAmtForTheTransaction   
 --SELECT * FROM @PaidFeeDetails    
  
 IF(@PaymentMode = N'By Cash')  
  SELECT DISTINCT  
      A.Student_Id  
     ,A.FeeMode  
     ,A.Paid_Date  
     ,A.ReceiptNo  
     ,A.Remarks  
     ,@ActualAmt AS ActualAmt  
     ,@MaxAmtForTheTransaction AS MaxAmtForTheTransaction  
     ,@PaymentMode As PaymentMode  
     ,NULL AS Bank_Name  
     ,A.BankId AS Bank_Id  
     ,0 AS Cheque_Amount  
     ,NULL AS Cheque_Number  
     ,@LateFee AS LateFee  
     ,@LateFeeRemark AS LateFeeRemark  
     ,@PaidDate AS PaidDate  
     ,A.Cheque_Date  
     ,@ConcessionAmt AS ConcessionAmt  
     ,A.DepositBankId  
     ,A.IsDirectlyDeposited  
     ,A.ChallanNo  
    FROM @PaidFeeDetails A  
   WHERE A.ReceiptNo = @Receipt_Number  
  
 IF(@PaymentMode = N'By Card')  
  SELECT DISTINCT  
      A.Student_Id  
     ,A.FeeMode  
     ,A.Paid_Date  
     ,A.ReceiptNo  
     ,A.Remarks  
     ,@ActualAmt AS ActualAmt  
     ,@MaxAmtForTheTransaction AS MaxAmtForTheTransaction  
     ,@PaymentMode AS PaymentMode  
     ,NULL AS Bank_Name  
     ,0 AS Bank_Id  
     ,0 AS Cheque_Amount  
     ,NULL AS Cheque_Number  
     ,@LateFee AS LateFee  
     ,@LateFeeRemark AS LateFeeRemark  
     ,@PaidDate AS PaidDate  
     ,A.Cheque_Date  
     ,@ConcessionAmt AS ConcessionAmt  
     ,A.DepositBankId  
     ,A.IsDirectlyDeposited  
     ,A.ChallanNo  
    FROM @PaidFeeDetails A  
   WHERE A.ReceiptNo = @Receipt_Number  
     AND A.IsCardPayment = 1  
  
 IF(@PaymentMode=N'By Cheque')    
  SELECT DISTINCT  
      A.Student_Id  
     ,A.FeeMode  
     ,A.Paid_Date  
     ,A.ReceiptNo  
     ,A.Remarks  
     ,@ActualAmt AS ActualAmt  
     ,@MaxAmtForTheTransaction AS MaxAmtForTheTransaction  
     ,@PaymentMode  AS PaymentMode  
     ,B.Bank_Name  
     ,B.Bank_Id  
     ,B.Cheque_Amount  
     ,B.Cheque_Number  
     ,@LateFee AS LateFee  
     ,@LateFeeRemark AS LateFeeRemark  
     ,@PaidDate AS PaidDate  
     ,ISNULL(B.Cheque_Date, dbo.GetLocalDate(DEFAULT)) AS Cheque_Date  
     ,@ConcessionAmt AS ConcessionAmt  
     ,ISNULL(B.DepositBankId,0) [DepositBankId]  
     ,A.IsDirectlyDeposited  
     ,A.ChallanNo  
    FROM @PaidFeeDetails A  
 INNER JOIN @tblCheckDetails B  
   ON B.Receipt_Number = A.ReceiptNo  
   WHERE A.ReceiptNo = @Receipt_Number  
END
GO
