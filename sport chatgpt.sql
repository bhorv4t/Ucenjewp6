-- Kreiraj bazu podataka ako već ne postoji

use master;
go 

drop database if exists sportchatgpt;
go

create database sportchatgpt;
go

use sportchatgpt;
go


---- Kreiraj tablicu 'klub'
CREATE TABLE klub (
    sifra INT IDENTITY(1,1) PRIMARY KEY,
    naziv VARCHAR(50),
    osnovan DATE,
    stadion VARCHAR(50),
    predsjednik VARCHAR(50),
    drzava VARCHAR(50),
    liga VARCHAR(50)
);

---- Kreiraj tablicu 'igrac'
CREATE TABLE igrac (
    sifra INT IDENTITY(1,1) PRIMARY KEY,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    datum_rodenja DATE,
    pozicija VARCHAR(20),
    broj_dresa INT,
    klub INT,
    FOREIGN KEY (klub) REFERENCES klub(sifra)
);

---- Kreiraj tablicu 'utakmica'
CREATE TABLE utakmica (
    sifra INT IDENTITY(1,1) PRIMARY KEY,
    datum DATE,
    vrijeme TIME,
    lokacija VARCHAR(50),
    stadion VARCHAR(50),
    domaci_klub INT,
    gostujuci_klub INT,
    FOREIGN KEY (domaci_klub) REFERENCES klub(sifra),
    FOREIGN KEY (gostujuci_klub) REFERENCES klub(sifra)
);

-- Kreiraj tablicu 'trener'
CREATE TABLE trener (
    sifra INT IDENTITY(1,1) PRIMARY KEY,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    klub INT,
    nacionalnost VARCHAR(50),
    iskustvo INT,
    FOREIGN KEY (klub) REFERENCES klub(sifra)
);
