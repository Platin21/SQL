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
  `Preis` 	   		   INT,
  `EndDatum`   		   DATE,
  `StartDatum` 		   DATE,
  `Mahung`     		   BOOL,
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
INSERT INTO Kunde VALUES(NULL,'Hans','Mair','hans@freemail.com','1994-08-22','Man');
INSERT INTO Kunde VALUES(NULL,'Maria','Mair','vertuz@mail.sw','1994-08-12','Frau');
INSERT INTO Kunde VALUES(NULL,'Ingrid','Franzl','ingrid@gmx.at','1994-08-23','Frau');
INSERT INTO Kunde VALUES(NULL,'Lina','Mair','lina@mair.com','1994-08-02','Frau');
INSERT INTO Kunde VALUES(NULL,'Tina','Flakes','tina@tira.com','1994-08-06','Frau');
INSERT INTO Kunde VALUES(NULL,'Markus','Flawin','markus@htomail.com','2001-05-27','Man');
INSERT INTO Kunde VALUES(NULL,'Herman','Lowan','lown@htomail.com','1901-02-03','Man');
INSERT INTO Kunde VALUES(NULL,'Erwin','Maklesch','erwin@htomail.com','1965-05-27','Man');
INSERT INTO Kunde VALUES(NULL,'Markus','Flawin','markus@htomail.com','1967-03-17','Man');
INSERT INTO Kunde VALUES(NULL,'David','Macleaf','macleaf@htomail.com','1921-02-23','Man');

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
INSERT INTO Fahrrad VALUES (NULL, 2  ,6678244  ,19);
INSERT INTO Fahrrad VALUES (NULL, 8  ,20180197 ,23);
INSERT INTO Fahrrad VALUES (NULL, 7  ,20180197 ,21);
INSERT INTO Fahrrad VALUES (NULL, 5  ,20180197 ,23);
INSERT INTO Fahrrad VALUES (NULL, 3  ,20180197 ,24);
INSERT INTO Fahrrad VALUES (NULL, 4  ,20180197 ,25);
INSERT INTO Fahrrad VALUES (NULL, 1  ,20180197 ,26);
INSERT INTO Fahrrad VALUES (NULL, 10 ,20180197 ,22);
INSERT INTO Fahrrad VALUES (NULL, 9  ,20180197 ,26);
INSERT INTO Fahrrad VALUES (NULL, 6  ,20180197 ,19);

-- @>>-----------------------------------------------------<<@
#  INSERT's Verleih
-- @>>-----------------------------------------------------<<@
INSERT INTO Verleih VALUES (1,2,34,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (2,4,45,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (3,5,67,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (4,6,56,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (5,7,33,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (6,0,67,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (7,9,14,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (8,3,57,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (9,8,65,'1994-08-22','1994-08-22',0);
INSERT INTO Verleih VALUES (0,1,76,'1994-08-22','1994-08-22',0);
