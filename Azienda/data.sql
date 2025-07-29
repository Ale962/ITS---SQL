BEGIN TRANSACTION;
SET constraints all deferred;


INSERT INTO impiegato(nome, cognome, nascita, stipendio, id) VALUES 
('Paolo', 'Ferrari', '1983-01-13', 16060.48, 1),
('Laura', 'Russo', '1979-02-04', 35640.33, 2),
('Anna', 'Colombo', '1999-06-14', 35559.93, 3),
('Giulia', 'Ricci', '1978-05-20', 39292.94, 4),
('Mario', 'Rossi', '1971-06-06', 16004.06, 5),
('Luca', 'Ferrari', '1986-01-12', 37823.82, 6),
('Giulia', 'Colombo', '1976-04-05', 37978.16, 7),
('Giulia', 'Ferrari', '1990-03-26', 49322.11, 8),
('Elena', 'Rossi', '1991-02-26', 44834.72, 9),
('Paolo', 'Esposito', '1996-06-03', 56614.53, 10),
('Mario', 'Bianchi', '1977-06-04', 42191.75, 11),
('Marco', 'Verdi', '1979-05-02', 34099.83, 12),
('Anna', 'Ferrari', '1994-01-17', 35457.91, 13),
('Giulia', 'Esposito', '2000-06-23', 38176.2, 14),
('Marco', 'Romano', '1972-01-16', 33346.44, 15),
('Elena', 'Verdi', '1983-01-30', 50013.94, 16),
('Anna', 'Bianchi', '1995-01-07', 19253.44, 17),
('Elena', 'Russo', '1979-04-13', 19963.72, 18),
('Mario', 'Romano', '1983-04-04', 53624.47, 19),
('Sara', 'Bianchi', '1986-06-28', 41381.39, 20);


INSERT INTO dipartimento(nome, indirizzo, id) VALUES
('Dipartimento_1', ROW('Via Verdi', '32', '74259'), 1),
('Dipartimento_2', ROW('Via Dante', '45', '59613'), 2),
('Dipartimento_3', ROW('Via Roma', '88', '22059'), 3),
('Dipartimento_4', ROW('Via Garibaldi', '17', '10624'), 4),
('Dipartimento_5', ROW('Via Dante', '93', '21418'), 5);


INSERT INTO afferenza(data_afferenza, impiegato, dipartimento) VALUES
('2020-02-09', 1, 1),
('2021-08-13', 2, 2),
('2023-09-17', 3, 3),
('2022-12-19', 4, 4),
('2022-10-30', 5, 5),
('2020-06-14', 6, 1),
('2024-06-30', 7, 2),
('2023-04-25', 8, 3),
('2022-02-18', 9, 4),
('2021-11-02', 10, 5),
('2024-07-10', 11, 1),
('2020-03-21', 12, 2),
('2021-01-15', 13, 3),
('2023-12-28', 14, 4),
('2022-05-06', 15, 5),
('2020-08-09', 16, 1),
('2023-10-01', 17, 2),
('2024-03-05', 18, 3),
('2020-04-26', 19, 4),
('2021-06-18', 20, 5);


INSERT INTO direzione(impiegato, dipartimento) VALUES
(7, 1),
(14, 2),
(13, 3),
(10, 4),
(4, 5);


INSERT INTO numerotelefono(dipartimento, telefono) VALUES
(1, '3478305843'),
(1, '3881234567'),
(2, '3492937955'),
(2, '3931122445'),
(2, '3669876543'),
(3, '3883557436'),
(3, '3926677889'),
(4, '3662106844'),
(4, '3709988776'),
(5, '3912846603'),
(5, '3775566443'),
(5, '3892233114');


INSERT INTO progetto(nome, budget, id) VALUES
('Progetto_1', 120794.03, 1),
('Progetto_2', 107755.39, 2),
('Progetto_3', 121108.94, 3),
('Progetto_4', 112441.79, 4),
('Progetto_5', 171916.91, 5);


INSERT INTO coinvolto(impiegato, progetto) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5);

COMMIT;