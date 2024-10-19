use KundanDB

----Loop----

declare @Number int = 1
 
while @Number < 5
Begin
	print('Number is ' + Convert(nvarchar(25),@Number))
	SET	@Number = @Number + 1
End


------Loop with break-------

declare @Num int = 6

while @Num > 1
begin

	if (@Num = 3)
	begin 
		print('Number equal to 3')
		break
	end

	print('Number is '+ Cast(@Num as nvarchar(25)))
	set @Num = @Num - 1
end

-------Loop with Continue ---------

declare @Num int = 6

while @Num > 1
begin

	print('Number is '+ Cast(@Num as nvarchar(25)))
	set @Num = @Num - 1

	if (@Num = 3)
	begin 
		print('Number equal to 3')
		Continue
	end

end