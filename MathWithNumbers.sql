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
SELECT `pname`,`gehalt`, (`gehalt` / 100) * 5 + `gehalt` AS '5% Erhöht' FROM `ahPersonal`;

-- 8.
SELECT `pname`,`gehalt`,`gehalt` + 50 FROM `ahPersonal` WHERE `gehalt` >= 4000;

-- 9.
SELECT SUM(`gehalt`) / COUNT(*) FROM `ahPersonal` WHERE `gehalt` < 3000;

-- 10.
CREATE TABLE geoFigur
(
	nummer INT PRIMARY KEY AUTO_INCREMENT,
    _type ENUM('Quadrat','Rechteck','Kreis','Würfel','Quader','Kugel'),
    bez   VARCHAR(16),
    wert1 INT,
    wert2 INT,
    wert3 INT
);

INSERT INTO `geoFigur` VALUES(NULL,'Quadrat','Quadrat',5,6,0);
INSERT INTO `geoFigur` VALUES(NULL,'Rechteck','Rechteck',5,0,0);
INSERT INTO `geoFigur` VALUES(NULL,'Kreis','Kreis',5,0,0);
INSERT INTO `geoFigur` VALUES(NULL,'Würfel','Würfel',5,0,0);
INSERT INTO `geoFigur` VALUES(NULL,'Quader','Quader',5,5,5);
INSERT INTO `geoFigur` VALUES(NULL,'Kugel','Kugel',3,0,0);

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
SELECT FLOOR(AVG(`gehalt`)) FROM `ahPersonal`;

-- 12. 
SELECT `gehalt`, ROUND(`gehalt`/1000,0) FROM `ahPersonal`;

-- 13.
DROP TABLE Zufall;
CREATE TABLE Zufall
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    zufallszahl INT
);


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

-- How knows waht erwarter Durschnitts Wert ist
SELECT ROUND(AVG(`zufallszahl`),2) AS 'Schnitt' ,499.34 AS 'erwartet', ROUND(AVG(`zufallszahl`) - 499.34 ,2) AS 'Differenz' FROM `Zufall`; 

-- Musterverlgeich
-- 14. 
SELECT `pname` FROM `ahPersonal` 
WHERE RIGHT(`pname`,2) = 'er';

-- 15.
SELECT `pname` FROM `ahPersonal` 
WHERE FIND_IN_SET(`pname`,'Mayer','Meyer','Meier') > 0;

-- 16. 

SELECT `pname` FROM `ahPersonal` 
WHERE FIND_IN_SET(LEFT(`pname`,1),'F','S') > 0;

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


