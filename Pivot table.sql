
Pivot Table :
	When we have a requirement to convert column value into row header then we have to use pivot table.
	Pivot table is used for creating report and data analysis.

	-- Syntax
		Select column1,column2,column3 from
			(Select column1,column2,column3 from table_name) as tbl1
		pivot
			(Aggregate function for 
				(column to be used for total)[COlumn to be used as header]) as tbl2
		group by tbl2.column


		Create table tbl_SalesByRegion
		(
			Region nvarchar(100),
			Sales_Year int,
			Sales_Amount decimal(18,2)
		)

		Insert into tbl_SalesByRegion(Region,Sales_Year,Sales_Amount)
		values('South',2010,500),('North',2010,250),('East',2011,500),('South',2011,200),
			('East',2012,300)


		---Select data by Region wise..
		Select Region,ISNULL([2010],0) as [2010],ISNULL([2011],0) as [2011],
			ISNULL([2012],0) as [2012] from
			(Select Region,Sales_Year,Sales_Amount from tbl_SalesByRegion) as tbl1
		pivot
			(Sum(Sales_Amount) for [Sales_Year] in ([2010],[2011],[2012])) as tbl2
		order by tbl2.Region

		---Select data by Region wise..

		Select Sales_Year,ISNULL([South],0) as[South],ISNULL([North],0) as [North],
		ISNULL([East],0) as East from
		(Select Sales_Year,Region,Sales_Amount from tbl_SalesByRegion) as tbl1

		pivot
			(Sum(Sales_Amount) for [Region] in ([South],[North],[East]) ) as tbl2
