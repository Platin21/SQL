-- BADV / MySQL WH 3
-- Armin Hamar 3AFID

use tennis;

# 1. Anzahl der weiblichen Spieler gruppiert nach der Stadt. (aufst. sortiert nach der Stadt)
# Beispielergebnis:
#@Fail: Woman ar not W they are F in german 
SELECT 
    town AS 'Stadt', COUNT(*) AS 'Anzahl Weiblich'
FROM
    players
GROUP BY town,sex
HAVING UPPER(sex) = 'F'
ORDER BY town ASC;

# 2. Gebe die Strafsumme pro Spieler für das Jahr 2010 aus.
SELECT 
    `playerno` AS 'Spieler', SUM(`amount`) AS 'Strafsumme'
FROM
    `penalties`
GROUP BY `playerno` ,`pen_date`
HAVING YEAR(`pen_date`) = 2010;

# 3. Gebe eine Liste der Strafen ab dem Jahr 2013 in folgender Form (sortiert nach Datum)
# aus.

SELECT 
    CONCAT('Spielernr.: ',
            `playerno`,
            ' Datum: ',
            DAY(`pen_date`),
            '. ',
            MONTHNAME(`pen_date`),
            ' ',
            YEAR(`pen_date`)) AS 'Strafliste'
FROM
    `penalties`
WHERE
    YEAR(`pen_date`) >= 2013
ORDER BY `pen_date`;


# 4. Gesucht ist die PLAYERNO jener Spieler, deren Strafensumme über 150 liegt. 

SELECT 
    playerno
FROM
    penalties
GROUP BY 
	playerno
HAVING
    SUM(amount) > 150;
    
# 5. Anzahl der Strafen und durchschnittliche Strafhöhe pro Spieler (Runde den Geldbetrag
# auf Hundertstel).

SELECT 
    playerno,
    COUNT(playerno) AS 'Anzahl der Strafen',
    ROUND(AVG(amount), 3) AS 'Durchschnittliche Höhe der Strafen'
FROM
    penalties
GROUP BY playerno;

# 6. 10% aller Strafen im Dezember 2013 soll an eine caritative Organisation gespendet
# werden. Wie hoch ist die Spende? Runde auf und füge die Währung Euro im Ergebnis
# hinzu.

SELECT 
    CONCAT(ROUND((SUM(`amount`) / 100) * 10,2),' Euro') AS 'Spende'
FROM
    `penalties`
WHERE YEAR(`pen_date`) = 2013
GROUP BY YEAR(`pen_date`);

# 7. Ersetze die Spieler-Initialien in der Tabelle players (Update der Tabelle!): Die neuen
# Initialen sollen aus der ersten Stelle Playerno + die ersten zwei Buchstaben des
# Nachnamens (groß) bestehen.
SET SQL_SAFE_UPDATES = 0;
UPDATE players SET initials = CONCAT(LEFT(playerno,1),UPPER(LEFT(name,2)));
SET SQL_SAFE_UPDATES = 1;

# Looks good ?
SELECT playerno,name,initials FROM players ORDER BY playerno;