---------------Final exam-----------

----Question1
/*1. Create a Customer table with the below columns:
		a. Here's the `Customers` table explained in simple language:
				i. CustomerID: A unique number assigned automatically to each customer. 
					This is the main identifier for the customer.

				ii. FirstName: Stores the customer's first name, allowing up to 50 characters.

				iii. LastName: Stores the customer's last name, also allowing up to 50 characters.

				iv. Email: Holds the customer's email address. It must be unique, so no two customers can have the same email.

				v. PasswordBinary: This is where the encrypted version of the customer's password is stored for security.

				vi. PhoneNumber: Stores the customer’s phone number, allowing up to 15 characters.

				vii. Address: Holds the customer’s street address, with space for up to 255 characters.

				viii. RegistrationDate: Automatically stores the customer's registration date and time.
					It fills in the current date and time when a new customer is added.
*/

	Create table tbl_Customers
	(
		CustomerID int primary key identity(1,1),
		First_Name nvarchar(50),
		Last_Name nvarchar(50),
		Email nvarchar(255) unique,
		PasswordBinary nvarchar(max),--varbinary(max),
		PhoneNumber bigint,
		[Address] nvarchar(255),
		RegistrationDate datetime
	)

	---------Question 2------

	-- Create Procedure for Insert data into the Customer table.
	
		Alter procedure Sp_InsertCustomerDetail
		(
			@First_Name nvarchar(50),
			@Last_Name nvarchar(50),
			@Email nvarchar(255),
			@PasswordBinary nvarchar(max),
			@PhoneNumber bigint,
			@Address nvarchar(255)
		)
		As
		begin
				begin try
						begin transaction

						------insert--
				

						insert into tbl_Customers(First_Name,Last_Name,Email,PasswordBinary,PhoneNumber,Address,RegistrationDate)
						values(@First_Name,@Last_Name,@Email,@PasswordBinary,@PhoneNumber,@Address,GETDATE())

						------Select------
						Select First_Name,Last_Name,Email,CAST(@PasswordBinary as varbinary(max)) as [Password],PhoneNumber,Address,
						CONVERT(VARCHAR(11),RegistrationDate , 106) AS RegistrationDate from tbl_Customers where Email = @Email

						Commit transaction
				End try

				begin catch
			
						ROLLBACK TRANSACTION
								 DECLARE @ErrorMessage NVARCHAR(4000)
								 SET @ErrorMessage = ERROR_MESSAGE()
								  RAISERROR (@ErrorMessage, 16, 1)

					--	raiserror(Error_message(),16,1)
				end catch
		End


----Execution of Store Procedure---

exec Sp_InsertCustomerDetail @First_Name='John',@Last_Name='Doe',
@Email ='john12.doe@example.com',@PasswordBinary = 'encryptedpassword1',@PhoneNumber = 1234567890,@Address = '123 main St'


exec Sp_InsertCustomerDetail @First_Name='Jane',@Last_Name='Smith',
@Email ='jane.smith@example.com',@PasswordBinary = 'encryptedpassword2',@PhoneNumber = 9876543210,@Address = '456 Oak St'


exec Sp_InsertCustomerDetail @First_Name='Mike',@Last_Name='Johnson',
@Email ='mike.johnson@example.com',@PasswordBinary = 'encryptedpassword3',@PhoneNumber = 1928374650,@Address = '789 pine St'


-----------------Question 3--------------------------------

