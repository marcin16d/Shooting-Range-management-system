/*
Created: 12.12.2017
Modified: 17.12.2017
Project: Strzelnica - model fizyczny
Model: Strzelnica - model fizyczny
Database: PostgreSQL 9.5
*/


-- Create roles section -------------------------------------------------

CREATE ROLE "administrator" LOGIN
superuser,createuser,createdb,login
;

CREATE ROLE "klienci"
nosuperuser
;

CREATE ROLE "sprzedawcy"
nosuperuser
;

CREATE ROLE "kierownicy"
nosuperuser
;

-- Create schemas section -------------------------------------------------

CREATE SCHEMA "Schema2"
;

-- Create tables section -------------------------------------------------

-- Table Adres

CREATE TABLE "Adres"(
 "id_adresu" Integer NOT NULL,
 "tel_kontaktowy" Character varying DEFAULT CREATE DOMAIN telefon AS Character varying
 CHECK (VALUE ~ \d{9} OR VALUE ~\d{3}-\d{3}-d{3}) NOT NULL,
 "miejsce_zamieszkania" Character varying(60) NOT NULL,
 "poczta" Character varying DEFAULT CREATE DOMAIN poczta AS
varchar CHECK (VALUE ~ \d{2}-\d{3}?); NOT NULL
)
;

-- Add keys for table Adres

ALTER TABLE "Adres" ADD CONSTRAINT "id_klienta" PRIMARY KEY ("id_adresu")
;

-- Table Zawodnik

CREATE TABLE "Zawodnik"(
 "id_zawodnika" Integer NOT NULL,
 "id_druzyny" Integer NOT NULL,
 "kontrola_lekarska" Boolean NOT NULL,
 "termin_badan" Date NOT NULL
)
;

-- Add keys for table Zawodnik

ALTER TABLE "Zawodnik" ADD CONSTRAINT "Key2" PRIMARY KEY ("id_zawodnika")
;

-- Table Drużyna

CREATE TABLE "Drużyna"(
 "id_druzyny" Integer NOT NULL,
 "nazwa" Character varying(60) NOT NULL,
 "imie_trenera" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL,
 "nazwisko_trenera" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL
)
;

-- Add keys for table Drużyna

ALTER TABLE "Drużyna" ADD CONSTRAINT "Key3" PRIMARY KEY ("id_druzyny")
;

-- Table Klient

CREATE TABLE "Klient"(
 "id_klienta" Integer NOT NULL,
 "id_adresu" Integer NOT NULL,
 "imie" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL,
 "nazwisko" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL,
 "pelnoletni" Boolean NOT NULL,
 "funkcjonariusz" Boolean
)
;

-- Add keys for table Klient

ALTER TABLE "Klient" ADD CONSTRAINT "Key4" PRIMARY KEY ("id_klienta")
;

-- Table Konto

CREATE TABLE "Konto"(
 "id_konta" Integer NOT NULL,
 "id_klienta" Integer NOT NULL,
 "login" Character varying DEFAULT 24 NOT NULL,
 "haslo" Character varying DEFAULT 32 NOT NULL,
 "email" Bigint DEFAULT CREATE DOMAIN Email as character varying 
 CHECK(
VALUE ~^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$
); NOT NULL
)
;

-- Add keys for table Konto

ALTER TABLE "Konto" ADD CONSTRAINT "Key5" PRIMARY KEY ("id_konta")
;

-- Table Rezerwacja

CREATE TABLE "Rezerwacja"(
 "id_rezerwacji" Integer NOT NULL,
 "id_konta" Integer NOT NULL,
 "id_pakietu" Integer NOT NULL,
 "id_szkolenia" Integer,
 "data_zamowienia" Date NOT NULL
)
;

-- Add keys for table Rezerwacja

ALTER TABLE "Rezerwacja" ADD CONSTRAINT "Key6" PRIMARY KEY ("id_rezerwacji")
;

-- Table Pakiet

CREATE TABLE "Pakiet"(
 "id_pakietu" Integer NOT NULL,
 "dla_pelnoletnich" Boolean NOT NULL,
 "bron" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL,
 "liczba_strzalow" Integer NOT NULL,
 "cena" Double precision NOT NULL
)
;

-- Add keys for table Pakiet

