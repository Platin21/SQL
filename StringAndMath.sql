-- Mysql Spezial Funktionen
-- As Example for Strings
-- 15.012.2016

USE `testdb`;

SELECT `pname`,LENGTH(`pname`) AS 'Names Länge' 
FROM `ahPersonal`;

SELECT `pname` 
FROM `ahPersonal`
WHERE LENGTH(`panme`); 

-- CONCAT Function
SELECT CONCAT(`vname`,' ',`pname`) AS 'Personenname'
FROM `ahPersonal`;

-- SUBSTRING Function
SELECT CONCAT(SUBSTRING(`panme`,1,1),SUBSTRING(`pvname`,1,1)) AS 'Initial Namen'
FROM `ahPersonal`;

SELECT `abtname`, INSERT(`abtname`,1,0,'sm_') AS 'Abtname mit Präfix' 
FROM `ahAbteilung`;

SELECT UPPER(`panme`) AS 'Nachname',LOWER(`pvname`) AS 'Geschlecht' FROM `ahPersonal`;

-- End Of Lesson !

-- 1.
SELECT `tbez` AS 'tbez',LENGTH(`tbez`) AS 'Stellenanzahl' FROM `ahTaetigkeitsarten`;

-- 2. 
SELECT 
CONCAT(UPPER(`pname`),' ',`pvname`,'.',`geschlecht`,'.',`gehalt`) 
FROM `ahPersonal`;

-- 3.
SELECT `tbez` 
FROM `ahPersonal` 
WHERE NOT INSTR(`tbez`,'Projekt') = 0;

-- 4.
SELECT `abtnr`,`tbez`,CONCAT(LEFT(`tbez`,1),LEFT(`tbez`,2),'.') AS 'Abkuerzung';

-- 5. 
SELECT 