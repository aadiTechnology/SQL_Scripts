update bcd
set SchoolCurrentAccountNumber = case when SchoolCurrentAccountNumber = '380' then '028330100000380' when SchoolCurrentAccountNumber = '381' then '028330100000381' else SchoolCurrentAccountNumber end
from BankChallanDetails bcd
inner join vw_standard_division vsd
on bcd.StandardDivisionId = vsd.SchoolWise_Standard_Division_Id
inner join Schoolwise_Fee_Type_Configuration sftc
on bcd.OriginalFeeTypeId = sftc.Original_Fee_Type_Id
and vsd.academic_year_id = sftc.Academic_Year_Id
where vsd.academic_year_id = 14
and bcd.IsDeleted = 0
and sftc.Is_Deleted = 'N'
and sftc.Fee_Type IN ('Software Development Fees','E - Campus Fees')
and (Standard_Name like '11 %' or Standard_Name like '12 %')