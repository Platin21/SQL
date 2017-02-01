--     Name: Armin Hamar
--     Date: 24.Nov.2016
-- Beispiel: dml2 -> Aggregat Funktionen
-- ------------------------------------------------------------------------

use testdb;

-- Min function
SELECT MIN(gehalt) FROM ahPersonal;

-- Min + Where
SELECT MIN(gehalt) FROM ahPersonal WHERE geschlecht = 'w';

-- Max
SELECT MAX(eintritt) FROM ahPersonal;

-- Max + AS 
SELECT MAX(eintritt) AS 'Jüngstes Eintritts Datum' FROM ahPersonal;

-- The SUM function
SELECT SUM(gehalt) FROM ahPersonal;

-- The SUM function + AS
SELECT SUM(gehalt) AS 'Gesamt Gehalt' FROM ahPersonal;

-- SUM + WHERE 'M'
SELECT SUM(gehalt) AS 'Gesamt Gehalt Männer' FROM ahPersonal WHERE geschlecht = 'm';

-- SUM + WHERE + 'W'
SELECT SUM(gehalt) AS 'Gesamt Gehalt Männer' FROM ahPersonal WHERE geschlecht = 'w';

-- Average Function
SELECT AVG(gehalt) AS 'Durschnittsgehalt' FROM ahPersonal;

-- Average from 1.1.1980

SELECT AVG(gehalt)
AS 'Durchschnittsgehalt 1.1.1980'
FROM ahPersonal
WHERE eintritt >= '1980-01-01';

SELECT COUNT(*)
FROM ahPersonal
WHERE gehalt >= 2500;

