

1. Wyświetlenie wszystkich pracowników z podstawowymi danymi
 
SELECT imie, nazwisko, pensja, id_dzialu, data_zatrudnienia FROM pracownicy; 

2. Obliczenie średniej, minimalnej i maksymalnej pensji

SELECT AVG(pensja) AS srednia_pensja, MIN(pensja) AS minimalna_pensja, MAX(pensja) AS maksymalna_pensja FROM pracownicy; 

3. Wyświetlenie pracowników z pensją powyżej średniej 

SELECT imie, nazwisko, pensja FROM pracownicy WHERE pensja > (SELECT AVG(pensja) FROM pracownicy) ORDER BY pensja DESC; 

4. Wyświetlenie pracowników zatrudnionych przed 2020-01-01 

SELECT imie, nazwisko, data_zatrudnienia FROM pracownicy WHERE data_zatrudnienia < '2020-01-01' ORDER BY data_zatrudnienia; 

5. Wyświetlenie pracowników w działach 2-4 z sortowaniem po pensji 

SELECT imie, nazwisko, id_dzialu, pensja FROM pracownicy WHERE id_dzialu BETWEEN 2 AND 4 ORDER BY id_dzialu, pensja DESC; 

6. Liczba pracowników i średnia pensja w każdym dziale 

SELECT id_dzialu, COUNT(*) AS liczba_pracownikow, ROUND(AVG(pensja),2) AS srednia_pensja FROM pracownicy GROUP BY id_dzialu ORDER BY srednia_pensja DESC; 

7. Działy z średnią pensją powyżej 7000 

SELECT id_dzialu, AVG(pensja) AS srednia_pensja FROM pracownicy GROUP BY id_dzialu HAVING AVG(pensja) > 7000 ORDER BY srednia_pensja DESC; 

8. Klasyfikacja pensji pracowników

 SELECT imie, nazwisko, pensja, CASE WHEN pensja < 5000 THEN 'niska' WHEN pensja BETWEEN 5000 AND 8000 THEN 'srednia' ELSE 'wysoka' END AS poziom_pensji FROM pracownicy ORDER BY pensja DESC; 

9. Pracownicy z pensją powyżej 7000 wraz z nazwą działu

SELECT pracownicy.imie, pracownicy.nazwisko, pracownicy.pensja, dzialy.nazwa_dzialu AS "nazwa_dzialu" FROM pracownicy JOIN dzialy ON pracownicy.id_dzialu = dzialy.id_dzialu WHERE pracownicy.pensja > 7000 ORDER BY pracownicy.pensja DESC;

10. Tworzenie tymczasowej tabeli 

WITH srednie_pensje AS (SELECT id_dzialu , AVG(pensja) AS srednia_pensja FROM pracownicy GROUP BY id_dzialu) SELECT * FROM srednie_pensje;


