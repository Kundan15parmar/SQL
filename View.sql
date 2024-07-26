select * from tbl_subCategoryMaster

select * from tbl_categoryMaster
-- Create view

create view VW_CategoryData as
Select CM.Category_ID,CM.Category_Name,SCM.subCategory_ID,SCM.subCategory_Name
from tbl_categoryMaster CM inner join tbl_subCategoryMaster SCM
on CM.Category_ID = SCM.category_ID

--Select View

select * from VW_CategoryData

--Delete View

drop view VW_CategoryData

-- Select View  which join with table

select * from tbl_OrderMaster
select om.Order_Id,cd.subCategory_Name from VW_CategoryData cd inner join tbl_OrderMaster om
on cd.subCategory_Id = Om.subcategory_Id 


