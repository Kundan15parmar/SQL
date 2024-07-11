
SQL

SQL (Structured Query Language) :
 SQL (Structured Query Language) is used to perform operations on the records stored in the database, such as updating records, inserting records, deleting records, creating and modifying database tables, views, etc.
SQL is not a database system, but it is a query language.

CRUD Operation:
C - Create
R - Read
U - Update
D-  Delete

DataTypes : We allow users to enter data in specific format.

String : Combination of numeric value, Alphabet value, Special char.
	String always decorated with :  " " /  ' '.

Example :	string abc = 'WelTech@123' // Combination
		string efg = 'WelTec';
		string ghi = '123';
		string fgh = '@'

Types of string datatype in SQL :

 Varchar :     Allow string value.
		It is single-code.
		Allow only single language / script.

		Syntax :   varchar(length)

nvarchar :    Allow string value.
It is a unicode type.
			Allow multiple languages / script.
			
Syntax :nvarchar(length)

char :  Single alphabet is considered as char.
string = 'WelTec Institute'.
In the above example space is also considered as char.

number :  Allow only numeric value.

int : 	Length is predefined.
   	Limited number of char allowed.

	Syntax : int
	
bigint :  Length is double than int.

Syntax : bigint

decimal :  Value has a '.' in between numbers is considered as decimal.

	Example : 23.58	

Syntax : decimal(18,2)

		Here, 18 is char before '.' in decimal.	And  2 is char after '.' in decimal.

float :   It can be anything positive / negative and with decimal value.

Syntax : float

boolean :  boolean value always accept true / false.

Syntax :  bool

bit :     It only supports 0 and 1.
            	it always returns as true / false but in the form of 0 and 1.

	Syntax :   bit

uniqueidentifier :       Is always saving unique data.
		Mostly it is used with GUID.

GUID Example : '630C0DA3-7191-4213-8CC6-725EB068EEEA'
	
	Syntax :  uniqueidentifier


DataBase :  

	– Database is a collection of tables, store procedure, function and views.
– Space and special char are not allowed in the Database name.
– Database name should be : EmployeeData.
– First char can not be a number or special char.
– In syntax, "create database" is not case sensitive.
– Duplicate database name is not allowed.

Syntax :   create database databasename

Example :   create database EmployeeData

To delete / remove databases from the server we are using the 'Drop' keyword.

	Syntax : drop database databasename

Example : drop database sampledata

use EmployeeData -- Change database 

Table : 
       –  Every column has its own data type . Which can be the same or different for the column.
       –Table name should start with the prefix "tbl_".
       – As a first char number and special char is not allowed.
       – Table names with the same name are not allowed in the same database.

    Syntax :	create table tablename
	(
			columnname1 datatype,
			columnname2 datatype,
			.
			.
			columnnameN datatype
		)

Create column rules :
	–Space is not allowed in column names.
	–Not start with a special char and number.
	–Every column must have a datatype.
	–Instead of space between the column names use '_'.
	
Example : Your columnname is "Employee Name" so instead use write "Employee_Name".
     Column name should not be the same as sql function name.

How to identify inbuild function :
 Example :
			key -> Inbuilt function
			EmployeeName -> Not sql function 

 Create table with name -> EmployeeDetail
--Employee_Id
--Employee Name
--Employee Corporate Id
--Employee DOB
--Employee Age
--Employee Salary

Table with null field :
	create table tbl_EmployeeDetail
	(
		Employee_Id int,
		Employee_Name nvarchar(50),
		Employee_Corporate_Id nvarchar(10),
		Employee_DOB datetime,
		Employee_Age int,
		Employee_Salary decimal(18,2)
	)
	
	
Table with Non-nullable field :
	create table tbl_EmployeeDetail_1
	(
		Employee_Id int,
		Employee_Name nvarchar(50) not null,
		Employee_Corporate_Id nvarchar(10),
		Employee_DOB datetime,
		Employee_Age int,
		Employee_Salary decimal(18,2)
	)

 Alter :
If we want to modify / Update the current instance (Table, Store Procedure, Functions) then alter is used.

-- Add new column :   If we want to add a new column to the existing table.
   Syntax :       Alter table table_name
	Add column_name data_type

    Example :    Alter table tbl_EmployeeDetail
		Add Employee_Mobile bigint

