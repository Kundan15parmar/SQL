use SQLPracDb


/* Database transaction:
1) Commit
2) Rollback

Commit : Perform on sucessfull transaction in database.
	   - Can not rollback data after commit is done.
	   - Commit is not apply on select statement.

	   Syntax : begin transaction Transaction_Name
			
					Statement(Insert/update/delete )
				
				Commit transaction Transaction_Name
*/
		Example :
				begin transaction tr_categoryAndSubcategory
					insert into tbl_CategoryMaster(Category_Name)
					values('Camera1')
					
					insert into tbl_SubcategoryMaster(Category_Id,Subcategory_Name)
					values(5,Boat)  --Error

				Commit transaction tr_categoryAndSubcategory
/*
Rollback : It is reverse entry when tranaction is failed.

	Syntax :  Rollback transaction Transaction_Name
*/
	Example : Rollback transaction tr_categoryAndSubcategory


Select * from tbl_CategoryMaster
Select * from tbl_SubcategoryMaster


-----Prcedure for perform Database transaction

Alter procedure Sp_categoryAndSubcategory
(
	@Category_Name nvarchar(25),
	@Category_Id int,
	@Subcategory_Name  nvarchar(25)
)
as
Begin
	begin try
		begin transaction tr_categoryAndSubcategory
					insert into tbl_CategoryMaster(Category_Name)
					values(@Category_Name)

					raisError('Error',16,0)
					
					insert into tbl_SubcategoryMaster(Category_Id,Subcategory_Name)
					values(@Category_Id,@Subcategory_Name )  

		Commit transaction tr_categoryAndSubcategory
	end try
	begin catch
		Rollback transaction tr_categoryAndSubcategory
		print('Data is not inserted')

	end catch
End

--Execution
	Exec Sp_categoryAndSubcategory 'Adopter',Boat -- with scope identity

	Exec Sp_categoryAndSubcategory 'Adopter',Boat -- error

	Exec Sp_categoryAndSubcategory
		@Category_Name =  'Adopter',
		@Category_Id=5,
		@Subcategory_name = Boat --with parameter


--	SCOPE_IDENTITY() : returns Last Inserted Identity ID

		print(SCOPE_IDENTITY())

--   NewID() : generate new GUID every time