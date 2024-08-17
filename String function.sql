Use KundanDB
-----String function-----------
--1)len()
		Select len('Hello World') as StringLength

--2)Ltrim()
		Select ltrim('   Hello World    ') 
--3)Rtrim()
		Select rtrim('   Hello World    ')

--4)Trim()
		Select trim('   Hello World    ')

--5)Concat()
		Select CONCAT('hello ' ,'World')

--6)Concat with +
		Select 'hello '  + 'World'

--7)Concat_ws()
		Select CONCAT_ws('.','www','Google','Com')

--**8)SubString()
		Select SUBSTRING('Hello World',2,5)

		
--9)upper()
		Select Upper('Hello World')
--10)Lower()
		Select Lower('Hello World')
--11)Char()
		Select Char(65)

--12)Reverse()
			Select Reverse('Hello World')

--**13)Left()
		Select Left('Hello world',2)

--**14)Right()
		Select Right('Hello world',2)

--**15)Charindex()
		Select CHARINDEX('a','Kundan Parmar')
		Select CHARINDEX('a','Kundan Parmar',6)

--***Question) How User name is seperate in form of First name and last name---


Select LEFT(Employee_Name,CHARINDEX(' ',Employee_Name)) as FirstName,
Right(Employee_Name,CHARINDEX(' ',Employee_Name)) as LastName
from tbl_EmployeeData


Select LEFT(Employee_Name,CHARINDEX(' ',Employee_Name)) as FirstName,
Right(Employee_Name,Len(Employee_Name) - CHARINDEX(' ',Employee_Name)) as LastName
from tbl_EmployeeData


Select Len(Employee_Name) as Name_Length,
CHARINDEX(' ',Employee_Name) as PreSpace ,
Len(Employee_Name) - CHARINDEX(' ',Employee_Name) as lenthAfterPrespace from tbl_EmployeeData
