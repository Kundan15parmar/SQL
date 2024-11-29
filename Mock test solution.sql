

------Solution  of Mock Test

----Question1
/*1. Write a SQL statement to create a table named students with the following columns:
		 student_id (integer, primary key)
		 first_name (varchar, up to 50 characters)
		 last_name (varchar, up to 50 characters)
		 gpa (decimal with two decimal places)
*/
	create table tbl_Students
	(
		Student_ID int primary key identity(1,1),
		First_Name nvarchar(25),
		Last_Name nvarchar(25),
		GPA decimal(18,2)
	)	

	insert into tbl_Students(First_Name,Last_Name,GPA)
	Values
	('Alice','Johnson',3.75),
	('Bob','Smith',3.2),
	('Charlie','Brown',3.95),
	('Diana','King',3.5),
	('Ethan','Lee',2.85),
	('Fiona','Garcia',3.9),
	('George','Martinez',3.3),
	('Hannah','Lopez',3.6)


	Select * from tbl_Students

	-------Question2

	/*2. Adding Constraints:
	 Write a SQL statement to create a table named courses that include:
			o course_id (integer, primary key)
			o course_name (varchar, up to 100 characters, must be unique)
			o credits (integer, must be between 1 and 5)*/

	Create table tbl_Courses
	(
		Course_Id	int primary key identity(1,1),
		Course_Name nvarchar(100) unique,
		Credits int check(Credits between 1 and 5)
	)

	insert into tbl_Courses(Course_Name,Credits)
	values('Introduction to Programming1',4),
	('Data Structures',3),
	('Database Management Systems',4),
	('Web Development',3),
	('Machine Learning',5),
	('Operating Systems',4),
	('Software Engineering',3)

	-----Question3
	/*3. Foreign Key Relationships:
		 Write a SQL statement to create a table named enrollments with:
				o enrollment_id (integer, primary key)
				o student_id (integer, foreign key referencing students)
				o course_id (integer, foreign key referencing courses)
				o enrollment_date (date)*/
				
	create table tbl_Enrollment
	(
		Enrollment_ID int primary key identity(1,1),
		Student_Id int,
		Course_ID int,
		Enrollment_Date date,
		Constraint Fk_Student_Id Foreign key(Student_Id) references tbl_Students(Student_ID),
		Constraint Fk_Course_Id Foreign key(Course_ID) references tbl_Courses(Course_Id)
	)

	insert into tbl_Enrollment(Student_Id,Course_ID,Enrollment_Date)
	values
	(1,1,'1/15/2024'),
	(1,3,'1/15/2024'),
	(2,2,'2/1/2024'),
	(3,5,'1/20/2024'),
	(4,1,'1/25/2024'),
	(5,6,'2/10/2024'),
	(6,4,'2/5/2024'),
	(7,3,'1/30/2024')

	-------Question4
	/*4. Inner Join:
		 Given two tables, students and enrollments, write a query to select all students 
		enrolled in any course.*/

		Select S.Student_ID,S.First_Name,S.Last_Name,e.Enrollment_ID,e.Enrollment_Date,c.Course_Id,c.Course_Name
		from tbl_Students s
		inner join tbl_Enrollment  e
		on s.Student_ID=e.Student_Id inner join tbl_Courses c on c.Course_Id = e.Course_ID

		-----Question 5---
		/*
			5. Create a Store Procedure for the Insert Student and Enrollment tables.
			*/

		Create PROCEDURE sp_InsertStudentEnrollment
			@First_Name NVARCHAR(25),
			@Last_Name NVARCHAR(25),
			@GPA decimal(18,2),
		   -- @EnrollmentDate DATE,
			@Course_ID int
			AS
			BEGIN
				DECLARE @StudentID INT;

				BEGIN TRANSACTION;

				BEGIN TRY
					-- Insert into Student table
					INSERT INTo tbl_Students(First_Name, Last_Name,GPA)
					VALUES (@First_Name, @Last_Name,@GPA)

					-- Get the newly inserted StudentID


					SET @StudentID = SCOPE_IDENTITY();

	
					-- Insert into Enrollment table
					INSERT INTO tbl_Enrollment(Student_Id,Course_ID,Enrollment_Date)
					VALUES (@StudentID,@Course_ID,GETDATE())

					COMMIT TRANSACTION;
				END TRY
				BEGIN CATCH
					ROLLBACK TRANSACTION;
					DECLARE @ErrorMessage NVARCHAR(4000);
					SET @ErrorMessage = ERROR_MESSAGE();
					RAISERROR (@ErrorMessage, 16, 1);
				END CATCH;
			END



			Exec sp_InsertStudentEnrollment @First_Name = 'Kundan',@Last_Name = 'Parmar',@GPA = 9.2,@Course_ID = 1



		---Question6----
		/*
			6. Difference between truncate and delete with syntax. */

			Truncate : it remove all the rows from the table with its identity key without based on any condition.

				Synax : truncate table tableName

			Delete : It remove one or more rows from table based on conditions applied

				Syntax : delete from tableName where ColumnName = Condition

		---------Question7
		/* 7. Write a string function with an example.

		len :
			Return a count of char in string.
			Space is also consider as a char in len function.

			-- Example
				Select LEN('Weltec') as stringLength

				from tbl_EmployeeData
		ltrim
			Remove space from left side of string

			select LTRIM(' Oppo mobile') as ltrimspaceremove

		rtrim
			Remove whitespace from right side of the string

			select RTRIM('Oppo mobile   ') as rtrimspaceremove
			
		trim
			Remove whitespace from both side of string.

			Select TRIM(Category_Name) as Category_Name from tbl_CategoryMaster

	concat with +
			Merge two string into single string.
			
			select 'Hello ' + 'World' as singlestring
	
	concat
			Select concat('Hello ','World ','From ', 'Wel tech') as singlestring
	
	concat_ws
			concat with custom seperator.

			Select concat_ws('.','www','google','com')

			Select concat_ws(' ','Hello','World','From', 'Wel tech') as singlestring


		substring
			Get a particular portion of output from string.

			select substring(string,starting point, end point)

			Select substring('Hello world',4,2) as stringvalue
			
			-- select substring('Hello world',0,4)
		upper :
			Convert a string into a upper case
			Recommanded not to use in select statement.

			Select Upper('WelTec') as Uppercase
			
			--if(lower('ABC') = 'abc')
			--Begin
			--	print('Same value')
			--End
			--Else
			--Begin
			-- print('Value is not same')
			--End

		lower
			Convert a string into a lower case
			Recommanded not to use in select statement.

			Select lower('WelTec') as Uppercase

		char :
			select char(75) as char

		reverse
			select reverse('Hello World') as reverseorder
*/
----Question8---
	/*
	8. Write a syntax for the trigger.*/

	
	create trigger tr_Name
	on TableName
	For (Insert/Update/Delete)
	as
	Begin
		Statements
	End

	-----Question9---
	/*
	9. Create a log table for the student table. And create a trigger for the student table log.*/



	create table tbl_StudentLog
	(
		Log_ID int identity(1,1),
		Student_ID int
	)

	create trigger tr_Student
	on tbl_Students
	For Insert
	as
	begin
		declare @Student_ID int

		select @Student_ID = Student_ID from inserted
	
		insert into tbl_StudentLog(Student_ID)
		values(@Student_ID)
	end
	------Question10-----
	/*
		10.Create a function for students that returns grades based on GPA*/

		
	Alter function fn_StudentGrade
	(
		@GPA decimal(18,2)
	)
	returns nvarchar(25)
	as
	Begin
			declare @Grade nvarchar(25)

			Set @Grade =
			(Select Case when @GPA < 10 and @GPA > = 8 then 'A'
					 when @GPA < 8 and @GPA > = 7 then 'B'
					  when @GPA < 7 and @GPA > = 6 then 'C'
					   when @GPA < 6 and @GPA > = 5 then 'D'
				else
				'Fail'
			end
			)

			return @Grade
	End

	Select Student_ID,First_name,Last_Name,GPA,dbo.fn_StudentGrade(GPA) as StudentGrade
	from tbl_Students