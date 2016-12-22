-- Lesson Things !
-- Random Number from 10 to 1 
SELECT TRUNCATE(RAND()*10,0) AS 'Random';
-- END Lesson


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