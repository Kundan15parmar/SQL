-------------Question1---------------
--Q) Find the customers who bought both products A & B but did not buy Product C.

create table tbl_Customers
(
	Customer_Id int primary key identity(1,1),
	Customer_Name nvarchar(25)

)
select * from tbl_Customers

insert into tbl_Customers(Customer_Name)
values('John Doe','Jane Smith','ALice Johnson','Bod Brown','Charlie Black')

create table tbl_Purchases
(
	Chase_Id int primary key identity(1,1),
	Customer_Id int,
	Product_Id char

)

INSERT INTO tbl_Purchases(Customer_Id,Product_Id)
VALUES(1,'A'),(1,'B'),(2,'A'),(2,'C'),(3,'B'),(3,'A'),(4,'A'),(4,'B'),(5,'C')

select * from tbl_Customers
sELECT * FROM tbl_Purchases

--select Customer_Id from tbl_Purchases where Product_Id = 'A'

--select Customer_Id from tbl_Purchases where Product_Id = 'B'

--select Customer_Id from tbl_Purchases where Product_Id = 'C'

select Customer_Name from tbl_Customers
where Customer_Id in 
(select Customer_Id from tbl_Purchases where Product_Id = 'A') and
Customer_Id in 
(select Customer_Id from tbl_Purchases where Product_Id = 'B') and 
Customer_Id not in
(select Customer_Id from tbl_Purchases where Product_Id = 'C')
order by Customer_Id

------------------Question2---------------

Create table tbl_EmployeeDetails
(
	Employee_ID int primary key identity(1,1),
	FirstName nvarchar(25),
	LastName nvarchar(25),
	Department nvarchar(25),
	Salary decimal(18,2),
	HireDate date 
)

select * from tbl_EmployeeDetails

--Retrieve the department(s) where the total salary expense is greater than
--the average total salary expenses across all departments.

--Solving Approach
--1.Find total salary expenses across all departments.

Select Sum(Salary) as Total_Salary from tbl_EmployeeDetails 

--2.Get the average of that total salary expenes.

Select Avg(Salary) as Average_Salary from tbl_EmployeeDetails

--3. get the depatarment where total salary is greater than th average of total salary expenes.


select Department, SUM(Salary) as Total_Salary  from tbl_EmployeeDetails
group by Department
having SUM(Salary) > AVG(Salary)


------------------Question3---------------
-- Find the top 5 Customer with the highest percentage of returned items out of their total Item_Orders.

Select * from tbl_AmazonOrder

create table tbl_AmazonReturns
(
	Returns_ID int primary key,
	Order_ID int,
	Returns_Date date,
	Returned_Items int,
	Constraint FK_Order_Id Foreign key (Order_ID) references tbl_AmazonOrder(Order_ID) 
)

Select * from tbl_AmazonReturns
--Solving Approach:

--Find the Total Order and Total Cancelled Ordered per customer.
	Select ao.Customer_ID,ao.Order_ID,ao.Total_items,ar.Returned_Items
	from tbl_AmazonOrder ao inner join tbl_AmazonReturns ar
	on ao.Order_ID = ar.Order_ID

--Get the percentage of return Per customer Using Formula : (Return/Total)*100 .

--As Dividing two integers will provide integers so need to convert it in float data type .

---Round off the percentage upto two decimal using Round Function.

--We need only top 5 cutomer so use top keyword to get only top 5 cutomer with return percentage by using desc command.


Select top 5 ao.Customer_ID,
Sum(ao.Total_items) as Total_items,
SUM(ar.Returned_Items) as returned_items,

case when Total_items > 0 then 
	Round(
			(
				Cast(returned_items as float)/
				Cast(Total_items as float)
			)*100
		,2)
	Else
		0
	End as PerCentage_Returns

from tbl_AmazonOrder ao inner join tbl_AmazonReturns ar on ao.Order_ID = ar.Order_ID
group by ao.Customer_ID,Total_items,returned_items
order by PerCentage_Returns desc


------------------Question4---------------
--Identify users who have made purchases totaling more than Rs.5,000 in the last 1 month from the Current Date.

CREATE TABLE tbl_IBM_Purchases (
    Purchase_id INT Identity (1,1) PRIMARY KEY,
    User_id INT,
    Date_of_purchase date,
    Product_id INT,
    Amount_spent DECIMAL(10, 2)
)

INSERT INTO tbl_IBM_Purchases ( User_id, Date_of_purchase, Product_id, Amount_spent)
VALUES
(1, '2024-07-22' , 11, 1000),
(3, '2024-07-24' , 12, 4000),
(1, '2024-07-28 ', 11, 7000),
(2, '2024-07-19 ', 12, 2000),
(3, '2024-07-12 ', 12, 7000),
(1, '2024-06-15 ', 11, 8000),
(3, '2024-06-18 ', 12, 3000),
(1, '2024-06-28 ', 11, 9000),
(2, '2024-07-20 ', 12, 1500),
(3, '2024-07-25 ', 12, 6000)

Select * from tbl_IBM_Purchases

 /*Solving Approach:

1. Filter the last 1 month data with where clauses.
2. Get the sum of amount spent based on group of User_ID.
3. Filter the group using Having Clauses . */

SELECT SUM(Amount_spent) as Total_Spent, USER_ID
FROM tbl_IBM_Purchases
WHERE date_of_purchase >= DATEADD(MONTH, -1, GETDATE())
GROUP BY USER_ID
HAVING SUM(amount_spent) > 5000
