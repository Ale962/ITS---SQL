BEGIN TRANSACTION;

CREATE DOMAIN RealGEZ AS real
    CHECK (value >= 0);

CREATE DOMAIN Stringa AS varchar;

CREATE DOMAIN CAP AS char(5)
    check (value ~'[0-9]{5}');

CREATE TYPE indirizzo as 
    (
        via Stringa,
        civico Stringa,
        CAP CAP
);

CREATE TABLE impiegato (
    nome Stringa,
    cognome Stringa,
    nascita date,
    stipendio RealGEZ,
    id INT PRIMARY KEY
);

CREATE TABLE dipartimento (
    nome Stringa,
    indirizzo indirizzo,
    id INT PRIMARY KEY
);

CREATE TABLE afferenza (
    data_afferenza date UNIQUE,
    impiegato INT PRIMARY KEY,
        FOREIGN KEY (impiegato)
            REFERENCES impiegato(id) DEFERRABLE,
    dipartimento INT,
        FOREIGN KEY (dipartimento)
            REFERENCES dipartimento(id) DEFERRABLE
);

CREATE TABLE direzione (
    impiegato INT,
        FOREIGN KEY (impiegato)
            REFERENCES impiegato(id) DEFERRABLE,
    dipartimento INT PRIMARY KEY,
        FOREIGN KEY (dipartimento)
            REFERENCES dipartimento(id) DEFERRABLE
);

CREATE TABLE numerotelefono (
    dipartimento INT,
        FOREIGN KEY (dipartimento) 
            REFERENCES dipartimento(id) DEFERRABLE,
    telefono Stringa PRIMARY KEY
);

CREATE TABLE progetto (
    nome Stringa,
    budget RealGEZ,
    id INT PRIMARY KEY
);

CREATE TABLE coinvolto (
    impiegato INT,
        FOREIGN KEY (impiegato)
            REFERENCES impiegato(id) DEFERRABLE,
    progetto INT,
        FOREIGN KEY (progetto)
            REFERENCES progetto(id) DEFERRABLE
);

COMMIT;