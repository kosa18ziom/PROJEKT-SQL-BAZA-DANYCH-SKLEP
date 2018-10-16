CREATE TABLE FAKTURA
  (
    ID_FAKTURY      INTEGER NOT NULL ,
    DATA            DATE ,
    ID_PRACOWNIKA   INTEGER NOT NULL ,
    ID_KLIENTA      INTEGER NOT NULL ,
    Wartosc_Faktury NUMBER (10,2) NOT NULL
  ) ;
ALTER TABLE FAKTURA ADD CONSTRAINT FAKTURA_PK PRIMARY KEY ( ID_FAKTURY ) ;
CREATE TABLE KLIENT
  (
    ID_KLIENTA  INTEGER NOT NULL ,
    IMIE        VARCHAR2 (20) ,
    NAZWISKO    VARCHAR2 (20) ,
    ULICA       VARCHAR2 (20) ,
    MIEJSCOWOŚĆ VARCHAR2 (20)
  ) ;
ALTER TABLE KLIENT ADD CONSTRAINT KLIENT_PK PRIMARY KEY ( ID_KLIENTA ) ;
CREATE TABLE KRAJ_PRODUKCJI
  (
    ID_KRAJU    INTEGER NOT NULL ,
    NAZWA_KRAJU VARCHAR2 (25)
  ) ;
ALTER TABLE KRAJ_PRODUKCJI ADD CONSTRAINT "KRAJ PRODUKCJI_PK" PRIMARY KEY ( ID_KRAJU ) ;
CREATE TABLE POZYCJA_FAKTURY
  (
    ID_POZYCJI    INTEGER NOT NULL ,
    ID_TOWARU     INTEGER NOT NULL ,
    ID_FAKTURY    INTEGER NOT NULL ,
    CENA          NUMBER (10,2) NOT NULL ,
    ILOSC_TOWAROW INTEGER NOT NULL
  ) ;
ALTER TABLE POZYCJA_FAKTURY ADD CONSTRAINT "POZYCJA FAKTURY_PK" PRIMARY KEY ( ID_POZYCJI, ID_FAKTURY ) ;
CREATE TABLE PRACOWNIK
  (
    ID_PRACOWNIKA INTEGER NOT NULL ,
    IMIE          VARCHAR2 (15) ,
    NAZWISKO      VARCHAR2 (20) ,
    ULICA         VARCHAR2 (20) ,
    MIEJSCOWOŚĆ   VARCHAR2 (20) ,
    ID_SKLEPU     INTEGER NOT NULL
  ) ;
ALTER TABLE PRACOWNIK ADD CONSTRAINT Pracownik_PK PRIMARY KEY ( ID_PRACOWNIKA ) ;
CREATE TABLE SKLEP
  (
    ID_SKLEPU   INTEGER NOT NULL ,
    Nazwa       VARCHAR2 (20) ,
    Ulica       VARCHAR2 (20) ,
    Miejscowość VARCHAR2 (20)
  ) ;
ALTER TABLE SKLEP ADD CONSTRAINT SKLEP_PK PRIMARY KEY ( ID_SKLEPU ) ;
CREATE TABLE TOWAR
  (
    ID_TOWARU INTEGER NOT NULL ,
    CENA      NUMBER (10,2) NOT NULL ,
    NAZWA     VARCHAR2 (20) NOT NULL ,
    ID_SKLEPU INTEGER NOT NULL ,
    ID_KRAJU  INTEGER NOT NULL ,
    ID_TYPU   INTEGER NOT NULL
  ) ;
ALTER TABLE TOWAR ADD CONSTRAINT TOWAR_PK PRIMARY KEY ( ID_TOWARU ) ;
CREATE TABLE TYP_TOWARU
  (
    ID_TYPU    INTEGER NOT NULL ,
    NAZWA_TYPU VARCHAR2 (20)
  ) ;
