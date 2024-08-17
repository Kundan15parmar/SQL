--------------Assignment6--------------------

--***Question) How User name is seperate in form of First name and last name---


Select LEFT(Employee_Name,CHARINDEX(' ',Employee_Name)) as FirstName,
Right(Employee_Name,Len(Employee_Name) - CHARINDEX(' ',Employee_Name)) as LastName
from tbl_EmployeeData


Select Len(Employee_Name) as Name_Length,
CHARINDEX(' ',Employee_Name) as PreSpace ,
Len(Employee_Name) - CHARINDEX(' ',Employee_Name) as lenthAfterPrespace from tbl_EmployeeData

/*
--Not work
Select LEFT(Employee_Name,CHARINDEX(' ',Employee_Name)) as FirstName,
Right(Employee_Name,CHARINDEX(' ',Employee_Name)) as LastName
from tbl_EmployeeData
*/