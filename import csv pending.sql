USE SQLPracDb

CREATE TABLE EmployeeData
(
	EEID nvarchar(25),
	Full_Name nvarchar(50),
	Job_Tilte nvarchar(50),
	Department nvarchar(50),
	Business_Unit nvarchar(50),
	Gender nvarchar(11),
	Ethnicity nvarchar(10),
	Age int,
	Hire_Date nvarchar(25),
	Annual_Salary nvarchar(25),
	[Bonus%] nvarchar(25),
	Country nvarchar(25),
	City nvarchar(25),
	Exit_Date nvarchar(25)

)

Bulk insert tbl_AmazonData 
	from 'C:\Users\Kiran\Desktop\Data Analytics\Power BI\EmployeeDataCsv.csv'
	with
	(
		Format = 'csv',
		Firstrow = 2
	)