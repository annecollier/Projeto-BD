-- 1. COMANDOS DDL (ESTRUTURA)

-- [1] ALTER TABLE
ALTER TABLE Palco RENAME COLUMN local TO local_palco;
ALTER TABLE Instrumento ADD Modelo VARCHAR2(50);

-- [2] CREATE INDEX
CREATE INDEX idx_banda_nome ON Banda (nome_banda);
CREATE INDEX idx_apres_cache ON Apresentacao (cache_combinado);

-- [25] CREATE VIEW
CREATE OR REPLACE VIEW lineup AS
SELECT f.nome_festival AS Nome_Festival, p.nome_palco AS Palco, b.nome_banda AS Banda, 
       a.hora_inicio AS Inicio, a.hora_fim AS Fim
FROM Apresentacao a
INNER JOIN Banda b ON a.banda = b.id_banda
INNER JOIN Palco p ON a.palco = p.id_palco
INNER JOIN Festival f ON p.festival = f.id_festival;

-- 2. COMANDOS DML (MANIPULAÇÃO DE DADOS)

-- [3] INSERT INTO (Exemplo de nova apresentação)
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) 
VALUES (8, 2, TO_TIMESTAMP('2026-09-12 20:00', 'YYYY-MM-DD HH24:MI'), 
        TO_TIMESTAMP('2026-09-12 21:30', 'YYYY-MM-DD HH24:MI'), 35000, 140000.00);

-- [4] UPDATE (Aumento de 10% para as bandas com mais público - Ajustado para Oracle)
UPDATE Apresentacao
SET cache_combinado = cache_combinado * 1.1
WHERE banda IN (
    SELECT banda FROM (
        SELECT banda FROM Apresentacao ORDER BY publico_presente DESC
    ) WHERE ROWNUM <= 5
);

-- [5] DELETE
DELETE FROM Equipamento_de_palco
WHERE id_equipamento NOT IN (SELECT equipamento FROM Utiliza);

-- 3. CONSULTAS E FILTROS BÁSICOS

-- [6] SELECT-FROM-WHERE
SELECT NOME_FESTIVAL, DATA_INICIO, DATA_FIM From festival WHERE LOCAL = 'Recife';

-- [7] BETWEEN e [21] ORDER BY
SELECT B.nome_banda, A.cache_combinado, F.nome_festival 
FROM Banda B 
INNER JOIN Apresentacao A ON B.id_banda = A.banda 
WHERE A.cache_combinado BETWEEN 100000 AND 200000 
ORDER BY A.cache_combinado ASC;

-- [8] IN
SELECT nome_banda, genero FROM BANDA WHERE genero IN ('Rock', 'Metal', 'Punk');

-- [9] LIKE
SELECT nome_festival FROM Festival WHERE nome_festival LIKE '%Rock%';

-- [10] IS NULL ou IS NOT NULL
SELECT nome_banda FROM Banda WHERE madrinha IS NULL;

-- 4. JUNÇÕES, AGRUPAMENTOS E AGREGAÇÃO

-- [11] INNER JOIN, [15] COUNT, [22] GROUP BY
SELECT B.genero, COUNT(DISTINCT B.id_banda) AS qtd_bandas, SUM(A.publico_presente) AS total_publico
FROM Banda B
INNER JOIN Apresentacao A ON B.id_banda = A.banda
GROUP BY B.genero;

-- [16] LEFT/RIGHT/FULL OUTER JOIN
SELECT M.nome, I.tipo
FROM Membro M 
LEFT OUTER JOIN Instrumento I ON M.CPF = I.MEMBRO 
ORDER BY I.tipo;

-- [23] HAVING
SELECT P.nome_palco, COUNT(*) AS QUANTIDADE_SHOWS
FROM PALCO P 
INNER JOIN APRESENTACAO A ON A.palco = P.id_palco
GROUP BY P.nome_palco HAVING COUNT(*) > 3;

