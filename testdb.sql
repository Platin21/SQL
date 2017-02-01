
-- 2c Übung

use testdb;

-- Erstelle eine Übersicht über alle in Tabelle personal gespeicherten Daten
SELECT * 
FROM ahPersonal;

-- Zeige Namen und Eintrittsdatum der Mitarbeiter an
SELECT abtnr,eintritt
FROM ahPersonal;

-- An welchen Terminen sind Personaleinstellungen erfolgt?
SELECT DISTINCT eintritt FROM ahPersonal ORDER BY eintritt DESC;

-- Zeige die Daten der Mitarbeiter aus Abteilung 2 an!
SELECT * 
FROM ahPersonal WHERE abtnr = 2;


-- Zeige den Vornamen des Mitarbeiters Meier an!
SELECT pvname 
FROM ahPersonal 
WHERE pname = 'Meier';

-- Zeige Namen und Gehalt der Mitarbeiter, deren Gehalt über 4500€ liegt
SELECT pname,pvname,gehalt FROM ahPersonal WHERE gehalt > 4500; 

-- Zeige Namen und Eintrittsdatum der Mitarbeiter, deren Name im Alphabet vor 'M' liegt
SELECT pname,eintritt FROM ahPersonal WHERE pname < 'M';

-- Zeige Namen, Abteilungsnummer und Geschlecht der Mitarbeiter, die am 1.1.1975 in das Unternehmen
-- eingetreten sind
SELECT pname,geschlecht,abtnr FROM ahPersonal WHERE eintritt = '1.1.1975';



-- Der Geschäftsführer möchte wissen, welche Mitarbeiter der Abteilung 3 mehr als 4000 € verdienen!
-- Gib Vorname, Nachname und Gehalt aus!
SELECT pvname,pname,gehalt FROM ahPersonal WHERE abtnr = 3 AND gehalt > 4000;

-- Welche Mitarbeiter arbeiten in Abteilung 3 beziehungsweise verdienen über 4000 €?
SELECT pvname,pname,gehalt FROM ahPersonal WHERE abtnr = 3 OR gehalt > 4000;
  







