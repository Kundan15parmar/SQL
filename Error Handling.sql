
	---------Error handling---

	declare  @Number int 

	Begin try
		Set @Number = 10/0
	end try
	Begin catch
		print('Number is not divide by 0')
	End catch


	declare  @Number int 

	Begin try
		Set @Number = 'fsdgfds'
	end try
	Begin catch
		print('Number is not divide by 0')
	End catch