ALTER TABLE "Pakiet" ADD CONSTRAINT "Key7" PRIMARY KEY ("id_pakietu")
;

-- Table Szkolenie

CREATE TABLE "Szkolenie"(
 "id_szkolenia" Integer NOT NULL,
 "id_instruktora" Integer NOT NULL,
 "cena" Double precision NOT NULL
)
;

-- Add keys for table Szkolenie

ALTER TABLE "Szkolenie" ADD CONSTRAINT "Key8" PRIMARY KEY ("id_szkolenia")
;

-- Table Instruktor

CREATE TABLE "Instruktor"(
 "id_instruktora" Integer NOT NULL,
 "badania" Boolean NOT NULL,
 "data_ostatnich_badan" Date NOT NULL
)
;

-- Add keys for table Instruktor

ALTER TABLE "Instruktor" ADD CONSTRAINT "Key9" PRIMARY KEY ("id_instruktora")
;

-- Table Pracownik

CREATE TABLE "Pracownik"(
 "id_pracownika" Integer NOT NULL,
 "imie" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL,
 "nazwisko" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL,
 "stanowisko" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL
)
;

-- Add keys for table Pracownik

ALTER TABLE "Pracownik" ADD CONSTRAINT "Key10" PRIMARY KEY ("id_pracownika")
;

-- Table Dyżury

CREATE TABLE "Dyżury"(
 "id_pracownika" Integer NOT NULL,
 "data" Date NOT NULL
)
;

-- Add keys for table Dyżury

ALTER TABLE "Dyżury" ADD CONSTRAINT "Key11" PRIMARY KEY ("id_pracownika","data")
;

-- Table Broń

CREATE TABLE "Broń"(
 "id_broni" Integer NOT NULL,
 "nazwa" Character varying NOT NULL,
 "dostepnosc" Boolean NOT NULL,
 "serwis" Date NOT NULL,
 "zakupiony" Date NOT NULL
)
;

-- Add keys for table Broń

ALTER TABLE "Broń" ADD CONSTRAINT "Key12" PRIMARY KEY ("id_broni")
;

-- Table Statystyki

CREATE TABLE "Statystyki"(
 "id_statystyk" Integer NOT NULL,
 "id_klienta" Integer NOT NULL,
 "id_broni" Integer NOT NULL,
 "rodzaj" Character varying DEFAULT 20 NOT NULL,
 "oddane_strzaly" Integer NOT NULL,
 "wynik" Integer NOT NULL,
 "data" Date NOT NULL
)
;

-- Add keys for table Statystyki

ALTER TABLE "Statystyki" ADD CONSTRAINT "Key13" PRIMARY KEY ("id_statystyk")
;

-- Table Zawody

CREATE TABLE "Zawody"(
 "id_zawodow" Integer NOT NULL,
 "data" Date NOT NULL,
 "rodzaj" Bigint DEFAULT CREATE DOMAIN slowo as character varying(50)
 CHECK(
VALUE ~[A-Z][a-z]+
) NOT NULL,
 "I_miejsce" Integer NOT NULL,
 "II_miejsce" Integer NOT NULL,
 "III_miejsce" Integer NOT NULL
)
;

-- Add keys for table Zawody

ALTER TABLE "Zawody" ADD CONSTRAINT "Key14" PRIMARY KEY ("id_zawodow")
;

-- Table Zawody_indywidualne

CREATE TABLE "Zawody_indywidualne"(
 "id_zawodnika" Integer NOT NULL,
 "id_zawodow" Integer NOT NULL
)
;

-- Add keys for table Zawody_indywidualne

ALTER TABLE "Zawody_indywidualne" ADD CONSTRAINT "Key15" PRIMARY KEY ("id_zawodnika","id_zawodow")
;

-- Table Zawody_grupowe

CREATE TABLE "Zawody_grupowe"(
 "id_druzyny" Integer NOT NULL,
 "id_zawodow" Integer NOT NULL
)
;

-- Add keys for table Zawody_grupowe

ALTER TABLE "Zawody_grupowe" ADD CONSTRAINT "Key16" PRIMARY KEY ("id_druzyny","id_zawodow")
;

-- Create views section -------------------------------------------------

