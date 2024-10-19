
use SQLPracDb

-- Table use for import csv file.
create table tbl_OnlineGames
(
	Game_Rank int primary key identity(1,1),
	Game_Name nvarchar(50),
	Game_Platform nvarchar(30),
	Game_Year int,
	Genere nvarchar(25),
	Publisher nvarchar(25),
	NA_Sales decimal(18,2),
	EU_Sales	decimal(18,2),
	JP_Sales	decimal(18,2),
	Other_Sales	decimal(18,2),
	Global_Sales decimal(18,2)

)