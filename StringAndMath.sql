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
CONCAT(UPPER(`pname`),' ',`pvname`,'.',LOWER(`geschlecht`),'.',`gehalt`) 
FROM `ahPersonal`;

-- 3.
SELECT `tbez` 
FROM `ahTaetigkeitsarten` 
WHERE NOT INSTR(`tbez`,'Projekt') = 0;

-- 4.
SELECT `abtnr`,`tbez`,CONCAT(LEFT(`tbez`,1),LEFT(`tbez`,2),'.') AS 'Abkuerzung' FROM `ahTaetigkeitsarten`;

-- 5. 
SELECT `pvname`,`pname`,CONCAT(RIGHT(`pvname`,1),SUBSTR(`pname`,1,2),SUBSTR(`pvname`,LENGTH(`pvname`)-4,LENGTH(`pvname`)),SUBSTR(`pname`,1,4)) FROM `ahTaetigkeitsarten`;

-- 6. 
SELECT `tbez` AS 'tbez',CONCAT(UPPER(LEFT(`tbez`,2)),SUBSTR(`tbez`,3,LENGTH(`tbez`))) AS 'tbez modifiziert' FROM `ahTaetigkeitsarten`;


-- 7.
SELECT `pname`,`gehalt`, (`gehalt` / 100) * 5 + `gehalt` AS '5% Erhöht' FROM `ahPersonal`;

-- 8.
SELECT `pname`,`gehalt`,`gehalt` + 50 FROM `ahPersonal` WHERE `gehalt` >= 4000;

-- 9.
SELECT SUM(((`gehalt` / 100) * 10) + `gehalt`) FROM `ahPersonal` WHERE `gehalt` < 3000;

CREATE TABLE geoFigur
(
	nummer INT PRIMARY KEY,
    
)
-- 10.
