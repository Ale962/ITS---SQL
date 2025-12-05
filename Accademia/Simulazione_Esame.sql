SELECT DISTINCT *
FROM progetto
WHERE progetto.fine > '2023-12-31';

SELECT count(persona), posizione
FROM persona
GROUP BY posizione;

SELECT DISTINCT persona.id, persona.nome, persona.cognome
FROM persona, assenza
WHERE assenza.tipo = 'Malattia'
AND assenza.persona = persona.id;

SELECT count(assenza), tipo
FROM assenza
GROUP BY tipo;

SELECT max(stipendio) stipendio_massimo
FROM persona
WHERE persona.posizione = 'Professore Ordinario';

SELECT tipo, id, oredurata
FROM attivitaprogetto
WHERE attivitaprogetto.persona = 1
AND attivitaprogetto.progetto = 4
ORDER BY attivitaprogetto.oredurata DESC;

SELECT persona.nome, persona.cognome, assenza.tipo, count(giorno)
FROM assenza, persona
WHERE assenza.persona = persona.id
GROUP BY (assenza.tipo, persona.nome, persona.cognome);

SELECT persona.id, persona.nome, persona.cognome
FROM persona
WHERE persona.posizione = 'Professore Ordinario'
AND (
    SELECT max(stipendio)
    FROM persona
    WHERE persona.posizione = 'Professore Ordinario'
) = persona.stipendio;

SELECT sum(oredurata), attivitaprogetto.tipo
FROM attivitaprogetto
WHERE attivitaprogetto.persona = 3
AND (
    SELECT sum(oredurata)
    FROM attivitaprogetto
    WHERE attivitaprogetto.persona = 3
) <= 3
GROUP BY attivitaprogetto.tipo;

SELECT DISTINCT persona.id, persona.nome, persona.cognome
FROM persona, assenza
WHERE assenza.tipo <> 'Chiusura Universitaria'
AND assenza.persona = persona.id;