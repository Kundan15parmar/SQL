---Convert function

declare @Number int = 101
declare @String nvarchar(10) = 'Welcome'
select @Number + convert(int,@String) --- error bcoz we 

select Convert(nvarchar(10),@Number) + @String as Combine 

select getDate()

select Convert(nvarchar(10),getdate(),1) as today

select Convert(nvarchar(10),getdate(),2) as today
select Convert(nvarchar(10),getdate(),101) as today

declare @Number1 int = 15
declare @Number2 decimal(18,2) = 95.34

select @Number1 + convert(int,@Number2) as addition

