-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema AHLinzLinien
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `AHLinzLinien` ;

-- -----------------------------------------------------
-- Schema AHLinzLinien
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AHLinzLinien` DEFAULT CHARACTER SET utf8 ;
USE `AHLinzLinien` ;

-- -----------------------------------------------------
-- Table `AHLinzLinien`.`Fahrzeugart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AHLinzLinien`.`Fahrzeugart` (
  `Fahrzeugart` VARCHAR(45) NOT NULL,
  `Bemerkung` TINYTEXT NULL,
  PRIMARY KEY (`Fahrzeugart`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AHLinzLinien`.`Fahrzeug`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AHLinzLinien`.`Fahrzeug` (
  `FahrzeugNr` INT NOT NULL AUTO_INCREMENT,
  `Hersteller` VARCHAR(45) NULL,
  `Baujahr` DATE NULL,
  `Sitzplätze` INT NULL,
  `Stehplätze` INT NULL,
  `Fahrzeugart` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FahrzeugNr`, `Fahrzeugart`),
  INDEX `fk_Fahrzeug_Fahrzeugart_idx` (`Fahrzeugart` ASC),
  CONSTRAINT `fk_Fahrzeug_Fahrzeugart`
    FOREIGN KEY (`Fahrzeugart`)
    REFERENCES `AHLinzLinien`.`Fahrzeugart` (`Fahrzeugart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AHLinzLinien`.`Tageseinteilung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AHLinzLinien`.`Tageseinteilung` (
  `FahrzeugNr` INT NOT NULL,
  `Linie` INT NOT NULL,
  `Datum` DATE NOT NULL,
  `Dauer` INT NOT NULL,
  PRIMARY KEY (`FahrzeugNr`, `Linie`),
  INDEX `fk_Fahrzeug_has_Linie_Linie1_idx` (`Linie` ASC),
  INDEX `fk_Fahrzeug_has_Linie_Fahrzeug1_idx` (`FahrzeugNr` ASC),
  CONSTRAINT `fk_Fahrzeug_has_Linie_Fahrzeug1`
    FOREIGN KEY (`FahrzeugNr`)
    REFERENCES `AHLinzLinien`.`Fahrzeug` (`FahrzeugNr`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Fahrzeug_has_Linie_Linie1`
    FOREIGN KEY (`Linie`)
    REFERENCES `AHLinzLinien`.`Linie` (`Linie`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AHLinzLinien`.`Linie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AHLinzLinien`.`Linie` (
  `Linie` INT NOT NULL AUTO_INCREMENT,
  `Km` INT NOT NULL DEFAULT 5,
  `Starthaltestelle` VARCHAR(45) NOT NULL,
  `Endhaltestelle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Linie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AHLinzLinien`.`Tageseinteilung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AHLinzLinien`.`Tageseinteilung` (
  `FahrzeugNr` INT NOT NULL,
  `Linie` INT NOT NULL,
  `Datum` DATE NOT NULL,
  `Dauer` INT NOT NULL,
  PRIMARY KEY (`FahrzeugNr`, `Linie`),
  INDEX `fk_Fahrzeug_has_Linie_Linie1_idx` (`Linie` ASC),
  INDEX `fk_Fahrzeug_has_Linie_Fahrzeug1_idx` (`FahrzeugNr` ASC),
  CONSTRAINT `fk_Fahrzeug_has_Linie_Fahrzeug1`
    FOREIGN KEY (`FahrzeugNr`)
    REFERENCES `AHLinzLinien`.`Fahrzeug` (`FahrzeugNr`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Fahrzeug_has_Linie_Linie1`
    FOREIGN KEY (`Linie`)
    REFERENCES `AHLinzLinien`.`Linie` (`Linie`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


use `AHLinzLinien`;

-- Inserts
-- Insert But let some keys Null
INSERT INTO `Fahrzeugart` VALUES('Bus','Behinderten Freundlich');
INSERT INTO `Fahrzeugart` VALUES('OBus',NULL);
INSERT INTO `Fahrzeugart` VALUES('Straßenbahn',NULL);

-- Insert Special with only these Values Km ,Starthaltestelle ,Endhaltestelle
INSERT INTO `Linie` (`Km`,`Starthaltestelle`,`Endhaltestelle`) VALUES(7,'Pos1','Pos3');
INSERT INTO `Linie` (`Km`,`Starthaltestelle`,`Endhaltestelle`) VALUES(34,'Pos4','Pos6');
INSERT INTO `Linie` (`Km`,`Starthaltestelle`,`Endhaltestelle`) VALUES(56,'Pos4','Pos7');

-- Insert with all Keys Fahrzeug
INSERT INTO `Fahrzeug` VALUES(NULL,'Beispiel1','1944-05-23',22,25,'Bus');
INSERT INTO `Fahrzeug` VALUES(NULL,'Beispiel2','1999-02-01',19,20,'Straßenbahn');
INSERT INTO `Fahrzeug` VALUES(NULL,'Beispiel4','2005-05-01',40,15,'OBus');

INSERT INTO `Tageseinteilung` VALUES(1,2,'2016-05-01',23);
INSERT INTO `Tageseinteilung` VALUES(2,3,'2016-07-01',54);
INSERT INTO `Tageseinteilung` VALUES(3,1,'2016-07-01',54);

-- Read tabels with SELECT <WHAT?> FROM <TABEL> ;
SELECT * FROM Fahrzeug;
SELECT * FROM Fahrzeugart;
SELECT * FROM Linie;