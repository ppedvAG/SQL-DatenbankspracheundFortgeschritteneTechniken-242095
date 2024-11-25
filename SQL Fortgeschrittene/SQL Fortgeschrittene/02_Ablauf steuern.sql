--TRY_CATCH

begin try 
select 1/0
end try
begin catch 
select  error_number()
		, ERROR_MESSAGE()
		, ERROR_PROCEDURE()
		, ERROR_SEVERITY()
end catch

------GOTO 
start:
select 100
GOTO B

A:
select 200

B:
select 300


declare @i as int=(Select count(*) from customers where
					country = 'UK')

select @i

IF @i < 5	goto poor
IF @i > 10	goto rich
IF @i between 5 and 10 goto middle


poor:
select @i , 'kein gutes land'

middle:
select @i , 'geht so'
goto ende;

rich:
select @i , 'Cashcow'

ende:

-------SCHLEIFEN

declare @i as int = 1
 
WhILE @i<=10
	BEGIN
		select @i 
		set @i+=1
		IF @i = 3	continue
		set @i+=1
		IF @i=5		break
	END
