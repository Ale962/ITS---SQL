--1
SELECT DISTINCT persona.id, persona.nome, persona.cognome, persona.stipendio
FROM persona
WHERE persona.stipendio >= 40000;

--2
SELECT DISTINCT p.id, p.nome, p.cognome, p.stipendio
FROM persona AS p, attivitaprogetto AS ap
WHERE p.stipendio <= 40000
AND p.posizione = 'Ricercatore'
AND ap.persona = p.id;

--3
SELECT sum(p.budget)
FROM progetto AS p;

--4
SELECT DISTINCT p.nome, p.cognome, sum(pr.budget)
FROM persona AS p, progetto AS pr, attivitaprogetto AS at1, attivitaprogetto AS at2
WHERE p.id = at1.persona
AND at1.progetto = pr.id
AND at1.progetto <> at2.progetto
GROUP BY (p.nome, p.cognome);

--5
SELECT DISTINCT p.nome, p.cognome, count(DISTINCT ap.progetto)
FROM persona AS p, attivitaprogetto AS ap
WHERE p.posizione = 'Professore Ordinario'
AND p.id = ap.persona
GROUP BY(p.nome, p.cognome);

--6
SELECT DISTINCT p.nome, p.cognome, a.tipo, count(a.id)
FROM persona AS p, assenza AS a
WHERE p.id = a.persona
AND p.posizione = 'Professore Associato'
AND a.tipo = 'Malattia'
GROUP BY (p.nome, p.cognome, a.tipo);

--7
SELECT DISTINCT p.nome, p.cognome, sum(ap.oredurata)
FROM persona AS p, attivitaprogetto AS ap
WHERE p.id = ap.persona
AND ap.progetto = 5
GROUP BY (p.nome, p.cognome);

--8
SELECT DISTINCT p.nome, p.cognome, avg(ap.oredurata)
FROM persona AS p, attivitaprogetto AS ap
WHERE p.id = ap.persona
GROUP BY (p.nome, p.cognome);

--9
SELECT DISTINCT p.nome, p.cognome, sum(anp.oredurata)
FROM persona AS p, attivitanonprogettuale AS anp
WHERE anp.tipo = 'Didattica'
AND anp.persona = p.id
GROUP BY (p.nome, p.cognome);

--10
SELECT DISTINCT p.nome, p.cognome, sum(ap.oredurata)
FROM persona AS p, attivitaprogetto AS ap
WHERE ap.wp = 5
AND ap.progetto = 3
GROUP BY (p.nome, p.cognome);