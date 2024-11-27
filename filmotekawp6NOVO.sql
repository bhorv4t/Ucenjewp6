--ovo je baza pracenje filmova koje smo pogledali
--organizirana po zanrovima i datumu kada smo film pogledali

USE master;
GO 

-- Brišemo postojeću bazu ako postoji
DROP DATABASE IF EXISTS filmotekawp6;
GO 

-- Kreiramo novu bazu podataka s ispravnim collationom
CREATE DATABASE filmotekawp6 COLLATE Croatian_CI_AS;
GO 

USE filmotekawp6;
GO 

-- Tablica za žanrove
CREATE TABLE Zanrovi (
    id INT PRIMARY KEY IDENTITY(1,1),
    naziv VARCHAR(50) NOT NULL,
    opis TEXT
);

-- Dodavanje žanrova
INSERT INTO Zanrovi (naziv, opis) VALUES 
('Akcija','Napeti filmovi s brzim tempom, borbama, jurnjavama i eksplozijama.'),
('Komedija','Filmovi puni humora, duhovitih situacija i zabavnih likova.'),
('Drama','Filmovi s emotivnim pričama koje istražuju složene ljudske odnose i životne izazove.'),
('Horor','Filmovi koji izazivaju strah i napetost kroz zastrašujuće scene i atmosferu.'),
('Sci-Fi','Filmovi o futurističkim tehnologijama, svemiru i nepoznatim svjetovima.');

-- Tablica za filmove
CREATE TABLE Filmovi (
    id INT PRIMARY KEY IDENTITY(1,1),
    naziv VARCHAR(50) NOT NULL,
    opis VARCHAR(250) NOT NULL,
    datum_izlaska DATE NOT NULL,
    zanr_id INT NOT NULL,
    FOREIGN KEY (zanr_id) REFERENCES Zanrovi(id)
);

-- Tablica za korisnike
CREATE TABLE Korisnici (
    id INT PRIMARY KEY IDENTITY(1,1),
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

-- Tablica za praćenje gledanja filmova
CREATE TABLE Gledanje (
    id INT PRIMARY KEY IDENTITY(1,1),
    film_id INT NOT NULL,
    korisnik_id INT NOT NULL,
    datum_gledanja DATE NOT NULL,
    FOREIGN KEY (film_id) REFERENCES Filmovi(id),
    FOREIGN KEY (korisnik_id) REFERENCES Korisnici(id)
);
