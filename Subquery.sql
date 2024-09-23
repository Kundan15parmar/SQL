use KundanDB

select * from table1
	inner join table2
	on table1.Column = table2.Column and table2.Column = 'Value' and table2.Column = 'Values'

select * from table1
	inner join table2
	on table1.Column = table2.Column
	where table2.Column = 'Value' and table2.Column = 'Values'

-------Subquery---
I.Q) What is SubQuery.How we define it write a synatx.
	or
		Which Query is first execute parent or child

	write a Select statement inside another select Statement.
	Here subquery has parent and child relatin.
	Subquery always written in paranthesis.
	we can use subquery in where clause and equal and Conditional operators.
	In subquery only single column is allowd.

	--Synatx
		Select Column1,Cloumn2,Column3 from table1
			where Column1 = (
				Select Column1 from table2 where Condition
			)

	In place of Subquery recommended to use joins because Subquery low performs of execution.

	--Example

		Select * from tbl_StudentDetail
			Select * from tbl_StudentMaster

		--iF Multiple Student Name is 'Kalpana Natvarbhai Parmar' than this is error Statement otherwise is true
		
		Select * from tbl_StudentDetail
			where Student_Name = (
			Select Student_Name from tbl_StudentMaster where Student_Name = 'Kalpana Natvarbhai Parmar'
			
			)

			
		Select * from tbl_StudentDetail
			where Student_Name in (
			Select Student_Name from tbl_StudentMaster where Student_Name in('Kalpana Natvarbhai Parmar','Atharva Kiran Parmar')
			
			)