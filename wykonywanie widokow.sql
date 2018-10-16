
--PERSPEKTYWA
select * from dochod_30_dni; --dochod z ostatnich 30 dni
select * from pracownik_miesiaca; --pracownik miesiaca (ostatnie 30 dni)

--PROCEDURA 
call pr_dochod_miesiac(1,2016) --procedura pokazujaca dochod z danego miesiaca i roku

--GENEROWANIE TRANSAKCJI
call pr_generowanie_transakcji(); --procedura generujaca transakcje


/*
PERSPEKTYWA ZMATERIALIZOWANA
*/

select * from laczny_dochod; -- widok/perspektywa zmaterializowany

REFRESH MATERIALIZED VIEW laczny_dochod; --odswiezanie widoku/perspektywy zmaterializowanej



--perspektywa zmaterializowana - jak pokazac ze dziala
select * from laczny_dochod;
call pr_generowanie_transakcji();
select * from laczny_dochod;
REFRESH MATERIALIZED VIEW laczny_dochod;
select * from laczny_dochod;