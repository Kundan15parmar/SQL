Use PracticeDB

----------CTE(To find 2nd Highest Salary)----------
with cte_EmployeeSalary as
(
	Select Row_Number() over (order by Salary desc) as HighestSalary,
	Employee_ID,FirstName,LastName,Department,Salary,HireDate
	from tbl_EmployeeDetails
)
Select * From cte_EmployeeSalary
where HighestSalary  = 2

-----------Without Cte(To find 2nd Highest Salary) 
Select * from
	(Select Row_Number() over (order by Salary desc) as HighestSalary,
	Employee_ID,FirstName,LastName,Department,Salary,HireDate
	from tbl_EmployeeDetails) as TempSalary
where HighestSalary = 2


----------CTE(Delete Duplicate Data)----------
with cte_EmployeeSalary as
(
	Select Dense_Rank() over ( Partition by FirstName order by Salary desc ) as Number,
	Employee_ID,FirstName,LastName,Department,Salary,HireDate
	from tbl_EmployeeDetails
	where FirstName is not null
)
Delete From cte_EmployeeSalary
where Number  > 1

