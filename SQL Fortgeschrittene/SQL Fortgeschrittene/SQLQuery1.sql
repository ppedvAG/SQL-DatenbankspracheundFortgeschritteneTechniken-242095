select companyname as firma, country as Land, city , count(*) as Anzahl
from customers c
where country = 'UK'
group by c.CompanyName, country, city having  AGG
order by firma


--logischen Fluss
--> FROM --> JOIN --> WHERE --> GROUP BY --> HAVING
--> SELECT (berechnungen,Alias) --> ORDER BY -->AUSGABE


FROM Customers
	JOin emplyoees
	JOIn Orders
	JOIN Orderdetails
	