-- Multiple column add
		Alter table tbl_EmployeeDetail
		Add Employee_Mobile bigint

		Alter table tbl_EmployeeDetail
		Add Employee_Address nvarchar(100)

	-- Alter Column :
		If we want to update data types in existing columns.
		It does not modify / rename the column name.

	Syntax :  Alter table table_name
			   Alter column column_name datatype

		Example :Alter table tbl_EmployeeDetail
			     Alter column Employee_Mobile bigint

-- Remove column : Remove existing column from table.

	Syntax :  Alter table table_name
		   drop column column_name
 
	Example : Alter table tbl_EmployeeDetail
		    drop column Employee_Mobile

-- Drop table :  Remove existing table from database.

	Syntax :  drop table table_name

	Example : drop table tbl_EmployeeDetail_1


DDL Operation :	Data Definition language , Contain "Select" statement.

Select Statement :	To fetch / read data from an existing table.

	Syntax :  1)  Select column1, column2, column3,...columnN
           		        from table_name

		    2)  Select * from table_name

	Example :
		Select * from tbl_EmployeeDetail

	-- With column:
Select Employee_Id, Employee_Name, Employee_Corporate_Id, Employee_DOB,  Employee_Age, Employee_Salary
 from tbl_EmployeeDetail


DML Operation :  Data manipulation language.
			 DML operation perform data changes on existing table.
	DML include :
	-- Insert : When we need to add a new record into the existing table.

	Syntax :  Insert into table_name(column1, column2, column3,....,columnN)
				values(value1, value2, value3,....,ValueN)


	-- multiple insertion :
		Insert into table_name(column1, column2, column3,....,columnN)
		values(value1, value2,value3...valueN),  (value1, value2,value3...ValueN)

Example :

Insert into tbl_EmployeeDetail(Employee_Id,Employee_Name,	Employee_Corporate_id, Employee_DOB,Employee_Age,Employee_Salary)
values(1, 'WelTec Institute','D1234','2024-06-15 23:05:32.803',25, 25000.65)

-- Error generation code :
Insert into tbl_EmployeeDetail(Employee_Id,Employee_Name,Employee_Corporate_id, Employee_DOB,Employee_Age,Employee_Salary)
values(1, 'WelTec Institute','D1234',25, 25000.65)

-- Multiple insert: 
Insert into tbl_EmployeeDetail(Employee_Id,Employee_Name, Employee_Corporate_id, Employee_DOB,Employee_Age,Employee_Salary)
values(2, 'WelTec Institute','D2345','2024-06-15 23:05:32.803',26, 35000.65),
(3, 'R C Technical Institute','D4578','2024-06-15 00:05:32.803',28, 45000.65)

Select Employee_Id,Employee_Name,Employee_Corporate_id,Employee_DOB,
Employee_Age,Employee_Salary
from tbl_EmployeeDetail
			

Update :
–Update / Modify existing data into the table.
--We can modify multiple or single rows.
– Always verify the update statement before execution to avoid false execution or unwanted data update.

Syntax :
	Update tbl_Name Set
	column1 = 'new value', column2 = 'new value'

	Update tbl_name set
	column1 = 'new value', column2 = 'new value'
	where column3 = 'existing value'

Example :
		
select Employee_name,Employee_Age,Employee_Dob,Employee_MobileNo,Employee_no,Employee_Salary from tbl_EmployeeData 

update tbl_EmployeeData set Employee_Age = 25 where Employee_no = 3

Update tbl_EmployeeData set Employee_Age = 27, Employee_MobileNo = 8745784574
		where Employee_no = 2 And Employee_name = 'Raj'

select Employee_name,Employee_Age,Employee_Dob,Employee_MobileNo, Employee_no,Employee_Salary 
from tbl_EmployeeData where Employee_no = 2 or Employee_name = 'Yash'

Delete :
--Remove existing records from table permanently.

Syntax :  delete from tbl_name

- With where clause
--delete from tbl_name where column1 = 'existing value'

Example :	delete from tbl_EmployeeData where Employee_no = 3	


--Where :  Where clause is used to filter out data from tables.
                  We can use multiple conditions in a single where clause.
      We can apply 'AND' and 'OR'.

condition with AND operator :
--And conditions verify that all statements returns true.
--If one condition is false then the query returns an empty result.

