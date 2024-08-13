use KundanDB

-------Assignment5(top5 by rating)------

------ Store procedure create to find TOP 5 by Rating--------------

Create procedure SP_Select_MovieBy_Rating
as
begin
	Select Top 5 Movie_Id,Movie_Name,Category_Id,SubCategory_Id,Release_Date,Small_Description,Ratings
	from tbl_Movie M
	order by Ratings desc
end

--------Execution---------

Exec SP_Select_MovieBy_Rating
