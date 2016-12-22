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
    _type INT,
    bez
)
-- 10.