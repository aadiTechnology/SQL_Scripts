BEGIN TRANSACTION
BEGIN TRY

DECLARE @iSerialNo INT SELECT  @iSerialNo =  dbo.UDF_NextSerialNo(18)         

INSERT  INTO   Schoolwise_Debit_Entry_Log(Payable_For,Amount,Paid_Date,Remarks,School_Id,Academic_Year_Id,Inserted_By_id,Insert_Date,Fee_Type ,Serial_Number  , Standard_Id  , Division_Id  , IsConsiderForRTEStudent, AccountHeaderId,IsDueDateApplicable)
select N'Migration Certificate Fee'  , 250 , N'05-06-2026'  , N''  , 18 , 57 , 4529 ,dbo.getlocaldate(default) ,  N'Migration Certificate Fee'  , @iSerialNo  , 1110 , 1316,1,0,1

INSERT  INTO  Schoolwise_Student_Fee_Details(Payable_For,Standard_Div_Id,Amount,[Debit/Credit],Paid_Date,Remarks,School_Id,Academic_Year_Id,Inserted_By_id,Insert_Date,Fee_Type ,Student_Id ,Serial_Number ,Std_FeeType_Id, IntervalStartDate, IntervalEndDate, AccountHeaderId) 
SELECT DISTINCT  N'Migration Certificate Fee'  , vsd.SchoolWise_Standard_Division_Id   , 250 , N'Debit'  , N'05-06-2026'  , N''  , 18 , 57 , 4529 ,dbo.getlocaldate(default) , N'Migration Certificate Fee'  , ysd.YearWise_Student_Id  , @iSerialNo  , 0,N'04-01-2026',N'03-31-2027',0 
FROM vw_standard_division VSD 
INNER JOIN YearWise_Student_Details YSD 
ON VSD.Standard_Id = YSD.Standard_Id
and vsd.Division_Id = ysd.Division_id
INNER JOIN SchoolWise_Student_Master SSM 
on YSD.Student_Id=SSM.SchoolWise_Student_Id  
WHERE vsd.SchoolWise_Standard_Division_Id = 1511 
AND YSD.Is_Deleted='N'  

print 'Success!'
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	THROW
END CATCH