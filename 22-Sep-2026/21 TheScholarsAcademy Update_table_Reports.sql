update Reports
set Report_Name = 'LeavingCertificate_TSA.rpt',
UsedVwOrUSPList = 'usp_LeavingCertificateForTSA'
where Report_Id = 32
and Is_Deleted = 'N'

update Report_Fields
set Field_name = '{usp_LeavingCertificateForTSA;1.Enrolment_Number}'
where Report_Field_Id = 118
and Is_Deleted = 'N'

update Report_Fields
set Field_name = '{usp_LeavingCertificateForTSA;1.PrintDate}'
where Report_Field_Id = 500
and Is_Deleted = 'N'