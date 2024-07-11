create procedure SP_deleteEmployeeData
(
	@Employee_Id int
	
)
As
begin
	delete from tbl_EmployeeData where Employee_ID = @Employee_Id
end

exec SP_deleteEmployeeData 1002