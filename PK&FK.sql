-- Foreign key and primary key

use kundanDB

create table tbl_ClientMaster
(
	Client_ID int primary key identity(1,1),
	Client_FirstName nvarchar(25),
	Client_LastName nvarchar(25),
	Client_Age int,
	Client_Country nvarchar(25)
)

insert into tbl_ClientMaster(Client_FirstName,Client_LastName,Client_Age,Client_Country)
values('Kalpana','Parmar',29,'India'),
('Kiran','Parmar',32,'canada'),
('Sahil','Desai',36,'canada'),
('Kirtan','Patel',29,'USA')



create table tbl_ClientOrder
(
	Order_Id int identity(1,1),
	Order_Product nvarchar(25),
	Order_Total int,
	Client_Id int,
	Constraint FK_ClientID Foreign key (Client_Id) references tbl_ClientMaster(Client_ID)
)


--- Another example to add foreign key---
create table tbl_ClientOrder1
(
	Order_Id int identity(1,1),
	Order_Product nvarchar(25),
	Order_Total int,
	Client_Id int FOREIGN KEY REFERENCES tbl_ClientMaster(Client_ID)
)

insert into tbl_ClientOrder(Order_Product,Order_Total,Client_Id)
values('Mac book',50,2),('Laptop',25,1),('Scanner',10,1),('Iphone',6,3)

select * from tbl_ClientMaster

select * from tbl_ClientOrder


---Remove fk 

Alter table tbl_ClientOrder
drop Constraint FK_ClientID 


-- Add FK in Existing table

Alter table tbl_ClientOrder
add Constraint FK_ClientID Foreign key (Client_Id) references tbl_ClientMaster(Client_ID)

-- Another way

Alter table tbl_ClientOrder
add Foreign key (Client_Id) references tbl_ClientMaster(Client_ID)