CREATE SEQUENCE SEQ_FAKTURAA START WITH 1 INCREMENT BY 1 MINVALUE 1 ;

CREATE SEQUENCE SEQ_KLIENTT START WITH 1 INCREMENT BY 1 MINVALUE 1 ;

CREATE SEQUENCE SEQ_PRACOWNIKK START WITH 1 INCREMENT BY 1 MINVALUE 1 ;

CREATE SEQUENCE SEQ_SKLEPP START WITH 1 INCREMENT BY 1 MINVALUE 1 ;

CREATE SEQUENCE SEQ_TOWARR START WITH 1 INCREMENT BY 1 MINVALUE 1 ;

CREATE TABLE FAKTURA
  (
    ID_FAKTURY    	INTEGER DEFAULT (SEQ_FAKTURAA.nextval) NOT NULL ,
    DATA          	DATE ,
    ID_PRACOWNIKA 	INTEGER NOT NULL ,
    ID_KLIENTA    	INTEGER NOT NULL ,
   WARTOSC_FAKTURY   NUMERIC (10,2) NOT NULL
  );
ALTER TABLE FAKTURA ADD CONSTRAINT FAKTURA_PK PRIMARY KEY ( ID_FAKTURY ) ;


CREATE TABLE KLIENT
  (
    ID_KLIENTA  INTEGER DEFAULT (SEQ_KLIENTT.nextval) NOT NULL ,
    IMIE        VARCHAR (20) ,
    NAZWISKO    VARCHAR (20) ,
    ULICA       VARCHAR (20) ,
    MIEJSCOWOŚĆ VARCHAR (20)
  );
ALTER TABLE KLIENT ADD CONSTRAINT KLIENT_PK PRIMARY KEY ( ID_KLIENTA ) ;


CREATE TABLE KRAJ_PRODUKCJI
  (
    ID_KRAJU    INTEGER NOT NULL ,
    NAZWA_KRAJU VARCHAR (25)
  );
ALTER TABLE KRAJ_PRODUKCJI ADD CONSTRAINT "KRAJ PRODUKCJI_PK" PRIMARY KEY ( ID_KRAJU ) ;


CREATE TABLE POZYCJA_FAKTURY
  (
    ID_POZYCJI     INTEGER NOT NULL ,
    ID_TOWARU      INTEGER NOT NULL ,
    ID_FAKTURY     INTEGER NOT NULL ,
    CENA           NUMERIC (10,2) NOT NULL ,
	ILOSC_TOWAROW  INTEGER NOT NULL  
  );
ALTER TABLE POZYCJA_FAKTURY ADD CONSTRAINT "POZYCJA FAKTURY_PK" PRIMARY KEY ( ID_POZYCJI, ID_FAKTURY ) ;


CREATE TABLE PRACOWNIK
  (
    ID_PRACOWNIKA INTEGER DEFAULT (SEQ_PRACOWNIKK.nextval) NOT NULL ,
    IMIE          VARCHAR (15) ,
    NAZWISKO      VARCHAR (20) ,
    ULICA         VARCHAR (20) ,
    MIEJSCOWOŚĆ   VARCHAR (20) ,
    ID_SKLEPU     INTEGER NOT NULL
  );
ALTER TABLE PRACOWNIK ADD CONSTRAINT Pracownik_PK PRIMARY KEY ( ID_PRACOWNIKA ) ;


CREATE TABLE SKLEP
  (
    ID_SKLEPU   INTEGER DEFAULT (SEQ_SKLEPP.nextval) NOT NULL ,
    Nazwa       VARCHAR (20) ,
    Ulica       VARCHAR (20) ,
    Miejscowość VARCHAR (20)
  );
ALTER TABLE SKLEP ADD CONSTRAINT SKLEP_PK PRIMARY KEY ( ID_SKLEPU ) ;


CREATE TABLE TOWAR
  (
    ID_TOWARU INTEGER DEFAULT (SEQ_TOWARR.nextval) NOT NULL ,
    CENA      NUMERIC (10,2) NOT NULL ,
    NAZWA     VARCHAR (20) NOT NULL ,
    ID_SKLEPU INTEGER NOT NULL ,
    ID_KRAJU  INTEGER NOT NULL ,
    ID_TYPU   INTEGER NOT NULL
  );
ALTER TABLE TOWAR ADD CONSTRAINT TOWAR_PK PRIMARY KEY ( ID_TOWARU ) ;


CREATE TABLE TYP_TOWARU
  (
    ID_TYPU    INTEGER NOT NULL ,
    NAZWA_TYPU VARCHAR (20)
  );