/*
	3. Create a ProductCategory Table with the below columns.
			 CategoryID: A unique number automatically assigned to each category. This serves as
			the main identifier for each product category.

			 CategoryName: The name of the product category, like "Electronics," "Clothing," or
			"Furniture." It can store up to 100 characters.
*/

	Create table tbl_ProductCategory
	(
		CategoryID int primary Key identity(1,1),
		CategoryName nvarchar(100)
	)

	
	----------------------Question 4 ----------------------

	---Create a Procedure to Insert data into the ProductCategory Table

	Alter procedure Sp_InsertProductCategory
	(
		@CategoryName nvarchar(100)
	)
	As
	Begin
		begin try
				begin transaction
						--------Insert

						insert into tbl_ProductCategory(CategoryName)
						values(@CategoryName)

						----Select

						Select * from tbl_ProductCategory where CategoryName = @CategoryName

				Commit transaction
		end try
		begin catch
				Rollback transaction
				declare @Error_Message nvarchar(max)
				set @Error_Message = ERROR_MESSAGE()
				RaisError(@Error_Message,16,1)
		end catch
			
	End


	Exec Sp_InsertProductCategory 	'Electronics'

	Exec Sp_InsertProductCategory  'Clothing'
	Exec Sp_InsertProductCategory  'Furniture'
	Exec Sp_InsertProductCategory 'Books'
	Exec Sp_InsertProductCategory 'Toys'

	Select * from tbl_ProductCategory

	-----------Question 5 -------------------

	/*Create a Product Table with the below columns.
			 ProductID: A unique number that is automatically assigned to each product. This
			number serves as the product's main identifier.

			 ProductName: The name of the product. This can be up to 100 characters long.

			 Description: A detailed description of the product, with no fixed character limit,
			allowing you to store as much information as needed.

			 Price: The price of the product. It is stored with two decimal places, allowing values
			like 99.99 or 150.50.

			 StockQuantity: The number of units of this product that are currently available in
			stock.

			 CategoryID: A number that links this product to a category (like electronics, clothing,
			etc.). This is a foreign key that connects to the ProductCategory table.

			 DateAdded: The date and time when the product was added to the database. It is
			automatically set to the current date and time when a new product is added.

*/

	Create table tbl_Product
	(
		ProductID int primary key identity(1,1),
		ProductName nvarchar(100),
		[Description] nvarchar(max),
		Price decimal(18,2),
		StockQuantity int,
		CategoryID int,
		DateAdded datetime Default Getdate(),
		Constraint FK_CategoryID Foreign Key(CategoryID) references tbl_ProductCategory(CategoryID)
	)

	----------------------Question6-----------------------------
	--6. Create a Procedure to Insert data into the Product table

	Create procedure SP_InsertProductData
	(
		@ProductName nvarchar(100),
		@Description nvarchar(max),
		@Price decimal(18,2),
		@StockQuantity int,
		@CategoryID int
	)
	As
	Begin
		begin try
				begin transaction
					-------------Insert
					insert into tbl_Product(ProductName,Description,Price,StockQuantity,CategoryID)
					Values(@ProductName,@Description,@Price,@StockQuantity,@CategoryID)

					-------------Select
					Select ProductID,ProductName,Description,Price,StockQuantity,CategoryID,DateAdded 
					from tbl_Product
					where ProductName = @ProductName
				Commit transaction
		end try
		begin catch
				Rollback transaction
				declare @Error_Message nvarchar(max)
				set @Error_Message = ERROR_MESSAGE()
				RaisError(@Error_Message,16,1)
		end catch

	End


	----Execution of procedure

	Exec SP_InsertProductData @ProductName = 'Smartphone',
			@Description = 'A high-end smartphone with 128GB Storage',
			@Price = 699.9,@StockQuantity=50,@CategoryID = 1

	
	Exec SP_InsertProductData @ProductName = 'Jeans',
			@Description = 'Comfortable blue jeans with a modern fit',
			@Price = 46.99,@StockQuantity=200,@CategoryID = 2

	
	Exec SP_InsertProductData @ProductName = 'Sofa',
			@Description = 'Three-seater leather sofa',
			@Price = 799,@StockQuantity=20,@CategoryID = 3

			
	Exec SP_InsertProductData @ProductName = 'Novel',
			@Description = 'Best-selling mystery novel',
			@Price = 15.99,@StockQuantity=100,@CategoryID = 4

	
	Exec SP_InsertProductData @ProductName = 'Action Figure',
			@Description = 'Popular superhero action figure',
			@Price = 699.9,@StockQuantity=50,@CategoryID = 5

Select * from tbl_Product

