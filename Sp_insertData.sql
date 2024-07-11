select * from tbl_EmployeeData

create procedure SP_InsertEmployeeData
(

	@Employee_Name nvarchar(50) = 'null',
	@Employee_Age int = null,
	@Employee_Role nvarchar(20) = 'Null',
	@Employee_Salary decimal(18,2) = null,
	@Employee_MobileNo bigint = null
)
As
begin
	insert into tbl_EmployeeData(Employee_Name,Employee_Age,Employee_Role,Employee_Salary,Employee_MobileNo)
	values(@Employee_Name,@Employee_Age,@Employee_Role,@Employee_Salary,@Employee_MobileNo)

end

exec SP_InsertEmployeeData 'Kundan',29,'Data Analytics',250000,8238442860