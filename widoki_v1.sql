--laczny dochod sklepow
select s.ID_sklepu, s.Nazwa, sum(pf.CENA) as dochod from 
SKLEP s join towar t on s.ID_Sklepu = t.ID_SKLEPU
join pozycja_faktury pf on pf.id_towaru = t.id_towaru
group by s.ID_Sklepu, s.nazwa
order by dochod desc
;

--dochod sklepow z ostatnich 30 dni
select s.ID_sklepu, s.Nazwa, sum(pf.CENA) as dochod from 
SKLEP s join towar t on s.ID_Sklepu = t.ID_SKLEPU
join pozycja_faktury pf on pf.id_towaru = t.id_towaru
join faktura f on f.id_faktury = pf.id_faktury
where data > getdate() - 30
group by s.ID_Sklepu, s.nazwa
order by dochod desc
;

--pracownik miesiaca - sprzedaz pracownika w ostatnich 30 dniach
select p.id_pracownika, p.imie, p.nazwisko, sum(pf.cena) as sprzedaz, s.nazwa from 
pracownik p join faktura f on p.id_pracownika = f.ID_PRACOWNIKA
join pozycja_faktury pf on pf.id_faktury = f.ID_faktury
join sklep s on s.id_sklepu = p.id_sklepu
where f.data > getdate() - 30
group by p.id_pracownika, p.imie, p.nazwisko, s.Nazwa
order by sprzedaz desc
;

--po roku
BEGIN 

    declare @rok integer = 2016;

    select s.ID_sklepu, s.Nazwa, sum(pf.CENA) as dochod from 
    SKLEP s join towar t on s.ID_Sklepu = t.ID_SKLEPU
    join pozycja_faktury pf on pf.id_towaru = t.id_towaru
    join faktura f on f.id_faktury = pf.id_faktury
    where year(data) = @rok
    group by s.ID_Sklepu, s.nazwa
    order by dochod desc
    ;
end;

--po roku i miesiacu
BEGIN 

    declare @miesiac integer = 1;
    declare @rok integer = 2016;

    select s.ID_sklepu, s.Nazwa, sum(pf.CENA) as dochod from 
    SKLEP s join towar t on s.ID_Sklepu = t.ID_SKLEPU
    join pozycja_faktury pf on pf.id_towaru = t.id_towaru
    join faktura f on f.id_faktury = pf.id_faktury
    where month(data) = @miesiac and year(data) = @rok
    group by s.ID_Sklepu, s.nazwa
    order by dochod desc
    ;
end;

--najlepiej sprzedajace sie produkty
select t.nazwa,tt.nazwa_typu,count(pf.ID_Pozycji) as liczba_sprzedanych, sum(pf.cena) as dochod
from towar t join typ_towaru tt on t.ID_TYPU=tt.ID_TYPU 
join Pozycja_faktury pf on t.ID_towaru=pf.ID_Towaru
group by t.nazwa,tt.nazwa_typu
order by liczba_sprzedanych desc
;
