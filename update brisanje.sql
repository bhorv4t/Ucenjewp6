--update naredba

select * from smjerovi

update smjerovi set cijena=1100
where sifra=2; -- ako mjenjamo po PK tada mijenjamo 1 red 

update smjerovi set 
izvodiseod='2024-12-05',
vaucer=0
where sifra=2;

select *from polaznici whare sifra=16'Franjic' where sifra=16;
update polaznici set prezime=16'Franjic' where sifra=16;

select *from polaznici whare sifra=16;

--unjeti 5 novi smjerova s cijenom

select * from smjerovi (naziv, cijena, izvodiseod, vaucer)

insert into smjerovi(naziv, cijena, izvodiseod, vaucer)
values
('Java programiranje',34234,234234,234234),

insert into smjerovi(naziv, cijena, izvodiseod, vaucer)
values
('sdasdasd',34234,234234,234234),

insert into smjerovi(naziv, cijena, izvodiseod, vaucer)
values
('sdasdasd',34234,234234,234234),

select * from smjerovi
update smjerovi set cijena = cijena * 0.9;
select * from smjerovi

--uvecajte sve cijene za 35%

select * from smjerovi
update smjerovi set cijena = cijena * 1.35;
select * from smjerovi

--smanjite svim smjerovima cijenu za 10 eura 

select * from smjerovi
update smjerovi set cijena = cijena - 10;
select * from smjerovi


--uvjet vanjskog kljuca
update grupe set smjer=3 where sifra=1;

--DELETE naredba

select * from smjerovi;
delete from smjerovi where sifra>3;
select * from smjerovi;

select * from grupe; 
update grupe set smjer=1 where sifra=1;

delete grupe where sifra=1;

select * from clanovi;

update clanovi set grupa=2 where grupa=1;











