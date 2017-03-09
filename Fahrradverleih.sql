#SAFE MODE!
DROP DATABASE IF EXISTS `Fahrradverleih`;

-- @>>-----------------------------------------------------<<@
-- Schema Fahrradverleih
-- @>>-----------------------------------------------------<<@
CREATE DATABASE `Fahrradverleih`;
USE `Fahrradverleih` ;

-- @>>-----------------------------------------------------<<@
-- Typen
-- @>>-----------------------------------------------------<<@
#SAFE MODE!
DROP TABLE IF EXISTS `Typen`;

CREATE TABLE IF NOT EXISTS `Fahrradverleih`.`Typen`
(
  `TypenID` INT AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`TypenID`)
);



-- @>>-----------------------------------------------------<<@
-- Fahrrad
-- @>>-----------------------------------------------------<<@
#SAFE MODE!
DROP TABLE IF EXISTS `Fahrrad`;

CREATE TABLE IF NOT EXISTS `Fahrradverleih`.`Fahrrad`
(
  `FahrradId` INT AUTO_INCREMENT,
  `TypenID` INT NOT NULL,
  `color`   INT,
  `size`	INT,
  PRIMARY KEY (`FahrradId`),
  INDEX `fk_Fahrrad_Typen1_idx` (`TypenID` ASC),
  CONSTRAINT `fk_Fahrrad_Typen1`
    FOREIGN KEY (`TypenID`)
    REFERENCES `Fahrradverleih`.`Typen` (`TypenID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- @>>-----------------------------------------------------<<@
-- Kunde
-- @>>-----------------------------------------------------<<@
#SAFE MODE!
DROP TABLE IF EXISTS `Kunde`;

CREATE TABLE IF NOT EXISTS `Fahrradverleih`.`Kunde`
(
  `kundenNummer` INT AUTO_INCREMENT,
  `vname` VARCHAR(25),
  `nname` VARCHAR(25),
  `email` VARCHAR(35),
  `gebdat` DATE,
  `geschlecht` SET('Frau','Man'),
  PRIMARY KEY (`kundenNummer`)
);



-- @>>-----------------------------------------------------<<@
-- Kunde_hat_Fahrrad
-- @>>-----------------------------------------------------<<@
#SAFE MODE!
DROP TABLE IF EXISTS `Verleih`;

CREATE TABLE IF NOT EXISTS `Fahrradverleih`.`Verleih`
(
  `Kunde_kundenNummer` INT NOT NULL,
  `Fahrrad_FahrradId`  INT NOT NULL,
  `Preis` 	   		   INT NULL,
  `EndDatum`   		   DATE NULL,
  `StartDatum` 		   DATE NULL,
  `Mahung`     		   BOOL NULL,
  PRIMARY KEY (`Kunde_kundenNummer`, `Fahrrad_FahrradId`),
  INDEX `fk_Kunde_has_Fahrrad_Fahrrad1_idx` (`Fahrrad_FahrradId` ASC),
  INDEX `fk_Kunde_has_Fahrrad_Kunde_idx` (`Kunde_kundenNummer` ASC),
  CONSTRAINT `fk_Kunde_has_Fahrrad_Kunde`
    FOREIGN KEY (`Kunde_kundenNummer`)
    REFERENCES `Fahrradverleih`.`Kunde` (`kundenNummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kunde_has_Fahrrad_Fahrrad1`
    FOREIGN KEY (`Fahrrad_FahrradId`)
    REFERENCES `Fahrradverleih`.`Fahrrad` (`FahrradId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- @>>-----------------------------------------------------<<@
#  USE Fahrradverleih as primary database to insert
-- @>>-----------------------------------------------------<<@
USE `Fahrradverleih`;

-- @>>-----------------------------------------------------<<@
#  INSERT's Kunde
-- @>>-----------------------------------------------------<<@
INSERT INTO Kunde VALUES(1,'Hans','Mair','hans@freemail.com','1994-08-22','Man');
INSERT INTO Kunde VALUES(2,'Maria','Mair','vertuz@mail.sw','1994-08-12','Frau');
INSERT INTO Kunde VALUES(3,'Ingrid','Franzl','ingrid@gmx.at','1994-08-23','Frau');
INSERT INTO Kunde VALUES(4,'Lina','Mair','lina@mair.com','1994-08-02','Frau');
INSERT INTO Kunde VALUES(5,'Tina','Flakes','tina@tira.com','1994-08-06','Frau');
INSERT INTO Kunde VALUES(6,'Markus','Flawin','markus@htomail.com','2001-05-27','Man');
INSERT INTO Kunde VALUES(7,'Herman','Lowan','lown@htomail.com','1901-02-03','Man');
INSERT INTO Kunde VALUES(8,'Erwin','Maklesch','erwin@htomail.com','1965-05-27','Man');
INSERT INTO Kunde VALUES(9,'Markus','Flawin','markus@htomail.com','1967-03-17','Man');
INSERT INTO Kunde VALUES(10,'David','Macleaf','macleaf@htomail.com','1921-02-23','Man');

-- @>>-----------------------------------------------------<<@
#  INSERT's Typen
-- @>>-----------------------------------------------------<<@
INSERT INTO Typen VALUES (NULL,'Kunstrad');
INSERT INTO Typen VALUES (NULL,'E-bike-Alltag');
INSERT INTO Typen VALUES (NULL,'E-bike-Mountn');
INSERT INTO Typen VALUES (NULL,'Alltags-Rad');
INSERT INTO Typen VALUES (NULL,'Tourenrad');
INSERT INTO Typen VALUES (NULL,'Trekkingrad');
INSERT INTO Typen VALUES (NULL,'Rennrad');
INSERT INTO Typen VALUES (NULL,'Bahnrad');
INSERT INTO Typen VALUES (NULL,'Mountainbike');
INSERT INTO Typen VALUES (NULL,'BMX-Rad');

-- @>>-----------------------------------------------------<<@
#  INSERT's Fahrrad
-- @>>-----------------------------------------------------<<@
INSERT INTO Fahrrad VALUES (1,  2  ,6678244  ,19);
INSERT INTO Fahrrad VALUES (2,  8  ,20180197 ,23);
INSERT INTO Fahrrad VALUES (3,  7  ,20180197 ,21);
INSERT INTO Fahrrad VALUES (4,  5  ,20180197 ,23);
INSERT INTO Fahrrad VALUES (5,  3  ,20180197 ,24);
INSERT INTO Fahrrad VALUES (6,  4  ,20180197 ,25);
INSERT INTO Fahrrad VALUES (7,  1  ,20180197 ,26);
INSERT INTO Fahrrad VALUES (8,  10 ,20180197 ,22);
INSERT INTO Fahrrad VALUES (9,  9  ,20180197 ,26);
INSERT INTO Fahrrad VALUES (10, 6  ,20180197 ,19);
-- @>>-----------------------------------------------------<<@
#  INSERT's Verleih
-- @>>-----------------------------------------------------<<@
INSERT INTO Verleih VALUES ( 1, 2, 34, '2006-10-19',  '2007-02-20', 0   );  # Same!
INSERT INTO Verleih VALUES ( 2, 4, 45, '2007-07-25',  '2011-10-21', 1   );  # -//-
INSERT INTO Verleih VALUES ( 3, 5, 67, '2007-10-25',  '2012-06-01', 1   );  # -//-
INSERT INTO Verleih VALUES ( 4, 6, 56, '2008-09-17',  '2013-05-14', 0   );  # -//-
INSERT INTO Verleih VALUES ( 5, 7, 33, '2010-05-21',  '2013-11-18', 0   );  # -//-
INSERT INTO Verleih VALUES ( 6, 10, 67, '2011-04-07', '2016-11-07', 0   );  # -//-
INSERT INTO Verleih VALUES ( 7, 9, 14, '2011-07-05',  '2017-06-08', 1   );  # -//-
INSERT INTO Verleih VALUES ( 8, 3, 57, '2015-06-09',  '2017-06-27', 1   );  # -//-
INSERT INTO Verleih VALUES ( 9, 8, 65, '2016-03-04',  '2017-06-27', 0   );  # -//-
INSERT INTO Verleih VALUES ( 10, 1, 76, '2017-04-13', '2017-10-24', 1   );  ##

-- @>>-----------------------------------------------------<<@
#     Update Statment
-- @>>-----------------------------------------------------<<@

#Change Verleih table add->3 days
UPDATE Verleih
SET Verleih.EndDatum = DATE_ADD(Verleih.EndDatum,INTERVAL 3 DAY)
WHERE Kunde_kundenNummer = 2;

-- @>>-----------------------------------------------------<<@
#     Delete Statment
-- @>>-----------------------------------------------------<<@
DELETE FROM Verleih
WHERE Kunde_kundenNummer = 4;

-- @>>-----------------------------------------------------<<@
#     Select's Statmens
-- @>>-----------------------------------------------------<<@
USE Fahrradverleih;

#Zeige alle kundenNummern an die eine mahung erhalten. Gib die Mahung als Erhalten aus
SELECT Kunde_kundenNummer AS 'Kunden Nummer',CASE Mahung
	WHEN Mahung = 1 THEN 'Erhalten'
END
AS 'Mahung'
FROM Verleih
WHERE Mahung = 1;

#Gib alle Kunden Aus die mehr als 40 Euro Gezahlt haben und Über 29 sind
SELECT vname AS 'Vorname',nname AS 'Nachname',Preis AS 'Zu Zahlen'
FROM Kunde
INNER JOIN Verleih
ON Kunde.kundenNummer = Verleih.Kunde_kundenNummer
WHERE Preis > 40 AND YEAR(DATE_SUB(NOW(),INTERVAL 29 YEAR)) > YEAR(gebdat);

# Gib Die Summe der einnahmen in denn Unterschiedlichen Jahren an
SELECT SUM(Preis) AS 'Verdient'
FROM Verleih
GROUP BY StartDatum;


