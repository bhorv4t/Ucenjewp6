use master;
go 

drop database if exists sport;
go

create database sport;
go

use sport;
go

CREATE TABLE klub (
    sifra INT PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL,
    osnovan VARCHAR(50),
    stadion VARCHAR(50),
    predsjednik VARCHAR(50),
    drzava VARCHAR(50),
    liga VARCHAR(50)
);
CREATE TABLE utakmica (
    sifra INT PRIMARY KEY,
    datum DATE,
    vrijeme TIME,
    lokacija VARCHAR(50),
    stadion VARCHAR(50),
    domaci_klub INT,
    gostujuci_klub INT,
    FOREIGN KEY (domaci_klub) REFERENCES klub(sifra),
    FOREIGN KEY (gostujuci_klub) REFERENCES klub(sifra)
);

CREATE TABLE igrac (
    sifra INT PRIMARY KEY,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodjenja DATE,
    pozicija VARCHAR(50),
    klub_id INT,
    FOREIGN KEY (klub_id) REFERENCES klub(sifra)
);

CREATE TABLE trener (
    sifra INT PRIMARY KEY,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    klub_id INT,
    nacionalnost VARCHAR(50),
    iskustvo VARCHAR(50),
    FOREIGN KEY (klub_id) REFERENCES klub(sifra)
);