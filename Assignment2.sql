--Assignement 2 :
--	Check value in select statement
--	If value is available then update or insert a new record.
--	Value in the condition should be check with parameter

declare @Book_Name nvarchar(50) = 'War and Peace'

declare @Book_Author nvarchar(50) = 'Leo Tolstoy'

declare @Book_Price int = 594

if exists(Select Book_Name,Book_Author,Book_Price from tbl_BookDetails where Book_Name = @Book_Name)
	Begin
		print('Book is available')
		update tbl_BookDetails set Book_Price = 594 where Book_Name = @Book_Name
	End
else
	Begin
		print('Book is not available')
		Insert into tbl_BookDetails(Book_Name,Book_Author,Book_Price)
		values(@Book_Name,@Book_Author,@Book_Price)	
	End