ALTER TABLE TYP_TOWARU ADD CONSTRAINT "Typ Towaru_PK" PRIMARY KEY ( ID_TYPU ) ;
ALTER TABLE FAKTURA ADD CONSTRAINT FAKTURA_KLIENT_FK FOREIGN KEY ( ID_KLIENTA ) REFERENCES KLIENT ( ID_KLIENTA ) ;
ALTER TABLE FAKTURA ADD CONSTRAINT FAKTURA_Pracownik_FK FOREIGN KEY ( ID_PRACOWNIKA ) REFERENCES PRACOWNIK ( ID_PRACOWNIKA ) ;
ALTER TABLE POZYCJA_FAKTURY ADD CONSTRAINT "POZYCJA FAKTURY_FAKTURA_FK" FOREIGN KEY ( ID_FAKTURY ) REFERENCES FAKTURA ( ID_FAKTURY ) ;
ALTER TABLE POZYCJA_FAKTURY ADD CONSTRAINT "POZYCJA FAKTURY_TOWAR_FK" FOREIGN KEY ( ID_TOWARU ) REFERENCES TOWAR ( ID_TOWARU ) ;
ALTER TABLE PRACOWNIK ADD CONSTRAINT Pracownik_SKLEP_FK FOREIGN KEY ( ID_SKLEPU ) REFERENCES SKLEP ( ID_SKLEPU ) ;
ALTER TABLE TOWAR ADD CONSTRAINT "TOWAR_KRAJ PRODUKCJI_FK" FOREIGN KEY ( ID_KRAJU ) REFERENCES KRAJ_PRODUKCJI ( ID_KRAJU ) ;
ALTER TABLE TOWAR ADD CONSTRAINT TOWAR_SKLEP_FK FOREIGN KEY ( ID_SKLEPU ) REFERENCES SKLEP ( ID_SKLEPU ) ;
ALTER TABLE TOWAR ADD CONSTRAINT "TOWAR_Typ Towaru_FK" FOREIGN KEY ( ID_TYPU ) REFERENCES TYP_TOWARU ( ID_TYPU ) ;


INSERT INTO KRAJ_PRODUKCJI (ID_KRAJU, NAZWA_KRAJU)

select 1,'Polska'  from dual
union all select 2,'Chiny'  from dual
union all select 3,'Stany Zjednoczone'  from dual
union all select 4,'Niemcy'  from dual
union all select 5,'Anglia'  from dual
union all select 6,'Japonia' from dual
union all select 7,'Czechy' from dual
union all select 8,'Portugalia' from dual
union all select 9,'Hiszpania' from dual
union all select 10,'Tajlandia' from dual
union all select 11,'Kanada' from dual
union all select 12,'Białoruś' from dual
union all select 13,'Grecja' from dual
union all select 14,'Włochy' from dual
union all select 15,'Austria' from dual
union all select 16,'Australia' from dual
union all select 17,'Egipt' from dual
union all select 18,'Indie' from dual
union all select 19,'Rumunia' from dual
union all select 20,'Węgry' from dual;


INSERT INTO SKLEP (ID_SKLEPU,Nazwa,Ulica,Miejscowość)

select 1,'Krecik Bemowo','Radiowa','Warszawa' from dual
union all select 2,'Krecik Tarchomin','Myśliborska','Warszawa' from dual
union all select 3,'Krecik Siemiatycze','Plac Jana Pawła II','Siemiatycze' from dual
union all select 4,'Krecik Białystok','Starobojarska','Białystok' from dual;


INSERT INTO PRACOWNIK(ID_Pracownika,IMIE,NAZWISKO,ULICA,MIEJSCOWOŚĆ,ID_SKLEPU)

select 1,'Jacek','Abacki','Lazurowa','Warszawa',1 from dual
union all select 2,'Wojciech','Malinowski','Górczewska','Warszawa',1 from dual
union all select 3,'Krzysztof','Komorowski','Kocjana','Warszawa',1 from dual
union all select 4,'Adam','Piotrowski','Kaliskiego','Warszawa',1 from dual
union all select 5,'Piotr','Kowalski','Ćmielowska','Warszawa',2 from dual
union all select 6,'Anna','Koc','Świętokrzyska','Warszawa',2 from dual
union all select 7,'Kamil','Kosowski','Siemiatycka','Warszawa',2 from dual
union all select 8,'Katarzyna','Chrabąszcz','Al.Jerozolimskie','Warszawa',2 from dual
union all select 9,'Adam','Nowak','11 Listopada','Siemiatycze',3 from dual
union all select 10,'Józef','Kosiński','Wrzosowa','Siemiatycze',3 from dual
union all select 11,'Damian','Chlebowski','Kasztanowa','Siemiatycze',3 from dual
union all select 12,'Magdalena','Cieciuch','Górna','Siemiatycze',3 from dual
union all select 13,'Cezary','Pazur','Miłosza','Białystok',4 from dual
union all select 14,'Paulina','Aranowska','Szpitalna','Białystok',4 from dual
union all select 15,'Julia','Zambrowska','Kościelna','Białystok',4 from dual
union all select 16,'Patryk','Orłowski','Fabryczna','Białystok',4 from dual;


