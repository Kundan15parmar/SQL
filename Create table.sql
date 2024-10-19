use SQLPracDb

---------1) Create Table Tbl_Customers-----------
Create Table tbl_Customers
(
	Customer_Id int Primary key identity(1,1),
	First_Name nvarchar(25),
	Last_Name nvarchar(25),
	Birth_Date Date,
	Money_Spend decimal(18,2),
	Anniversary date
)




---------2)Create Table tbl_Employee-------------------
Create table tbl_Employee
(
	Employee_Id int primary key identity(101,1),
	First_Name nvarchar(25),
	Last_Name nvarchar(25),
	Birth_Date Date
)

---------3)Create Table tbl_Products-------------------
Create table tbl_Products
(
	Product_Id int Primary key identity(201,1),
	Category nvarchar(25),
	Price decimal(18,2)
)

---------4)Create Table tbl_Orders------------------------
Create table tbl_Orders
(
	Order_Id int Primary key identity(301,1),
	Customer_Id int,
	Employee_Id int,
	Product_Id int,
	Order_Total decimal(18,2),
	Order_Date date,
	Constraint FK_Customer_Id Foreign key(Customer_Id) references tbl_Customers(Customer_Id),
	Constraint FK_Employee_Id Foreign key(Employee_Id) references tbl_Employee(Employee_Id),
	Constraint FK_Product_Id Foreign key(Product_Id) references tbl_Products(Product_Id)
)