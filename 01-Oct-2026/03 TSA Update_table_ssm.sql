update ssm
set Admission_Date = '2026-04-01',
	Joining_Date = '2026-04-01'
from SchoolWise_Student_Master ssm
inner join vw_BaseStudentDetails bsd
on ssm.SchoolWise_Student_Id = bsd.SchoolWise_Student_Id
where studentname in 
(
	'Miss Aaradhya Ketan Gaikwad',
'Miss Ananya Baburao Gaikwad',
'Miss Shreya Rahul Badekar',
'Master Devansh Navnath Pawar',
'Master Harshad Balasaheb Hungarge',
'Master Junaid Enus Pathan',
'Master Rugved Govind Gaikwad',
'Master Shivansh Amar Gaikwad',
'Master Shrinil Bajirao Kanawade',
'Master Swaroop Santosh Shinde',
'Master Yadwik Mangesh Gaikwad',
'Master Kartik Shyamrao Markad',
'Master Shlok Dhananjay Gaikwad',
'Master Arush Ganesh Godage',
'Miss Avira Akash Gaikwad',
'Master Shivansh Nilesh Gaikwad',
'Master Abhay Baliram Sagar',
'Master Shrihari Ravi Chakali',
'Miss Sanvi Kishor Bhalsing',
'Miss Avani Balasaheb Baste',
'Miss Ansurya'
)
and ssm.Is_Deleted = 'N'
and ssm.SchoolLeft_Date is null
and ssm.School_Id = 173