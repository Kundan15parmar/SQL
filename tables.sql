Create table tbl_StudentMaster
(
   Student_Id int primary key identity (1, 1), 
   Student_Name nvarchar (25), 
   Student_Age int, 
   Student_MobileNo bigint, 
   Student_Address nvarchar(50) 
) 
Create table tbl_StudentDetail
(
   Student_Detail_Id int primary key identity (1, 1), 
   Student_Id int, 
   Student_Marks decimal (18, 2), 
   Student_Subject nvarchar(25), 
   Student_Class int, 
   Constraint FK_Student_Id Foreign key (Student_Id) references tbl_StudentMaster(Student_Id)
) 