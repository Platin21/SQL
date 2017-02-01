#SQL DDL Skript

DROP DATABASE if exists tennis;
CREATE DATABASE tennis;
use tennis;

drop table if exists players;

create table players
 (playerno int(4) not null,
  name varchar(15),
  initials varchar(3),
  year_of_birth int(4),
  sex char(1),
  year_joined int(4),
  street varchar(15),
  houseno varchar(4),
  postcode varchar(6),
  town varchar(10),
  phoneno varchar(10),
  leagueno varchar(4));

drop table if exists teams;

create table teams
 (teamno int(2) not null,
  playerno int(4),
  division varchar(6));

drop table if exists matches;

create table matches
 (matchno int(5) not null,
  teamno int(2),
  playerno int(4),
  won int(1),
  lost int(1));

drop table if exists penalties;

create table penalties
 (paymentno int(4) not null,
  playerno int(4),
  pen_date date,
  amount decimal(7,2));
  
# delete from players;

insert into players values
 (6,'Parmenter','R',1964,'M',1977,'Haseltine Lane',
  '80','1234KK','Stratford','070-476537','8467');
insert into players values
 (44,'Baker','E',1963,'M',1980,'Lewis Street',
  '23','4444LJ','Inglewood','070-368753','1124');
insert into players values
 (83,'Hope','PK',1956,'M',1982,'Magdalena Road',
  '16A','1812UP','Stratford','070-353548','1608');
insert into players values
 (2,'Everett','R',1948,'M',1975,'Stoney Road',
  '43','3575NH','Stratford','070-237893','2411');
insert into players values
 (27,'Collins','DD',1964,'F',1983,'Long Drive',
  '804','8457DK','Eltham','079-234857','2513');
insert into players values
 (104,'Moorman','D',1970,'F',1984,'Stout Street',
  '65','9437AO','Eltham','079-987571','7060');
insert into players values
 (7,'Wise','GWS',1963,'M',1981,'Edgecombe Way',
  '39','9758VB','Stratford','070-347689',NULL);
insert into players values
 (57,'Brown','M',1971,'M',1985,'Edgecombe Way',
  '16','4377CB','Stratford','070-473458','6409');
insert into players values
 (39,'Bishop','D',1956,'M',1980,'Eaton Square',
  '78','9629CD','Stratford','070-393435',NULL);
insert into players values
 (112,'Bailey','IP',1963,'F',1984,'Vixen Road',
  '8','6392LK','Plymouth','010-548745','1319');
insert into players values
 (8,'Newcastle','B',1962,'F',1980,'Station Road',
  '4','6584RQ','Inglewood','070-458458','2983');
insert into players values
 (100,'Parmenter','P',1963,'M',1979,'Haseltine Lane',
  '80','1234KK','Stratford','070-494593','6524');
insert into players values
 (28,'Collins','C',1963,'F',1979,'Old Main Road',
  '10','1294QK','Midhurst','071-659599',NULL);
insert into players values
 (95,'Miller','P',1963,'M',1972,'High Street',
  '33A','5746OP','Douglas','070-867564',NULL);

# delete from teams;

insert into teams values (1,6,'first');
insert into teams values (2,27,'second');

# delete from matches;

insert into matches values (1,1,6,3,1);
insert into matches values (2,1,6,2,3);
insert into matches values (3,1,6,3,0);
insert into matches values (4,1,44,3,2);
insert into matches values (5,1,83,0,3);
insert into matches values (6,1,2,1,3);
insert into matches values (7,1,57,3,0);
insert into matches values (8,1,8,0,3);
insert into matches values (9,2,27,3,2);
insert into matches values (10,2,104,3,2);
insert into matches values (11,2,112,2,3);
insert into matches values (12,2,112,1,3);
insert into matches values (13,2,8,0,3);

# delete from penalties;

insert into penalties values (1,6,'2010.12.08',100.0);
insert into penalties values (2,44,'2011.5.05',75.0);
insert into penalties values (3,27,'2013.09.10',100.0);
insert into penalties values (4,104,'2013.12.08',50.0);
insert into penalties values (5,44,'2010.12.08',25.0);
insert into penalties values (6,8,'2009.12.08',25.0);
insert into penalties values (7,44,'2012.12.03',30.0);
insert into penalties values (8,27,'2013.12.12',75.0);
