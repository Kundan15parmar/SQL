
---Create a function to find total of subjects 
use SQLPracDb

create function fn_FindTotal
(
	@StudentDetails_Maths int,
	@StudentDetails_SS int,
	@StudentDetails_Science int,
	@StudentDetails_Computer int
)
returns int
as
begin
	declare @Total int

	Set @Total = @StudentDetails_Maths + @StudentDetails_SS +@StudentDetails_Science+@StudentDetails_Computer

	return @Total
End


