-------Ranking Function/Analytic function/Numbering function
-- Rank()
--ROW_Number()
--Dense_Rank()

Use PracticeDB

---Row_Number()---------------------------------
Select Row_Number() over(order by Salary) as srno,
	Employee_Id,FirstName,department, Salary
	from tbl_EmployeeDetails
	where FirstName is not  Null
	
Select Row_Number() over(partition by department order by Salary) as srno,
	Employee_Id,FirstName,department, Salary
	from tbl_EmployeeDetails
	where FirstName is not  Null

SELECT * FROM tbl_EmployeeDetails


---RANK()---------------------------------

Select RANK() over(order by Salary) as srno,
	Employee_Id,FirstName,Salary
	from tbl_EmployeeDetails
	where FirstName is not  Null


---DENSE_RANK()---------------------------------

Select DENSE_RANK() over(order by Salary) as srno,
	Employee_Id,FirstName,Salary
	from tbl_EmployeeDetails
	where FirstName is not  Null

-----Question --To Find the 2nd highest  and 2nd lowest salary

Select DENSE_RANK() over(order by Salary desc) as srno,
	Employee_Id,FirstName,Salary
	from tbl_EmployeeDetails
	where FirstName is not  Null 

------	To Find the 2nd highest salary
Select Employee_ID,FirstName,LastName,Salary from 
(Select DENSE_RANK() over(order by Salary desc) as Highest_Salary,
	Employee_Id,FirstName,LastName,Salary
	from tbl_EmployeeDetails
	where FirstName is not Null ) as rankSalary
	where Highest_Salary = 2

	------	To Find the 2nd Lowest salary
Select Employee_ID,FirstName,LastName,Salary from 
(Select DENSE_RANK() over(order by Salary) as Highest_Salary,
	Employee_Id,FirstName,LastName,Salary
	from tbl_EmployeeDetails
	where FirstName is not Null ) as rankSalary
	where Highest_Salary = 2