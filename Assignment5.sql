use KundanDB

------------Assignment5--------------
/* 
1) create table movieCategory with following fields:
	Movie_categoryId -> primary key,
	category_Name,
	Inserted_date,
	deleted_date,
	Update_date 
*/
	Create table tbl_MovieCategory
	(
		Movie_CategoryId int primary key identity(1,1),
		Category_Name nvarchar(50),
		Inserted_Date datetime,
		Deleted_Date datetime,
		Update_Date datetime,
		IsDeleted bit
	)


	----------Procedure for Crud operastion on tbl_MovieCategory-----

	Create procedure Sp_MovieCategory
		@Operation nvarchar(25) =null,
		@Movie_Category_ID int = Null,
		@Category_Name nvarchar(50) = Null,
		@IsDeleted bit = 0
	as
	Begin
		If (@Operation = 'Insert')
		Begin
			Insert into tbl_MovieCategory(Category_Name,Inserted_date,IsDeleted)
			values(@Category_Name,GETDATE(),@IsDeleted)
		End
		else if(@Operation = 'Update')
		Begin
			Update tbl_MovieCategory
			set Category_Name = @Category_Name,
				Update_Date = GETDATE()
			where Movie_CategoryId = @Movie_Category_ID
		End
		else if(@Operation = 'Delete')
		Begin
			Update tbl_MovieCategory
			set IsDeleted = 1,
			Deleted_Date = GETDATE() 
			where Movie_CategoryId = @Movie_Category_ID
		End
		else 
		Begin
			Select ROW_NUMBER() over (Order by Movie_categoryId) as RowNumber,
			Movie_categoryId, category_Name,Inserted_date,Update_date,Deleted_date,IsDeleted 
			from tbl_MovieCategory
		End
End

----Execution for inserting data--------

Exec Sp_MovieCategory @operation = 'Insert',@Category_Name = 'Comedy'
Exec Sp_MovieCategory @operation = 'Insert',@Category_Name = 'Action'
Exec Sp_MovieCategory @operation = 'Insert',@Category_Name = 'Family Drama'
Exec Sp_MovieCategory @operation = 'Insert',@Category_Name = 'Biography'
Exec Sp_MovieCategory @operation = 'Insert',@Category_Name = 'Thriller'
Exec Sp_MovieCategory @operation = 'Insert',@Category_Name = 'Romance'

----Execution for Updating data--------

Exec Sp_MovieCategory @operation = 'Update',@Movie_Category_ID = 3,@Category_Name = 'Drama'
Exec Sp_MovieCategory @operation = 'Update',@Movie_Category_ID = 4,@Category_Name = 'Biography'

----Execution for Deleting data--------

Exec Sp_MovieCategory @operation = 'Delete',@Movie_Category_ID = 4,@Category_Name = 'Biography'

----Execution for Fetch data--------

Exec Sp_MovieCategory 

/*
2) create table movieSubCatergory with following fields:
	SubCategory_Id -> primary key,
	category_Id -> Foreign key,
	Category_Name,
	Inserted_date,
	deleted_date,
	Update_date
*/

	create table tbl_MovieSubcategory
	(
		Subcategory_ID int primary key identity(101,1),
		Category_ID int,
		Subcategory_Name nvarchar(50),
		Inserted_Date datetime,
		Deleted_Date datetime,
		Update_Date datetime,
		IsDeleted bit,
		constraint FK_Category_ID foreign key(Category_ID) references tbl_MovieCategory(Movie_CategoryId)
	)
	
	
