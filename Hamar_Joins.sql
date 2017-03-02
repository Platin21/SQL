use testdb;

#INFOTEXT
# - 1. Gib Berichtsnummer, Auftragsnummer und Bezeichnung aller Tätigkeitsposten des Mitarbeiters
# - mit Personalnummer 10 aus!
#ENDINFO

SELECT
    tp.tbnr,ta.aufnr,ta.tbez
FROM
	ahPersonal p
INNER JOIN
    ahTaetigkeitsarten ta
ON
	p.persnr  = 10
INNER JOIN
	ahTaetigkeitsposten tp
ON
	tp.persnr = 10
WHERE
    tp.taetnr = ta.taetnr;

#INFOTEXT
# - 2. Gib von jeder Abteilung den Abteilungsnamen und den Namen des Abteilungsleiters aus!
#ENDINFO
#SPEC Is a sepzification wich tables we need : bteilungen, abteilungsleiter und personal
SELECT
    ab.abtnr,ab.abtname,p.pname
FROM
    ahAbteilung ab
INNER JOIN
    ahAbteilungsleiter al
ON
	ab.abtnr = al.abtnr
INNER JOIN
	ahPersonal p
ON
	al.persnr = p.persnr
GROUP BY al.persnr;

#INFOTEXT
# 3. In welcher Abteilung arbeiten die weiblichen Mitarbeiter?
# Gib Vor- und Nachnamen und den Abteilungsnamen aus!
#ENDINFO
#SPEC personal und abteilungen
SELECT
	p.pname,p.pvname,ab.abtname
FROM
	ahPersonal p
INNER JOIN ahAbteilung ab
ON p.persnr = ab.persnr
INNER JOIN ahAbteilungsleiter al
ON ab.persnr = al.persnr
WHERE
	ahPersonal.geschlecht = 'F';

#INFOTEXT
# - 4. Die Personalnummern und Namen jener Mitarbeiter, die Familienangehörige besitzen, sind mit
# - Zuschlag je Angehörigem anzuzeigen!
#ENDINFO
#SPEC
SELECT
	p.persnr AS 'persnr', p.pname, f.zuschlag
FROM
	ahPersonal p
INNER JOIN
	ahFamilienmitglieder f
ON
 	p.persnr = f.persnr;

#INFOTEXT
# - 5. Die Personalnummern und Namen jener Mitarbeiter, die Familienangehörige besitzen sind
# - anzuzeigen. Weiters sind die Vornamen und Art der Verwandtschaft je Angehörigen anzuzeigen
#ENDINFO
#SPEC personal, familienmitglieder, verwandtschaftsgrade
SELECT
    p.persnr, p.pname, p.pvname, f.vwgrad, f.vorname
FROM
    ahPersonal p
INNER JOIN
    ahFamilienmitglieder f
ON
	p.persnr = f.persnr;

#INFOTEXT
# - 6.Die Personalnummern und Namen aller Mitarbeiter sind anzuzeigen.
# - Bei den Mitarbeitern mit Familienangehörigen sind zusätzlich deren Vornamen und
# - Verwandschaftsgrad auszugeben!
# - Wo keine Familienangehörige vorhanden, bleiben die Ausgabefelder leer!
#ENDINFO
#SPEC LEFT JOIN personal -> familienmitglieder -> verwandschaftsgrade;
SELECT
	p.pvname,p.pname,IFNULL(f.vorname,' '),IFNULL(f.vwgrad,' ')
FROM
	ahPersonal p
LEFT JOIN
	ahFamilienmitglieder f
    ON
    f.persnr = p.persnr
LEFT JOIN
	ahVerwantschaftsgrade v
    ON
    f.vwgrad = v.vwgrad;

#INFOTEXT
# - 7. Die Personalnummern und Namen jener Mitarbeiter, die Familienangehörige besitzen, sind mit
# - Anzahl der Angehörigen und dem Gesamt-Zuschlag für die Angehörigen anzuzeigen!
#ENDINFO
#SPEC Zusätzlich zur vorigen Aufgabe kommen 2 Aggregatfunktionen;
# - Gruppierung für familienmitglieder;
SELECT
	p.persnr,p.pname,COUNT(f.vorname),SUM(f.zuschlag)
FROM
	ahPersonal p
LEFT JOIN
	ahFamilienmitglieder f
    ON
    f.persnr = p.persnr
LEFT JOIN
	ahVerwantschaftsgrade v
    ON
    f.vwgrad = v.vwgrad
WHERE
	f.zuschlag IS NULL
GROUP BY
	p.persnr;

#INFOTEXT
# - 8. Gib alle Mitarbeiternamen und die Namen ihrer Vorgesetzten aus!
#ENDINFO
#SPEC ? 2 Inner-Joins: zur Verknüpfung von Mitarbeiter mit 'Mitarbeiter in vorgesetzte-Liste'
#SPEC ? Zur Verknüpfung von 'Mitarbeiter als Vorgesetzer' mit 'Vorgesetzter in vorgesetzte-Liste'
#JOIN!

SELECT p.persnr,p.pname
FROM
	ahPersonal p
INNER JOIN
	ahVorgesetzter v
ON
	v.persnr = p.persnr




































