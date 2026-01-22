CREATE DOMAIN CodiceFiscale as varchar(100);

CREATE TABLE persona (
    nome varchar(100)
    cf CodiceFiscale NOT NULL
    primary key (cf)
);

CREATE TABLE corsodilaurea (
    id integer PRIMARY KEY,
    nome varchar(100)
);

CREATE TABLE dipartimento (
    id integer PRIMARY KEY,
    nome varchar(100)
);

CREATE TABLE studente (
    matricola varchar(12) NOT NULL UNIQUE,
    cf CodiceFiscale PRIMARY KEY,
        FOREIGN KEY (cf) 
            REFERENCES persona(cf) DEFERRABLE,
    corsolaurea integer NOT NULL,
        FOREIGN KEY (corsolaurea)
            REFERENCES corsodilaurea(id) DEFERRABLE
);

CREATE TABLE docente (
    nascita date NOT NULL,
    cf CodiceFiscale NOT NULL PRIMARY KEY,
        FOREIGN KEY (cf) 
            REFERENCES persona(cf) DEFERRABLE,
    dipartimento integer NOT NULL,
        FOREIGN KEY (dipartimento)
            REFERENCES dipartimento(id) DEFERRABLE
);