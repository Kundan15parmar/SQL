use SQLPracDb

-----Date Function---
---It is used to filter out data according dates.

--1) Getdate()
	--	To get a current time and date where sql server is installed.

		Select GETDATE()

--2)	GetUtcDate()
	--	UTC : Universal Time Coordinates.
	--	To get a Universal time across the world.

		select GETDATE()
		Select GETUTCDATE()

--3)	SYSDATETIME
	--	return current system date and time.

		Select SYSDATETIME()

--4)	CURRENT_TIMESTAMP()
		select CURRENT_TIMESTAMP

--5)	SYSDATETIMEOFFSET():		Return date and time with timezone.

		select SYSDATETIMEOFFSET()

--6)	DatePart():		Return value as int.		

		Select DATEPART(month,getdate())
		Select DATEPART(YEAR,GETDATE())
		Select DATEPART(DAY,GETDATE())
		select DATEPART(WEEKDAY,GETDATE())
		select DATEPART(DAYOFYEAR,GETDATE())
		select DATEPART(HH,GETDATE())
		select DATEPART(MINUTE,GETDATE())

--7)	DateName():		Return string value as output

		Select DATENAME(MONTH,GETDATE())
		Select DATENAME(YEAR,GETDATE())
		Select DATENAME(DAY,GETDATE())
		select DATENAME(WEEKDAY,GETDATE())
		select DATENAME(DAYOFYEAR,GETDATE())
		select DATENAME(HH,GETDATE())
		select DATENAME(MINUTE,GETDATE())

		select DATENAME(WEEK,GETDATE())


--8)	DateDiff():		Return a difference between two dates.

		select GETDATE() -- 2024-09-15 11:26:37.037

		select DATEDIFF(DAY,'2024-10-01 11:26:37.037','2025-01-01 11:26:37.037')
		select DATEDIFF(YEAR,getdate(),'2025-01-01 11:26:37.037')
		select DATEDIFF(MONTH,getdate(),'2025-01-01 11:26:37.037')
		select DATEDIFF(WEEK,'2024-10-01 11:26:37.037','2025-01-01 11:26:37.037')

--9)	EOMonth():		Return a last day of month

		select EOMONTH('2019-02-05 11:26:37.037')

--10)	IsDate():		Validate the date either date format or month,year or day is valid or not.
					--	If date is valid then return 1 else return 0.

		select ISDATE('2024-12-13 13:15:12')

		select  GETDATE()
	