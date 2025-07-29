BEGIN TRANSACTION;

CREATE TYPE TipoImpiegato as ENUM('Segretario', 'Direttore', 'Progettista', 'Progettista-Responsabile');

CREATE TYPE Genere as ENUM('Uomo', 'Donna');

CREATE TYPE TipoPersona as ENUM('Studente', 'Impiegato');

CREATE DOMAIN Stringa as varchar(255);

CREATE DOMAIN RealGEZ as real
        check (value >= 0);

CREATE DOMAIN CodiceFiscale as char(16)
        check (value ~'[A-Z]{6}[0-9]{2}[A-Z]{1}[0-9]{2}[A-Z]{1}[0-9]{3}[A-Z]{1}');

CREATE DOMAIN IntGEZ as integer
        check (value >= 0);

SET CONSTRAINTS ALL DEFERRED;

CREATE TABLE PosizioneMilitare (
    id IntGEZ PRIMARY KEY,
    nome Stringa UNIQUE NOT NULL
);

CREATE TABLE Studente (
    matricola varchar(12) PRIMARY KEY
);

CREATE TABLE Progetto (
    nome Stringa NOT NULL,
    id IntGEZ PRIMARY KEY
);

CREATE TABLE Impiegato (
    stipendio RealGEZ NOT NULL,
    tipo TipoImpiegato NOT NULL,
    id IntGEZ PRIMARY KEY,
    progetto IntGEZ,
    FOREIGN KEY (progetto)
        REFERENCES progetto(id) DEFERRABLE
);

CREATE TABLE Persona (
    nome Stringa NOT NULL,
    cognome Stringa NOT NULL,
    cf CodiceFiscale PRIMARY KEY,
    nascita date NOT NULL,
    genere Genere NOT NULL,
    maternita IntGEZ,
    studente varchar(12),
    impiegato IntGEZ,
    posizionemilitare IntGEZ,
    FOREIGN KEY (studente)
        REFERENCES studente(matricola) DEFERRABLE,
    FOREIGN KEY (impiegato)
        REFERENCES impiegato(id) DEFERRABLE,
    FOREIGN KEY (posizionemilitare)
        REFERENCES PosizioneMilitare(id) DEFERRABLE
);

COMMIT;