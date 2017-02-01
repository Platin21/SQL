-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema testdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `testdb` ;

-- -----------------------------------------------------
-- Schema testdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `testdb` DEFAULT CHARACTER SET utf8 ;
USE `testdb` ;

-- -----------------------------------------------------
-- Table `testdb`.`ahAbteilung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahAbteilung` (
  `abtnr` INT NOT NULL,
  `abtname` VARCHAR(12) NULL,
  PRIMARY KEY (`abtnr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahPersonal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahPersonal` (
  `persnr` INT(2) NOT NULL,
  `pname` VARCHAR(12) NULL,
  `pvname` VARCHAR(12) NULL,
  `geschlecht` VARCHAR(1) NULL,
  `abtnr` INT(1) NULL AUTO_INCREMENT,
  `eintritt` DATE NULL,
  `gehalt` FLOAT(8,2) NULL,
  PRIMARY KEY (`persnr`),
  INDEX `fk_ahPersonal_1_idx` (`abtnr` ASC),
  CONSTRAINT `fk_ahPersonal_1`
    FOREIGN KEY (`abtnr`)
    REFERENCES `testdb`.`ahAbteilung` (`abtnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahVorgesetzter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahVorgesetzter` (
  `persnr` INT(2) NOT NULL,
  `vpersnr` INT(2) NULL,
  INDEX `fk_ahVorgesetzter_ahPersonal1_idx` (`vpersnr` ASC),
  PRIMARY KEY (`persnr`),
  CONSTRAINT `fk_ahVorgesetzter_1`
    FOREIGN KEY (`persnr`)
    REFERENCES `testdb`.`ahPersonal` (`persnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ahVorgesetzter_ahPersonal1`
    FOREIGN KEY (`vpersnr`)
    REFERENCES `testdb`.`ahPersonal` (`persnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahAbteilungsleiter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahAbteilungsleiter` (
  `abtnr` INT NOT NULL,
  `persnr` INT(2) NOT NULL,
  PRIMARY KEY (`abtnr`, `persnr`),
  INDEX `fk_ahAbteilungsleiter_ahPersonal1_idx` (`persnr` ASC),
  CONSTRAINT `fk_ahAbteilungsleiter_ahAbteilung1`
    FOREIGN KEY (`abtnr`)
    REFERENCES `testdb`.`ahAbteilung` (`abtnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ahAbteilungsleiter_ahPersonal1`
    FOREIGN KEY (`persnr`)
    REFERENCES `testdb`.`ahPersonal` (`persnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahMonatsgehaelter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahMonatsgehaelter` (
  `persnr` INT(2) NOT NULL,
  `jahr` INT(2) NOT NULL,
  `monat` INT(2) NOT NULL,
  `mgehalt` FLOAT(8,2) NULL,
  PRIMARY KEY (`persnr`, `jahr`, `monat`),
  CONSTRAINT `fk_ahMonatsgehaelter_1`
    FOREIGN KEY (`persnr`)
    REFERENCES `testdb`.`ahPersonal` (`persnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahAufträge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahAufträge` (
  `aufnr` INT(4) NOT NULL,
  `aufwert` FLOAT(8,2) NULL,
  `abdatum` DATE NULL,
  PRIMARY KEY (`aufnr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahTätigkeitsarten`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahTätigkeitsarten` (
  `tartnr` VARCHAR(1) NOT NULL,
  `tbez` VARCHAR(15) NULL,
  `tpreis` FLOAT(6,2) NULL,
  PRIMARY KEY (`tartnr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahTätigkeitsposten`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahTätigkeitsposten` (
  `tartnr` VARCHAR(1) NOT NULL,
  `persnr` INT(2) NOT NULL,
  `tstd` INT(4) NULL,
  `tbnr` INT(4) NOT NULL,
  `aufnr` INT(4) NOT NULL,
  PRIMARY KEY (`persnr`, `tartnr`, `tbnr`, `aufnr`),
  INDEX `fk_ahTätigkeitsposten_1_idx` (`tartnr` ASC),
  INDEX `fk_ahTätigkeitsposten_3_idx` (`aufnr` ASC),
  CONSTRAINT `fk_ahTätigkeitsposten_1`
    FOREIGN KEY (`tartnr`)
    REFERENCES `testdb`.`ahTätigkeitsarten` (`tartnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ahTätigkeitsposten_2`
    FOREIGN KEY (`persnr`)
    REFERENCES `testdb`.`ahPersonal` (`persnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ahTätigkeitsposten_3`
    FOREIGN KEY (`aufnr`)
    REFERENCES `testdb`.`ahAufträge` (`aufnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahVerwandtschaftsgrade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahVerwandtschaftsgrade` (
  `vwgrad` VARCHAR(1) NOT NULL,
  `vwname` VARCHAR(7) NULL,
  PRIMARY KEY (`vwgrad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `testdb`.`ahFamilienmitglieder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ahFamilienmitglieder` (
  `persnr` INT(2) NOT NULL PRIMARY KEY,
  `fmnr` INT(2) NULL,
  `vorname` VARCHAR(12) NULL,
  `vwgrad` VARCHAR(1) NULL,
  `zuschlag` FLOAT(8,2) NULL,
  INDEX `fk_ahFamilienmitglieder_2_idx` (`vwgrad` ASC),
  CONSTRAINT `fk_ahFamilienmitglieder_1`
    FOREIGN KEY (`persnr`)
    REFERENCES `testdb`.`ahPersonal` (`persnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ahFamilienmitglieder_2`
    FOREIGN KEY (`vwgrad`)
    REFERENCES `testdb`.`ahVerwandtschaftsgrade` (`vwgrad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `testdb`.`ahAbteilung`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahAbteilung` (`abtnr`, `abtname`) VALUES (1, 'Leitung');
INSERT INTO `testdb`.`ahAbteilung` (`abtnr`, `abtname`) VALUES (2, 'Verwaltung');
INSERT INTO `testdb`.`ahAbteilung` (`abtnr`, `abtname`) VALUES (3, 'Steuerung');
INSERT INTO `testdb`.`ahAbteilung` (`abtnr`, `abtname`) VALUES (4, 'Transport');

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdb`.`ahPersonal`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahPersonal` (`persnr`, `pname`, `pvname`, `geschlecht`, `abtnr`, `eintritt`, `gehalt`) VALUES (9, 'Bind', 'Gisela', 'W', 2, '1985-05-15', 4000.00);
INSERT INTO `testdb`.`ahPersonal` (`persnr`, `pname`, `pvname`, `geschlecht`, `abtnr`, `eintritt`, `gehalt`) VALUES (8, 'Volt', 'Gerda', 'W', 3, '1980-02-01', 4200.00);
INSERT INTO `testdb`.`ahPersonal` (`persnr`, `pname`, `pvname`, `geschlecht`, `abtnr`, `eintritt`, `gehalt`) VALUES (7, 'Meieris', 'Heinz', 'M', 3, '1980-02-01', 2450.00);
INSERT INTO `testdb`.`ahPersonal` (`persnr`, `pname`, `pvname`, `geschlecht`, `abtnr`, `eintritt`, `gehalt`) VALUES (5, 'Luft', 'Friedrich', 'M', 3, '1985-05-15', 4500.00);
INSERT INTO `testdb`.`ahPersonal` (`persnr`, `pname`, `pvname`, `geschlecht`, `abtnr`, `eintritt`, `gehalt`) VALUES (4, 'Strom', 'Claudius', 'M', 2, '1984-03-01', 3800.00);
INSERT INTO `testdb`.`ahPersonal` (`persnr`, `pname`, `pvname`, `geschlecht`, `abtnr`, `eintritt`, `gehalt`) VALUES (3, 'Meyer', 'Luise', 'W', 4, '1984-03-01', 2450.00);
INSERT INTO `testdb`.`ahPersonal` (`persnr`, `pname`, `pvname`, `geschlecht`, `abtnr`, `eintritt`, `gehalt`) VALUES (1, 'Eifer', 'Rik', 'M', 4, '1980-02-01', 3800.00);
INSERT INTO `testdb`.`ahPersonal` (`persnr`, `pname`, `pvname`, `geschlecht`, `abtnr`, `eintritt`, `gehalt`) VALUES (10, 'Meier', 'Adam', 'M', 1, '1975-01-01', 5000.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdb`.`ahVorgesetzter`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahVorgesetzter` (`persnr`, `vpersnr`) VALUES (1, 10);
INSERT INTO `testdb`.`ahVorgesetzter` (`persnr`, `vpersnr`) VALUES (3, 1);
INSERT INTO `testdb`.`ahVorgesetzter` (`persnr`, `vpersnr`) VALUES (4, 9);
INSERT INTO `testdb`.`ahVorgesetzter` (`persnr`, `vpersnr`) VALUES (5, 10);
INSERT INTO `testdb`.`ahVorgesetzter` (`persnr`, `vpersnr`) VALUES (7, 5);
INSERT INTO `testdb`.`ahVorgesetzter` (`persnr`, `vpersnr`) VALUES (8, 5);
INSERT INTO `testdb`.`ahVorgesetzter` (`persnr`, `vpersnr`) VALUES (9, 10);
INSERT INTO `testdb`.`ahVorgesetzter` (`persnr`, `vpersnr`) VALUES (10, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdb`.`ahAbteilungsleiter`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahAbteilungsleiter` (`abtnr`, `persnr`) VALUES (1,10);
INSERT INTO `testdb`.`ahAbteilungsleiter` (`abtnr`, `persnr`) VALUES (2,9);
INSERT INTO `testdb`.`ahAbteilungsleiter` (`abtnr`, `persnr`) VALUES (3, 5);
INSERT INTO `testdb`.`ahAbteilungsleiter` (`abtnr`, `persnr`) VALUES (4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdb`.`ahMonatsgehaelter`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (10, 2002, 1, 5900.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (9, 2002, 1, 4250.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (8, 2002, 1, 4760.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (7, 2002, 1, 2700.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (5, 2002, 1, 5000.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (4, 2002, 1, 3820.10);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (3, 2002, 1, 3200.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (1, 2002, 1, 4100.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (10, 2002, 2, 6001.74);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (1, 2002, 2, 4482.40);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (3, 2002, 2, 3428.28);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (4, 2002, 2, 3800.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (5, 2002, 2, 6063.63);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (9, 2002, 2, 4000.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (8, 2002, 2, 4240.00);
INSERT INTO `testdb`.`ahMonatsgehaelter` (`persnr`, `jahr`, `monat`, `mgehalt`) VALUES (7, 2002, 2, 2929.65);

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdb`.`ahAufträge`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahAufträge` (`aufnr`, `aufwert`, `abdatum`) VALUES (1111, 56400, '2002-02-28');
INSERT INTO `testdb`.`ahAufträge` (`aufnr`, `aufwert`, `abdatum`) VALUES (2222, 52700, NULL);
INSERT INTO `testdb`.`ahAufträge` (`aufnr`, `aufwert`, `abdatum`) VALUES (3333, 20800, '2002-02-28');
INSERT INTO `testdb`.`ahAufträge` (`aufnr`, `aufwert`, `abdatum`) VALUES (4444,NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdb`.`ahTätigkeitsarten`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahTätigkeitsarten` (`tartnr`, `tbez`, `tpreis`) VALUES ('1', 'Akquisition', 90.00);
INSERT INTO `testdb`.`ahTätigkeitsarten` (`tartnr`, `tbez`, `tpreis`) VALUES ('2', 'Vorbesprechung', 100.00);
INSERT INTO `testdb`.`ahTätigkeitsarten` (`tartnr`, `tbez`, `tpreis`) VALUES ('3', 'Beratung', 130.00);
INSERT INTO `testdb`.`ahTätigkeitsarten` (`tartnr`, `tbez`, `tpreis`) VALUES ('4', 'Projektentwurf', 120.00);
INSERT INTO `testdb`.`ahTätigkeitsarten` (`tartnr`, `tbez`, `tpreis`) VALUES ('5', 'Kalkulation', 110.00);
INSERT INTO `testdb`.`ahTätigkeitsarten` (`tartnr`, `tbez`, `tpreis`) VALUES ('6', 'Zeichnen', 90.00);
INSERT INTO `testdb`.`ahTätigkeitsarten` (`tartnr`, `tbez`, `tpreis`) VALUES ('7', 'Schreibarbeiten', 80.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdb`.`ahVerwandtschaftsgrade`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahVerwandtschaftsgrade` (`vwgrad`, `vwname`) VALUES ('m', 'Ehemann');
INSERT INTO `testdb`.`ahVerwandtschaftsgrade` (`vwgrad`, `vwname`) VALUES ('f', 'Ehefrau');
INSERT INTO `testdb`.`ahVerwandtschaftsgrade` (`vwgrad`, `vwname`) VALUES ('s', 'Sohn');
INSERT INTO `testdb`.`ahVerwandtschaftsgrade` (`vwgrad`, `vwname`) VALUES ('t', 'Tochter');

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdb`.`ahFamilienmitglieder`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdb`;
INSERT INTO `testdb`.`ahFamilienmitglieder` (`persnr`, `fmnr`, `vorname`, `vwgrad`, `zuschlag`) VALUES (10, 3, 'Else', 't', 60.00); 
INSERT INTO `testdb`.`ahFamilienmitglieder` (`persnr`, `fmnr`, `vorname`, `vwgrad`, `zuschlag`) VALUES (10, 2, 'Theo', 's', 40.00); -- Fails because the Primary key of the Tabel is the same which is 10
INSERT INTO `testdb`.`ahFamilienmitglieder` (`persnr`, `fmnr`, `vorname`, `vwgrad`, `zuschlag`) VALUES (10, 1, 'Hanna', 'f', 60.00);
INSERT INTO `testdb`.`ahFamilienmitglieder` (`persnr`, `fmnr`, `vorname`, `vwgrad`, `zuschlag`) VALUES (8, 1, 'Christa', 't', 40.00);
INSERT INTO `testdb`.`ahFamilienmitglieder` (`persnr`, `fmnr`, `vorname`, `vwgrad`, `zuschlag`) VALUES (5, 2, 'Heinz', 's', 40.00);
INSERT INTO `testdb`.`ahFamilienmitglieder` (`persnr`, `fmnr`, `vorname`, `vwgrad`, `zuschlag`) VALUES (5, 1, 'Beate', 'f', 60.00);
INSERT INTO `testdb`.`ahFamilienmitglieder` (`persnr`, `fmnr`, `vorname`, `vwgrad`, `zuschlag`) VALUES (3, 1, 'Heinrich', 'm', 60.00);

COMMIT;


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

-- Überprüfe, ob in der Tabelle taetigkeitsposten bei jeder Tätigkeit die angefallenen Stunden eingetragen
-- sind.
SELECT * FROM ahPersonal WHERE NULL;

-- Der Geschäftsführer möchte wissen, welche Mitarbeiter der Abteilung 3 mehr als 4000 € verdienen!
-- Gib Vorname, Nachname und Gehalt aus!
SELECT pvname,pname,gehalt FROM ahPersonal WHERE abtnr = 3 AND gehalt > 4000;

-- Welche Mitarbeiter arbeiten in Abteilung 3 beziehungsweise verdienen über 4000 €?
SELECT pvname,pname,gehalt FROM ahPersonal WHERE abtnr = 3 OR gehalt > 4000;

-- Welcher Mitarbeiter arbeiten in Abteilung 3 verdient nicht mehr als 4000 €?
SELECT pvname,pname,gehalt FROM ahPersonal WHERE abtnr = 3 AND gehalt < 4000;

  







