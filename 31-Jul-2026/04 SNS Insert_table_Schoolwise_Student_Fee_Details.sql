DECLARE @YearwiseStudentId INT = 39173;

UPDATE SSFD
SET Amount = 6500
FROM Schoolwise_Student_Fee_Details SSFD
WHERE Student_Id = @YearwiseStudentId
AND Academic_Year_Id = 13
AND Is_Deleted = 'N'
AND [Debit/Credit] = 'Debit'
AND Fee_Type = 'Transport Fees'
AND Payable_For = 'Transport Fees - I'
AND Schoolwise_Student_Fee_Id = 826011;


UPDATE SSFD
SET Amount = 6500
   ,Remarks=' Amount paid for Transport Fees - I (Transport Fees - Rs. 6500/-)  '
FROM Schoolwise_Student_Fee_Details SSFD
WHERE Student_Id = @YearwiseStudentId
AND Academic_Year_Id = 13
AND Is_Deleted = 'N'
AND [Debit/Credit] = 'Credit'
AND Fee_Type = 'Transport Fees'
AND Payable_For = 'Transport Fees - I'
AND Schoolwise_Student_Fee_Id = 840599;

Update SSFD
Set Amount=5000
from Schoolwise_Student_Fee_Details SSFD
Where Student_Id=@YearwiseStudentId
ANd Academic_Year_Id=13
AND Is_Deleted='N'
AND [Debit/Credit]='Debit'
AND Schoolwise_Student_Fee_Id =826012
AND Fee_Type= 'Transport Fees'
AND Payable_For='Transport Fees - II'

Update SSFD
Set Amount=5400
from Schoolwise_Student_Fee_Details SSFD
Where Student_Id=@YearwiseStudentId
ANd Academic_Year_Id=13
AND Is_Deleted='N'
AND [Debit/Credit]='Debit'
AND Schoolwise_Student_Fee_Id =826013
AND Fee_Type= 'Transport Fees'
AND Payable_For='Transport Fees - III'


INSERT INTO Schoolwise_Student_Fee_Details
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
    Serial_Number,
    Is_Cheque_Bounce,
    RefundFeeDetailsID,
    NetBankingPaymentTransactionID,
    IsReceiptConsidered,
    Is_Completed,
    IsCardPayment,
    School_Id,
    Academic_Year_Id,
    Is_Late_Fee,
    Is_Concession_Fee,
    Is_Directly_Deposited,
    Is_Arrears,
    Bank_Id,
    Is_Deleted,
    Insert_Date,
    Inserted_By_id,
    Update_Date,
    Updated_By_Id,
    DebitStudentFee_Id,
    DepositBankId,
    ChallanNo,
    IntervalStartDate,
    IntervalEndDate,
    DummySchoolwise_Student_Fee_Id,
    IsElectronicPayment,
    AccountHeaderId,
    AdditionalRemark,
    IsJournalVoucherPayment
)
SELECT
    Student_Id,
    Payable_For,
    Standard_Div_Id,
    Std_FeeType_Id,
    Fee_Type,
     1500,                     
    'Debit',
    Paid_Date,
    Receipt_Number,
    Remarks,
    Student_Fee_Id,
    Serial_Number,
    Is_Cheque_Bounce,
    RefundFeeDetailsID,
    NetBankingPaymentTransactionID,
    IsReceiptConsidered,
    Is_Completed,
    IsCardPayment,
    School_Id,
    Academic_Year_Id,
    Is_Late_Fee,
    Is_Concession_Fee,
    Is_Directly_Deposited,
    Is_Arrears,
    Bank_Id,
    'N',
    dbo.GetLocalDate(default),
    1,                 
    dbo.GetLocalDate(default),
    1,               
    826012,           
    DepositBankId,
    ChallanNo,
    IntervalStartDate,
    IntervalEndDate,
    DummySchoolwise_Student_Fee_Id,
    IsElectronicPayment,
    AccountHeaderId,
    AdditionalRemark,
    IsJournalVoucherPayment
FROM Schoolwise_Student_Fee_Details
WHERE Schoolwise_Student_Fee_Id = 826012
  AND [Debit/Credit] = 'Debit';

  DECLARE @ReceiptNo INT, @SerialNo INT;

SELECT @ReceiptNo = MAX (Convert(Int,Receipt_Number))
FROM Schoolwise_Student_Fee_Details
WHERE Academic_Year_Id=13
AND School_Id=122
AND Fee_Type = 'Transport Fees'

SELECT @SerialNo = MAX(Serial_Number)
FROM Schoolwise_Student_Fee_Details
WHERE School_Id=122
AND Fee_Type = 'Transport Fees'

SET @ReceiptNo = @ReceiptNo + 1;
SET @SerialNo = @SerialNo + 1;

  INSERT INTO Schoolwise_Student_Fee_Details
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
    Serial_Number,
    Is_Cheque_Bounce,
    RefundFeeDetailsID,
    NetBankingPaymentTransactionID,
    IsReceiptConsidered,
    Is_Completed,
    IsCardPayment,
    School_Id,
    Academic_Year_Id,
    Is_Late_Fee,
    Is_Concession_Fee,
    Is_Directly_Deposited,
    Is_Arrears,
    Bank_Id,
    Is_Deleted,
    Insert_Date,
    Inserted_By_id,
    Update_Date,
    Updated_By_Id,
    DebitStudentFee_Id,
    DepositBankId,
    ChallanNo,
    IntervalStartDate,
    IntervalEndDate,
    DummySchoolwise_Student_Fee_Id,
    IsElectronicPayment,
    AccountHeaderId,
    AdditionalRemark,
    IsJournalVoucherPayment
)
SELECT
    Student_Id,
    Payable_For,
    Standard_Div_Id,
    Std_FeeType_Id,
    Fee_Type,
    5000,
   'Credit',
    '2026-04-26 23:05:10.967',      
    @ReceiptNo,                         
    'Amount paid for Transport Fees - II (Tuition Fees - Rs. 5000/-).',
    Schoolwise_Student_Fee_Id,
    @SerialNo,
    'N',
    NULL,
    113989,                      
    0,
    0,
    0,
    School_Id,
    Academic_Year_Id,
    Is_Late_Fee,
    Is_Concession_Fee,
    Is_Directly_Deposited,
    Is_Arrears,
    Bank_Id,
    'N',
    '2026-04-26 23:05:10.967',
    NULL,
    '2026-04-26 23:05:10.967',
    39173,
    826012,
    DepositBankId,
    ChallanNo,
    IntervalStartDate,
    IntervalEndDate,
    DummySchoolwise_Student_Fee_Id,
    IsElectronicPayment,
    AccountHeaderId,
    AdditionalRemark,
    IsJournalVoucherPayment
FROM Schoolwise_Student_Fee_Details
WHERE Schoolwise_Student_Fee_Id = 826012
  AND [Debit/Credit] = 'Debit';

  UPDATE SAD
  Set FeeAreaName=12
     ,UpdateDate=dbo.GetLocalDate(default)
	 ,UpdatedById=2
  from StudentAdditionalDetails SAD
  where SchoolwiseStudentId=2299
  AND FeeAreaName=15
  AND IsDeleted=0

 

