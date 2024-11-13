use master;
go 

drop database if exists sport;
go

create database sport;
go

use sport;
go




create table klub(
sifra int,
naziv varchar(50),
osnovan varchar(50),
stadion varchar(50),
predsjednik varchar(50),
drzava varchar(50),
liga varchar(50),
);

create table utakmica(
sifra int,
datum varchar(50),
vrijeme varchar(50),
lokacija varchar(50)
stadion varchar(50),
domaci_klub varchar(50),
gostujuci_klub varchar(50),
);


create table igrac(
sifra int,
ime varchar(50),
prezime varchar(50),
datum_rodenja varchar(50),
pozicija varchar(50),
broj dresa varchar(50),
klub varchar(50)
);

create table trener(
sifra int,
ime varchar(50),
prezime varchar(50),
klub varchar(50),
nacionalnost varchar(50),
iskustvo varchar(50),
);