--condition with OR operator:
--OR condition, If one condition is true from multiple conditions then return the result.
	
Operators :
	= , > , 	< , >= ,  <= ,!=


-- Insert with Select Statement
Insert into tbl_EmployeeData(Employee_name,Employee_Age,Employee_Dob,Employee_MobileNo,Employee_no,Employee_Salary)
select Employee_name,Employee_Age,Employee_Dob,Employee_MobileNo,Employee_no,Employee_Salary from tbl_EmployeeData 
where Employee_no = 1

-- Insert data using select  statement
Insert into tbl_EmployeeData(Employee_name,Employee_Age,Employee_Dob,Employee_MobileNo,Employee_no,Employee_Salary)
select 'Mukesh' as Employee_name,52 as Employee_Age,'2024-06-21' as Employee_Dob,878478577 as Employee_MobileNo,
4 as Employee_no,51000 as Employee_Salary

Insert into tbl_StudentData(Student_Name,Student_Age,Student_MobileNo,Student_DOB)
values('Suresh',45,4785458478,'2024-06-21 23:27:26.047')


select Student_Id,Student_Name,Student_Age,Student_MobileNo,Student_DOB from tbl_StudentData

-- Insert data from another table using select statement
Insert into tbl_EmployeeData(Employee_name,Employee_Age,Employee_Dob,Employee_MobileNo,Employee_no)
Select Student_Name,Student_Age,Student_DOB,Student_MobileNo,Student_Id from tbl_StudentData

Keys in sql : 
Primary Key :

	–Primary key guarantee of no duplicate value.
	–Only one primary key is allowed in a single table.
	–Primary key always integers if used with identity column.

Identity : Auto increment values in primary key.
Example: Create table tbl_StudentData
(
	Student_Id int primary key identity(1,1),
	Student_Name nvarchar(50),
	Student_Age int,
	Student_MobileNo bigint,
	Student_DOB datetime,	
)
Here, Syntax:  Identity(Value , increment)
            Example : Identity(1,1) 
Value : It indicates the starting value of the row loaded into the table. By default, its value is 1.
Increment: It indicates the incremental value, which is added to the identity value of the last loaded row. By default, its value is 1.
Joins :   When we want to get data from one or more tables then we can use joins.
Types of Joins : 
Inner Join
Left Join 
Right join
Cross join
Self join
Inner join:  Inner join returns common data from both tables.                                         Inner join is applied on Primary Key of parent table or column data should be unique. 
Syntax :	Select column1,column2, column3 from table1    
 Inner join table2 on table1.column = table2.column


 Example :	Select CM.Category_Id,Category_Name,SubCategory_Id,
SubCategory_Name from tbl_Categorymaster CM
Inner join tbl_SubcategoryMaster SCM 
on CM.Category_Id = SCM.Category_ID
Left join :    Return all records from left table and matching data from right table
		-- First table in query is consider as a left table and second table  is consider as right table.
 Syntax :        Select column1,column2, column3 from table1
		Left join table2 on table1.column = table2.column


 Example :	Select CM.Category_Id,Category_Name,SubCategory_Id,
		SubCategory_Name from tbl_Categorymaster CM
		Left join tbl_SubcategoryMaster SCM 
on CM.Category_Id = SCM.Category_ID
Right join : Return all records from right table and matching data from left table
		 - First table in query is consider as left table and second table is consider as right table.
 Syntax :	Select column1,column2, column3 from table1
		Right join table2 on table1.column = table2.column


 Example :	Select CM.Category_Id,Category_Name,SubCategory_Id,
		SubCategory_Name from tbl_Categorymaster CM
		Right join tbl_SubcategoryMaster SCM
on CM.Category_Id = SCM.Category_ID
Cross join : Cross join return result with one to many relation.
	Syntax : Select column1,column2 from table1 cross join table2 
	Example :	Select * from tbl_Categorymaster CM cross join tbl_OrderMaster
Self join : Join table with itself.
Store Procedure (SP) :
–  SP is a special function / query that features provided by SQL.
–  Reusability of code.
–  Better readability
–  Clean code.
–  Duplicate names are not allowed in SP.


Syntax :  Create new SP
	  create procedure procedure_name
(
Parameter
	)
As
	Begin
		Insert / update/ delete / select
	End
	Go