--- Procedure for Crud operastion on tbl_MovieSubcategory
		
	Create procedure Sp_MovieSubcategory
		@Operation nvarchar(25) = null,
		@Subcategory_ID int = null,
		@Category_ID int = Null,
		@Subcategory_Name nvarchar(50) = Null,
		@IsDeleted bit = 0
	as
	Begin
		if(@Operation = 'Insert')
		Begin
			insert into tbl_MovieSubcategory(Category_ID,Subcategory_Name,Inserted_Date,IsDeleted)
			values(@Category_ID,@Subcategory_Name,GETDATE(),@IsDeleted)
		End
		else if(@Operation = 'Update')
		begin
			update tbl_MovieSubcategory set
					Subcategory_Name = @Subcategory_Name,
					Update_Date = GetDate()
				where Subcategory_ID = @Subcategory_ID
		end
		else if(@Operation = 'Delete')
		begin
			update tbl_MovieSubcategory set
					IsDeleted = 1,
					Deleted_Date = GetDate()
			where Subcategory_ID = @Subcategory_ID
		end
		else
		Begin
			Select Subcategory_ID,Category_ID,Subcategory_Name,
			Inserted_date,Update_date,Deleted_date,IsDeleted
			from tbl_MovieSubcategory
		end
	End

	------Execution for Inserting data------------
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 2 ,@Subcategory_Name = 'Revenge Drama'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 1 ,@Subcategory_Name = 'Romantic Comedy'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 3 ,@Subcategory_Name = 'Family Drama'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 1 ,@Subcategory_Name = 'Slapstick Comedy'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 3 ,@Subcategory_Name = 'Romantic Drama'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 2 ,@Subcategory_Name = 'Action Thriller'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 2 ,@Subcategory_Name = 'Superhero'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 2 ,@Subcategory_Name = 'Martial Arts'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 3 ,@Subcategory_Name = 'Social Issue Drama'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 3 ,@Subcategory_Name = 'Political Drama'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 2 ,@Subcategory_Name = 'Action Drama'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 4 ,@Subcategory_Name = 'prophetic biography'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 6 ,@Subcategory_Name = 'Historic'
	exec Sp_MovieSubcategory @Operation = 'Insert' ,@Category_ID = 5 ,@Subcategory_Name = 'Mystery Thriller'

	------Execution for Updating data------------
	exec Sp_MovieSubcategory @Operation = 'Update' ,@Subcategory_ID = 108 ,
	@Subcategory_Name = 'Martial Arts'


	------Execution for Deleting data------------

	exec Sp_MovieSubcategory @Operation = 'Delete' ,@Subcategory_ID = 108 ,
	@Subcategory_Name = 'Martial Arts'


	------Execution for fetch data------------

	Exec Sp_MovieSubcategory


/* 
3) create table movie with following fields:
	Movie_Id -> primary key,
	Movie_name,
	Category_Id -> foreign key,
	SubCategory_Id -> foreign key,
	Release_Date,
	Small_description,
	Ratings
*/

	create table tbl_Movie
	(
		Movie_Id int primary key identity(201,1),
		Movie_Name nvarchar(50),
		Category_Id int,
		SubCategory_Id int,
		Release_Date datetime,
		Small_Description nvarchar(500),
		Ratings decimal(10,2),
		Constraint FK_CategoryID Foreign key (Category_Id) references tbl_MovieCategory(Movie_categoryId),
		Constraint FK_SubCategory_ID Foreign key (SubCategory_Id) references tbl_MovieSubcategory(Subcategory_ID)
	)

	-----------Store procedure for Table Movie---------------
	Create procedure Sp_Movie
		@Operation nvarchar(25) = null,
		@Movie_Id int = null,
		@Movie_name nvarchar(50) = null,
		@Category_Id int = null,
		@SubCategory_Id int = null,
		@Release_Date datetime = null,
		@Small_description nvarchar(500) = null,
		@Ratings decimal(10,2) = null
	As
	Begin
		if(@Operation = 'Insert')
		Begin
			Insert into tbl_Movie(Movie_Name,Category_Id,SubCategory_Id,Release_Date,Small_Description,Ratings)
			Values(@Movie_name,@Category_Id,@SubCategory_Id,@Release_Date,@Small_description,@Ratings)
		End
		else if(@Operation = 'Update')
		Begin
			update tbl_Movie
			Set Ratings = @Ratings
			where Movie_Id = @Movie_Id
		End
		else
		Begin
			Select Movie_Id,Movie_Name,Category_Id,SubCategory_Id,Release_Date,Small_Description,Ratings
			from tbl_Movie
		End 
	End


