/*
#MK Armin Hamar
#VERS 1.0.0
#DATE 26.01.2017
#INFO SQL JOINS 
*/

USE testdb;

-- Full JOIN
SELECT 
    `persnr`, `pname`, `abtname`
FROM
    `ahPersonal`,
    `abteilung`;

-- Full JOIN WITH WHERE
SELECT 
	`persnr`, `pname`, `abtname`
FROM 
	`ahPersonal`, `abteilung`
WHERE 
	`persnr` < 5;

-- EQUI JOIN
SELECT 
    `persnr`, `pname`, `abtname`
FROM
    `ahPersonal`,
    `abteilung`
WHERE
    `ahPersonal`.`abtnr` = 4
        AND `abteilung`.`abtnr` = 4;
    
-- Only Some
SELECT 
    `persnr`, `pname`, `abtname`
FROM
    `ahPersonal`,
    `ahAbteilungen`
WHERE
    `ahPersonal`.`abtnr` = `abteilung`.`abtnr`
        AND `persnr` > 3;

-- Name der Mitarbeiter: in Tabelle personal 
-- Vorname der Familien Mitglieder: in Tabelle familienmitglieder

SELECT 
    `panme`, `vorname`, `vwgrad`
FROM
    `ahPersonal`,
    `familienmitglieder`
WHERE
    `personal`.`persnr` = `familienmitglieder`.`persnr`
GROUP BY `pname`;

-- Ist benötigt um Uneindeutigkeiten zu vereinfachen
-- Feld mit Tabelle qualifizieren
SELECT 
    `personal`.`persnr`, `panme`, `vorname`, `vwgrad`
FROM
    `ahPersonal`,
    `familienmitglieder`
WHERE
    `personal`.`persnr` = `familienmitglieder`.`persnr`
GROUP BY `pname`;

-- Select only the worker with the number ten
SELECT 
    `personal`.`persnr`, `panme`, `vorname`, `vwgrad`
FROM
    `ahPersonal`,
    `familienmitglieder`
WHERE
    `personal`.`persnr` = `familienmitglieder`.`persnr`
        AND `personal`.`persnr` = 10
GROUP BY `pname`;

-- outer(left join)
SELECT p.persnr,pname,vorname,vwgrad
FROM ahPersonal p LEFT JOIN ahFamilienmitglieder f
ON p.persnr = f.persnr;


-- outer(left join) with IFNULL
SELECT p.persnr,pname,IFNULL(vorname,'Zehn') AS 'Vorname',IFNULL(vwgrad,'MOOF') AS 'Verwandtschaftsgrad'
FROM ahPersonal p LEFT JOIN ahFamilienmitglieder f
ON p.persnr = f.persnr;


-- outer(left join) with IFNULL using
SELECT p.persnr,pname,IFNULL(vorname,'Zehn') AS 'Vorname',IFNULL(vwgrad,'MOOF') AS 'Verwandtschaftsgrad'
FROM ahPersonal p LEFT JOIN ahFamilienmitglieder f
USING(persnr);

-- outer(left join) with where clause
SELECT p.persnr,pname,vorname AS 'Vorname',vwgrad AS 'Verwandtschaftsgrad'
FROM ahPersonal p LEFT JOIN ahFamilienmitglieder f
USING(persnr)
WHERE vorname IS NULL;










































