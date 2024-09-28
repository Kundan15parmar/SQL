Use KundanDB

--------Insert/Update with joins

--1)Insert with joins:
	 --we can apply joins with insert statement by using Select statement as values.

	 --Syntax

		Insert into tbl_Name(Column1,Column2,Column3)
		Select Column1,Column2,Column3 from table1
		Inner join table2 on table1.Column = table2.column

		
			Select * from tbl_StudentDetail
			Select * from tbl_StudentMaster
		---Example

		Insert into tbl_StudentDetail(Student_Name)
		select sm.Student_Name  from tbl_StudentMaster sm inner join tbl_StudentDetail sd
		on sm.Student_Id = sd.Student_Id

--2) Update with joins:

	--Syntax:

		update t1
			set Column1 = value,Column2 = values
		From table t1
			inner join table2 on t1.Column = t2.column

			Select * from tbl_StudentDetail
			Select * from tbl_StudentMaster

			Alter table tbl_StudentDetail
			add Student_Name nvarchar(25)

		Select Sm.Student_Name from tbl_StudentMaster Sm inner join tbl_StudentDetail sd
		on sm.Student_Id = sd.Student_Id

	

		Update sd
			Set Sd.Student_Name = Sm.Student_Name from tbl_StudentMaster Sm inner join tbl_StudentDetail sd
		on sm.Student_Id = sd.Student_Id

		Select * from tbl_StudentDetail


		------Insert or transfer data from one database to another

		Insert into tableName1(Column1,Column2)
		Select Column1,Column2 from DatabaseName.dbo.Tablename2