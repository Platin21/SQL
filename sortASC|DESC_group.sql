/*
Name: Armin Hamar
Copy: -
Title: Sortieren und Gruppieren 
*/

# Begin Lesson

use testdb;

# From up to bottom
SELECT * 
FROM `ahPersonal`
ORDER BY `persnr` ASC;

# From bottom to up 
SELECT * 
FROM `ahPersonal`
ORDER BY `pname` DESC; 

# Sort multiple files
SELECT *
FROM `ahPersonal`
ORDER BY `pname` DESC,
		 `pvname` ASC;
         
# Also another Orderby
SELECT *
FROM `ahPersonal` 
ORDER BY `geschlecht` DESC, `pname` ASC;

# Limit the Output to the first 3 
SELECT *
FROM `ahPersonal` 
ORDER BY `gehalt` DESC LIMIT 3;

# Limit the Output to the last 3
SELECT * 
FROM `ahPersonal` 
ORDER BY `gehalt` ASC LIMIT 3;

# Limit with to Paramas End and Begin 4 and to two after 4  
SELECT * 
FROM `ahPersonal` 
ORDER BY `gehalt` DESC LIMIT 4,2;

# --- Grouping --- #

# Group by M and W so this means TWO Groups
SELECT `geschlecht`, AVG(`gehalt`) AS 'Durschnitts Gehalt' 
FROM `ahPersonal` 
GROUP BY `geschlecht`;

# Show all Workers that are Woman and Men
SELECT `geschlecht`,COUNT(*) AS 'Anzahl MA'
FROM `ahPersonal`
GROUP BY `geschlecht`;

# Sub Grouping needs two Parameters or more Parameters
SELECT `geschlecht`,`eintritt`,COUNT(*) AS 'Anzahl MA'
FROM `ahPersonal`
ORDER BY `geschlecht`,`eintritt`;

# Same as Above but Group in Years
SELECT `geschlecht`,`eintritt`,COUNT(*) AS 'Anzahl MA'
FROM `ahPersonal`
ORDER BY `geschlecht`,YEAR(`eintritt`);

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

# Where for Groups called HAVING
SELECT `geschlecht`,`eintritt`,COUNT(*) AS 'Anzahl MA'
FROM `ahPersonal`
GROUP BY `geschlecht`
HAVING YEAR(`eintritt`) >= 1982;





# End Lesson