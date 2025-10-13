--1
SELECT posizione, count(posizione) numero_strutturati
FROM persona
GROUP BY persona.posizione;

--2
SELECT  count(persona) numero_strutturati
FROM persona
WHERE persona.stipendio >= 40000;

--3
SELECT count(id) numero_progetti
FROM progetto
WHERE progetto.budget > 50000
AND progetto.fine < CURRENT_DATE;

--4
SELECT nome, max(oredurata) massimo_ore, min(oredurata) minimo_ore, (avg(oredurata)::numeric, 2) media_ore
FROM attivitaprogetto, progetto
WHERE progetto.nome = 'Pegasus'
AND progetto.id = attivitaprogetto.progetto
GROUP BY (progetto.nome);

--5
SELECT persona.nome, persona. cognome, max(oredurata) massimo_ore, min(oredurata) minimo_ore, avg(oredurata) media_ore
FROM attivitaprogetto, progetto, persona
WHERE progetto.nome = 'Pegasus'
AND progetto.id = attivitaprogetto.progetto
AND attivitaprogetto.id = persona.id
GROUP BY (persona.nome, persona. cognome);

--6
SELECT nome, cognome, sum(oredurata) numero_ore
FROM attivitanonprogettuale, persona
WHERE attivitanonprogettuale.tipo = 'Didattica'
AND attivitanonprogettuale.persona = persona.id
GROUP BY (persona.nome, persona.cognome);

--7
SELECT  round(avg(persona.stipendio)::numeric, 2) media_stipendi
FROM persona
WHERE persona.posizione = 'Ricercatore';

--8
SELECT persona.posizione posizione, max(persona.stipendio) massimo_stipendio, min(persona.stipendio) minimo_stipendio, round(avg(persona.stipendio)::numeric, 2) media_stipendi
FROM persona
GROUP BY persona.posizione;

--9
SELECT progetto.nome progetto, sum(attivitaprogetto.oredurata) ore_lavorate
FROM progetto, persona, attivitaprogetto
WHERE persona.nome = 'Ginevra' 
AND persona.cognome = 'Riva' 
AND persona.id = attivitaprogetto.persona
GROUP BY (progetto.nome);

--10
SELECT DISTINCT progetto.nome progetto
FROM progetto, attivitaprogetto as ap1, attivitaprogetto as ap2
WHERE ap2.progetto = ap1.progetto
AND ap1.progetto = progetto.id
AND (
    SELECT count(attivitaprogetto.persona)
    FROM attivitaprogetto
    WHERE ap1.persona <> ap2.persona
) > 2;

--11
SELECT DISTINCT persona.nome, persona.cognome
FROM persona, progetto, attivitaprogetto as ap1, attivitaprogetto as ap2
WHERE ap1.progetto <> ap2.progetto
AND ap1.persona = ap2.persona
AND ap2.persona = persona.id
AND persona.posizione = 'Professore Associato'
GROUP BY (persona.nome, persona.cognome);