Update Reports 
Set Report_Name='Bonafide Certificate For TheScholarsAcademy.rpt'
   ,UsedVwOrUSPList='usp_GetBonafideStudentDetails_TSA'
Where Report_Id=83
AND Is_deleted='N'


UPDATE Report_Fields
SET Field_name = REPLACE(Field_name,
    'usp_GetBonafideCertificateDetails_Report',
    'usp_GetBonafideStudentDetails_TSA')
WHERE Report_Field_Id IN (283,284,285,424,751);

UPDATE Report_Fields
SET Filter_Field_Name = REPLACE(Filter_Field_Name,
    'usp_GetBonafideCertificateDetails_Report',
    'usp_GetBonafideStudentDetails_TSA')
WHERE Report_Field_Id IN (283,284,285,424,751)
AND Filter_Field_Name IS NOT NULL;