--1



--2
WITH max_durata AS (
    SELECT avg(volo.durataminuti)
    FROM volo
)
SELECT avg(volo.durataminuti), volo.comp
FROM volo, max_durata
WHERE avg(volo.durataminuti) > max_durata
GROUP BY volo.comp
