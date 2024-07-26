--Find the customers who bought both products A & B but did not buy Product C.


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
--Find the customers who bought both products A & B but did not buy Product C.

Select distinct ct.Customer_Name from tbl_Customers ct inner join
tbl_Purchases ph on ct.Customer_Id = ph.Customer_Id
where Ct.Customer_Id in
(Select Customer_Id from tbl_Purchases
where  Product_Id in ('A','B') and Product_Id not in ('C'))


Select  Customer_Name from tbl_Customers where Customer_Id in 
(Select Customer_Id from tbl_Purchases where Product_Id in ('A','B') and Product_Id not in ('C'))


