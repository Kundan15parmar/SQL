--Assignement 3 :	
--	Execute if else condition with all operators(=,!=,>,>=,<,<=,<>).


--If condition with Equal to operator(=)
declare @Number1 int = 20 ,@Number2 int = 50

If (@Number1 = @Number2)
	Begin
		print('Number1 is equal to Number2')
	End
else
	Begin
		print('Number1 is not equal to Number2')
	End


--If condition with greater than operator(>)
declare @Num1 int = 20 ,@Num2 int = 50

If (@Num1 > @Num2)
	Begin
		print('Number1 is greater than Number2')
	End
else
	Begin
		print('Number1 is less than Number2')
	End


--If condition with greater than or equal to operator(>=)
declare @No1 int = 20 , @No2 int = 50

If (@No1 >= @No2)
	Begin
		print('Number1 is greater than or equal to Number2')
	End
else
	Begin
		print('Number1 is less than or equal to Number2')
	End


--If condition with less than operator(<)
declare @Value1 int = 20 ,@Value2 int = 50

If (@Value1 < @Value2)
	Begin
		print('Value1 is less than Value2')
	End
else
	Begin
		print('Value1 is greater than Value2')
	End


--If condition with less than or equal to operator(<=)
declare @Value1 int = 20 , @Value2 int = 50

If (@Value1 <= @Value2)
	Begin
		print('Value1 is less than or equal to Value2')
	End
else
	Begin
		print('Value1 is greater than or equal to Value2')
	End


--If condition with  not Equal to operator(!=)
declare @Number1 int = 20 ,@Number2 int = 50

If (@Number1 != @Number2)
	Begin
		print('Number1 is not equal to Number2')
	End
else
	Begin
		print('Number1 is equal to Number2')
	End


--with  not Equal to operator(<>)
declare @Number1 int = 50 ,@Number2 int = 50

If (@Number1 <> @Number2)
	Begin
		print('Number1 is not equal to Number2')
	End
else
	Begin
		print('Number1 is equal to Number2')
	End