Modify SP :   alter procedure procedure_name
	(
		Parameter
	)
	As
	Begin
		Insert / update/ delete / select
	End
	Go
For execution of Store procedure
– Execution of Stored procedure without Parameters =  exec sp_SelectCategory
– Execution of Stored procedure with Parameters = exec sp_SelectCategoryById 5
Assignment  Question:
Q) Create table with name Employee Data
		Column name :
			Employee id -> PK and identity
			Employee Name
			Employee Age
			Employee Role
		Employee Mobile no
Create SP for employee data that select data based on employee name
=> 	Create procedure SP_SelectEmployeeData
(
	@EmployeeName nvarchar(50)
)
As
Begin
Select Employee_ID,Employee_Name,Employee_Age,Employee_Role, Employee_Salary, Employee_MobileNo from tbl_EmployeeData
where Employee_Name = @EmployeeName
End
For execution of Store procedure =  exec SP_SelectEmployeeData ‘Kiran’


Q) Create stored procedures with multiple parameters for update and delete.
=> For Update
Create procedure SP_updateEmployeeData
(
	@Employee_Id int,
	@Employee_Salary decimal(18,2)
)
As
begin
	update tbl_EmployeeData 
	set Employee_Salary = @Employee_Salary
	where Employee_ID = @Employee_Id


end
For execution of Store procedure =  exec SP_updateEmployeeData 1,45000


--  For delete
Create procedure SP_deleteEmployeeData
(
	@Employee_Id int
)
As
begin
	delete from tbl_EmployeeData where Employee_ID = @Employee_Id
end
For execution of Store procedure = exec SP_deleteEmployeeData 1


Conditions :
 – When we want to compare value and based on comparison we want to execute a    statement.
	-- Conditions always return bool values (true or false).


IF ELSE
IF ELSE IF ELSE
SWITCH CASE


IF ELSE : 
-- We can check single conditions only.
-- In if and else only one block is executed at a time.
-- if condition is true then if block is executed else, else block is executed.


--Syntax :
	If condition and condition2
		Begin
			statement
		End
	Else
		Begin
			statement
		End




Example :
-- Declaration of variable 
	declare @value int
-- Initialization of Variable
	set @value = 10
	-- declare with initialization
	declare @value1 int = 10
if(@value = @value1) 
	Begin
		print('Value is equal')
	End
else
	Begin
		print('Value is not equal')
	End


-- Not equal to
	declare @val1 int
		-- Initilization
	set @val1 = 20
		-- declare with initiliaztion
	declare @val2 int = 10


	if (@val1 != @val2) -- 20 != 10
		Begin
	print(convert(nvarchar,@val1)  + ' is not equal to ' + convert(nvarchar,@val2))
		End
	else
		Begin
	print(convert(nvarchar,@val1)  + ' is equal to ' + convert(nvarchar,@val2))
		End


				


if (@val3 > @val4) 
Begin
	print(convert(nvarchar,@val3)  + ' is Greater than ' +convert(nvarchar,@val4))
	End
else
	Begin
print(convert(nvarchar,@val3)  + ' is not Greater than ' + convert(nvarchar,@val4))
	End




If else if else :
– Difference between if else and if else if else is, we can apply mutiple conditions.
-- We can use N  number of else if in condition.
-- Syntax :
	If (condition)
	Begin
			Statement
	End
	else if (condition)
		Begin
			statement
		End
	else if(condition)
		Begin
			statement
		End
	else
		Begin
			Statement
		End
- Example :
	-- Greater than or equal to 90 = A
	-- Greater than or equal to 80 And Less than 90 = B
	-- Greater than or equal to 70 And Less than 80 = C
	-- Greater than or equal to 60 And Less than 70 = D
	-- Greater than 35 And Less than 60 = E
	-- Less than or equal to 35 = F


	declare @Marks int = 95
if (@Marks >= 90)
		Begin
			print('A Grade')
		End
	else if(@Marks >= 80 And @Marks < 90)
		Begin
			print('B Grade')
		End
	else if (@Marks >= 70 And @Marks < 80) 
		Begin
			print('C Grade')
		End
	else if(@Marks >= 60 And @Marks < 70) 
		Begin
			print('D Grade')
		End
	else if (@Marks >= 35 And @Marks < 60) 
		Begin
			print('E Grade')
		End
	Else
		Begin
			print('F Grade')
		End




