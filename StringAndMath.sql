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

-- Lookup -> https://github.com/Platin21/SQL

-- Lesson Things !
-- Random Number from 10 to 1 
SELECT TRUNCATE(RAND()*10,0) AS 'Random';

-- Claissic if 
SELECT IF('','','') FROM `ahPersonal`;

-- Tests if it is null and wehn it is then it will 
-- be Replaced by the Second param
SELECT IFNULL(`abdatum`,'NULL?') FROM `ahAuftraege`;


SELECT * FROM `ahAuftraege` WHERE IFNULL(`abdatum`);

-- This Retuns True or False wich Depends on the Presence of the abdatum
SELECT * FROM `ahAuftraege` WHERE NOT ISNULL(`abdatum`);

SELECT CONCAT(IF(`geschlecht`='w','FRAU','MAN'),' ',`pname`) AS 'Anrede' FROM `ahPersonal`;

-- END Lesson


-- 7.
# Add 5% to `gehalt`
SELECT `pname`,`gehalt`, (`gehalt` / 100) * 5 + `gehalt` AS '5% Erhöht' FROM `ahPersonal`;

-- 8.
# Add Some money to `gehalt` (50 Dollars)
SELECT `pname`,`gehalt`,`gehalt` + 50 FROM `ahPersonal` WHERE `gehalt` >= 4000;

-- 9.
# Calc of Average 'gehalt'
SELECT SUM(`gehalt`) / COUNT(*) FROM `ahPersonal` WHERE `gehalt` < 3000;

-- 10.
# Add the Table geoFigur
CREATE TABLE geoFigur
(
	nummer INT PRIMARY KEY AUTO_INCREMENT,
    _type ENUM('Quadrat','Rechteck','Kreis','Würfel','Quader','Kugel'),
    bez   VARCHAR(16),
    wert1 INT,
    wert2 INT,
    wert3 INT
);

# Create some Geofigures (Insert them)
INSERT INTO `geoFigur` VALUES(NULL,'Quadrat','Quadrat',5,6,0);
INSERT INTO `geoFigur` VALUES(NULL,'Rechteck','Rechteck',5,0,0);
INSERT INTO `geoFigur` VALUES(NULL,'Kreis','Kreis',5,0,0);
INSERT INTO `geoFigur` VALUES(NULL,'Würfel','Würfel',5,0,0);
INSERT INTO `geoFigur` VALUES(NULL,'Quader','Quader',5,5,5);
INSERT INTO `geoFigur` VALUES(NULL,'Kugel','Kugel',3,0,0);

# Calculations for all Geo Figures i used CASE here
SELECT `nummer`,`wert1`,`wert2`,`wert3`, 
	CASE `_type` 
    WHEN 'Quadrat'  THEN `wert1` * `wert2`
    WHEN 'Rechteck' THEN `wert1` * `wert1` 
    WHEN 'Kreis' 	THEN `wert1` * `wert1` * PI()
    WHEN 'Würfel' 	THEN `wert1` * `wert1` * `wert1`
    WHEN 'Quader' 	THEN `wert1` * `wert1` * `wert3`
    WHEN 'Kugel'  	THEN 4/3 * PI() * (`wert1` * `wert1` * `wert1`)
    ELSE ' '
    END 
FROM `geoFigur`;
 
-- 11.
# Use of Floor to get and Value Rounded there are 3 Way's FLOOR() CEIL() ROUND()
SELECT 
FLOOR(AVG(`gehalt`)) 
FROM `ahPersonal`;

-- 12.
# Rounding for only one decimal Number
SELECT `gehalt`, 
ROUND(`gehalt`/1000,0) 
FROM `ahPersonal`;

-- 13.
# For Safty Reasons an Drop 
DROP TABLE Zufall;

# It would be also Possible that we do Hier IF EXISTS but how cares
CREATE TABLE Zufall
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    zufallszahl INT
);


# A bunch of inserts they are all randomly Generated in a Range from 0 to 999
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));
INSERT INTO `Zufall` VALUES(NULL,FLOOR(RAND() * 999));

SELECT * FROM Zufall;

-- Wer weiß was erwarter Durschnitts Wert ist ? 
SELECT ROUND(AVG(`zufallszahl`),2) AS 'Schnitt' ,
499.34 AS 'erwartet',
ROUND(AVG(`zufallszahl`) - 499.34 ,2) AS 'Differenz'
FROM `Zufall`; 

-- Musterverlgeich
-- 14. 
SELECT `pname` FROM `ahPersonal` 
WHERE RIGHT(`pname`,2) = 'er';

-- 15.
SELECT `pname` FROM `ahPersonal` 
WHERE FIND_IN_SET(`pname`,'Mayer,Meyer,Meier') != 0;

-- 16. 
# FIND_IN_SET Does not Work Like it should it normaly returns 
# a count but here it is only 0
# Probabbly IN would work but how knows if in Works
SELECT `pname` FROM `ahPersonal` 
WHERE FIND_IN_SET(LEFT(`pname`,1),'F,S') != 0;

-- 17.
SELECT
CASE `vwgrad` WHEN 's' THEN `persnr`
WHEN 't' THEN `persnr`
END
FROM `ahFamilienmitglieder` 
WHERE `vwgrad` = 's' OR `vwgrad` = 't'; 

-- 18.
SELECT `pname`,`pvname` FROM `ahPersonal`
WHERE `eintritt` IN (1980,1990);

-- 19.
SELECT `persnr`,  `tstd` 
FROM `ahPersonal` 
WHERE `persnr` = 1 AND `aufnr` = 3333;

-- 20.

# Missing but Easy to Make



