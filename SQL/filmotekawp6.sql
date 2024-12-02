﻿USE master;
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
GO

-- Tablica za filmove
CREATE TABLE Filmovi (
    id INT PRIMARY KEY IDENTITY(1,1),
    naziv VARCHAR(50) NOT NULL,
    opis VARCHAR(250) NOT NULL,
    datum_izlaska DATE NOT NULL,
    zanr_id INT NOT NULL,
    FOREIGN KEY (zanr_id) REFERENCES Zanrovi(id)
);

-- Dodavanje filmova s odgovarajućim žanrovima

-- Akcija / Triler
INSERT INTO Filmovi (naziv, opis, datum_izlaska, zanr_id) VALUES
('Tajna Iskustva', 'Napeti triler s tajnim misijama.', '2023-05-12', 1),
('Na Rubu Zakonitosti', 'Film o borbi protiv kriminala u kojem ništa nije jasno.', '2023-03-08', 1),
('Povratak u Senku', 'Film o borbi za opstanak u post-apokaliptičnom svijetu.', '2023-01-20', 1),
('Nemoguća Misija', 'Ekstremni trenuci borbe s teroristima.', '2023-07-25', 1),
('U Senci Smrti', 'Film o tajnoj operaciji u opasnoj zemlji.', '2023-11-01', 1);

-- Drama
INSERT INTO Filmovi (naziv, opis, datum_izlaska, zanr_id) VALUES
('Poslednji Trenuci', 'Emotivna drama o gubitku i pomirenju.', '2022-12-12', 3),
('Bez Ljubavi', 'Film o obiteljskim odnosima i životnim krizama.', '2022-06-25', 3),
('Iza Zatvorenih Vrata', 'Drama koja istražuje obiteljsku tajnu.', '2022-09-15', 3),
('Izgubljeni Put', 'Film o potrazi za smislom života.', '2023-04-10', 3),
('Beli Oblačak', 'Drama koja istražuje odnos između oca i sina.', '2023-02-03', 3);

-- Komedija
INSERT INTO Filmovi (naziv, opis, datum_izlaska, zanr_id) VALUES
('Sve je Moguće', 'Komedija koja pokazuje koliko su ljudi spremni za neobične situacije.', '2023-08-15', 2),
('Luda Ekspedicija', 'Grupa prijatelja na putovanju kroz nepoznate krajeve.', '2023-06-18', 2),
('Kreće Se Smešan Svemir', 'Komediija u svemiru punom smiješnih likova.', '2023-05-05', 2),
('Baka je u Opasnosti', 'Komedija u kojoj baka spasava unuke od kriminalaca.', '2023-03-22', 2),
('Pobednici iz Senke', 'Komedija o neuspješnim superherojima.', '2023-07-30', 2);

-- Sci-Fi
INSERT INTO Filmovi (naziv, opis, datum_izlaska, zanr_id) VALUES
('Putovanje Kroz Vreme', 'Film o vremenskim petljama i posljedicama putovanja kroz vrijeme.', '2023-09-12', 5),
('Ostrvo Zvezda', 'Film o otoku u svemiru na kojem se kriju nepoznate tajne.', '2023-06-02', 5),
('Dimenzije Sudbine', 'Film o paralelnim svjetovima i njihovim sudbinama.', '2023-04-14', 5),
('Prokleti Svetovi', 'Knjiga o opasnostima života na drugim planetima.', '2023-07-05', 5),
('Zlatna Sfera', 'Futuristički film u kojem je svemir podvrgnut novim pravilima.', '2023-10-10', 5);

GO

