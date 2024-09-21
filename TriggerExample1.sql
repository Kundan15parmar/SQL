-----Create a simple trigger

use KundanDB

Create table tbl_ProductMaster
(
	Product_Id int primary key identity(1,1),
	Product_Name nvarchar(25),
	Product_Price decimal(18,2),
	Product_Quantity int,
	Created_Date datetime,
	Modify_Date datetime,
	User_Id int
)

create table tbl_ProductMasterLog
(
	Log_ID int primary key identity(1,1),
	Log_Description nvarchar(Max),
	Inserted_By int,
	Created_Date datetime
)
----Create trigger on tbl_ProductMaster

create trigger tr_InsertProduct
on tbl_ProductMaster
For Insert
as
begin
		--Maintain a log for productMaster

		Insert into tbl_ProductMasterLog(Log_Description)
		Values('Insert Product Master Successfull')
End


--Insert data into product master

insert into tbl_ProductMaster(Product_Name,Product_Price,Product_Quantity,Created_Date,User_Id)
values('Watch',100,500,GETDATE(),1)



--Modify trigger on tbl_ProductMaster
Alter trigger tr_InsertProduct
on tbl_ProductMaster
For Insert
as
begin
		--Maintain a log for productMaster

		Insert into tbl_ProductMasterLog(Log_Description)
		Values(CONCAT_WS(' ','Insert Product On' ,GETDATE()))
End


--Insert data into product master

insert into tbl_ProductMaster(Product_Name,Product_Price,Product_Quantity,Created_Date,User_Id)
values('Apple Watch',100,800,GETDATE(),1)


--2) --Modify trigger on tbl_ProductMaster

		Alter trigger tr_InsertProduct
		on tbl_ProductMaster
		For Insert
		as
		begin
		--Maintain a log for productMaster
		declare @ProductName nvarchar(25)

		Select @ProductName = Product_Name from inserted

		Insert into tbl_ProductMasterLog(Log_Description,Created_Date)
		Values(CONCAT_WS(' ','Inserted Product is ',@ProductName,' on ',GETDATE()),GETDATE())
		End


	--Insert data into product master

	insert into tbl_ProductMaster(Product_Name,Product_Price,Product_Quantity,Created_Date,User_Id)
	values('Noise Watch',100,300,GETDATE(),1)

	
	insert into tbl_ProductMaster(Product_Name,Product_Price,Product_Quantity,Created_Date,User_Id)
	values('Boat Watch',100,300,GETDATE(),2)


	---Create new trigger for update on tbl_ProductMaster

	
		Alter trigger tr_UpdateProduct
		on tbl_ProductMaster
		For Update
		as
		begin
				--Maintain a log for productMaster
				declare @ProductName nvarchar(25)
							   
				Select @ProductName = Product_Name from inserted

				Insert into tbl_ProductMasterLog(Log_Description,Created_Date)
				Values(CONCAT_WS(' ','Updated Product is ',@ProductName,' on ',GETDATE()),GETDATE())
		End


		-- update

		update tbl_ProductMaster
		set Product_Price = 2000 where Product_Id = 2



		--Q)--When data insert in table than if we want to set value of created date and modify date by trigger not by table.

		---Create new trigger for update on tbl_ProductMaster

	
		Alter trigger tr_UpdateProduct
		on tbl_ProductMaster
		For Insert
		as
		begin
				--Maintain a log for productMaster
				declare @ProductName nvarchar(25)
				declare @CreatedBy int
				declare @ProductID int
				
				Select @ProductName = Product_Name, @CreatedBy = User_Id ,@ProductID = Product_Id from inserted

				Insert into tbl_ProductMasterLog(Log_Description,Created_Date)
				Values(CONCAT_WS(' ','Updated Product is ',@ProductName,' on ',GETDATE()),GETDATE())

				update tbl_ProductMaster
					set Created_Date = GETDATE() where Product_Id =  @ProductID
		End


		--Insert	
	insert into tbl_ProductMaster(Product_Name,Product_Price,Product_Quantity,User_Id)
	values('CrossBeat Watch',50000,500,2)



	Select * from tbl_ProductMaster

	Select * from tbl_ProductMasterLog