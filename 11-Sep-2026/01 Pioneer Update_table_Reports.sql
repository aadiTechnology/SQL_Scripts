update Reports
set Report_Name = 'AnnualConsolidationReportNew.rpt',
UsedVwOrUSPList = 'usp_AnnualConsolidationReportNew',
Is_Deleted = 'N'
where Report_Id = 189

update Report_Fields
set Field_name = '{usp_AnnualConsolidationReportNew;1.Standard_Id}'
where Report_Field_Id = 686
and Is_Deleted = 'N'

update Report_Fields
set Field_name = '{usp_AnnualConsolidationReportNew;1.Division_Id}'
where Report_Field_Id = 687
and Is_Deleted = 'N'

update Report_Fields
set Field_name = '{usp_AnnualConsolidationReportNew;1.SchoolwiseTestId}'
where Report_Field_Id = 688
and Is_Deleted = 'N'

update Report_Fields
set Filter_Field_Name = '{usp_AnnualConsolidationReportNew;1.Standard_Id}'
where Report_Field_Id = 687
and Is_Deleted = 'N'
