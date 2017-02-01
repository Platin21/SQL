-- DELETE Database but only if exists
DROP DATABASE IF EXISTS testdb;

-- Create Database testdb
CREATE DATABASE testdb;

-- TABLE CREATION
CREATE TABLE xxPersonal 
(
persnr 	   INT(2) PRIMARY KEY,
pname 	   VARCHAR(12),
pvname 	   VARCHAR(12),
geschlecht VARCHAR(1),
abtnr	   INT(1) AUTO_INCREMENT,
eintritt   DATE,
gehalt	   FLOAT(8,2)
);


CREATE TABLE xxAbteilung
(
abtnr INT(1) PRIMARY KEY
);