-- [12] MAX e [13] MIN e [14] AVG
SELECT MAX(cache_combinado), MIN(cache_combinado), AVG(publico_presente) FROM Apresentacao;

-- 5. SUBCONSULTAS E OPERAÇÕES DE CONJUNTO

-- [17] SUBCONSULTA COM OPERADOR RELACIONAL (>)
SELECT nome_banda FROM Apresentacao A JOIN Banda B ON A.banda = B.id_banda
WHERE publico_presente > (SELECT AVG(publico_presente) FROM Apresentacao);

-- [18] SUBCONSULTA COM IN
SELECT nome FROM Membro WHERE banda IN (SELECT banda FROM Apresentacao);

-- [19] SUBCONSULTA COM ANY
SELECT nome_banda, cache_combinado FROM Apresentacao A JOIN Banda B ON A.banda = B.id_banda
WHERE cache_combinado > ANY (SELECT cache_combinado FROM Apresentacao WHERE banda IN (SELECT id_banda FROM Banda WHERE genero = 'Sertanejo'));

-- [20] SUBCONSULTA COM ALL
SELECT * FROM Apresentacao WHERE publico_presente >= ALL (SELECT publico_presente FROM Apresentacao);

-- [24] UNION ou INTERSECT ou MINUS
SELECT genero FROM Banda WHERE id_banda IN (SELECT banda FROM Apresentacao WHERE palco = 1)
INTERSECT
SELECT genero FROM Banda WHERE id_banda IN (SELECT banda FROM Apresentacao WHERE palco = 15);

-- 6. SEGURANÇA

-- [26] GRANT / REVOKE
GRANT SELECT ON lineup TO PUBLIC;
REVOKE SELECT ON lineup FROM PUBLIC;

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 2, TO_TIMESTAMP('2026-09-12 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-12 21:30', 'YYYY-MM-DD HH24:MI'), 35000, 140000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 1, TO_TIMESTAMP('2026-09-15 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-15 20:30', 'YYYY-MM-DD HH24:MI'), 60000, 200000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 2, TO_TIMESTAMP('2026-09-18 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-18 19:30', 'YYYY-MM-DD HH24:MI'), 25000, 95000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 3, TO_TIMESTAMP('2026-03-26 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-26 22:30', 'YYYY-MM-DD HH24:MI'), 45000, 160000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 4, TO_TIMESTAMP('2026-03-27 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-27 23:59', 'YYYY-MM-DD HH24:MI'), 20000, 180000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 5, TO_TIMESTAMP('2026-02-15 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-15 23:30', 'YYYY-MM-DD HH24:MI'), 15000, 75000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 6, TO_TIMESTAMP('2026-02-16 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-17 00:30', 'YYYY-MM-DD HH24:MI'), 30000, 150000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 7, TO_TIMESTAMP('2026-04-19 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-20 00:30', 'YYYY-MM-DD HH24:MI'), 8000, 90000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 8, TO_TIMESTAMP('2026-04-19 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 21:30', 'YYYY-MM-DD HH24:MI'), 5000, 60000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 9, TO_TIMESTAMP('2026-06-12 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 19:30', 'YYYY-MM-DD HH24:MI'), 38000, 150000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 10, TO_TIMESTAMP('2026-06-12 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 21:30', 'YYYY-MM-DD HH24:MI'), 15000, 120000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 11, TO_TIMESTAMP('2026-07-25 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-25 23:30', 'YYYY-MM-DD HH24:MI'), 48000, 80000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 12, TO_TIMESTAMP('2026-07-26 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-26 21:30', 'YYYY-MM-DD HH24:MI'), 18000, 65000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 13, TO_TIMESTAMP('2026-01-31 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 23:30', 'YYYY-MM-DD HH24:MI'), 58000, 350000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 14, TO_TIMESTAMP('2026-01-31 01:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 03:00', 'YYYY-MM-DD HH24:MI'), 25000, 220000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 15, TO_TIMESTAMP('2026-10-11 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-12 01:00', 'YYYY-MM-DD HH24:MI'), 75000, 400000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 16, TO_TIMESTAMP('2026-10-12 00:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-12 02:00', 'YYYY-MM-DD HH24:MI'), 30000, 190000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 17, TO_TIMESTAMP('2026-11-20 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 00:30', 'YYYY-MM-DD HH24:MI'), 9500, 70000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 18, TO_TIMESTAMP('2026-11-21 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 21:00', 'YYYY-MM-DD HH24:MI'), 2500, 35000.00);


INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 19, TO_TIMESTAMP('2026-09-29 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-29 23:30', 'YYYY-MM-DD HH24:MI'), 65000, 320000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 20, TO_TIMESTAMP('2026-09-28 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-28 19:30', 'YYYY-MM-DD HH24:MI'), 28000, 85000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (6, 21, TO_TIMESTAMP('2026-05-15 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 20:30', 'YYYY-MM-DD HH24:MI'), 42000, 130000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (15, 22, TO_TIMESTAMP('2026-05-15 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 18:00', 'YYYY-MM-DD HH24:MI'), 9000, 45000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 23, TO_TIMESTAMP('2026-07-06 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-06 21:30', 'YYYY-MM-DD HH24:MI'), 50000, 95000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 24, TO_TIMESTAMP('2026-07-06 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-07 01:00', 'YYYY-MM-DD HH24:MI'), 20000, 250000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 25, TO_TIMESTAMP('2026-01-20 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-20 23:30', 'YYYY-MM-DD HH24:MI'), 48000, 160000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 26, TO_TIMESTAMP('2026-01-21 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-21 22:30', 'YYYY-MM-DD HH24:MI'), 19000, 140000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 27, TO_TIMESTAMP('2026-10-16 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 23:30', 'YYYY-MM-DD HH24:MI'), 38000, 130000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 28, TO_TIMESTAMP('2026-10-17 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-17 21:30', 'YYYY-MM-DD HH24:MI'), 12000, 70000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 27, TO_TIMESTAMP('2026-10-15 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-15 22:30', 'YYYY-MM-DD HH24:MI'), 35000, 145000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (13, 29, TO_TIMESTAMP('2026-05-21 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-21 21:30', 'YYYY-MM-DD HH24:MI'), 9000, 20000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (13, 30, TO_TIMESTAMP('2026-05-22 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-22 20:30', 'YYYY-MM-DD HH24:MI'), 4500, 15000.00);

COMMIT;


INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 1, TO_TIMESTAMP('2026-09-16 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-16 21:30', 'YYYY-MM-DD HH24:MI'), 75000, 180000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 2, TO_TIMESTAMP('2026-09-16 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-16 19:30', 'YYYY-MM-DD HH24:MI'), 30000, 90000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 1, TO_TIMESTAMP('2026-09-19 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-20 01:00', 'YYYY-MM-DD HH24:MI'), 90000, 350000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 3, TO_TIMESTAMP('2026-03-25 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-25 18:30', 'YYYY-MM-DD HH24:MI'), 35000, 100000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 4, TO_TIMESTAMP('2026-03-26 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-26 20:30', 'YYYY-MM-DD HH24:MI'), 18000, 85000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 3, TO_TIMESTAMP('2026-03-27 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-27 21:30', 'YYYY-MM-DD HH24:MI'), 40000, 160000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 6, TO_TIMESTAMP('2026-02-16 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-16 21:30', 'YYYY-MM-DD HH24:MI'), 28000, 95000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 5, TO_TIMESTAMP('2026-02-17 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-17 22:30', 'YYYY-MM-DD HH24:MI'), 14000, 65000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (6, 7, TO_TIMESTAMP('2026-04-18 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-18 20:30', 'YYYY-MM-DD HH24:MI'), 7500, 80000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 8, TO_TIMESTAMP('2026-04-19 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 19:30', 'YYYY-MM-DD HH24:MI'), 4000, 35000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 7, TO_TIMESTAMP('2026-04-19 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 22:30', 'YYYY-MM-DD HH24:MI'), 8000, 110000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 9, TO_TIMESTAMP('2026-06-12 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 17:30', 'YYYY-MM-DD HH24:MI'), 25000, 120000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 10, TO_TIMESTAMP('2026-06-12 17:30', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 19:00', 'YYYY-MM-DD HH24:MI'), 12000, 75000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 9, TO_TIMESTAMP('2026-06-12 22:30', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 23:59', 'YYYY-MM-DD HH24:MI'), 35000, 170000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 11, TO_TIMESTAMP('2026-07-18 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-18 21:30', 'YYYY-MM-DD HH24:MI'), 40000, 135000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 12, TO_TIMESTAMP('2026-07-22 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-22 20:30', 'YYYY-MM-DD HH24:MI'), 19000, 85000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 11, TO_TIMESTAMP('2026-07-27 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-27 22:30', 'YYYY-MM-DD HH24:MI'), 45000, 160000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 13, TO_TIMESTAMP('2026-01-30 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-30 19:30', 'YYYY-MM-DD HH24:MI'), 42000, 130000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 14, TO_TIMESTAMP('2026-01-30 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 01:00', 'YYYY-MM-DD HH24:MI'), 22000, 180000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 13, TO_TIMESTAMP('2026-01-31 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 20:30', 'YYYY-MM-DD HH24:MI'), 48000, 110000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 15, TO_TIMESTAMP('2026-10-11 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-11 22:00', 'YYYY-MM-DD HH24:MI'), 65000, 250000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 16, TO_TIMESTAMP('2026-10-10 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-10 23:00', 'YYYY-MM-DD HH24:MI'), 28000, 200000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 17, TO_TIMESTAMP('2026-11-20 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-20 21:30', 'YYYY-MM-DD HH24:MI'), 8500, 65000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 18, TO_TIMESTAMP('2026-11-21 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 23:30', 'YYYY-MM-DD HH24:MI'), 3000, 90000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 19, TO_TIMESTAMP('2026-09-28 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-28 23:30', 'YYYY-MM-DD HH24:MI'), 55000, 80000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 20, TO_TIMESTAMP('2026-09-29 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-29 20:30', 'YYYY-MM-DD HH24:MI'), 25000, 120000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 21, TO_TIMESTAMP('2026-05-15 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 17:30', 'YYYY-MM-DD HH24:MI'), 35000, 50000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 22, TO_TIMESTAMP('2026-05-15 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 22:30', 'YYYY-MM-DD HH24:MI'), 10000, 130000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 24, TO_TIMESTAMP('2026-07-05 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-05 22:00', 'YYYY-MM-DD HH24:MI'), 18000, 170000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 23, TO_TIMESTAMP('2026-07-06 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-06 19:30', 'YYYY-MM-DD HH24:MI'), 45000, 140000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 25, TO_TIMESTAMP('2026-01-20 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-20 20:30', 'YYYY-MM-DD HH24:MI'), 42000, 135000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 26, TO_TIMESTAMP('2026-01-21 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-22 00:30', 'YYYY-MM-DD HH24:MI'), 19000, 300000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 27, TO_TIMESTAMP('2026-10-16 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 20:30', 'YYYY-MM-DD HH24:MI'), 32000, 100000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 28, TO_TIMESTAMP('2026-10-17 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-17 19:30', 'YYYY-MM-DD HH24:MI'), 14000, 85000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 27, TO_TIMESTAMP('2026-10-15 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 00:30', 'YYYY-MM-DD HH24:MI'), 35000, 160000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 29, TO_TIMESTAMP('2026-05-20 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-20 22:30', 'YYYY-MM-DD HH24:MI'), 9500, 130000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 30, TO_TIMESTAMP('2026-05-22 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-22 22:30', 'YYYY-MM-DD HH24:MI'), 4800, 60000.00);

COMMIT;
