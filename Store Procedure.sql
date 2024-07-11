Create database KundanDB

use KundanDB

create table tbl_EmployeeData
(
	Employee_ID int primary key identity(1,1),
	Employee_Name nvarchar(50),
	Employee_Age int,
	Employee_Role nvarchar(20),
	Employee_Salary decimal(18,2),
	Employee_MobileNo bigint

)

insert into tbl_EmployeeData(Employee_Name,Employee_Age,Employee_Role,Employee_Salary,Employee_MobileNo)
values('Atharva',25,'Full Satck Developer',35000,9876543210),
('Kiran',32,'Java Developer',50000,7600997564),
('Kalpana',29,'Data Analytics',30000,9876789534),
('Neha',31,'Manual tester',250000,8765433452)

select * from tbl_EmployeeData

create procedure SP_SelectEmployeeData
(
	@EmployeeName nvarchar(50)
)
As
Begin
	Select Employee_ID,Employee_Name,Employee_Age,Employee_Role,Employee_Salary,Employee_MobileNo 
	from tbl_EmployeeData
	where Employee_Name = @EmployeeName
End
Go

exec SP_SelectEmployeeData 'neha'

