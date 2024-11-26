select * into #t from orders

select avg(freight) as Durchschnitt into #schnitt from orders

select * from #schnitt

--temp Tabellen haben immer ein #vorne

--#tabelle lokale temp Tabelle
-- existiert nur in der Erstellersitzung und wird nach Schliessen autom gelöscht

--##t globale temp Tabelle
--sie existiert auch in anderen Sessions

--

---

--Orderid und kleinsten Frachtkosten
--orderid mit höchsten Frachtkosten als ein Ergebnis
drop table #e1

select top 1 orderid, freight into #e1 from orders order by freight desc

select top 1 orderid, freight into #e2 from orders order by freight asc

select * from #e1
union
select * from #e2

--manchmal muss Tab aber auch löschen

drop table #e1












select avg(freight) as Durchschnitt into ##schnitt from orders

select * from #schnitt
select * from ##schnitt



-- summe(frachkosten) pro Shipcountry und SHipcity in orders



select shipcountry, shipcity, sum(freight)
from orders
group by shipcountry, shipcity

--weltweit Summe Frachtkosten

select '', '', sum(freight) from orders

select shipcountry, '', sum(freight) from orders
group by shipcountry


--Liste mit Summe Frachkosten für Land
-- pro Stadt
--pro Stadt und Land
--und weltweit


select shipcountry, shipcity, sum(freight) as Fracht
into #r1 from orders
group by shipcountry, shipcity

--weltweit Summe Frachtkosten

select '' as Land, '' as Stadt, sum(freight)  as Fracht into #r2 from orders



select shipcountry, '' as Stadt, sum(freight) as Fracht into #r3 from orders
group by shipcountry


select * from #r1
UNION
select * from #r3
UNION
select * from #r2












