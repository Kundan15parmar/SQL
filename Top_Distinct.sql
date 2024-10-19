Use PracticeDB
Select * from tbl_EmployeeDetails

---------------TOP

Select Top 5 Employee_ID,FirstName,Department,Salary  
from tbl_EmployeeDetails
where Salary is not null
order by Salary desc


---------------Distinct


Select Distinct Employee_ID,FirstName,Department,Salary  
from tbl_EmployeeDetails
where Salary is not null
order by Salary desc