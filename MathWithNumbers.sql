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
-- 11.