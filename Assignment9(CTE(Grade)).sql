
use SQLPracDb
---Create a CTE to fetch all the records from both tables with Grade
with cte_FindGrade as
(
	Select Sm.Student_Name,Sm.Student_Age,Sm.Student_Address,SD.StudentDetail_Id,Sd.Student_Id,
	Sd.StudentDetail_Standard,Sd.StudentDetail_Maths,Sd.StudentDetail_SS,Sd.StudentDetail_Science,
	Sd.StudentDetail_Computer,
	dbo.fn_FindTotal(Sd.StudentDetail_Maths,Sd.StudentDetail_SS,Sd.StudentDetail_Science,
	Sd.StudentDetail_Computer) as TotalMarks
	from tbl_Student_Master SM inner join tbl_StudentDetails sd
	on Sm.Student_Id = Sd.Student_Id
)
select *,
case when TotalMarks > 350 then 'A'
		when TotalMarks > 300 and TotalMarks <= 350 then 'B'
		when TotalMarks > 250 and TotalMarks <= 300 then 'C'
		when TotalMarks > 200 and TotalMarks <= 250 then 'D'
		when TotalMarks > 150 and TotalMarks <= 200 then 'B'
		else
		'F'
End as Grade

from cte_FindGrade



		