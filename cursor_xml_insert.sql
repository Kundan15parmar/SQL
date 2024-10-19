
Declare @xml_Employees xml = '
	<Employees>
		<Employee>
			<Name>Darshit</Name>
			<Age>25</Age>
			<Address>Baroda</Address>			
		</Employee>
		<Employee>
			<Name>Mithil</Name>
			<Age>28</Age>
			<Address>Canada</Address>
		</Employee>
		<Employee>
			<Name>ABC</Name>
			<Age>28</Age>
			<Address>Canada</Address>
		</Employee>
	</Employees>';

Declare @Name nvarchar(100)
Declare @Age int
Declare @Address nvarchar(100)

Declare cr_GetXML cursor
	for Select 
			Employee.value('(Name)[1]','nvarchar(50)') as Employee_Name,
			Employee.value('(Age)[1]', 'int') as Employee_Age,
			Employee.value('(Address)[1]','nvarchar(50)') as Employee_Address
		from @xml_Employees.nodes('/Employees/Employee') as Employees(Employee)
	Open cr_GetXML
		fetch next from cr_GetXML into @Name, @Age, @Address

		While @@FETCH_STATUS = 0
		Begin
			-- print(concat_ws(' ',@Name, @Age ,@Address))
			Insert into tbl_Employees(Employee_Name,Employee_Age,Employee_Address)
			values(@Name,@Age,@Address)
			
			fetch next from cr_GetXML into @Name, @Age, @Address
		End

	Close cr_GetXML
Deallocate cr_GetXML
