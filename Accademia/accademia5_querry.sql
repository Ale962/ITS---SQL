BEGIN TRANSACTION;

--1
SELECT wp.nome, wp.inizio, wp.fine
FROM wp, progetto
WHERE progetto.nome = 'Pegasus' 
AND progetto.id = wp.progetto;

--2
SELECT DISTINCT persona.nome, persona.cognome 
FROM attivitaprogetto, progetto, persona
WHERE progetto.nome = 'Pegasus' 
AND progetto.id = attivitaprogetto.progetto 
AND attivitaprogetto.persona = persona.id;

--3
SELECT DISTINCT persona.nome, persona.cognome 
FROM attivitaprogetto, progetto, persona
WHERE progetto.nome = 'Pegasus' 
AND progetto.id = attivitaprogetto.progetto 
AND (
    SELECT COUNT(persona)
    FROM attivitaprogetto
    WHERE progetto.id = attivitaprogetto.progetto
    AND persona.id = attivitaprogetto.persona
) > 1;

--4
SELECT DISTINCT persona.nome, persona.cognome, persona.posizione
FROM assenza, persona
WHERE assenza.tipo = 'Malattia' 
AND assenza.persona = persona.id 
AND persona.posizione = 'Professore Ordinario';

--5
SELECT DISTINCT persona.nome, persona.cognome, persona.posizione
FROM assenza, persona
WHERE assenza.tipo = 'Malattia' 
AND assenza.persona = persona.id 
AND persona.posizione = 'Professore Ordinario'
AND (
    SELECT COUNT(persona)
    FROM assenza
    WHERE assenza.persona = persona.id
) > 1;

--6
SELECT DISTINCT persona.nome, persona.cognome, persona.posizione
FROM attivitanonprogettuale, persona
WHERE attivitanonprogettuale.tipo = 'Didattica'
AND attivitanonprogettuale.persona = persona.id
AND persona.posizione = 'Ricercatore';

--7
SELECT DISTINCT persona.nome, persona.cognome, persona.posizione
FROM attivitanonprogettuale, persona
WHERE attivitanonprogettuale.tipo = 'Didattica'
AND attivitanonprogettuale.persona = persona.id
AND persona.posizione = 'Ricercatore'
AND (
    SELECT COUNT(tipo)
    FROM attivitanonprogettuale
    WHERE attivitanonprogettuale.persona = persona.id
) > 1;

--8
SELECT DISTINCT persona.nome, persona.cognome
FROM attivitanonprogettuale, attivitaprogetto, persona
WHERE attivitanonprogettuale.giorno = attivitaprogetto.giorno
AND attivitanonprogettuale.persona = attivitaprogetto.persona
AND attivitaprogetto.persona = persona.id;

--9
SELECT DISTINCT persona.nome, persona.cognome, attivitanonprogettuale.giorno as giorno, attivitanonprogettuale.tipo as attivitanp, attivitanonprogettuale.oredurata as orenp, progetto.nome as progetto, attivitaprogetto.oredurata as orep
FROM attivitanonprogettuale, attivitaprogetto, persona, progetto
WHERE attivitanonprogettuale.giorno = attivitaprogetto.giorno
AND attivitanonprogettuale.persona = attivitaprogetto.persona
AND attivitaprogetto.persona = persona.id
AND attivitaprogetto.id = progetto.id;

--10
SELECT DISTINCT persona.nome, persona.cognome
FROM persona, assenza, attivitaprogetto
WHERE attivitaprogetto.giorno = assenza.giorno
AND assenza.persona = persona.id;

--11
SELECT DISTINCT persona.nome, persona.cognome, assenza.giorno as giorno, assenza.tipo as causa, progetto.nome as progetto, attivitaprogetto.oredurata as ore
FROM persona, assenza, attivitaprogetto, progetto
WHERE attivitaprogetto.giorno = assenza.giorno
AND assenza.persona = persona.id
AND attivitaprogetto.progetto = progetto.id;

--12
SELECT DISTINCT wp1.nome
FROM wp wp1, wp wp2
WHERE wp1.nome = wp2.nome
AND wp1.progetto <> wp2.progetto;

COMMIT;