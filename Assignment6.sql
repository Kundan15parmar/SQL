--------------Assignment6--------------------

--***Question) How User name is seperate in form of First name and last name---


Select LEFT(Employee_Name,CHARINDEX(' ',Employee_Name)) as FirstName,
Right(Employee_Name,Len(Employee_Name) - CHARINDEX(' ',Employee_Name)) as LastName
from tbl_EmployeeData


Select Len(Employee_Name) as Name_Length,
CHARINDEX(' ',Employee_Name) as PreSpace ,
Len(Employee_Name) - CHARINDEX(' ',Employee_Name) as lenthAfterPrespace 
from tbl_EmployeeData

/*
--Not work
Select LEFT(Employee_Name,CHARINDEX(' ',Employee_Name)) as FirstName,
Right(Employee_Name,CHARINDEX(' ',Employee_Name)) as LastName
from tbl_EmployeeData
*/


--***Question) How User name is seperate in form of First name,Middle Name and last name---

SELECT 
  LEFT(Employee_Name, CHARINDEX(' ', Employee_Name)) AS first_name,
  SUBSTRING(Employee_Name, CHARINDEX(' ', Employee_Name) + 1, 
  CHARINDEX(' ', Employee_Name, CHARINDEX(' ', Employee_Name) + 1) - CHARINDEX(' ', Employee_Name) - 1) AS middle_name,
  RIGHT(Employee_Name, LEN(Employee_Name) - CHARINDEX(' ', Employee_Name, CHARINDEX(' ', Employee_Name) + 1)) AS last_name
FROM 
  tbl_EmployeeData



--------by using String_Split()

	
DECLARE @fullName nVARCHAR(100) = 'Kundan Natvarbhai Parmar';

WITH SplitNames AS (
  SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS Position
  FROM STRING_SPLIT(@fullName, ' ')
)
SELECT 
  MAX(CASE WHEN Position = 1 THEN value END) AS FirstName,
  MAX(CASE WHEN Position = 2 THEN value END) AS MiddleName,
  MAX(CASE WHEN Position = 3 THEN value END) AS LastName
FROM SplitNames;



------on live data

WITH SplitNames AS (
  SELECT Employee_ID, value, ROW_NUMBER() OVER (PARTITION BY Employee_ID ORDER BY (SELECT 1)) AS Position
  FROM tbl_EmployeeData
  CROSS APPLY STRING_SPLIT(Employee_Name, ' ')
)
SELECT 
  Employee_ID,
  MAX(CASE WHEN Position = 1 THEN value END) AS FirstName,
  MAX(CASE WHEN Position = 2 THEN value END) AS MiddleName,
  MAX(CASE WHEN Position = 3 THEN value END) AS LastName
FROM SplitNames
GROUP BY Employee_ID



