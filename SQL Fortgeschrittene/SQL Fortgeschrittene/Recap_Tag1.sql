/*
Normalisierung vs Redundanz
sparen von JOINs

Datentypen: 
date statt datetime (ms) 
nvarchar nchar .. n nur wenn es sein muss: unicode

SQL Speichert Datensätze in Dateien.Dateien sind in Seiten struturiert, 
die wiederum in Blöcken aufgehoben

1 Seite: 
8192 bytes Volumen
Kopf
Nutzlast: 8072 bytes
MAX 700DS
1 DS (fixe Datentypen) <= 8060bytes --muss un die Seite passen
Seiten kommen 1:1 vom DAtenträger in den Arbeitsspeicher


1 Block besteht aus 8 zusammenhängenden Seiten
64kb


Je weniger IO(Seiten) , desto weniger RAM Verbrauch,desto geringer die CPU Last

Wie kann man bei Abfragen messen, weiviele Seiten der SQL Server holen musste?

dbcc showcontig('Tab') --wieviele Seiten hat die Tabelle und wie voll sind diese

set statistics io on | off   --Anzahl der zu lesenden Seiten


--Wie können wir sehen, wie gut der SQL Server die Daten geholt hat?

Ausführungspläne!


Views:
+komfortable.. Joins schreiben zu müssen, komplexe Abfragen wiederverwendbar unter einfachen Namem
+Rechte + INS UP DEL SEL

Achtung: am besten  mit schemabinding schreiben--> korrekt arbeiten!


F()
+ Komfort/praktisch
Aber fast immer langsam: (kein MAXDOP)

create function fname(@par1 int, ...) returns int
as
BEGIN 
	return(Code)
end


Prozedur
+Ausfühungsplan wird beim ersten Aufruf optimiert mit den aufgerufenen 
Parametern erzeugt 
+ Der Plan bleibt bestehene und wird immer verwendet (auch nach Neustart)
+ BI Logik

Tipp: nicht benutzerfreundlich
fast immer das gleiche Ergebnis (Zeilenzahl)
man spart dich die Anlaysezeit


create proc gpname @par int, ... @par2 int output (ist auch Input)
as
Code (ISN UP DEL CR..)




















*/

select UnitPrice*Quantity from [Order Details]


select * from kundenumsatz


select * from kundenumsatz where id < 10

exec gpSucheID 10


create proc gpsucheID @zahl int
as
select * from kundenumsatz where id < @zahl

exec gpsucheiD 100000
--Tabellenscan.. mit mehr Kernen

