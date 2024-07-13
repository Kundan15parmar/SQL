-- Switch Case
-- Example :
				-- Greater than or equal to 90 = A
				-- Greater than or equal to 80 And Less than 90 = B
				-- Greater than or equal to 70 And Less than 80 = C
				-- Greater than or equal to 60 And Less than 70 = D
				-- Greater than 35 And Less than 60 = E
				-- Less than or equal to 35 = F


--declare @Marks int 
--select 
--	case when @Marks >= 90 then 'A Grade'
--		 when @Marks >= 80 And @Marks < 90 then 'B Grade'
--		 when @Marks >= 70 And @Marks < 80 then 'C Grade'
--		 when @Marks >= 60 And @Marks < 70 then 'D Grade'
--		 when @Marks >= 35 And @Marks < 60 then 'E Grade'
--	else
--		'F Grade'
--end as 'Student_Marks'

select Student_Mark from tbl_StudentData

--Example with table Student data

	select *,
	case when Student_Mark  >= 90 then 'A Grade'
		 when Student_Mark >= 80 And Student_Mark < 90 then 'B Grade'
		 when Student_Mark >= 70 And Student_Mark < 80 then 'C Grade'
		 when Student_Mark >= 60 And Student_Mark < 70 then 'D Grade'
		 when Student_Mark >= 35 And Student_Mark < 60 then 'E Grade'
	else
		'F Grade'

end as 'Student_Grade' from tbl_StudentData

