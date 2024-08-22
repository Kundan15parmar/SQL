Use KundanDB

-----String function-----------

--1)len()
		Select len('Hello World') as StringLength


		Select len(Employee_Name) as NameLength,Employee_Name from tbl_EmployeeData

		
--2)Ltrim()
		Select ltrim('   Hello World    ') 
		
		
		Select ltrim(Employee_Name) as Employee_Name from tbl_EmployeeData

--3)Rtrim()
		Select rtrim('   Hello World    ')

		Select Rtrim(Employee_Name) as Employee_Name from tbl_EmployeeData

--4)Trim()
		Select trim('   Hello World    ')

		Select trim(Employee_Name) as Employee_Name from tbl_EmployeeData

--5)Concat()
		Select CONCAT('hello ' ,'World')

		Select * from tbl_EmployeeData

		Select CONCAT(Employee_ID,' ',Employee_Name) as concatIdName from tbl_EmployeeData

--6)Concat with +
		Select 'hello '  + 'World'

		Select Convert(nvarchar(25),Employee_ID) + Employee_Name as concatData from tbl_EmployeeData

--7)Concat_ws()
		Select CONCAT_ws('.','www','Google','Com')

		Select Concat_ws('_',Employee_ID,Employee_Name,Employee_Salary) from tbl_EmployeeData

--**8)SubString()
		Select SUBSTRING('Hello World',2,5)

		Select Employee_Name , SUBSTRING(Employee_Name,5,8) as SelectedString from tbl_EmployeeData
		
--9)upper()
		Select Upper('Hello World')

		Select  Employee_Name , Upper(Employee_Name) as UpperName,Employee_Role,Upper(Employee_Role) as UpperRole
		from tbl_EmployeeData

--10)Lower()
		Select Lower('Hello World')

		Select  Employee_Name , Lower(Employee_Name) as LowerCase from tbl_EmployeeData


--11)Char()
		Select Char(65)

	--	Select Char(Employee_ID) from tbl_EmployeeData
	   
--12)Reverse()

			Select Reverse('Hello World')

			Select Employee_MobileNo, REVERSE(Employee_MobileNo) as ReverseNo from tbl_EmployeeData 

--**13)Left()

		Select Left('Hello world',2)

		Select Employee_Name, LEFT(Employee_Name,4) from tbl_EmployeeData

--**14)Right()
		Select Right('Hello world',2)

		Select Employee_Name, Right(Employee_Name,4) from tbl_EmployeeData


--**15)Charindex()
		Select CHARINDEX('a','Kundan Parmar')
		Select CHARINDEX('a','Kundan Parmar',6)

	--In This it count Space lentgh also.
		Select Employee_Name, CHARINDEX(' ',Employee_Name) as PreSpace from tbl_EmployeeData
	
	---It Count length before space
		Select Employee_Name, CHARINDEX(' ',Employee_Name) -1 as PreSpace from tbl_EmployeeData

	--Count String before second Space ' '

		Select Employee_Name, CHARINDEX(' ',Employee_Name,CHARINDEX(' ',Employee_Name) +1) -1 as PreSpace from tbl_EmployeeData

--16) Replace

		Select REPLACE('Kundan parmar','p','P')

		Select Employee_Name,REPLACE(Employee_Name,'a','A') from tbl_EmployeeData



--***Question) How User name is seperate in form of First name and last name---


Select LEFT(Employee_Name,CHARINDEX(' ',Employee_Name) -1 ) as FirstName,
Right(Employee_Name,Len(Employee_Name) - CHARINDEX(' ',Employee_Name)) as LastName
from tbl_EmployeeData

---Length for Names
Select Len(Employee_Name)  as Name_Length,
CHARINDEX(' ',Employee_Name) -1 as PreSpace ,
Len(Employee_Name) - CHARINDEX(' ',Employee_Name) +1 as lenthAfterPrespace from tbl_EmployeeData


Select * from tbl_EmployeeData

--***Question) How User name is seperate in form of First name,Middle Name and last name---

SELECT 
  LEFT(Employee_Name, CHARINDEX(' ', Employee_Name) -1) AS First_Name,
  SUBSTRING(Employee_Name, CHARINDEX(' ', Employee_Name) +1, 
  CHARINDEX(' ', Employee_Name, CHARINDEX(' ', Employee_Name) + 1) - CHARINDEX(' ', Employee_Name) - 1) AS Middle_Name,
  RIGHT(Employee_Name, LEN(Employee_Name) - CHARINDEX(' ', Employee_Name, CHARINDEX(' ', Employee_Name) + 1)) AS Last_Name
FROM tbl_EmployeeData
