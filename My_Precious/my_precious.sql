CREATE DATABASE my_precious;

BEGIN TRANSACTION;

CREATE DOMAIN stringa AS VARCHAR(100);

CREATE DOMAIN RealGEZ AS REAL
    CHECK (value >=0);

CREATE TABLE nazione (
    nome stringa NOT NULL,
    code stringa NOT NULL PRIMARY KEY
);

CREATE TABLE regione (
    nome stringa NOT NULL,
    code stringa NOT NULL PRIMARY KEY,
    nazione stringa NOT NULL,
        FOREIGN KEY (nazione)
            REFERENCES nazione(code) DEFERRABLE,
    UNIQUE (nome, nazione)
);

CREATE TABLE citta (
    nome stringa NOT NULL,
    code stringa NOT NULL PRIMARY KEY,
    regione stringa NOT NULL,
        FOREIGN KEY (regione)
            REFERENCES regione(code) DEFERRABLE,
    UNIQUE (nome, regione)
);

CREATE TABLE tecnica (
    nome stringa NOT NULL PRIMARY KEY
);

CREATE TABLE categoria (
    nome stringa NOT NULL PRIMARY KEY
);

CREATE TABLE correnteartistica (
    nome stringa NOT NULL PRIMARY KEY
);

CREATE TABLE artista (
    nome stringa NOT NULL,
    data_nascita DATE NOT NULL,
    data_morte DATE,
    id INTEGER PRIMARY KEY
);

CREATE TABLE esposizione (
    nome stringa NOT NULL,
    inizio DATE NOT NULL,
    id INTEGER NOT NULL PRIMARY KEY,
    is_temporanea BOOLEAN NOT NULL,
    is_permanente BOOLEAN NOT NULL,
    fine DATE,
    tema stringa,
    prezzo_accesso RealGEZ,
    CONSTRAINT no_temperonaea_e_permanente
        CHECK (is_temporanea <> is_permanente),
    CONSTRAINT obbligo_dati_temporanea
        CHECK ((is_temporanea = FALSE) OR (is_temporanea = TRUE AND fine IS NOT NULL AND tema IS NOT NULL AND prezzo_accesso IS NOT NULL))
);

CREATE TABLE opera (
    nome stringa NOT NULL,
    anno_realizzazione DATE,
    id INTEGER PRIMARY KEY,
    tecnica stringa NOT NULL,
        FOREIGN KEY (tecnica)
            REFERENCES tecnica(nome) DEFERRABLE,
    categoria stringa NOT NULL,
        FOREIGN KEY (categoria)
            REFERENCES categoria(nome) DEFERRABLE,
    correnteartistica stringa NOT NULL,
        FOREIGN KEY (correnteartistica)
            REFERENCES correnteartistica(nome) DEFERRABLE,
    artista INTEGER NOT NULL,
        FOREIGN KEY (artista)
            REFERENCES artista(id) DEFERRABLE
);

CREATE TABLE espone (
    inizio DATE NOT NULL,
    fine DATE,
    opera INTEGER,
        FOREIGN KEY (opera)
            REFERENCES opera(id) DEFERRABLE,
    esposizione INTEGER NOT NULL,
        FOREIGN KEY (esposizione)
            REFERENCES esposizione(id) DEFERRABLE,
    PRIMARY KEY (inizio, opera, esposizione)
);

CREATE TABLE tariffa (
    nome stringa NOT NULL,
    prezzo_base RealGEZ NOT NULL,
    id INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE biglietto (
    istante_acquisto TIME NOT NULL,
    data_validita DATE NOT NULL,
    id INTEGER NOT NULL PRIMARY KEY,
    is_extended BOOLEAN NOT NULL,
    is_standard BOOLEAN NOT NULL,
    esposizione INTEGER NOT NULL,
        FOREIGN KEY (esposizione)
            REFERENCES esposizione(id) DEFERRABLE,
    tariffa INTEGER,
        FOREIGN KEY (tariffa)
            REFERENCES tariffa(id) DEFERRABLE,
    CONSTRAINT tipo_biglietto 
        CHECK (is_extended <> is_standard)
);

COMMIT;