INSERT INTO KRAJ_PRODUKCJI (ID_KRAJU, NAZWA_KRAJU)
VALUES
(1,'Polska'),
(2,'Chiny'),
(3,'Stany Zjednoczone'),
(4,'Niemcy'),
(5,'Anglia'),
(6,'Japonia'),
(7,'Czechy'),
(8,'Portugalia'),
(9,'Hiszpania'),
(10,'Tajlandia'),
(11,'Kanda'),
(12,'Białoruś'),
(13,'Grecja'),
(14,'Włochy'),
(15,'Austria'),
(16,'Australia'),
(17,'Egipt'),
(18,'Indie'),
(19,'Rumunia'),
(20,'Węgry');

INSERT INTO SKLEP (Nazwa,Ulica,Miejscowość)
VALUES
('Krecik Bemowo','Radiowa','Warszawa'),
('Krecik Tarchomin','Myśliborska','Warszawa'),
('Krecik Siemiatycze','Plac Jana Pawła II','Siemiatycze'),
('Krecik Białystok','Starobojarska','Białystok');
select *from SKLEP;

INSERT INTO PRACOWNIK(IMIE,NAZWISKO,ULICA,MIEJSCOWOŚĆ,ID_SKLEPU)
VALUES
('Jacek','Abacki','Lazurowa','Warszawa',1),
('Wojciech','Malinowski','Górczewska','Warszawa',1),
('Krzysztof','Komorowski','Kocjana','Warszawa',1),
('Adam','Piotrowski','Kaliskiego','Warszawa',1),
('Piotr','Kowalski','Ćmielowska','Warszawa',2),
('Anna','Koc','Świętokrzyska','Warszawa',2),
('Kamil','Kosowski','Siemiatycka','Warszawa',2),
('Katarzyna','Chrabąszcz','Al.Jerozolimskie','Warszawa',2),
('Adam','Nowak','11 Listopada','Siemiatycze',3),
('Józef','Kosiński','Wrzosowa','Siemiatycze',3),
('Damian','Chlebowski','Kasztanowa','Siemiatycze',3),
('Magdalena','Cieciuch','Górna','Siemiatycze',3),
('Cezary','Pazur','Miłosza','Białystok',4),
('Paulina','Aranowska','Szpitalna','Białystok',4),
('Julia','Zambrowska','Kościelna','Białystok',4),
('Patryk','Orłowski','Fabryczna','Białystok',4);
select *from PRACOWNIK;

INSERT INTO KLIENT (IMIE,NAZWISKO,ULICA,MIEJSCOWOŚĆ,)
VALUES
('Edward','Klich','Łódzka','Łódź'),
('Robert','Świerzyński','Warszawska','Białystok'),
('Karolina','Rytel','Gdańska','Gdańsk'),
('Mirosław','Laskowski','Kościelna','Siemiatycze'),
('Kinga','Olszewska','Kinowa','Warszawa'),
('Maciej','Skolimowski','Grodzieńska','Siemiatycze'),
('Aleksandra','Lis','Żwirki i Wigury','Białystok'),
('Henryk','Lewandowski','Wysoka','Wrocław'),
('Władysław','Kolski','Ciołka','Warszawa'),
('Marlena','Głowacka','11 Listopada','Lublin');
select *from KLIENT;

INSERT INTO TYP_TOWARU (ID_TYPU,NAZWA_TYPU)
VALUES
(1,'Nabiał'),
(2,'Pieczywo'),
(3,'RTV-AGD'),
(4,'Odzież i Obuwie');
select *from TYP_TOWARU;

INSERT INTO TOWAR(CENA,NAZWA,ID_SKLEPU,ID_KRAJU,ID_TYPU)
VALUES
('2.59','Mleko',1,1,1),
('1.89','Jogurt',1,1,1),
('3.19','Masło',1,1,1),
('2.59','Mleko',2,1,1),
('1.89','Jogurt',2,1,1),
('3.19','Masło',2,1,1),
('2.59','Mleko',3,1,1),
('1.89','Jogurt',3,1,1),
('3.19','Masło',3,1,1),
('2.59','Mleko',4,1,1),
('1.89','Jogurt',4,1,1),
('3.19','Masło',4,1,1),
('0.29','Bułka Kajzerka',1,1,2),
('0.69','Bułka Fitness',1,1,2),
('2.59','Chleb',1,1,2),
('0.29','Bułka Kajzerka',2,1,2),
('0.69','Bułka Fitness',2,1,2),
('2.59','Chleb',2,1,2),
('0.29','Bułka Kajzerka',3,1,2),
('0.69','Bułka Fitness',3,1,2),
('2.59','Chleb',3,1,2),
('0.29','Bułka Kajzerka',4,1,2),
('0.69','Bułka Fitness',4,1,2),
('2.59','Chleb',4,1,2),
('2229.99','Telewizor LCD',1,2,3),
('2499.99','Notebook',1,7,3),
('1099.99','Kuchenka Mikrofalowa',1,11,3),
('2229.99','Telewizor LCD',2,2,3),
('2499.99','Notebook',3,8,3),
('1099.99','Kuchenka Mikrofalowa',2,13,3),
('2229.99','Telewizor LCD',4,6,3),
('2499.99','Notebook',4,3,3),
('1099.99','Kuchenka Mikrofalowa',3,20,3),
('69.99','Buty Sportowe',1,18,4),
('119.99','Koszula Męska',1,17,4),
('69.99','Buty Sportowe',2,18,4),
('119.99','Koszula Męska',2,17,4),
('69.99','Buty Sportowe',4,18,4),
('119.99','Koszula Męska',4,17,4);
select *from TOWAR;
