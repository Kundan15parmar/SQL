use KundanDB

-------Assignment5(top5 by subcategory)------

------- Store procedure create to find TOP 5 by Subcategory--------------

Alter procedure SP_Select_MovieBy_SubCategory
As
begin
	Select Top 5  M.Movie_Name,MC.Movie_CategoryId,MC.Category_Name,MSc.Subcategory_ID,Msc.Subcategory_Name  
	from tbl_Movie M inner join tbl_MovieSubcategory MSc
	on M.SubCategory_Id = MSc.Subcategory_ID inner join
	tbl_MovieCategory MC on MC.Movie_CategoryId = MSc.Category_ID
	order by MSc.Subcategory_ID 
end


---Execution---

exec SP_Select_MovieBy_SubCategory