----------------Question7---------------------
/*
		7. Create Orderdetail table with the following columns
				 OrderDetailID: A unique number automatically assigned to each order detail. This is the
				primary key.

				 OrderID: Refers to the order this detail is part of. This links to the Orders table using a
				foreign key.

				 ProductID: Refers to the product in the order. This links to the Products table using a
				foreign key.

				 Quantity: The number of units of this product ordered.

				 UnitPrice: The price per unit of the product at the time of the order.
*/

	Create table tbl_OrderDetail
	(
		OrderDetailID int primary key identity(1,1),
		OrderID int,
		ProductID int,
		Quantity int,
		UnitPrice decimal(18,2),
		Constraint FK_ProductID Foreign key (ProductID) references tbl_Product(ProductID)
	
	)

	----------------Question 8---------------------
	--	8. Create a trigger(Insert, Update, and Delete) to maintain the log for the OrderDetail table.

	--------Create Log Table

	Create table tbl_OrderDetailLog
	(
		OrderLogID int primary key identity(1,1),
		LogDescription nvarchar(100),
		OrderDetailID int,
		ProductID int,
		Quantity int,
		UnitPrice decimal(18,2),
		CreatedDate datetime,
		[Status] nvarchar(100)
	)
	-----------Trigger for insert data
		Alter trigger tr_InsertOrderDetail
		on tbl_OrderDetail
		For Insert
		as
		begin
			
			Declare @OrderDetailID int
			Declare @ProductID int
			Declare @Quantity int
			Declare @UnitPrice decimal(18,2)
			

			Select @OrderDetailID = OrderDetailID, @ProductID = ProductID, @Quantity=Quantity,@UnitPrice = UnitPrice
			from inserted

			insert into tbl_OrderDetailLog(LogDescription,OrderDetailID,ProductID,Quantity,UnitPrice,CreatedDate,Status)
			values('Order Sucessfully Placed...!',@OrderDetailID,@ProductID,@Quantity,@UnitPrice,GETDATE(),'Pending for Approval')
		End

		-------------------
		insert into tbl_OrderDetail(OrderID,ProductID,Quantity,UnitPrice)
		values(101,1,4,1500)


		--------------Trigger for update
	Alter trigger tr_UpdateOrderDetail
		on tbl_OrderDetail
		After Update
		as
		begin
			
			Declare @OrderDetailID int
			Declare @ProductID int
			Declare @Quantity int
			Declare @UnitPrice decimal(18,2)
			

			Select @OrderDetailID = OrderDetailID, @ProductID = ProductID, @Quantity=Quantity,@UnitPrice = UnitPrice
			from inserted

			insert into tbl_OrderDetailLog(LogDescription,OrderDetailID,ProductID,Quantity,UnitPrice,CreatedDate,Status)
			values('Order Sucessfully Updated...!',@OrderDetailID,@ProductID,@Quantity,@UnitPrice,GETDATE(),'Pending for Approval')

			update tbl_OrderDetail
				set Quantity = @Quantity
				where OrderDetailID = @OrderDetailID

		End

		Select * from tbl_OrderDetail

			update tbl_OrderDetail
			set Quantity = 4
				where OrderDetailID = 2

				Select * from tbl_OrderDetailLog

	---------------Trigger for Delete
	create trigger tr_DeleteOrderDetail
		on tbl_OrderDetail
		After Delete
		as
		begin
			
			Declare @OrderDetailID int
			Declare @ProductID int
			Declare @Quantity int
			Declare @UnitPrice decimal(18,2)
			

			Select @OrderDetailID = OrderDetailID, @ProductID = ProductID, @Quantity=Quantity,@UnitPrice = UnitPrice
			from deleted

			insert into tbl_OrderDetailLog(LogDescription,OrderDetailID,ProductID,Quantity,UnitPrice,CreatedDate)
			values('Order Sucessfully Deleted...!',@OrderDetailID,@ProductID,@Quantity,@UnitPrice,GETDATE())


		End
