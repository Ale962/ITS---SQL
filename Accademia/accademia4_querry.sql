--1
SELECT persona.cognome
FROM persona;

--2
SELECT nome, cognome
FROM persona
WHERE persona.posizione = 'Ricercatore';

--3
SELECT persona 
FROM persona
WHERE persona.posizione = 'Professore Associato' AND persona.cognome LIKE 'V%';

--4
SELECT persona 
FROM persona
WHERE persona.posizione = 'Professore Ordinario' OR persona.posizione = 'Professore Associato' AND persona.cognome LIKE 'V%';

--5
SELECT progetto
FROM progetto
WHERE progetto.fine < CURRENT_TIMESTAMP;

--6
SELECT progetto.nome
FROM progetto
ORDER BY progetto.inizio ASC;

--7
SELECT wp.nome
FROM wp
ORDER BY wp.nome ASC;

--8
SELECT DISTINCT assenza.tipo
FROM assenza;

--9
SELECT DISTINCT attivitaprogetto.tipo
FROM attivitaprogetto;

--10
SELECT DISTINCT anp.giorno
FROM AttivitaNonProgettuale as anp
WHERE anp.tipo = 'Didattica'
ORDER BY anp.giorno ASC;