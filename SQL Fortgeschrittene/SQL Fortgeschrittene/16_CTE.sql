--CTE

WITH CTENAME
as
(ABFRAGE)
select * from CTENAME


with cte
as
(select employeeid, sum(freight) as Summe from orders
	group by employeeid)
select * from cte where summe < 4000


select employeeid, avg(max(freight)) from orders
group by employeeid


select employeeid , max(freight) as MaxFracht into #t from orders
group by employeeid


select avg(maxfracht) from #t
set statistics io, time on
select avg(t.MaxFracht) from 
(
select employeeid , max(freight) as MaxFracht  from kundenumsatz
group by employeeid
) t 


;WITH CTE
AS
(	select employeeid, max(freight) as Maxfracht 
	from kundenumsatz group by employeeid
)
select avg(maxfracht) from cte



select reportsto, * from employees wherer etage= 3

WITH CTE as
(
	--Anker
select 100

;WITH CTE AS
	(
	--ANKER = Chef	
	select employeeid, lastname , firstname,1 as Ebene from employees where reportsto is null
	UNION ALL
	select e.employeeid,e.lastname, e.firstname, Ebene+1
			from employees e inner join cte on e.reportsto=cte.employeeid
	)
select *   from cte inner join 
(select * from orders) o on cte.employeeid = o.employeeid
where ebene = 3


--Alle best die mehr Frachtkosten haben als Durchsncitt der Frachtkosten ist

select * from orders
	where freight > (select avg(freight) from orders)



	--Liste Produkt , unitprice und Categoryname
;WITH MYcte
	(Prname, unitprice, categoryname)
AS
	(select p.productname as prname , p.unitprice, c.categoryname	
		from products p inner  join categories c
		on p.CategoryID=c.CategoryID)
select * from mycte order by categoryname, unitprice


--Wieviele Angestellte managed jeder ..
With myEmps (lastname, firstname, Knechte, Chef)
as
(select lastname,firstname, 
	(select count(1) from employees e2 where
		 e1.EmployeeID=e2.ReportsTo)
	,reportsto
from employees e1)
Select Lastname, firstname, knechte,  Chef from myEmps 
