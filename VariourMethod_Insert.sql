----Various Methods for Inserting Data into a Table-----
Select * from tbl_Person

---1) Using Keyword “Values”.
insert into tbl_Person(Person_ID,Person_Name)
values(1,'Kundan')

---2)  Using Keyword “Select”.

Insert into tbl_Person(Person_ID,Person_Name)
SELECT 2,'kalpana'

---3) Using Keyword “Select” and another table.

/*We can also insert all data drom one table to anotherr table */
Insert into tbl_Person(Person_ID,Person_Name)
SELECT Employee_ID, Employee_Name from tbl_Employees

/*We can also insert perticular data drom one table to anotherr table */
Insert into sqlholic (sqlholic_ID, Employee_name)
SELECT Column1_Name, column2_Name from Table_Name
WHERE Column_Id = 1

---4) Insert all data from one table to another table :

 select * into tbl_PersonNew from tbl_Person

/* Here a new table will be created with name tbl_PersonNew and all data from tbl_Person will be transfered to that new table */
/*Any connstrainst from tbl_Person will not be created in tbl_PersonNew */

----5)  Using Stored Procedure.