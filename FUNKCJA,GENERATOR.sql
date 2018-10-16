

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
