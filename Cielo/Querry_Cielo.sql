--1
SELECT DISTINCT codice, comp 
FROM volo
WHERE volo.durataMinuti > 180;

--2
SELECT DISTINCT comp 
FROM volo
WHERE volo.durataMinuti > 180;

--3
SELECT codice, comp 
FROM arrpart
WHERE arrpart.partenza = 'CIA';

--4
SELECT DISTINCT comp 
FROM arrpart
WHERE arrpart.arrivo = 'FCO';

--5
SELECT DISTINCT codice, comp 
FROM arrpart
WHERE arrpart.partenza = 'FCO'
AND arrpart.arrivo = 'JFK';

--6
SELECT DISTINCT comp 
FROM arrpart
WHERE arrpart.partenza = 'FCO'
AND arrpart.arrivo = 'JFK';

--7
SELECT DISTINCT arrpart.comp 
FROM arrpart, luogoaeroporto as luogo1, luogoaeroporto as luogo2
WHERE arrpart.partenza = luogo1.aeroporto
AND luogo1.citta = 'Roma'
AND arrpart.arrivo = luogo2.aeroporto
AND luogo2.citta = 'New York';

--8
SELECT DISTINCT aeroporto.codice, aeroporto.nome, luogoaeroporto.citta 
FROM aeroporto, luogoaeroporto, arrpart
WHERE luogoaeroporto.aeroporto = aeroporto.codice 
AND arrpart.partenza = aeroporto.codice 
AND arrpart.comp = 'MagicFly' ;

--9
SELECT DISTINCT arrpart.codice, arrpart.comp, arrpart.partenza, arrpart.arrivo 
FROM arrpart, luogoaeroporto as luogo1, luogoaeroporto as luogo2
WHERE luogo1.citta = 'Roma' 
AND luogo1.aeroporto = arrpart.partenza 
AND luogo2.citta = 'New York' 
AND luogo2.aeroporto = arrpart.arrivo;

--10
SELECT DISTINCT aereo1.comp, aereo1.codice, aereo1.partenza, aereo1.arrivo as scalo, aereo2.codice, aereo2.arrivo
FROM arrpart as aereo1, arrpart as aereo2, luogoaeroporto as luogo1, luogoaeroporto as luogo2
WHERE luogo1.citta = 'Roma' 
AND luogo2.citta = 'New York' 
AND aereo1.partenza = luogo1.aeroporto 
AND aereo1.arrivo <> luogo2.aeroporto 
AND aereo2.partenza = aereo1.arrivo 
AND aereo2.arrivo = luogo2.aeroporto 
AND aereo1.comp = aereo2.comp;


--11
SELECT DISTINCT compagnia.nome
FROM arrpart, compagnia
WHERE arrpart.partenza = 'FCO' 
AND arrpart.arrivo = 'JFK' 
AND arrpart.comp = compagnia.nome
AND compagnia.annofondaz IS NOT NULL;