-- Tablica za korisnike
CREATE TABLE Korisnici (
    id INT PRIMARY KEY IDENTITY(1,1),
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

-- Dodavanje nasumičnih korisnika
INSERT INTO Korisnici (ime, prezime, email) VALUES
('Ivan', 'Horvat', 'ivan.horvat@email.com'),
('Ana', 'Kovač', 'ana.kovac@email.com'),
('Marko', 'Marić', 'marko.marić@email.com'),
('Jelena', 'Novak', 'jelena.novak@email.com'),
('Petra', 'Zorić', 'petra.zoric@email.com'),
('David', 'Kovačić', 'david.kovacic@email.com'),
('Luka', 'Tomić', 'luka.tomic@email.com'),
('Sara', 'Jurić', 'sara.juric@email.com'),
('Toni', 'Babić', 'toni.babic@email.com'),
('Ivana', 'Brkić', 'ivana.brkic@email.com');

-- Tablica za praćenje gledanja filmova
CREATE TABLE Gledanje (
    id INT PRIMARY KEY IDENTITY(1,1),
    film_id INT NOT NULL,
    korisnik_id INT NOT NULL,
    datum_gledanja DATE NOT NULL,
    FOREIGN KEY (film_id) REFERENCES Filmovi(id),
    FOREIGN KEY (korisnik_id) REFERENCES Korisnici(id)
);

-- Dodavanje nasumičnih podataka u tablicu Gledanje
-- Svaki korisnik je odgledao nekoliko filmova na nasumičnim datumima
INSERT INTO Gledanje (film_id, korisnik_id, datum_gledanja) 
VALUES
-- Korisnik 1 (Ivan Horvat) 
(1, 1, DATEADD(DAY, -50, GETDATE())),  -- Film 1
(3, 1, DATEADD(DAY, -200, GETDATE())), -- Film 3
(5, 1, DATEADD(DAY, -100, GETDATE())), -- Film 5

-- Korisnik 2 (Ana Kovač)
(2, 2, DATEADD(DAY, -30, GETDATE())),  -- Film 2
(4, 2, DATEADD(DAY, -150, GETDATE())), -- Film 4
(6, 2, DATEADD(DAY, -75, GETDATE())),  -- Film 6

-- Korisnik 3 (Marko Marić)
(7, 3, DATEADD(DAY, -200, GETDATE())), -- Film 7
(8, 3, DATEADD(DAY, -120, GETDATE())), -- Film 8
(9, 3, DATEADD(DAY, -80, GETDATE())),  -- Film 9

-- Korisnik 4 (Jelena Novak)
(10, 4, DATEADD(DAY, -10, GETDATE())), -- Film 10
(2, 4, DATEADD(DAY, -300, GETDATE())), -- Film 2
(6, 4, DATEADD(DAY, -10, GETDATE())),  -- Film 6

-- Korisnik 5 (Petra Zorić)
(1, 5, DATEADD(DAY, -10, GETDATE())),  -- Film 1
(3, 5, DATEADD(DAY, -150, GETDATE())), -- Film 3
(5, 5, DATEADD(DAY, -250, GETDATE())), -- Film 5

-- Korisnik 6 (David Kovačić)
(4, 6, DATEADD(DAY, -200, GETDATE())), -- Film 4
(6, 6, DATEADD(DAY, -20, GETDATE())),  -- Film 6
(7, 6, DATEADD(DAY, -100, GETDATE())), -- Film 7

-- Korisnik 7 (Luka Tomić)
(8, 7, DATEADD(DAY, -120, GETDATE())), -- Film 8
(9, 7, DATEADD(DAY, -50, GETDATE())),  -- Film 9
(10, 7, DATEADD(DAY, -300, GETDATE())),-- Film 10

-- Korisnik 8 (Sara Jurić)
(3, 8, DATEADD(DAY, -220, GETDATE())), -- Film 3
(5, 8, DATEADD(DAY, -80, GETDATE())),  -- Film 5
(1, 8, DATEADD(DAY, -90, GETDATE())),  -- Film 1

-- Korisnik 9 (Toni Babić)
(2, 9, DATEADD(DAY, -10, GETDATE())),  -- Film 2
(4, 9, DATEADD(DAY, -50, GETDATE())),  -- Film 4
(6, 9, DATEADD(DAY, -20, GETDATE())),  -- Film 6

-- Korisnik 10 (Ivana Brkić)
(7, 10, DATEADD(DAY, -30, GETDATE())), -- Film 7
(8, 10, DATEADD(DAY, -70, GETDATE())), -- Film 8
(10, 10, DATEADD(DAY, -100, GETDATE())) -- Film 10
;
