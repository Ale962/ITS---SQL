BEGIN TRANSACTION;

CREATE DOMAIN CodiceFiscale as char(16)
        check (value ~'[A-Z]{6}[0-9]{2}[A-Z]{1}[0-9]{2}[A-Z]{1}[0-9]{3}[A-Z]{1}');

CREATE DOMAIN PartitaIVA as char(11)
        check (value ~'[0-9]{11}');

CREATE DOMAIN Telefono as char(9)
        check (value ~'[0-9]{9}');

CREATE DOMAIN email as varchar(255)
        check ( value like '%@%.%' );

CREATE TYPE StatoOrdineEnum as ENUM('In Preparazione',' Inviato', 'Da Saldare', 'Saldato');

CREATE DOMAIN stringa as varchar(100);

CREATE DOMAIN CAP as char(5)
        check (value ~ '[0-9]{5}');

CREATE TYPE indirizzo as (
        via stringa,
        civico stringa,
        CAP CAP
);

CREATE DOMAIN IntGEZ as integer
        check (value >= 0);

CREATE DOMAIN RealGEZ as real
        check (value >= 0);

CREATE DOMAIN Real0_1 as real
        check (value >= 0 and value <= 1);

COMMIT;