CREATE DATABASE voli_aerei;

BEGIN TRANSACTION;

CREATE DOMAIN StringaM as VARCHAR(100);

CREATE DOMAIN intGE as INTEGER DEFAULT 1900
    CHECK (value >= 1900);

CREATE DOMAIN intGZ as INTEGER DEFAULT 1
    CHECK (value > 0);

CREATE DOMAIN intGEZ as INTEGER DEFAULT 0
    CHECK (value >= 0);

CREATE TABLE nazione (
    nome StringaM NOT NULL,
    id StringaM NOT NULL PRIMARY KEY
);

CREATE TABLE citta (
    nome StringaM NOT NULL,
    abitanti intGZ NOT NULL,
    id StringaM NOT NULL PRIMARY KEY,
    nazione StringaM NOT NULL,
        FOREIGN KEY (nazione)
            REFERENCES nazione(id) DEFERRABLE
);

CREATE TABLE compagnia (
    nome StringaM NOT NULL,
    anno intGE NOT NULL,
    id StringaM NOT NULL PRIMARY KEY,
    citta StringaM NOT NULL,
        FOREIGN KEY (citta)
            REFERENCES citta(id) DEFERRABLE
);

CREATE TABLE aeroporto (
    nome StringaM NOT NULL,
    codice StringaM NOT NULL PRIMARY KEY,
    citta StringaM NOT NULL,
        FOREIGN KEY (citta)
            REFERENCES citta(id) DEFERRABLE
);

CREATE TABLE volo (
    codice StringaM NOT NULL PRIMARY KEY,
    durata_min intGZ NOT NULL,
    compagnia StringaM NOT NULL,
        FOREIGN KEY (compagnia)
            REFERENCES compagnia(id) DEFERRABLE,
    partenza StringaM NOT NULL,
        FOREIGN KEY (partenza)
            REFERENCES aeroporto(codice) DEFERRABLE,
    arrivo StringaM NOT NULL,
        FOREIGN KEY (arrivo)
            REFERENCES aeroporto(codice) DEFERRABLE,
    CONSTRAINT check_destinazione_diversa 
        CHECK (partenza <> arrivo)
);

COMMIT;