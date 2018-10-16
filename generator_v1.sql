ALTER PROCEDURE "x8_03"."pr_generuj_transakcje"( in data_faktury date )
/* RESULT( column_name column_type, ... ) */
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

    set @sklep_id = (select top 1 id_sklepu from sklep order by rand());
    set @klient_id = (select top 1 id_klienta from klient order by rand());
    set @pracownik_id = (select top 1 id_pracownika from pracownik where id_sklepu = @sklep_id order by rand());

    --insert faktura
    insert into faktura (data, id_pracownika, id_klienta, wartosc_faktury) VALUES 
    (data_faktury, @pracownik_id, @klient_id, 0);
    set @faktura_id = (select max(id_faktury) from faktura);

    set @liczba_towarow = (select fn_losuj_wartosc(1,5)); 

    petla:
    loop
        set @towar_id = (select top 1 id_towaru from towar where 
            id_sklepu = @sklep_id 
            and id_towaru not in (select id_towaru from pozycja_faktury where id_faktury = @faktura_id)
            order by rand());
        set @liczba_sztuk = (select fn_losuj_wartosc(1,3));       

        --insert pozycja
        insert into pozycja_faktury(id_pozycji, id_towaru, id_faktury, cena, ilosc_towarow)
        values (@licznik, @towar_id, @faktura_id,(select cena from towar where id_towaru = @towar_id ), @liczba_sztuk);

        set @laczna_cena = (select wartosc_faktury from faktura where id_faktury = @faktura_id) + 
            ((select cena from towar where id_towaru = @towar_id ) * @liczba_sztuk);

        update faktura set wartosc_faktury = @laczna_cena where id_faktury = @faktura_id;
        
        set @licznik = @licznik + 1;
        if @licznik > @liczba_towarow
            then leave petla
        end if;
    end loop petla;
    
END