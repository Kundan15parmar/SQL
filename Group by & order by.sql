use KundanDB
-----Group by------------
--Note:  Column which as primary key and identity is not used in group by clause because
		--it already have a unquie data.

insert into tbl_StudentData(Student_Name,Student_DOB,Student_Gender,Student_Mark)
values('Kalpana','1996-08-23','Female',Null)

select * from tbl_StudentData

Select Student_Id, Student_Name from tbl_StudentData 
group by Student_Name,Student_Id

Select Student_Name,Student_Gender from tbl_StudentData 
where Student_Name in ('Kiran','Kalpana')
group by Student_Name,Student_Gender

Select Student_Id,Student_Name,MAX(Student_Mark) as Maximum_Mark from tbl_StudentData 
group by Student_Name,Student_Id


-----------Order by---------

select * from tbl_StudentData

Select Student_Id, Student_Name from tbl_StudentData 
group by Student_Name,Student_Id
order by Student_Name desc
