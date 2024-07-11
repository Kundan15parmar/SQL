
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



--self join(pending)



select S1.subCategory_Name as SubCategoryName1,S2.subCategory_Name as SubCategoryName2,S1.Category_ID
from tbl_subCategoryMaster S1 ,tbl_subCategoryMaster S2
where  S1.subCategory_ID = S2.subCategory_ID
order by S1.category_ID