ALTER TABLE TYP_TOWARU ADD CONSTRAINT "Typ Towaru_PK" PRIMARY KEY ( ID_TYPU ) ;


ALTER TABLE FAKTURA ADD CONSTRAINT FAKTURA_KLIENT_FK FOREIGN KEY ( ID_KLIENTA ) REFERENCES KLIENT ( ID_KLIENTA );

ALTER TABLE FAKTURA ADD CONSTRAINT FAKTURA_Pracownik_FK FOREIGN KEY ( ID_PRACOWNIKA ) REFERENCES PRACOWNIK ( ID_PRACOWNIKA );

ALTER TABLE POZYCJA_FAKTURY ADD CONSTRAINT "POZYCJA FAKTURY_FAKTURA_FK" FOREIGN KEY ( ID_FAKTURY ) REFERENCES FAKTURA ( ID_FAKTURY );

ALTER TABLE POZYCJA_FAKTURY ADD CONSTRAINT "POZYCJA FAKTURY_TOWAR_FK" FOREIGN KEY ( ID_TOWARU ) REFERENCES TOWAR ( ID_TOWARU );

ALTER TABLE PRACOWNIK ADD CONSTRAINT Pracownik_SKLEP_FK FOREIGN KEY ( ID_SKLEPU ) REFERENCES SKLEP ( ID_SKLEPU );

ALTER TABLE TOWAR ADD CONSTRAINT "TOWAR_KRAJ PRODUKCJI_FK" FOREIGN KEY ( ID_KRAJU ) REFERENCES KRAJ_PRODUKCJI ( ID_KRAJU );

ALTER TABLE TOWAR ADD CONSTRAINT TOWAR_SKLEP_FK FOREIGN KEY ( ID_SKLEPU ) REFERENCES SKLEP ( ID_SKLEPU );

ALTER TABLE TOWAR ADD CONSTRAINT "TOWAR_Typ Towaru_FK" FOREIGN KEY ( ID_TYPU ) REFERENCES TYP_TOWARU ( ID_TYPU );


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

INSERT INTO TYP_TOWARU (ID_TYPU,NAZWA_TYPU)
VALUES
(1,'Nabiał'),
(2,'Pieczywo'),
(3,'RTV-AGD'),
(4,'Odzież i Obuwie');

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

--najlepiej sprzedajace sie produkty
CREATE OR REPLACE VIEW  najpopularniejsze_produkty()
AS
select t.nazwa,tt.nazwa_typu,count(pf.ID_Pozycji) as liczba_sprzedanych, sum(pf.cena) as dochod
from towar t join typ_towaru tt on t.ID_TYPU=tt.ID_TYPU 
join Pozycja_faktury pf on t.ID_towaru=pf.ID_Towaru
group by t.nazwa,tt.nazwa_typu
order by liczba_sprzedanych desc
;

--pracownik miesiaca - sprzedaz pracownika w ostatnich 30 dniach
CREATE OR REPLACE VIEW pracownik_miesiaca()
AS
select p.id_pracownika, p.imie, p.nazwisko, sum(pf.cena) as sprzedaz, s.nazwa from 
pracownik p join faktura f on p.id_pracownika = f.ID_PRACOWNIKA
join pozycja_faktury pf on pf.id_faktury = f.ID_faktury
join sklep s on s.id_sklepu = p.id_sklepu
where f.data > getdate() - 30
group by p.id_pracownika, p.imie, p.nazwisko, s.Nazwa
order by sprzedaz desc
;

--dochod sklepow z ostatnich 30 dni
CREATE OR REPLACE VIEW dochod_30_dni( )
AS
select s.ID_sklepu, s.Nazwa, sum(pf.CENA) as dochod from 
SKLEP s join towar t on s.ID_Sklepu = t.ID_SKLEPU
join pozycja_faktury pf on pf.id_towaru = t.id_towaru
join faktura f on f.id_faktury = pf.id_faktury
where data > getdate() - 30
group by s.ID_Sklepu, s.nazwa
order by dochod desc
;

--laczny dochod (materialized view)
CREATE MATERIALIZED VIEW laczny_dochod()
IN "system" AS
select s.ID_sklepu, s.Nazwa, sum(pf.CENA) as dochod from 
SKLEP s join towar t on s.ID_Sklepu = t.ID_SKLEPU
join pozycja_faktury pf on pf.id_towaru = t.id_towaru
group by s.ID_Sklepu, s.nazwa
order by dochod desc
;




