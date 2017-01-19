# //++ Module Icon ++//
 /*
 #MK        Armin Hamar
 #VERS      0.0.1
 #INFOTEXT  Sortieren und Gruppieren UE-SortierenGruppieren.pdf  
 #DATE 		18-01-2017
 */
 
 # 1. Gib alle Mitarbeiterdaten nach Eintrittsdatum sortiert aus!
 # Der zuletzt eingetretene Mitarbeiter soll am Anfang der Liste stehen!
 # -------------------------------------------------------------------------------#
 # Show all Workers in the Database and sort it in the 
 # DESC order to get the worker arrived last times
 SELECT 
	* 
 FROM 
	`ahPersonal` 
 ORDER BY 
	`eintritt` DESC;
 
 # 2. Gib die Nachnamen, Geschlecht und Gehalt aller Mitarbeiter
 # sortiert nach Geschlecht (weiblich vorher) und Gehalt (höchstes am Schluss) aus!
 # -------------------------------------------------------------------------------#
 # Show all Workers and Group there `geschlecht` and also 
 # sort it by gehalt where the most should be at least
 SELECT 
	`pname` , 
    `geschlecht` ,
    `gehalt` 
 FROM 
	`ahPersonal`
 ORDER BY 
	`geschlecht` DESC, 
	`gehalt`     ASC; 
 
 # 3. Die Zeilen der Tabelle taetigkeitsposten vom 1.3.2002 sollen nach den Auftragsnummern
 # aufsteigend, innerhalb der Auftragsnummern nach Personalnummern absteigend und innerhalb
 # gleicher Personalnummern nach Tätigkeitsarten aufsteigend sortiert angezeigt werden!
 # -------------------------------------------------------------------------------#
 # I don't know if it works but i think it normaly should not work at all because 
 # of the Ordering by Diffrent sort methods ASC and DESC
 SELECT 
	`persnr` ,
     `aufnr` ,
	`taetnr` ,
	  `tstd`
 FROM 
	`ahTaetigkeitsposten`
 WHERE 
	`tbnr` >= '01032002'
 ORDER BY 
	`aufnr` ASC,
    `persnr` DESC,
    `taetnr` ASC;
 
 # 4. Gib die Zuschlagssumme für Familienmitglieder gruppiert nach
 # Personalnummer der Mitarbeiter aus!
 # -------------------------------------------------------------------------------#
 # Used SUM and GROUP BY `persnr`
 SELECT `persnr` , SUM(`zuschlag`) 
 FROM 
	`ahFamilienmitglieder` 
 GROUP BY 
	`persnr`;
 
 # 5. Gib Nachname und Eintrittsdatum jener 4 Mitarbeiter aus, welche die wenigsten Dienstjahre
 # haben!
 # -------------------------------------------------------------------------------#
 # Order by in DESCENT Order also Limit by 4 
 SELECT `pname` , `eintritt` 
 FROM 
	`ahPersonal` 
 ORDER BY 
	`eintritt` DESC
 LIMIT 4; 

# 6. Gib Jahr, Monat und Summe der Monatsgehälter gruppiert nach Jahr und Monat aus.
# -------------------------------------------------------------------------------#
# Double Group by year and monat and also use SUM  
SELECT `jahr`,`monat` , SUM( `mgehalt` ) 
FROM 
	`ahMonatsgehaelter`
GROUP BY 
	`jahr` ,
    `monat`;
    
# 7. Gib Personalnummer und Gehaltssumme pro Mitarbeiter im Jahr 2002 aus!
# -------------------------------------------------------------------------------#
# Note Little Error jahr is int(2) and cannot be 2002 because this would be  
# to larg to fit into the database !   
SELECT 
	`persnr` , 
    SUM( `mgehalt` ) 
FROM
	`ahMonatsgehaelter`
GROUP BY 
	`persnr` 
HAVING 
	`jahr` = 2002;

# 8. Ermittle für jeden Auftrag in Tabelle taetigkeitsposten die Summe der Tätigkeitsstunden!
# Gib das Ergebnis zusammen mit der Auftragsnummer aus.
# Der Auftrag mit der niedrigsten Stundenanzahl soll am Anfang stehen.
# -------------------------------------------------------------------------------#
# Very Easy it needs only group by different datasets  
SELECT 
	`aufnr` , 
    SUM( `tstd` ) 
FROM 
	`ahTaetigkeitsposten`
GROUP BY 
	`aufnr`;

# 9. Ermittle für jede Tätigkeitsart in Tabelle taetigkeitsposten die Summe der Tätigkeitsstunden!
# Es sollen nur die Ergebnisse für die Tätigkeitsarten 3 bis 6 ausgegeben werden.
# Zähle und gib zusätzlich aus die Anzahl der Tätigkeitseinträge pro Tätigkeitsart!
# -------------------------------------------------------------------------------#
# Sort special on tartnr if it is 3 or 6 Also use of the SUM Aggregat function  
# and Rename    
SELECT 
	`tartnr`, 
    SUM( `tartnr` ) AS 'Einträge',
    SUM( `tstd` ) AS 'Summe Tätigkeits Stunden'
FROM 
	`ahTaetigkeitsposten`
GROUP BY 
	`tartnr` 
HAVING 
	`tartnr` = 3 OR
    `tartnr` = 6;

# 10. Bilde Mitarbeitergruppen für jeden Anfangsbuchstaben des Nachnamens und zähle die Anzahl der
# Mitarbeiter in dieser Gruppe!
# Es sollen nur jene Zeilen ausgegeben werden, deren Anzahl größer als 1 ist.
# -------------------------------------------------------------------------------#
# A little bit Odd i think it is easy but i don't know if it works 
SELECT 
	SUM(`pname`) AS 'Anzahl'
FROM 
	`ahPersonal`
GROUP BY 
	LEFT(1,`pname`)
HAVING
	SUM(`pname`) > 1;

