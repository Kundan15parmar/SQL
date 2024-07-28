----------Aggregate function----------
-- SUM,MIN,MAX,AVG,COUNT

select * from tbl_StudentData

---SUM()

Select Sum(Student_Mark) as Student_MArk from tbl_StudentData

---MIN()

Select MIN(Student_Mark) as Student_MArk from tbl_StudentData

---MAX()

Select MAX(Student_Mark) as Student_MArk from tbl_StudentData

---AVG()
select * from tbl_StudentData
-- Note : IF the value is NULL than it not count that value.
Select AVG(Student_Mark) as Student_MArk from tbl_StudentData

---COUNT()

Select COUNT(Student_Name) from tbl_StudentData


----- Query for excute all funtion in single query----

Select Sum(Student_Mark) as Addition, Min(Student_Mark) as Minimum_Mark,
Max(Student_Mark) as Maximum_Mark, Avg(Student_Mark) as Average,
Count(Student_Name) as Count_Marks
from tbl_StudentData


Select Sum(Student_Mark) as Addition, Min(Student_Mark) as Minimum_Mark,
Max(Student_Mark) as Maximum_Mark, Avg(Student_Mark) as Average,
Count(Student_Name) as Count_Marks
from tbl_StudentData where Student_Mark is not null

