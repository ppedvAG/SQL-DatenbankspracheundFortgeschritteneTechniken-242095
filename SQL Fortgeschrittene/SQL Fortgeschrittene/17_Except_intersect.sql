
select * into cust2 from customers where country in('Italy', 'germany', 'Austria')



--Welche DS sind in bdeien Tabellen identisch



select * from cust2

update cust2 set city = 'Köln' where customerid = 'ALFKI'



select customerid, country, companyname, city from customers
intersect
select customerid,country, companyname, city from cust2


select * from customers
except
select * from cust2


select * from cust2
except
select * from customers

