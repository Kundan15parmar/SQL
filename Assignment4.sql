/*
------------Assignment 4:------------

1) 	Create Category Table with following fields:

		Category id primary key and identity key(unique)
		Category Name string,
		Inserted date -> New record insert
		Deleted date -> Current date and time when delete
		Updated date -> Current date and time when update
		Comapny id int
		IsDeleted bit 

2)	Create SP :
		Insert
		Update
		Delete
		Select

Also add row number in select statement */

	Create table tbl_Category
	(
		Category_Id int primary key  identity(1,1),
		Category_Name nvarchar(50),
		Inserted datetime, 
		Deleted datetime, 
		Updated datetime, 
		Comapny_Id int,
		IsDeleted bit 
	)


	Create procedure Sp_Category
		@Operation nvarchar(25),
		@Category_ID int = Null,
		@Category_Name nvarchar(50) = Null,
		@Inserted datetime = Null, 
		@Deleted datetime = Null, 
		@Updated datetime = Null, 
		@Comapny_Id int = 1,
		@IsDeleted bit = 0
	as
	Begin
		If (@Operation = 'Insert')
		Begin
			Insert into tbl_Category(Category_Name,Inserted,Comapny_Id,IsDeleted)
			values(@Category_Name,GetDate(),@Comapny_Id,@IsDeleted)
		End
		else if(@Operation = 'Update')
		Begin
			Update tbl_Category
			set Category_Name = @Category_Name,
				Updated = GETDATE()
			where Category_Id = @Category_ID
		End
		else if(@Operation = 'Delete')
		Begin
			--In Place of Delete we use update because soft deletion of data
			update tbl_Category
			set IsDeleted = 1,
				Deleted = GETDATE()
			where Category_Id = @Category_ID
		End
		else if(@Operation = 'Select')
		Begin
			Select ROW_NUMBER() over (Order by Category_Id) as RowNumber,
			Category_Id, Category_Name,Inserted,Updated,Comapny_Id
			from tbl_Category
			Where IsDeleted = 0
		End
		Else
		begin
			print('Select any one CRUD operation...!')
		End
	End

	Select * from tbl_Category

	--Execution for Inserting data

	Exec Sp_Category @Operation = 'Insert',@Category_Name = 'Laptop'
	Exec Sp_Category @Operation = 'Insert',@Category_Name = 'Mobile'
	Exec Sp_Category @Operation = 'Insert',@Category_Name = 'Headphone'
	Exec Sp_Category @Operation = 'Insert',@Category_Name = 'Watch'


	--Execution for update
	
	Exec Sp_Category @Operation = 'Update',@Category_Id = 4,@Category_Name = 'Camera'

	--Execution For Delete(Soft Delete)

	Exec Sp_Category @Operation = 'Delete',@category_Id = 3

	--Execution For Select 

	Exec Sp_Category @Operation = 'Select'
