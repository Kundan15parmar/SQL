use SQLPracDb

select * from tbl_Studentmaster

Select * from tbl_StudentDetails

---For single value
			declare @Student_Name nvarchar(25)

			declare cr_StudentMaster cursor
				for select Student_Name from tbl_Studentmaster
				open cr_StudentMaster
		
					fetch next from cr_StudentMaster into @Student_Name
					print(@Student_Name)
				close cr_StudentMaster
			deallocate cr_StudentMaster


--for muliple value

		declare @Student_ID int
		declare @Stud_Computer int
		declare @Stud_Maths int
		declare @total int

		declare cr_StudentDetails cursor
			for Select StudentDetail_Id,StudentDetail_Computer,StudentDetail_Maths
				from tbl_StudentDetails
				open cr_StudentDetails
					fetch next from cr_StudentDetails into @Student_Id,@Stud_Computer,@Stud_Maths

					while @@FETCH_STATUS = 0
					Begin
						set @total = @Stud_Computer + @Stud_Maths
						print(Concat_ws(' ','Student ID is ',@Student_ID,'Computer marks is',
						@Stud_Computer,'maths marks is',@Stud_maths,'Total',@total))
						fetch next from cr_StudentDetails into @Student_ID,@Stud_Computer,@Stud_Maths
						end
			Close cr_StudentDetails

			deallocate cr_StudentDetails
