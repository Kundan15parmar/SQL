Index :
	Index is use to improve retrive process from database table.

	Disadvantage :
		Multiple index can slow down the Insert, update and delete process.

	Normal index
		Allow duplicate values

		-- Syntax :
			create index index_name
			on table_name(column)

			create index index_name
			on table_name(column1,column2)			

			create index idx_CategoryName
			on tbl_CategoryMaster(Category_Name)

			Create index idx_tbl_People
			on tbl_People(User_Id,FirstName,LastName,Email)

	Unique index
		Not allow duplicate value

		-- Syntax :
			create unique index index_name
			on table_name(column)

			create unique index idx_EmployeeName
			on tbl_Employee(Employee_Name)

			select * from tbl_Employee

			Insert into tbl_Employee(Employee_Name,Employee_Age,Manager_Id)
			values('Tanay Sharma',12,4)
			-- To remove index from table
				drop index index_name
				on table_name

				drop index idx_EmployeeName
				on tbl_Employee

				create unique index idx_EmployeeName_EMployeeAge
				on tbl_Employee(Employee_Name,Employee_Age)