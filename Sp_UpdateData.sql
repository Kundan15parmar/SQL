
select * from tbl_EmployeeData

create procedure SP_updateEmployeeData
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

exec SP_updateEmployeeData 1,40000