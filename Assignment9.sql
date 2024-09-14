USe SQLPracDb

--Question. Create table StudentMaster and StudentDetails
			--- Create a function to find total of subjects 
			---Create a CTE to fetch all the records from both tables with Grade

Create table tbl_Student_Master
(
	Student_Id int primary key identity(1,1),
	Student_Name nvarchar(25),
	Student_Age	int,
	Student_Address nvarchar(50)
)

insert into tbl_Student_Master(Student_Name,Student_Age,Student_Address)
values('Umesh',	15,'Baroda'),
	('Priyank',	12,'Baroda'),
	('Gaurav',10,'Baroda'),
	('Digesh',13,'Baroda'),
	('Amit',16,'Baroda')

Create table tbl_StudentDetails
(
	StudentDetail_Id int primary key identity,
	Student_Id int,
	StudentDetail_Standard int,
	StudentDetail_Maths  int,
	StudentDetail_SS  int,
	StudentDetail_Science  int,
	StudentDetail_Computer  int,
	Constraint FK_Student_Id Foreign key (Student_Id) references tbl_Student_Master(Student_Id)
)

insert into tbl_StudentDetails(Student_Id,StudentDetail_Standard,StudentDetail_Maths,StudentDetail_SS,StudentDetail_Science,StudentDetail_Computer)
values(1,5,65,59,82,90),
		(2,6,85,56,47,97),
		(3,5,89,85,43,89),
		(5,5,56,65,49,56),
		(2,5,30,87,48,87),
		(4,3,45,25,52,52),
		(2,4,15,10,85,90),
		(1,4,91,85,78,95)


		Select * from tbl_Student_Master
		Select * from tbl_StudentDetails