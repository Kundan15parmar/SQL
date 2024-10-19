
Create table tbl_categoryMaster
(
	Category_ID int primary key identity(1,1),
	Category_Name nvarchar(20)
)

insert into tbl_categoryMaster(Category_Name)
values('Mobile'),('Laptop'),('Headphone'),('Watch'),('Camera')

select * from tbl_categoryMaster

create table tbl_subCategoryMaster
(
	subCategory_ID int primary key identity(1,1),
	category_ID int,
	subCategory_Name nvarchar(20)
)

insert into tbl_subCategoryMaster(category_ID,subCategory_Name)
values(2,'Hp'),(3,'Boat'),(1,'One plus'),(1,'MI'),(4,'Boat'),(4,'Noise')




create table tbl_OrderMaster
(
	Order_Id int primary key identity(1,1),
	Order_Number nvarchar(20),
	subcategory_Id int
)

insert into tbl_OrderMaster(Order_Number,subcategory_Id)
values('H789',2),('W121',5),('W122',6),('L151',1)

select * from tbl_categoryMaster

Select * from tbl_subCategoryMaster

select * from tbl_OrderMaster


--inner join 

select * 
from tbl_categoryMaster CM inner join tbl_subCategoryMaster SCM
on  Cm.Category_ID = SCM.category_ID

--Left join

select * 
from tbl_categoryMaster CM Left join tbl_subCategoryMaster SCM
on  Cm.Category_ID = SCM.category_ID

--Right join

select * 
from tbl_categoryMaster CM Right join tbl_subCategoryMaster SCM
on  Cm.Category_ID = SCM.category_ID

--Cross join

select * 
from tbl_categoryMaster CM cross join tbl_subCategoryMaster SCM



--self join :

select emp.Employee_ID, emp.Employee_Name,manager.Employee_Name as Manager_Name
from tbl_EmployeeData emp,tbl_EmployeeData manager
where manager.Employee_ID = emp.Manager_ID


