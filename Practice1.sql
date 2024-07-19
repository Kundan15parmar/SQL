create database PracticeDB

use practiceDB

create table tbl_Department
(
	Department_ID int primary key identity(1,1),
	Department_Name nvarchar(25),
	Department_Location nvarchar(20)
)

insert into tbl_Department(Department_Name,Department_Location)
values('FINANCE','Mumbai'),
		('Marketing','Hyderabad'),
		('IT','Banglore'),
		('Production','Vadodara')

create table tbl_Employees
(
	Employee_Id int primary key identity(101,1),
	Employee_Name nvarchar(25),
	Employee_Job_Name nvarchar(20),
	Employee_Hiring_Date date,
	Employee_Salary decimal(18,2),
	Department_ID int
)

Alter table tbl_Employees
add Manager_ID int


insert into tbl_Employees(Employee_Name,Employee_Job_Name,Employee_Hiring_Date,Employee_Salary,Department_ID,Manager_ID)
values('Atharva','Persidant','1991-11-18',80000,1,Null)

insert into tbl_Employees(Employee_Name,Employee_Job_Name,Employee_Hiring_Date,Employee_Salary,Department_ID,Manager_ID)
values('Kiran','Software Developer','1991-05-01',60000,3,101),
	('Kalpana','Data Analytics','2005-05-21',35000,3,101),
	('Darshit','Clerk','2015-03-11',15000,4,103)

--Joins

select emp.Employee_Id,emp.Employee_Name,emp.Manager_ID,dep.Department_ID,dep.Department_Name,dep.Department_Location 
from tbl_Employees emp inner join tbl_Department dep on emp.Department_ID = dep.Department_ID


select emp.Employee_Id,emp.Employee_Name,emp.Manager_ID,dep.Department_ID,dep.Department_Name,dep.Department_Location 
from tbl_Employees emp left join tbl_Department dep on emp.Department_ID = dep.Department_ID

select emp.Employee_Id,emp.Employee_Name,emp.Manager_ID,dep.Department_ID,dep.Department_Name,dep.Department_Location 
from tbl_Employees emp right join tbl_Department dep on emp.Department_ID = dep.Department_ID

select emp.Employee_Id,emp.Employee_Name,emp.Manager_ID,dep.Department_ID,dep.Department_Name,dep.Department_Location 
from tbl_Employees emp cross join tbl_Department dep 

--Doubt in Query(Self join)

Select * from tbl_Department
select * from tbl_Employees

select emp.Employee_Id,
		emp.Employee_Name,
		Manager.Department_ID,
		Manager.Manager_ID,
		Manager.Employee_Name as Manager_Name
from tbl_Employees emp, tbl_Employees Manager
where Manager.Employee_Id = emp.Manager_ID


--Stored Procedure

alter procedure SP_CRUDOperation
(
	@Type nvarchar(20),
	@Employee_ID int = null,
	@Employee_Name nvarchar(25) = null,
	@Employee_Job_Name nvarchar(20) = null,
	@Employee_Hiring_Date date = null,
	@Employee_Salary decimal(18,2) = null,
	@Department_Id int = null,
	@Manger_Id int = null
)
AS
Begin
	if(@Type = 'Insert')
		begin
			if exists(Select * from tbl_Employees where Employee_Name = @Employee_Name)
			begin
				print('Data Availabe')
			end
			else
			begin
				insert into tbl_Employees(Employee_Name,Employee_Job_Name,Employee_Hiring_Date,Employee_Salary,Department_ID,Manager_ID)
				Values(@Employee_Name,@Employee_Job_Name,@Employee_Hiring_Date,@Employee_Salary,@Department_Id,@Manger_Id)
				print('Data insert')
			end
			
		end
	else if(@Type = 'Update')
		begin
			print('Data Update')
			update tbl_Employees set Employee_Salary = @Employee_Salary where Employee_Name = @Employee_Name
		end
	else if(@Type = 'Select')
		begin
		select * from tbl_Employees
			print('Data Select')
			
		end
	else if(@Type = 'Delete')
		begin
			print('Data Delete')
			delete from tbl_Employees where Employee_Id = @Employee_ID
		end
	else
		begin
			print('Type any one crud operation..')
		end
End

exec SP_CRUDOperation 'Inse'

exec SP_CRUDOperation @Type = 'Select'

--Conditions(if else, if else if, nested if,switch case)

--IF ELSE
declare @Number1 int = 5
if(@Number1 = 10)
begin
	print('Number is '+ convert(nvarchar(20), @Number1) +' which is equal to 10' )
end
else
begin
	print('Number is '+ convert(nvarchar(20), @Number1) +' which is not equal to 10' )
end

--IF else if
declare @marks int = 55

if(@marks > 90)
Begin
	print('A Grade')
end
else if(@marks > 80 And @marks <= 90 )
Begin
	print('B Grade')
end
else if(@marks > 70 And @marks <= 80 )
Begin
	print('C Grade')
end
else if(@marks > 60 And @marks <= 70 )
Begin
	print('D Grade')
end
else if(@marks > 35 And @marks <= 60 )
Begin
	print('E Grade')
end
else
Begin
	print('F Grade')
end

--Switch case

select * from tbl_StudentResult

select Student_ID,Student_Name,Student_Marks,

case when Student_Marks > 90 then 'A Grade'
	 when Student_Marks > 80 and Student_Marks <= 90 then 'B Grade'
	 when Student_Marks > 70 and Student_Marks <= 80 then 'C Grade'
	 when Student_Marks > 60 and Student_Marks <= 70 then 'D Grade'
	 when Student_Marks > 35 and Student_Marks <= 60 then 'E Grade'
	else
	'F Grade'
end as Student_Grade
from tbl_StudentResult


--View

create view vw_Employee as
select * from tbl_Employees

select * from vw_Employee


