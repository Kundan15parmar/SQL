select * from sys.tables

use KundanDB

create table tbl_ApprovedCategoryMaster
(
	category_ID int primary key identity(1,1),
	category_Name nvarchar(25),
	created_date datetime
)

create table tbl_RequestCategoryMaster_Log
(
	Category_ID int primary key identity(1,1),
	category_Name nvarchar(25),
	created_date datetime,
	Status nvarchar(100)
)


---Create View for insert data
Alter view vw_SelectRequestedCategoryMaster_Log as
Select category_Name,Status,created_date from tbl_RequestCategoryMaster_Log 

--Create trigger,execute when data insert into view
create trigger tr_vw_SelectRequestedCategoryMaster_Log
on vw_SelectRequestedCategoryMaster_Log
Instead of Insert
as
begin
	declare @Category_Name nvarchar(25)

	Select @Category_Name = category_Name
	from inserted

	Insert into tbl_RequestCategoryMaster_Log(category_Name,created_date,Status)
	values(@Category_Name,getdate(),'Pending for Approval..!')
End

----Create trigger when Status is approved than data insert into original table(tbl_ApprovedCategoryMaster)
Create trigger tr_InsertRequestedCategoryMaster_Log
on tbl_RequestCategoryMaster_Log
After update
as
begin
	declare @Status nvarchar(25)

	select @Status = Status from inserted

	If @Status = 'Approved'
	begin
		Insert into tbl_ApprovedCategoryMaster(category_Name,created_date)
		Select Category_name,GETDATE() from inserted
	End
End



Select * from tbl_ApprovedCategoryMaster
Select * from tbl_RequestCategoryMaster_Log
Select * from vw_SelectRequestedCategoryMaster_Log

----Insert value into view
insert into vw_SelectRequestedCategoryMaster_Log(category_Name,Status,created_date)
values('Watch','Pending for Approval..!',Getdate())

---Update table for change Status
update tbl_RequestCategoryMaster_Log
	set Status = 'Approved'
	where Category_ID = 1