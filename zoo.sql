--create database zoo; 
--use zoo;

use master;
go 

drop database if exists zoo;
go

create database zoo;
go

use zoo;
go




create table djelatnik(
sifra int,
ime varchar(50),
prezime varchar(50),
iban varchar(50),
);

create table zivotinja(
sifra int,
vrsta varchar(50),
ime varchar(50),
djelatnik int,
prostorija int,
datum int
);


create table prostorija(
sifra int,
dimenzije varchar(30),
maks_broj int,
mjesto varchar(30),

);

create table datum(
D_rodenja datetime,
D_dolaska datetime,
D_smrti datetime,
sifra int
);