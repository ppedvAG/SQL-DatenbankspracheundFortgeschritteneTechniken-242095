--Functions

select f(wert), f(spalte) from f(wert) where f(Spalte) > f(wert)



select * from orders
select * from  [Order Details]

select sum(unitprice*quantity) from [Order Details]

select fBestellID(10248) 


create function fRsumme(@bestid int) returns money
as
	begin
		return (
				select sum(unitprice*quantity) 
				from 
					[Order Details]
				where 
					orderid = @bestid
			)
	end

select dbo.frsumme(10248)--440


select dbo.frsumme(orderid),* from orders
set statistics io, time on


alter table orders add Rsumme as dbo.frsumme(orderid)



select * from orders
