-- Example :
				-- Greater than or equal to 90 = A
				-- Greater than or equal to 80 And Less than 90 = B
				-- Greater than or equal to 70 And Less than 80 = C
				-- Greater than or equal to 60 And Less than 70 = D
				-- Greater than 35 And Less than 60 = E
				-- Less than or equal to 35 = F

				declare @Marks1 int = 55, 
						@Marks2 int = 85, 
						@Marks3 int = 45,
						@Marks4 int = 75,
						@Marks5 int = 55

				declare @Total int = (@Marks1 + @Marks2 + @Marks3 +@Marks4 + @Marks5) / 5

				if (@Total >= 90) 
				Begin
					if(@Marks1 > 35 AND @Marks2 > 35 And @Marks3 > 35 And @Marks4 > 35 And @Marks5 > 35)
					Begin
						print('A Grade with '+ convert(nvarchar(50), @Total) + '%')
					End
					else
					Begin
						print(' You are FAIL..!')
					End
				End
				else if(@Total >= 80 And @Total < 90)
				Begin
					if(@Marks1 > 35 AND @Marks2 > 35 And @Marks3 > 35 And @Marks4 > 35 And @Marks5 > 35)
						Begin
							print('B Grade with '+ convert(nvarchar(50), @Total) + '%')
						End
					else
						Begin
							print(' You are FAIL..!')
						End
				End
				else if (@Total >= 70 And @Total < 80) 
				Begin
					if(@Marks1 > 35 AND @Marks2 > 35 And @Marks3 > 35 And @Marks4 > 35 And @Marks5 > 35)
						Begin
							print('C Grade with '+ convert(nvarchar(50), @Total) + '%')
						End
					else
						Begin
							print(' You are FAIL..!')
						End
				End
				else if(@Total >= 60 And @Total < 70) 
				Begin
					if(@Marks1 > 35 AND @Marks2 > 35 And @Marks3 > 35 And @Marks4 > 35 And @Marks5 > 35)
						Begin
							print('D Grade with '+ convert(nvarchar(50), @Total) + '%')
						End
					else
						Begin
							print(' You are FAIL..!')
						End
				End
				else if (@Total >= 35 And @Total < 60) 
				Begin
					if(@Marks1 > 35 AND @Marks2 > 35 And @Marks3 > 35 And @Marks4 > 35 And @Marks5 > 35)
						Begin
							print('E Grade with '+ convert(nvarchar(50), @Total) + '%')
						End
					else
						Begin
							print(' You are FAIL..!')
						End
				End
				else
				Begin
					print('F Grade with '+ convert(nvarchar(50), @Total) + '%')
				End