Exist :
--	Exist one type of operator.
--	Exist check whether the value is present or not from the output.
--	It is usually used with select statements in if condition.


Example


if not exists (Select Category_Name from tbl_Categorymaster where Category_Name = 'Printer')
	Begin
		Insert into tbl_Categorymaster(Category_Name)
		values('Printer')


		print('Value is inserted')
	End
Else
	Begin
		print('value already exists')
	End


 Nested If condition
if condition
Begin
	if condition
	Begin
		if condition
		Begin
			Statement
		End
	End
End


-- Is the laptop is exists in category table?


-- String concat :
String With String
	declare @string1 nvarchar(10) = 'Hello'
	declare @string2 nvarchar(10) = 'World'


	print(@string1 + ' ' + @string2)


String with Integer(we Convert integer value into String)	
	declare @string3 nvarchar(10) = 'Value is : ' -- string
	declare @val int = 10 -- int
	print(@string3 + convert(nvarchar(10),@val))


Assignment Question :
Q)	– Check value in select statement
	– If value is available then update or insert a new record.
	– Value in the condition should be check with parameters


declare @Book_Name nvarchar(50) = 'War and Peace'


declare @Book_Author nvarchar(50) = 'Leo Tolstoy'


declare @Book_Price int = 594


if exists(Select Book_Name,Book_Author,Book_Price from tbl_BookDetails where Book_Name = @Book_Name)
	Begin
		print('Book is available')
		update tbl_BookDetails set Book_Price = 594 where Book_Name = @Book_Name
	End
else
	Begin
		print('Book is not available')
		Insert into tbl_BookDetails(Book_Name,Book_Author,Book_Price)
		values(@Book_Name,@Book_Author,@Book_Price)	
	End




--Assignment Question :	
Q) Execute the if else condition with all operators(=,!=,>,>=,<,<=,<>).


--If condition with Equal to operator(=)


declare @Number1 int = 20 ,@Number2 int = 50


If (@Number1 = @Number2)
	Begin
		print('Number1 is equal to Number2')
	End
else
	Begin
		print('Number1 is not equal to Number2')
	End




--If condition with greater than operator(>)
declare @Num1 int = 20 ,@Num2 int = 50


If (@Num1 > @Num2)
	Begin
		print('Number1 is greater than Number2')
	End
else
	Begin
		print('Number1 is less than Number2')
	End




--If condition with greater than or equal to operator(>=)
declare @No1 int = 20 , @No2 int = 50


If (@No1 >= @No2)
	Begin
		print('Number1 is greater than or equal to Number2')
	End
else
	Begin
		print('Number1 is less than or equal to Number2')
	End




--If condition with less than operator(<)
declare @Value1 int = 20 ,@Value2 int = 50


If (@Value1 < @Value2)
	Begin
		print('Value1 is less than Value2')
	End
else
	Begin
		print('Value1 is greater than Value2')
	End




--If condition with less than or equal to operator(<=)
declare @Value1 int = 20 , @Value2 int = 50


If (@Value1 <= @Value2)
	Begin
		print('Value1 is less than or equal to Value2')
	End
else
	Begin
		print('Value1 is greater than or equal to Value2')
	End




--If condition with  not Equal to operator(!=)
declare @Number1 int = 20 ,@Number2 int = 50


If (@Number1 != @Number2)
	Begin
		print('Number1 is not equal to Number2')
	End
else
	Begin
		print('Number1 is equal to Number2')
	End




--with  not Equal to operator(<>)
declare @Number1 int = 50 ,@Number2 int = 50


If (@Number1 <> @Number2)
	Begin
		print('Number1 is not equal to Number2')
	End
else
	Begin
		print('Number1 is equal to Number2')
	End
































	


https://github.com/darshitkansara94/SQL_14June2024/blob/main/


TEAMS LINK

https://teams.microsoft.com/l/meetup-join/19%3aWGzHOizNFh_UMi2dzw9I0Zq6-L2_9bnmPlNBim3OIro1%40thread.tacv2/1717740356902?context=%7b%22Tid%22%3a%228fe2b7c9-f625-4d5e-96b0-94cc20e50e7f%22%2c%22Oid%22%3a%22044d9dda-4b6f-4854-beca-3196989e6b2a%22%7d