------------------Execution for inserting data-------------

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Kalki',@Category_Id =2,
@SubCategory_Id = 111,@Release_Date ='2024-07-27',
@Small_Description = 'Lord Kalki will destroy the sinners from the world by riding on a horse or vehicle named Devadatta and re-establish religion.',@Ratings = 7.6

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Salaar',@Category_Id =2,
@SubCategory_Id = 106,@Release_Date ='2023-12-22',
@Small_Description = 'the film follows the friendship between Deva (Prabhas), the exiled prince of Khansaar, 
and Varadha (Prithviraj), the current prince of Khansaar.',@Ratings = 6.5

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'India 2',@Category_Id = 3,
@SubCategory_Id = 110,@Release_Date ='2024-07-12',
@Small_Description = 'As corruption becomes rampant in the country, 
a group of vloggers urges freedom fighter-turned-vigilante Senapathy to return to finish his mission.',@Ratings = 5.1

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Kakuda',@Category_Id = 2,
@SubCategory_Id = 106,@Release_Date ='2024-07-12',
@Small_Description = 'A town trapped in time by a curse and 3 of its inhabitants face a ghost that makes them question superstition, tradition and love.',@Ratings = 5.4

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = '3 Idiots',@Category_Id = 3,
@SubCategory_Id = 109,@Release_Date ='2009-12-25',
@Small_Description = ' college best friends, Farhan (R. Madhavan) and Raju (Sharman Joshi),
who drive down to Shimla in search for Rancho (Aamir Khan), their long-lost buddy.',@Ratings = 8.4

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Marry Kom',@Category_Id = 4,
@SubCategory_Id = 112,@Release_Date ='2014-09-02',
@Small_Description = 'Mary Kom is an Indian boxer who has the distinction of being a five-time World Amateur Boxing champion.',@Ratings = 6.8

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Hera Pheri',@Category_Id = 1,
@SubCategory_Id = 104,@Release_Date ='2000-03-21',
@Small_Description = 'The plot revolves around two tenants, Raju and Shyam, and their landlord, Baburao Ganpatrao Apte, who are in desperate need of money.
They chance upon a ransom call through a cross-connection and hatch a plan to claim the ransom for themselves.',@Ratings = 8.4

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Golmaal',@Category_Id = 1,
@SubCategory_Id = 104,@Release_Date ='2006-07-14',
@Small_Description = 'The story revolves around the lives of Gopal (Ajay Devgn), Lucky (Tusshar Kapoor), Madhav (Arshad Warsi) and Laxman (Sharman Joshi)',@Ratings = 7.5

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Jodha Akbar',@Category_Id = 6,
@SubCategory_Id = 113,@Release_Date ='2008-02-15',
@Small_Description = 'the life and love between the Muslim Emperor Akbar of Mughal Empire and a Hindu Princess Jodhaa Bai of Amber, and their political marriage.',@Ratings = 7.5

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Kahaani',@Category_Id = 5,
@SubCategory_Id = 114,@Release_Date ='2009-03-09',
@Small_Description = 'A poison-gas attack on a Kolkata Metro Rail compartment kills the passengers on board. Two years later Vidya Bagchi, a pregnant British-Indian software engineer, arrives in Kolkata from London during the Durga Puja festivities in search of her missing husband, Arnab Bagchi.',@Ratings = 8.1

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Neerja',@Category_Id = 4,
@SubCategory_Id = 112,@Release_Date ='2016-02-16',
@Small_Description = 'The story of courageous Neerja Bhanot, who sacrificed her life while protecting the lives of 359 passengers on Pan Am Flight 73 in 1986 when it was hijacked by a terrorist organization.',@Ratings = 7.6

Exec Sp_Movie @Operation = 'Insert',@Movie_Name = 'Krrish 3',@Category_Id =2,
@SubCategory_Id = 107,@Release_Date ='2013-11-01',
@Small_Description = 'Krishna Mehra, also known as Krrish, and his scientist father, Rohit Mehra, who face an elaborate conspiracy orchestrated by the evil genetist Kaal and his gang of mutants, led by the ruthless Kaya.',@Ratings = 5.3


-------Execution for Fetch data----------

Exec Sp_Movie