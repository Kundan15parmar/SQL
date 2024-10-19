use SQLPracDb


Create table tbl_People
(
	[Index] int primary key identity(1,1),
	User_Id nvarchar(50),
	FirstName nvarchar(50),
	LastName nvarchar(50),
	Sex nvarchar(10),
	Email nvarchar(100),
	Phone nvarchar(50),
	DateOfBirth nvarchar(max),
	JobTitle nvarchar(100)
)

insert into tbl_People(User_Id,FirstName,LastName,Sex,Email,Phone,DateOfBirth,JobTitle)
Select User_Id,FirstName,LastName,Sex,Email,Phone,DateOfBirth,JobTitle  from tbl_People

----import csv file using coding

			Bulk insert tbl_People 
			from 'C:\Users\Kiran\Downloads\people-1000.csv'
			with
			(
				Format='csv',
				Firstrow = 2
			)


		select * from tbl_People -- 1:22

---For index 
	
		Create index idx_tbl_People
				on tbl_People(User_Id)  -- 1:03 time

		Create index idx_tbl_People
				on tbl_People(User_Id,FirstName,LastName,Email) -- 1:32 time