------------
		delete from tbl_OrderDetail where OrderDetailID = 2

		select * from tbl_OrderDetail
		Select * from tbl_OrderDetailLog


	----------------Question 9---------------------
	/*	9. Maintain stock in the Product table using the trigger once the order is confirmed in the
			OrderDetail table.*/

				/*	9. Maintain stock in the Product table using the trigger once the order is confirmed in the
			OrderDetail table.*/

			Select * from tbl_Product
			Select * from tbl_OrderDetail


			create table tbl_RequestOrderDetail_Log
				(
					RequestLogID int primary key identity(1,1),
					OrderDetailID int,
					OrderId int,
					ProductID int,
					Quantity int,
					UnitPrice decimal(18,2),
					created_date datetime,
					[Status] nvarchar(100)
				)


		
		---Create View for insert data
	create view vw_SelectRequestOrderDetail_Log as
		Select OrderDetailID,OrderId,ProductID,Quantity,UnitPrice,created_date,Status from tbl_RequestOrderDetail_Log 


		--Create trigger,execute when data insert into view
				create trigger tr_vw_SelectRequestOrderDetail_Log
				on vw_SelectRequestOrderDetail_Log
				Instead of Insert
				as
				begin
					declare @OrderDetailID int
					declare @OrderID int
					declare @ProductID int
					declare @Quantity int
					declare @UnitPrice decimal
					declare @Status nvarchar(100)

					Select @OrderDetailID = OrderDetailID,
								@OrderID = OrderId,
								@ProductID=ProductID,
								@Quantity=Quantity,
								@UnitPrice = UnitPrice
								from inserted

					Insert into vw_SelectRequestOrderDetail_Log(OrderDetailID,OrderId,ProductID,Quantity,UnitPrice,created_date,Status)
					values(@OrderDetailID,@OrderID,@ProductID,@Quantity,@UnitPrice,getdate(),'Pending for Approval..!')
				End

			----Create trigger when Status is approved than data insert into original table
			Alter trigger tr_InsertRequestOrderDetail_Log
			on tbl_RequestOrderDetail_Log
			After update
			as
			begin
				declare @Status nvarchar(25)

				select @Status = Status from inserted

				If @Status = 'Approved'
				begin
					Insert into tbl_OrderDetail(OrderID,ProductID,Quantity,UnitPrice)
					Select OrderId,ProductID,Quantity,UnitPrice from inserted

					update tbl_Product
					set StockQuantity = p.StockQuantity - o.Quantity
					from tbl_Product p ,tbl_OrderDetail o
					where p.ProductID =o.ProductID
				End
			End

			Select * from tbl_OrderDetail
			Select * from tbl_RequestOrderDetail_Log
			Select * from vw_SelectRequestOrderDetail_Log

			---------Insert into view

			insert into	vw_SelectRequestOrderDetail_Log(OrderId,ProductID,Quantity,UnitPrice,created_date,Status)
			values(104,4,10,15.99,GETDATE(),'Pending For Approval')

			Select * from tbl_Product

			update tbl_RequestOrderDetail_Log
			set Status ='Approved' where OrderId = 104



	----------------Question 10---------------------
	/*	10.Create a Select store procedure to count the total price (Using function) for the Order Detail
		table and get the product name.*/

		-----------Function for calculate Total----------
		create function fn_TotalPrice
		(
			@Quantity int,
			@UnitPrice decimal(18,2)
		)
		returns decimal(18,2)
		as
		begin
			return @Quantity*@UnitPrice
		end

		-------------Procedure--------
		Alter procedure sp_OrderDetailTotal
		as
		begin
			begin try
				
				Select o.OrderDetailID,o.OrderID,o.ProductID,p.ProductName,o.Quantity,o.UnitPrice,
					dbo.fn_TotalPrice(o.Quantity,o.UnitPrice) As totalPrice
					from tbl_OrderDetail o inner join tbl_Product p 
					on o.ProductID = p.ProductID
			end try
			begin catch
					declare @Error_Message nvarchar(max)
					set @Error_Message = ERROR_MESSAGE()
					RaisError(@Error_Message,16,1)
			end catch
		end


		exec sp_OrderDetailTotal