CREATE VIEW "Pakiety dla niepełnoletnich" AS
SELECT "id_pakietu", "liczba_strzalow", "cena", "bron"
FROM "Pakiet"
WHERE dla_pelnoletnich=false
;

CREATE VIEW "Statystyki broni" AS
SELECT "Broń"."id_broni", "data", "oddane_strzaly", "wynik"
FROM "Broń", "Statystyki"
;

CREATE VIEW "Czempion zawodów indywidualnych" AS
SELECT "imie", "nazwisko"
FROM "Klient", "Zawody"
WHERE rodzaj='Indywidualne' and id_klienta=I_miejsce and data=(SELECT max(data) from Zawody)
;

CREATE VIEW "Czempion zawodów grupowych" AS
SELECT "nazwa"
FROM "Drużyna", "Zawody"
WHERE rodzaj='Grupowe' and id_druzyny=I_miejsce and data=(SELECT max(data) from Zawody)
;

CREATE VIEW "Kadra kierownicza" AS
SELECT "imie", "nazwisko"
FROM "Pracownik"
WHERE "stanowisko"='Kierownik'
;
-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Klient" ADD CONSTRAINT "jest przypisany" FOREIGN KEY ("id_adresu") REFERENCES "Adres" ("id_adresu") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Zawodnik" ADD CONSTRAINT "jest członkiem" FOREIGN KEY ("id_druzyny") REFERENCES "Drużyna" ("id_druzyny") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Konto" ADD CONSTRAINT "zakłada" FOREIGN KEY ("id_klienta") REFERENCES "Klient" ("id_klienta") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Rezerwacja" ADD CONSTRAINT "dokonuje" FOREIGN KEY ("id_konta") REFERENCES "Konto" ("id_konta") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Szkolenie" ADD CONSTRAINT "jest przydzielany" FOREIGN KEY ("id_instruktora") REFERENCES "Instruktor" ("id_instruktora") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Instruktor" ADD CONSTRAINT "może pracować jako" FOREIGN KEY ("id_instruktora") REFERENCES "Pracownik" ("id_pracownika") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Statystyki" ADD CONSTRAINT "otrzymuje" FOREIGN KEY ("id_klienta") REFERENCES "Klient" ("id_klienta") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Statystyki" ADD CONSTRAINT "uwzględniają" FOREIGN KEY ("id_broni") REFERENCES "Broń" ("id_broni") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Zawody_indywidualne" ADD CONSTRAINT "uczestniczą" FOREIGN KEY ("id_zawodow") REFERENCES "Zawody" ("id_zawodow") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Zawody_indywidualne" ADD CONSTRAINT "uczestniczy" FOREIGN KEY ("id_zawodnika") REFERENCES "Zawodnik" ("id_zawodnika") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Zawody_grupowe" ADD CONSTRAINT "uczestniczy" FOREIGN KEY ("id_druzyny") REFERENCES "Drużyna" ("id_druzyny") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Zawody_grupowe" ADD CONSTRAINT "uczestniczą" FOREIGN KEY ("id_zawodow") REFERENCES "Zawody" ("id_zawodow") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Rezerwacja" ADD CONSTRAINT "zawiera" FOREIGN KEY ("id_pakietu") REFERENCES "Pakiet" ("id_pakietu") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Dyżury" ADD CONSTRAINT "pełni" FOREIGN KEY ("id_pracownika") REFERENCES "Pracownik" ("id_pracownika") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Zawodnik" ADD CONSTRAINT "zapisuje się jako" FOREIGN KEY ("id_zawodnika") REFERENCES "Klient" ("id_klienta") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Rezerwacja" ADD CONSTRAINT "może zawierać" FOREIGN KEY ("id_szkolenia") REFERENCES "Szkolenie" ("id_szkolenia") ON DELETE CASCADE ON UPDATE CASCADE
;



-- Grant permissions section -------------------------------------------------

GRANT ALL privileges on ALL TABLES IN SCHEMA "Schema2" to "administrator";
GRANT ALTER on Klient, Konto, Zawodnik to "klienci";
GRANT INSERT on Klient, Konto, Zawodnik, Szkolenie, Rezerwacja, Dyżury to "sprzedawcy";
GRANT INSERT, ALTER on Drużyna, Zawody, Pakiet, Instruktor Pracownik, Broń, Dyżury to "kierownicy";

