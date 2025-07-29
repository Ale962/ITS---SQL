-- database cielo


CREATE DOMAIN posinteger AS INTEGER
	CHECK (VALUE >= 0);
	
CREATE DOMAIN stringam AS VARCHAR(100);

CREATE DOMAIN codITA AS CHARACTER(3);

BEGIN TRANSACTION;
SET constraints all deferred;

CREATE TABLE compagnia (
	nome stringam PRIMARY KEY,
	annofondaz posinteger
);

CREATE TABLE volo (
	codice posinteger NOT NULL,
	comp stringam NOT NULL,
	PRIMARY KEY (codice, comp),
	durataMinuti posinteger NOT NULL,
	FOREIGN KEY (comp)
		REFERENCES compagnia(nome) DEFERRABLE
);

CREATE TABLE aeroporto (
	codice codITA PRIMARY KEY,
	nome stringam NOT NULL
);

CREATE TABLE luogoaeroporto (
	aeroporto codITA PRIMARY KEY,
	citta stringam NOT NULL,
	nazione stringam NOT NULL,
	FOREIGN KEY (aeroporto)
		REFERENCES aeroporto(codice) ON DELETE CASCADE DEFERRABLE
);

ALTER TABLE aeroporto
	ADD CONSTRAINT aeroporto_luogoaeroporto_fk
		FOREIGN KEY (codice)
			REFERENCES luogoaeroporto(aeroporto) ON DELETE CASCADE DEFERRABLE;

CREATE TABLE arrpart (
	codice posinteger NOT NULL,
	comp stringam NOT NULL,
	PRIMARY KEY (codice, comp),
	FOREIGN KEY (codice, comp)
		REFERENCES volo(codice, comp) DEFERRABLE,
	partenza codITA NOT NULL,
	arrivo codITA NOT NULL
);

ALTER TABLE volo 
	ADD CONSTRAINT volo_arrpart_fk
	FOREIGN KEY (codice, comp)
		REFERENCES arrpart(codice, comp) DEFERRABLE;

COMMIT;