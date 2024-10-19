-- Select single record from table

Select * from tbl_UserMaster

Declare @User_Name as nvarchar(50)
Declare @User_Email as nvarchar(100)

Declare cr_UserMaster cursor
	for Select User_Name, User_EmailAddress from tbl_UserMaster
	Open cr_UserMaster
		fetch next from cr_UserMaster into @User_Name , @User_Email

		Print(concat_ws(' ',@User_Name,@User_Email))
	Close cr_UserMaster
Deallocate cr_UserMaster