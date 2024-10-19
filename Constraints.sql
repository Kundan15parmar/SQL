Use SQLPracDb
/* Constraints : To define a rules on table we can use Constraints.

	1)Primary key
	2)Foregien Key
	3)Check
	4)Default
	5)Not Null 
	6)unique
*/


--3)Check : Insert a value into table based on Condition.
			Create table tbl_Temp2
			(
				TempId int primary key identity(1,1),
				Temp_Name nvarchar(10) unique,
				Temp_Age int,
				Constraint Ck_TempAge Check(Temp_Age >= 18)
			)

			--Modify(Add Check constraint on existing table )
		/*	Syntax For single Column: 
				Alter table TableName
				Add Constraint ConstraintName Check (ColumnName)
		*/

		
				Alter table tbl_Temp1
				Add Constraint Cn_Temp_Name Check (Temp_Age >=18)

		--from Existing table delete Unique constraint
		/*
			Alter table tbl_Temp1
			Drop Constraint ConstraintName
		*/

			Alter table tbl_Temp2
			Drop Constraint CK_Temp_Age

--4)Default : Use to set default value if user is not pass value in statement.
				
			Create table tbl_Temp
			(
				TempId int primary key identity(1,1),
				Temp_Name nvarchar(10),
				Temp_Age int default 20,
				Constraint Default_Temp_Name Default 'This is default' for Temap_Name
			)
	
				Alter table tbl_Temp1
				Add Constraint Default_Temp_Name Default 'This is default' for Temap_Name

--5)Not Null: Allow user to not insert null value.
		--	Declare using NOt Null

			Create table tbl_Temp
			(
				TempId int primary key identity(1,1),
				Temp_Name nvarchar(10) not null,
				Temp_Age int 
			)
	
			insert into tbl_Temp(Temp_Age) 
			values(12)

			--Modify(Add Not null constraint on existing table)
			/*	Syntax: 
				Alter table TableName
				Alter Column ColumnName dataType
			*/
		
			Alter table tbl_Temp
			Alter Column Temp_Name nvarchar(10) 

--6)Unquie : insert unquie value for every data.
		-- we can allow multiple unique column in single table

				Create table tbl_Temp1
			(
				TempId int primary key identity(1,1),
				Temp_Name nvarchar(10) unique,
				Temp_Age int 
			)

		--Modify(Add unique constraint on existing table )
		/*	Syntax For single Column: 
				Alter table TableName
				Add Constraint ConstraintName Unique (ColumnName)
		*/

		/*	Syntax for multiple column: 
				Alter table TableName
				Add Constraint ConstraintName Unique (ColumnName1,ColumnName2)
		*/
				Alter table tbl_Temp1
				Add Constraint Cn_Temp_Name Unique (Temp_Name)

		--from Existing table delete Unique constraint
		/*
			Alter table tbl_Temp1
			Drop Constraint ConstraintName
		*/

			Alter table tbl_Temp1
			Drop Constraint Cn_Temp_Name