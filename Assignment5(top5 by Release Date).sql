use KundanDB

-------Assignment5(top5 by Release Date)------

------- Store procedure create to find TOP 5 by Release Date--------------

Create Procedure Sp_Select_MovieBy_ReleaseDate
as
Begin
	Select Top 5 Movie_Id,Movie_Name,Category_Id,SubCategory_Id,Release_Date,Small_Description,Ratings
	from tbl_Movie M
	order by Release_Date desc
End
 
 ----------Execution------

 Exec Sp_Select_MovieBy_ReleaseDate
