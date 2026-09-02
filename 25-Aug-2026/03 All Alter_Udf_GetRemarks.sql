/****** Object:  UserDefinedFunction [dbo].[Udf_GetRemarks]    Script Date: 8/25/2025 11:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter FUNCTION [dbo].[Udf_GetRemarks](@School_Id INT, @Academic_Year_Id INT,@Receipt_Number VARCHAR(50))
RETURNS NVARCHAR(MAX) 

AS  
BEGIN 
DECLARE @PayableFor NVARCHAR(MAX) 

SELECT  @PayableFor =  COALESCE(@PayableFor + ', ' , '') + Payable_For + ' ('+ Fee_Type + ' - Rs. ' +convert(nvarchar(100),Amount) + '/-)'
						FROM    Schoolwise_Student_Fee_Details  
						WHERE ([Debit/Credit] = N'Credit') AND (Receipt_Number = @Receipt_Number) AND (Is_Cheque_Bounce = 'N') 
								AND (Is_Deleted = 'N') AND (Is_Late_Fee = 'N') AND Academic_Year_Id = @Academic_Year_Id and Is_Concession_Fee='N'
						ORDER BY Schoolwise_Student_Fee_Id
SELECT  @PayableFor =  COALESCE(@PayableFor+ '' , '')+' with Concession (Fee Concession - Rs. ' +convert(nvarchar(100),Amount) + '/-)'
						FROM    Schoolwise_Student_Fee_Details  
						WHERE ([Debit/Credit] = N'Credit') AND (Receipt_Number = @Receipt_Number) AND (Is_Cheque_Bounce = 'N') 
								AND (Is_Deleted = 'N') AND (Is_Late_Fee = 'N') AND Academic_Year_Id = @Academic_Year_Id and Is_Concession_Fee='Y'
						ORDER BY Schoolwise_Student_Fee_Id
						


SELECT  @PayableFor =  COALESCE(@PayableFor + ' & Late Fee for ' , '') + Payable_For + ' ( Rs. '+ convert(nvarchar(100),Amount) + '/-)'
						FROM    Schoolwise_Student_Fee_Details  
						WHERE ([Debit/Credit] = N'Credit') AND (Receipt_Number = @Receipt_Number) AND (Is_Cheque_Bounce = 'N') 
								AND (Is_Deleted = 'N') AND (Is_Late_Fee = 'Y') AND Academic_Year_Id = @Academic_Year_Id
						ORDER BY Schoolwise_Student_Fee_Id
					

RETURN @PayableFor

END
GO