INSERT INTO KLIENT (ID_KLIENTA,IMIE,NAZWISKO,ULICA,MIEJSCOWOŚĆ,)
select 1,'Edward','Klich','Łódzka','Łódź' from dual
union all select 2,'Robert','Świerzyński','Warszawska','Białystok' from dual
union all select 3,'Karolina','Rytel','Gdańska','Gdańsk' from dual
union all select 4,'Mirosław','Laskowski','Kościelna','Siemiatycze' from dual
union all select 5,'Kinga','Olszewska','Kinowa','Warszawa' from dual
union all select 6,'Maciej','Skolimowski','Grodzieńska','Siemiatycze' from dual
union all select 7,'Aleksandra','Lis','Żwirki i Wigury','Białystok' from dual
union all select 8,'Henryk','Lewandowski','Wysoka','Wrocław' from dual
union all select 9,'Władysław','Kolski','Ciołka','Warszawa' from dual
union all select 10,'Marlena','Głowacka','11 Listopada','Lublin' from dual;


INSERT INTO TYP_TOWARU (ID_TYPU,NAZWA_TYPU)

select 1,'Nabiał' from dual
union all select 2,'Pieczywo' from dual
union all select 3,'RTV-AGD' from dual
union all select 4,'Odzież i Obuwie' from dual;


INSERT INTO TOWAR(ID_TOWARU,CENA,NAZWA,ID_SKLEPU,ID_KRAJU,ID_TYPU)
select 1,'2,59','Mleko',1,1,1 from dual
union all select 2,'1,89','Jogurt',1,1,1 from dual
union all select 3,'3,19','Masło',1,1,1 from dual
union all select 4,'2,59','Mleko',2,1,1 from dual
union all select 5,'1,89','Jogurt',2,1,1 from dual
union all select 6,'3,19','Masło',2,1,1 from dual
union all select 7,'2,59','Mleko',3,1,1 from dual
union all select 8,'1,89','Jogurt',3,1,1 from dual
union all select 9,'3,19','Masło',3,1,1 from dual
union all select 10,'2,59','Mleko',4,1,1 from dual
union all select 11,'1,89','Jogurt',4,1,1 from dual
union all select 12,'3,19','Masło',4,1,1 from dual
union all select 13,'0,29','Bułka Kajzerka',1,1,2 from dual
union all select 14,'0,69','Bułka Fitness',1,1,2 from dual
union all select 15,'2,59','Chleb',1,1,2 from dual
union all select 16,'0,29','Bułka Kajzerka',2,1,2 from dual
union all select 17,'0,69','Bułka Fitness',2,1,2 from dual
union all select 18,'2,59','Chleb',2,1,2 from dual
union all select 19,'0,29','Bułka Kajzerka',3,1,2 from dual
union all select 20,'0,69','Bułka Fitness',3,1,2 from dual
union all select 21,'2,59','Chleb',3,1,2 from dual
union all select 22,'0,29','Bułka Kajzerka',4,1,2 from dual
union all select 23,'0,69','Bułka Fitness',4,1,2 from dual
union all select 24,'2,59','Chleb',4,1,2 from dual
union all select 25,'2229,99','Telewizor LCD',1,2,3 from dual
union all select 26,'2499,99','Notebook',1,7,3 from dual
union all select 27,'1099,99','Kuchenka Mikrofalowa',1,11,3 from dual
union all select 28,'2229,99','Telewizor LCD',2,2,3 from dual
union all select 29,'2499,99','Notebook',3,8,3 from dual
union all select 30,'1099,99','Kuchenka Mikrofalowa',2,13,3 from dual
union all select 31,'2229,99','Telewizor LCD',4,6,3 from dual
union all select 32,'2499,99','Notebook',4,3,3 from dual
union all select 33,'1099,99','Kuchenka Mikrofalowa',3,20,3 from dual
union all select 34,'69,99','Buty Sportowe',1,18,4 from dual
union all select 35,'119,99','Koszula Męska',1,17,4 from dual
union all select 36,'69,99','Buty Sportowe',2,18,4 from dual
union all select 37,'119,99','Koszula Męska',2,17,4 from dual
union all select 38,'69,99','Buty Sportowe',4,18,4 from dual
union all select 39,'119,99','Koszula Męska',4,17,4 from dual;