--Funkcja losująca wartość. Będziemy jej używać w generowaniu transakcji
create or replace function fn_losuj_wartosc
(v_min integer,v_max integer)
returns integer
begin
declare v_wylosowana_wartosc integer;
set v_wylosowana_wartosc = 
round (v_min+(v_max-v_min)*rand(),0);
return v_wylosowana_wartosc;
end;

--Procedura generująca jedną fakturę.
CREATE OR REPLACE PROCEDURE pr_generuj_transakcje( in data_faktury date )
BEGIN 
    declare @klient_id integer;
    declare @sklep_id integer;
    declare @pracownik_id integer;
    declare @towar_id integer;
    declare @liczba_towarow integer;
    declare @licznik integer = 1;
    declare @faktura_id integer;
    declare @liczba_sztuk integer;
    declare @laczna_cena numeric(10,2);

    set @sklep_id = (select top 1 id_sklepu from sklep order by rand()); //losujemy sklep
    set @klient_id = (select top 1 id_klienta from klient order by rand());//losujemy klienta
    set @pracownik_id = (select top 1 id_pracownika from pracownik where id_sklepu = @sklep_id order by rand());//losujemy pracownika

    --insert faktura
    insert into faktura (data, id_pracownika, id_klienta, wartosc_faktury) VALUES 
    (data_faktury, @pracownik_id, @klient_id, 0);
    set @faktura_id = (select max(id_faktury) from faktura);//wstawiamy dane do faktury

    set @liczba_towarow = (select fn_losuj_wartosc(1,5));  //losujemy liczbę towarów za pomocą funkcji fn_losuj_wartość

  


  petla:
    loop
        set @towar_id = (select top 1 id_towaru from towar where  id_sklepu = @sklep_id  and      id_towaru not in (select id_towaru from pozycja_faktury where id_faktury = @faktura_id)  order by rand()); 
        set @liczba_sztuk = (select fn_losuj_wartosc(1,3));      // losujemy towar a następnie ilosć

        --insert pozycja
        insert into pozycja_faktury(id_pozycji, id_towaru, id_faktury, cena, ilosc_towarow)
        values (@licznik, @towar_id, @faktura_id,(select cena from towar where id_towaru = @towar_id ), @liczba_sztuk); //

        set @laczna_cena = (select wartosc_faktury from faktura where id_faktury = @faktura_id) + 
            ((select cena from towar where id_towaru = @towar_id ) * @liczba_sztuk);//podliczamy wartość faktury

        update faktura set wartosc_faktury = @laczna_cena where id_faktury = @faktura_id;
        
        set @licznik = @licznik + 1;
        if @licznik > @liczba_towarow
            then leave petla
        end if;
    end loop petla;  
END;

--Procedura generująca od 5 do 20 transakcji połączona z eventem stworzonym przez Prowadzącego.
CREATE OR REPLACE PROCEDURE  pr_generowanie_transakcji()
 begin
    declare @licznik integer = 1;
    declare @liczba_trans integer;

    set @liczba_trans = (select fn_losuj_wartosc(5, 20));// za pomocą funkcji losujemy ilosć faktur do wygenerowania 

    petla:
    loop
        call pr_generuj_transakcje(getdate()); //wywołujemy procedurę do generowania transakcji z punktu a)

        set @licznik = @licznik + 1;
        if @licznik > @liczba_trans// jeśli licznik większy niz liczba wylosowana w funkcji to opuszcamy pętlę
            then leave petla
        end if;
    end loop petla;
    commit;
    REFRESH MATERIALIZED VIEW laczny_dochod;//odświeżamy perspektywę zamterializowaną laczny_dochod
 end;

--Procedura generująca serię transakcji w zadanym okresie czasu.
CREATE OR REPLACE PROCEDURE  pr_gen_transakcji_w_okresie( in data_wej date, in data_wyj date )
/* RESULT( column_name column_type, ... ) */
begin
    declare @licznik integer = 1;
    declare @liczba_trans integer;
    declare @licznik_daty date;
    set @licznik_daty = data_wej;
    petla:
    loop
        set @liczba_trans = (select fn_losuj_wartosc(5, 20));
        set @licznik = 1;

        petla2:
        loop

            call pr_generuj_transakcje(@licznik_daty);

            set @licznik = @licznik + 1;
            if @licznik > @liczba_trans
                then leave petla2
            end if;

        end loop petla2;

        set @licznik_daty = @licznik_daty + 1;
        if @licznik_daty > data_wyj
            then leave petla
        end if;
    end loop petla;
    commit;
    REFRESH MATERIALIZED VIEW laczny_dochod;
 end;
