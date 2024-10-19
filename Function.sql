use KundanDB

----------Scalar value Function----------

	Create function fn_ScalarSum
	 (
		@Number1 int,
		@Number2 int
	 )
	 returns int
	as
	begin
		return (@Number1 + @Number2)
	end

 -------Execution of scalar value function

 Select dbo.fn_ScalarSum(2,5) as Total

/********************************************************/
	Select * from tbl_ClientOrder
	Select * from tbl_ClientMaster

----------Table value Function----------
	Alter function fn_GetTable
	(
		@order_Id int
	)
	returns table
	as
		return (Select cN.Client_Id,CM.Client_FirstName,cM.Client_LastName,cN.Order_Product  
		from tbl_ClientOrder cn inner join tbl_ClientMaster cm on cn.Client_Id = cm.Client_ID
		WHERE cN.Order_Id = @order_Id)

-------Execution of table value function
	sELECT * FROM  fn_GetTable(2)