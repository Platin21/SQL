/*
#MK   Armin Hamar
#DATE 1.01.2017
#INFO WH_MySQL_2_Nach_WH.pdf
*/

USE tennis;

# 1.
# Wieviele Spieler haben für das Team 1 jemals ein Match bestritten? (Jeder Spieler darf
# nur einmal gezählt werden)
# --------------------------------------------------------------------------------------
SELECT 
	COUNT(`playerno`) AS 'Anzahl der Spieler' 
FROM 
	`players`;
 
# 2.
# In welchen Städten leben zwei oder mehr Spieler? 
# --------------------------------------------------------------------------------------    
SELECT 
    `town`
FROM
    `players`
GROUP BY `town`
HAVING COUNT(`town`) >= 2;

# 3.
# Gebe den kleinsten und größten Strafbetrag (amount) für das Jahr 1983 aus.
# --------------------------------------------------------------------------------------    

SELECT 
	2010    AS 'Jahr',
    MAX(`amount`) AS 'Kleinster Betrag',
    MIN(`amount`) AS 'Größter Betrag'
FROM
    `penalties`
WHERE
    YEAR(`pen_date`) = 2010;


# 4. Gesamtsumme aller Strafen (amount) pro Spieler aufsteigend nach der Strafsumme.    
# --------------------------------------------------------------------------------------    
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT 
    `playerno`, SUM(`amount`)
FROM
    `penalties`
GROUP BY `amount` ASC;

# 5. Gesucht sind alle Spieler, die noch nie ein Match bestritten haben. (Ersetze null-Werte mit
# 0 Zeichen)
# -------------------------------------------------------------------------------------- 
# Made with sub select but it uses number 

SELECT 
    `playerno` AS 'nummer', 0 AS 'Spiele'
FROM
    `players`
WHERE
    `playerno` NOT IN 
    (
     SELECT 
		`playerno`
	 FROM
	    `matches`
	);

# 6. Gesucht ist die Anzahl der Spiele pro Team mit Name des Teamkapitäns (Anm: Verwen-
# de Tabellen-ALIAS)
# --------------------------------------------------------------------------------------
SELECT 
    `p`.`name`, COUNT(*)
FROM
    `matches` `m`,
    `teams` `t`,
    `players` `p`
WHERE
    `m`.`playerno` = `p`.`playerno` AND 
    `p`.`playerno` = `t`.`playerno`
GROUP BY `p`.`name`;















