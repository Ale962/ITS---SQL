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

CREATE TABLE nazione (
    nome stringa NOT NULL UNIQUE,
    id IntGEZ PRIMARY KEY
);

CREATE TABLE regione (
    nome stringa NOT NULL,
    id IntGEZ PRIMARY KEY,
    nazione IntGEZ not null,
    FOREIGN KEY (nazione)
        REFERENCES nazione(id) DEFERRABLE,
        UNIQUE (nome, nazione)
);

CREATE TABLE citta (
    nome stringa NOT NULL,
    id IntGEZ PRIMARY KEY,
    regione IntGEZ NOT NULL,
    FOREIGN KEY (regione)
        REFERENCES regione(id) DEFERRABLE,
        UNIQUE (nome, regione)
);

CREATE TABLE direttore (
    nome stringa NOT NULL,
    cognome stringa NOT NULL,
    cf CodiceFiscale PRIMARY KEY,
    anniservizio IntGEZ NOT NULL,
    nascita date NOT NULL,
    citta IntGEZ NOT NULL,
    FOREIGN KEY (citta)
        REFERENCES citta(id) DEFERRABLE
);

CREATE TABLE dipartimento (
    nome stringa NOT NULL,
    indirizzo indirizzo NOT NULL,
    id IntGEZ PRIMARY KEY,
    direttore CodiceFiscale NOT NULL,
    citta IntGEZ NOT NULL,
    FOREIGN KEY (direttore)
        REFERENCES direttore(cf) DEFERRABLE,
    FOREIGN KEY (citta)
        REFERENCES citta(id) DEFERRABLE
);

CREATE TABLE StatoOrdine (
    nome stringa NOT NULL UNIQUE,
    id IntGEZ PRIMARY KEY
);

CREATE TABLE fornitore (
    regionesociale stringa NOT NULL,
    partitaiva PartitaIVA PRIMARY KEY,
    indirizzo indirizzo NOT NULL,
    telefono telefono NOT NULL,
    email email NOT NULL,
    citta IntGEZ NOT NULL,
    FOREIGN KEY (citta)
        REFERENCES citta(id) DEFERRABLE
);

CREATE TABLE ordine (
    datastipula date NOT NULL,
    imponibile RealGEZ NOT NULL,
    aliquota Real0_1 NOT NULL,
    descrizione stringa NOT NULL,
    id IntGEZ PRIMARY KEY,
    StatoOrdine IntGEZ NOT NULL,
    dipartimento IntGEZ NOT NULL,
    fornitore PartitaIVA NOT NULL,
    FOREIGN KEY (StatoOrdine)
        REFERENCES StatoOrdine(id) DEFERRABLE,
    FOREIGN KEY (dipartimento)
        REFERENCES dipartimento(id) DEFERRABLE,
    FOREIGN KEY (fornitore)
        REFERENCES fornitore(partitaiva) DEFERRABLE
);

COMMIT;