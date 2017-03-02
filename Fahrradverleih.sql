-- MySQL Workbench Forward Engineering
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS `Fahrradverleih` ;

-- -----------------------------------------------------
-- Schema Fahrradverleih
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Fahrradverleih`;
USE `Fahrradverleih` ;

-- -----------------------------------------------------
-- Typen
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fahrradverleih`.`Typen`
(
  `TypenID` INT AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`TypenID`)
);



-- -----------------------------------------------------
-- Fahrrad
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Kunde
-- -----------------------------------------------------
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



-- -----------------------------------------------------
-- Kunde_hat_Fahrrad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fahrradverleih`.`Verleih`
(
  `VerleihID`		   INT AUTO_INCREMENT,
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
    ON UPDATE NO ACTION,
    PRIMARY KEY(`VerleihID`)
);

-- -----------------------------------------------------
#  USE Fahrradverleih AS PRIMARY DATABASE TO INSERT
-- -----------------------------------------------------
USE `Fahrradverleih`;

-- -----------------------------------------------------
#  INSERT's Kunde
-- -----------------------------------------------------
INSERT INTO Kunde VALUES(NULL,'Hans','Mair','hans@freemail.com',22-08-1994,'Man');
INSERT INTO Kunde VALUES(NULL,'Maria','Mair','vertuz@mail.sw',12-08-1994,'Frau');
INSERT INTO Kunde VALUES(NULL,'Ingrid','Franzl','ingrid@gmx.at',23-08-1994,'Frau');
INSERT INTO Kunde VALUES(NULL,'Lina','Mair','lina@mair.com',02-08-1994,'Frau');
INSERT INTO Kunde VALUES(NULL,'Tina','Flakes','tina@tira.com',16-08-1994,'Frau');
INSERT INTO Kunde VALUES(NULL,'Markus','Flawin','markus@htomail.com',27-05-2001,'Man');
INSERT INTO Kunde VALUES(NULL,'Herman','Lowan','lown@htomail.com',03-02-1901,'Man');
INSERT INTO Kunde VALUES(NULL,'Erwin','Maklesch','erwin@htomail.com',27-05-1965,'Man');
INSERT INTO Kunde VALUES(NULL,'Markus','Flawin','markus@htomail.com',17-03-1967,'Man');
INSERT INTO Kunde VALUES(NULL,'David','Macleaf','macleaf@htomail.com',23-02-1921,'Man');

-- -----------------------------------------------------
#  INSERT's Typen
-- -----------------------------------------------------
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

-- -----------------------------------------------------
#  INSERT's Fahrrad
-- -----------------------------------------------------
INSERT INTO Fahrrad VALUES (NULL, 2 ,6678244  ,19);
INSERT INTO Fahrrad VALUES (NULL, 8 ,20180197 ,23);
INSERT INTO Fahrrad VALUES (NULL, 7 ,20180197 ,21);
INSERT INTO Fahrrad VALUES (NULL, 5 ,20180197 ,23);
INSERT INTO Fahrrad VALUES (NULL, 3 ,20180197 ,24);
INSERT INTO Fahrrad VALUES (NULL, 4 ,20180197 ,25);
INSERT INTO Fahrrad VALUES (NULL, 1 ,20180197 ,26);
INSERT INTO Fahrrad VALUES (NULL, 10 ,20180197 ,22);
INSERT INTO Fahrrad VALUES (NULL, 9 ,20180197 ,26);
INSERT INTO Fahrrad VALUES (NULL, 6 ,20180197 ,19);

-- -----------------------------------------------------
#  INSERT's Verleih
-- -----------------------------------------------------
# `VerleihID`		   INT AUTO_INCREMENT,			   #
# `StartDatum` 		   DATE,						   #
# `Mahung`     		   BOOL,						   #
# `Kunde_kundenNummer` INT NOT NULL,				   #
# `Fahrrad_FahrradId`  INT NOT NULL,				   #
# `Preis` 	   		   INT,							   #
# `EndDatum`   		   DATE,						   #
-- -----------------------------------------------------
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,3,7,2034-02-12);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,1,6,2034-02-12);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,5,1,2034-02-12);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,4,8,02-12-2034);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,8,3,02-12-2034);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,9,4,02-12-2034);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,4,5,02-12-2034);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,7,9,02-12-2034);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,2,4,02-12-2034);
INSERT INTO Verleih VALUES(NULL,2034-02-12,NULL,6,2,02-12-2034);
