CREATE DATABASE IF NOT EXISTS AHoebb;
use AHoebb;

DROP TABLE IF EXISTS Zugkategorie;
CREATE TABLE Zugkategorie 
(
	Kategorie VARCHAR(30) PRIMARY KEY,
    Bemerkung VARCHAR(30)
    
);

DROP TABLE IF EXISTS Zug;
CREATE TABLE Zug
(
	ZugNr INT PRIMARY KEY,
    Zugname VARCHAR(30),
    Abfahrtsort VARCHAR(30),
    Zielort VARCHAR(30),
    Abfahrtszeit TIME,
    Ankunstszeit TIME,
    Kategorie VARCHAR(30),
	FOREIGN KEY `fk_Zugkategorie` (`Kategorie`) REFERENCES `AHoebb`.`Zugkategorie`(`Kategorie`)
);

DROP TABLE IF EXISTS `Waggon`;
CREATE TABLE `Waggon`
(
	`WaggonNr` INT PRIMARY KEY,
    `Gattung` VARCHAR(30),
    `Extras` VARCHAR(30),
    `Sitzplätze` INT
);

DROP TABLE IF EXISTS `Waggonreihung`;
CREATE TABLE `Waggonreihung`
(
   `Reihenfolge` INT,
   `ZugNr` INT,
   `WaggonNr` INT,
   -- Foreign Keys -> Handmade!
   FOREIGN KEY `fk_waggon` (`WaggonNr`) REFERENCES `AHoebb`.`Waggon`(`WaggonNr`),
   FOREIGN KEY `fk_zug` (`ZugNr`) REFERENCES `AHoebb`.`Zug`(`ZugNr`)
);