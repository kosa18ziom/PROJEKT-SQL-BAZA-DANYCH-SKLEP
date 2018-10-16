ALTER PROCEDURE "x8_03"."pr_generowanie_transakcji"()
 begin
   /* to do */
    declare @licznik integer = 1;
    declare @liczba_trans integer;

    set @liczba_trans = (select fn_losuj_wartosc(5, 20));

    petla:
    loop
        call pr_generuj_transakcje(getdate());

        set @licznik = @licznik + 1;
        if @licznik > @liczba_trans
            then leave petla
        end if;
    end loop petla;
    commit;
    REFRESH MATERIALIZED VIEW laczny_dochod;
 end