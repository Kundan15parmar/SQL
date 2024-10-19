
		use SQLPracDb

		create table tbl_AmazonData
		(
			Order_ID nvarchar(50),
			Order_Date datetime,
			Ship_Date datetime,
			Customer_Name nvarchar(25),
			Country nvarchar(25),
			City nvarchar(25),
			[State] nvarchar(25),
			Category nvarchar(25),
			Product_Name nvarchar(max),
			Sales decimal(18,2),
			Quantity decimal(18,2),
			Profit decimal(18,2)

		)

		Bulk insert tbl_AmazonData 
		from 'C:\Users\Kiran\Downloads\Amazon 1 Final.xlsx'
		with
		(
			Format = 'xlsx',
			Firstrow = 2
		)