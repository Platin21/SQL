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


SELECT 
    `personal`.`persnr`, `panme`, `vorname`, `vwgrad`
FROM
    `ahPersonal` `p`,
    `familienmitglieder` `f`
WHERE
    `p`.`persnr` = `f`.`persnr`
        AND `p`.`persnr` = 10
GROUP BY `pname`;























































