--1
SELECT aeroporto.nome aeroporto, count(DISTINCT ap.comp) 
FROM arrpart as ap, aeroporto
WHERE ap.partenza = aeroporto.codice
OR ap.arrivo = aeroporto.codice
GROUP BY aeroporto.codice;

--2
SELECT aeroporto.nome aeroporto, count(arrpart.codice) numero_voli
FROM aeroporto, arrpart, volo
WHERE aeroporto.codice = 'HTR'
AND arrpart.partenza = aeroporto.codice
AND arrpart.codice = volo.codice
AND volo.durataminuti > 100
GROUP BY aeroporto.nome;

--3
SELECT l.nazione nazione, count(DISTINCT l.aeroporto)
FROM arrpart as ap, luogoaeroporto as l
WHERE ap.comp = 'Apitalia'
AND (ap.partenza = l.aeroporto OR ap.arrivo = l.aeroporto)
GROUP BY l.nazione;

--4
SELECT comp, round(avg(volo.durataminuti)::numeric, 2) as media_durata, min(volo.durataminuti) minima_durata, max(volo.durataminuti) massima_durata
FROM volo
WHERE volo.comp = 'MagicFly'
GROUP BY volo.comp;

--5
SELECT ae.codice, ae.nome aeroporto, min(co.annofondaz) anno_fondazione
FROM compagnia as co, arrpart as ap, aeroporto as ae
WHERE (ap.arrivo = ae.codice OR ap.partenza = ae.codice)
AND ap.comp = co.nome
GROUP BY (ae.codice, ae.nome);

--6
SELECT lu1.nazione, count(DISTINCT lu2.nazione)
FROM arrpart as ar, luogoaeroporto as lu1, luogoaeroporto as lu2
WHERE ar.partenza = lu1.aeroporto
AND ar.arrivo = lu2.aeroporto
GROUP BY lu1.nazione;

--7
SELECT arp.codice, arp.nome, avg(v.durataMinuti) durata_media_voli
FROM volo as v, aeroporto as arp, arrpart as ar
WHERE v.codice = ar.codice
AND ar.partenza = arp.codice
GROUP BY (arp.codice, arp.nome);

--8
SELECT c.nome, sum(v.durataMinuti) durata_complessiva_voli
FROM volo as v, compagnia as c
WHERE c.annofondaz > 1950
AND c.nome = v.comp
GROUP BY (c.nome);