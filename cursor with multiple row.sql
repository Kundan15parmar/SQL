
-- Fetch every row from the cursor

-- Select * from tbl_UserMaster

--Select * from tbl_OrderMaster

Declare @Order_Name nvarchar(100)
Declare @Order_Amount decimal(18,2)
Declare @Order_Quantity decimal(18,2)
Declare @Order_Total decimal(18,2)

Declare cr_OrderMaster cursor
	for Select Order_Name,Order_Amount,Order_Quantity from tbl_OrderMaster
	open cr_OrderMaster
		fetch next from cr_OrderMaster into @Order_Name, @Order_Amount, @Order_Quantity

		While @@FETCH_STATUS = 0
		Begin
			Set @Order_Total = @Order_Amount * @Order_Quantity

			print(concat_ws(' ','Order name is',@Order_Name,'Order Amount is',@Order_Amount,
				'Order Quantity is',@Order_Quantity,'Order Total is',@Order_Total))

			fetch next from cr_OrderMaster into @Order_Name, @Order_Amount, @Order_Quantity
		End

	Close cr_OrderMaster
Deallocate cr_OrderMaster
