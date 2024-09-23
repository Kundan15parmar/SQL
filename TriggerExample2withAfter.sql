use KundanDB

------Create trigger with After

	Select * from tbl_StudentDetail


	update tbl_StudentMaster
		set Created_By_Name= 'Askhit Patel'

	Alter table tbl_StudentMaster
	add Created_By_Name nvarchar(50)

	create table tbl_StudentMasterLog
	(
		Log_Id int primary key identity(1,1),
		Log_Description nvarchar(max),
		Created_Date datetime,
		Inserted_By_Id int,
		Inserted_By_Name nvarchar(50)
	)

create trigger tr_AfterInsert
on tbl_StudentMaster
After Insert
as
begin
		declare @Student_ID int
		declare @Student_Name nvarchar(50)
		declare @Created_By_Id int
		declare @Created_By_Name nvarchar(50)

		Select @Student_ID = Student_Id, 
				@Student_Name = Student_Name,
				@Created_By_Id = Created_By_Id,
				@Created_By_Name = Created_By_Name
				from inserted

		Insert into tbl_StudentMasterLog(Log_Description,Created_Date,Inserted_By_Id,Inserted_By_Name)
		Values(CONCAT_WS(' ','Inserted Student Data is',@Student_Name),GETDATE(),@Created_By_Id,@Created_By_Name)


		Update tbl_StudentMaster
		set Created_Date =GETDATE() where Student_Id = @Student_ID
End


Alter trigger tr_AfterUpdate
on tbl_StudentMaster
After Update
as
begin
		declare @Student_ID int
		declare @Student_MobileNo bigint
		declare @Created_By_Id int
		declare @Created_By_Name nvarchar(50)
		declare @Update_Date datetime

		Select @Student_ID = Student_Id, 
				@Student_MobileNo = Student_MobileNo,
				@Created_By_Id = Created_By_Id,
				@Created_By_Name = Created_By_Name
				from inserted

		Insert into tbl_StudentMasterLog(Log_Description,Created_Date,Inserted_By_Id,Inserted_By_Name)
		Values(CONCAT_WS(' ','Update Student mobile is',@Student_MobileNo,'Of student Id is',@Student_ID),
				GETDATE(),@Created_By_Id,@Created_By_Name)

				update tbl_StudentMaster
					set Student_MobileNo = @Student_MobileNo,
						Update_Date = getDate()
					where Student_Id = @Student_ID

End


	Select * from tbl_StudentMaster
	Select * from tbl_StudentMasterLog

	insert into tbl_StudentMaster(Student_Name,Student_Age,Student_MobileNo,Student_Address,Created_By_ID,Created_By_Name)
	values('Dhawnit Gaurang Parmar',20,9878667551,'Ahemdabad,Gujarat',2,'Rahul Singh')

	update tbl_StudentMaster
	set Student_MobileNo = 8238442860 where Student_Id = 1