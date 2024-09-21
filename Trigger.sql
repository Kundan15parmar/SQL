use KundanDB

-------Trigger----------
/*
-	Trigger is special type of procedure which generate event on particular operation.
-	Trigger can be applied only on Insert/update/delete statements.
-	We can not directly execute trigger like Store procedure.
-	Trigger is associate to the table.So Single trigger can perform operation for single table.
-	we can not create duplicate trigger in the same database.
-   In trigger we can't declare parameters inside trigger,so we can declare variable and get or delete data by inserted/Deleted

	For Insert & update we use:

		declare @variable datatype

		Select @variable = Column Name from inserted

	For Delete :
		declare @variable datatype

		Select @variable = Column Name from deleted
		

	why to use trigger?
		whe we need to maintain a log for a particular table or 
		we want to update particular record for that table.

		Types of trigger:
		1)For
		2)After

		For : 
			--Synatx for creating trigger:
				Create trigger tr_Name
				on table_name  --table name on which we need to create trigger
				For {Insert/update/Delete}
				As
				Begin
					Statement
				End

			--Synatx for Modify trigger:
				Alter trigger tr_Name
				on table_name
				For {Insert/update/Delete}
				As
				Begin
					Statement
				End

		After : 
			--Synatx for creating trigger:
				Create trigger tr_Name
				on table_name
				After {Insert/update/Delete}
				As
				Begin
					Statement
				End

				
			--Synatx for Modify trigger:
				Alter trigger tr_Name
				on table_name
				After {Insert/update/Delete}
				As
				Begin
					Statement
				End
*/