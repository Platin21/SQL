/*
#MK   Armin Hamar
#DATE 1.01.2017
#INFO 2.pdf
*/

SELECT 
    `year_of_birth` AS 'Geburtsjahr',
    COUNT(`sex`) AS 'Anzahl Männlich' 
FROM
    `players`
GROUP BY `year_of_birth` , `sex` 
HAVING UPPER(`sex`) = 'M';

# 2. Gebe den Durchschnitt der Strafen pro Jahr aus (Runde auf Hundertstel) 

SELECT 
    YEAR(`pen_date`) AS 'Jahr' , ROUND(AVG(`amount`),3) AS 'Strafdurchschnitt'
FROM
    `penalties`
GROUP BY YEAR(`pen_date`);

# 3. Alle Spieler ausgeben (Felder s.u.), die mehr als 100 Strafsumme haben. Sortiere nach der
# Strafsumme

-- JOINS we can do this but we must not use the might!

# 4. Gebe eine Liste der Strafen mit einer Höhe größer als 50 in folgender Form (sortiert nach
# Datum) aus:
SELECT CONCAT('Zahlungsnr.: ',`paymentno`,' Datum: ',DAY(`pen_date`),'. ',MONTHNAME(`pen_date`),' ',YEAR(`pen_date`)) AS 'Strafliste'
FROM `penalties`
WHERE `amount` > 50
ORDER BY DAY(`pen_date`) DESC;

# 5. In welchen Städten leben mehr als 4 Spieler
SELECT 
    town AS 'town', COUNT(`name`) AS 'AnzSpieler'
FROM
    players
GROUP BY `town`
HAVING COUNT(`name`) > 4;

# 6. Gebe den kleinsten und größten Strafbetrag je Jahr aus.
SELECT 
    YEAR(`pen_date`) AS 'Jahr', MIN(`amount`) AS 'Kleinster Betrag', MAX(`amount`) AS 'Grösster Betrag'
FROM
    `penalties`
GROUP BY YEAR(`pen_date`);