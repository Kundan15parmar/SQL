--Example of CRUD operation in SP

--Alter procedure SP_CRUDIfElseOperation
--(
--	@Type nvarchar(50)
	
--)
--As
--Begin
--	if(@Type = 'Insert')
--		begin
--			print('Insert data')
--		end
--	else if(@Type = 'Select')
--		begin
--			print('Select data')
--		end
--	else if(@Type = 'Update')
--		begin
--			print('Update data')
--		end
--	else if(@Type = 'Delete')
--		begin
--			print('Delete data')
--		end
--	else
--		Begin
--			print('Select Any one from Crud')
--		End
--End


-- exec SP_CRUDIfElseOperation ''

-- Example Of CRUD operation in SP using Insert,update,Select and delete from table

Select * from tbl_BookDetails

Alter procedure SP_CRUDIfElseOperation
(
	@Type nvarchar(25),
	@Book_Id int = null,
	@Book_Name nvarchar(50) = null,
	@Book_Author nvarchar(50) = null,
	@Book_Price int = null

)
As
Begin
	if(@Type = 'Insert')
		begin
			
			if not exists (select * from tbl_BookDetails where Book_Name = @Book_Name)
			begin
				print('Insert data into Table')
				Insert into tbl_BookDetails(Book_Name,Book_Author,Book_Price)
				values(@Book_Name,@Book_Author,@Book_Price)
			end
			else
			Begin
				print('Book name already exist please Add another book details')
			end
		end
	else if(@Type = 'Select')
		begin
			print('Select data from table')
			Select * from tbl_BookDetails 
		end
	else if(@Type = 'Update')
		begin
			print('Update data into table')
			update tbl_BookDetails set Book_Price = @Book_Price where Book_Name = @Book_Name
		end
	else if(@Type = 'Delete')
		begin
			print('Delete data from table')
			delete from tbl_BookDetails where Book_Name = @Book_Name
		end
	else
		Begin
			print('Select Any one (Insert,Update,Select,Delete) from Crud')
		End
End

exec SP_CRUDIfElseOperation @Type = 'insert',@Book_Name = 'Atomic Habit'