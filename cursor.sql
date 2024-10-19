use KundanDB
--------Cursor-------
Cursor :
	Cursor is used to fetch data row by row.
	It excutes for every single row available into the table.
	Cursor is not stored into database.
	Cursor affects on performance of output.
	We have to use cursor when we need to select / Insert data from type 'XML' or bulk insert.
	User has to manually deallocate cursor memory from database.

	-- Syntax :
		-- For select Single row from table using cursor
		Declare cursor_Name cursor
			for select_statement
			open cursor_name
				fetch next from cursor_name into variable_name
			Close cursor_name
		-- Release memory of cursor
		Deallocate cursor_name	

		-- For get all the rows from table using cursor
		Declare cursor_name cursor
			for select_statement
			open cursor_name
				fetch next from cursor_name into variable_name

				-- To fetch multiple row
				while @@FETCH_STATUS = 0
				Begin
					print some values / manipulate values

					fetch next from cursor_name into variable_name
				End
			close cursor_name

		Deallocate cursor_name