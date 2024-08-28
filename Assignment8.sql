use SQLPracDb

-----------------Assignment8 (Scalar Value function)----------------

	/*	Return a grade based on marks.
		Validation : If user enter marks > 100 then message should return.	
		'Invalid marks. Marks should be less than 100'
	*/

--------Using Swicth case------------
		Alter function fn_GetGrade
		(
			@Marks int
		)
		Returns nvarchar(100)
		as
		Begin
			declare @Grade nvarchar(100)
			
			Set @Grade = 
			Case
				when  @Marks > 100 then  'Invalid marks. Marks should be less than 100'
				when  @Marks > 80 and @Marks <= 90  then  'A'
				when  @Marks > 70 and @Marks <= 80  then   'B'
				when  @Marks > 60 and @Marks <= 70  then  'C'
				when  @Marks > 50 and @Marks <= 60  then  'D'
				when  @Marks > 35 and @Marks <= 50  then  'E'
			else
				  'F'
			end 
			return @Grade
		End

----Execution of Scalar value function

	Select dbo.fn_GetGrade(120) as StudentGrade

	Select dbo.fn_GetGrade(46) as StudentGrade
		
----2) Using if elseif----------------

	Create function fn_GetGradeUsingIfElse
	(
		@Marks int
	)
	returns nvarchar(50)
	as
	begin
		declare @Grade nvarchar(50)

		if (@Marks > 100)
			begin
				Set @Grade = 'Invalid marks. Marks should be less than 100'
			end
		else if(@Marks > 90 and @Marks <= 100)
			begin
				Set @Grade = 'A'
			end
		else if(@Marks > 80 and @Marks <= 90)
			begin
				Set @Grade = 'B'
			end
		else if(@Marks > 70 and @Marks <= 80)
			begin
				Set @Grade = 'C'
			end
		else if(@Marks > 60 and @Marks <= 70)
			begin
				Set @Grade = 'D'
			end
		else if(@Marks > 50 and @Marks <= 60)
			begin
				Set @Grade = 'E'
			end
		else
			begin
				Set @Grade = 'F'
			end

		return @Grade
	end

----Execution of Scalar value function

	Select dbo.fn_GetGradeUsingIfElse(120) as StudentGrade

	Select dbo.fn_GetGradeUsingIfElse(46) as StudentGrade

	   
---------Apply GetGradeUsingIFElse function on live data----

	Select  Student_Id,Student_Subject,Student_Class,Student_Marks,
	dbo.fn_GetGradeUsingIfElse(Student_Marks) as Student_Grade
	from tbl_StudentDetail

