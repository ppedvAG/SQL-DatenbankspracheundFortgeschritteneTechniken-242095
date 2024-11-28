--Window Functions

with cte as
(
select orderid, employeeid , customerid, freight ,
	row_number() over(
						partition by employeeid
						order by    freight desc) as RangProAngFr
from orders
)
select * from cte where RangProAngFr = 1


select orderid, employeeid , customerid, freight ,
	rank() over(
				order by    freight asc
				) as RangProAngFr
from orders


select orderid, employeeid , customerid, freight ,
	dense_rank() over(
				order by    freight asc
				) as RangProAngFr
from orders


select orderid, employeeid , customerid, freight ,
	NTILE(100) over(
				order by    freight asc
				) as RangProAngFr
from orders


select employeeid,customerid,  sum(Freight) over(
									partition by employeeid, customerid
									order by customerid)
from orders


--all time Top verkauften produkte ..welche kommen am häudigsten (top 3)

--Ausgabe Jahr Produktname, Quartal, menge , Rang


WITH CTE AS
(
select 
		year(o.orderdate) as Jahr, datepart(qq, orderdate) as QU
		, p.ProductName 
		,sum(quantity) as Menge
		, rank() over (
						partition by year(o.orderdate),datepart(qq, orderdate)
						order by sum(od.quantity) desc
					  ) as Rang
from 
	orders o inner join [Order Details] od  on o.orderid   = od.orderid
			 inner join products p			on p.ProductID = od.ProductID
group by 
		year(o.orderdate), datepart(qq, orderdate), p.ProductName
)
select * from cte where RANG in (1,2,3)




select EOMONTH(getdate())


select employeeid, year(orderdate),sum(freight) as AktFrachtsumme,
		LAG(sum(freight),1,0) over (
							partition by employeeid 
							order by year(orderdate)
								) as imVorjahr,
			sum(freight) -
		LAG(sum(freight),1,0) over (
							partition by employeeid 
							order by year(orderdate)
								) 
from orders
group by employeeid , year(orderdate)




select sp, 
		windof() over (
							partition by spx, spz
							order by sp)

