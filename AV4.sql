ALTER TABLE Palco RENAME COLUMN local TO novo_nome?;
-- Listar os festivais realizados em recife
-- lida com Where ####WHERE#####
SELECT NOME_FESTIVAL, DATA_INICIO, DATA_FIM From festival1 WHERE LOCAL = 'Recife'
-- Filtrar as bandas que tenham arrecadado entre 100000 e 200000 reais por apresentação 
-- Lida com Inner join, Where, Between e Order By ####INNER JOIN, BETWEEN, ORDER BY#####
SELECT B.nome_banda, A.cache_combinado, F.nome_festival 
FROM Banda1 B 
INNER JOIN Apresentacao1 A ON B.id_banda = A.banda 
INNER JOIN Palco1 P ON A.palco = P.id_palco
INNER JOIN Festival1 F ON P.festival = F.id_festival
WHERE A.cache_combinado BETWEEN 100000 AND 200000 
ORDER BY A.cache_combinado ASC;
-- Filtrar as bandas de rock como um todo
-- Lida com Where e IN ####WHERE; IN ####
SELECT nome_banda AS "Bandas de Rock", genero AS "Subgenero" 
FROM BANDA1 
WHERE genero in ('Rock', 'Metal', 'Punk')
-- ###ACG, SUBQUERY RELACIONAL###O
-- Isso a gente já usa subquery com relacional e AVG tb, mas acho que seria melhor se a gente filtrasse por festival tambem, sei lá,
-- talvez fazer por percentual de preenchimento do respectivo palco, algo assim
-- Isso mostra as bandas que tiveram população maior que a media
SELECT B.nome_banda, F.NOME_FESTIVAL, A.publico_presente
FROM BANDA1 B, Apresentacao1 A, FESTIVAL1 F, PALCO1 P 
WHERE B.id_banda = A.banda 
AND A.Palco = P.id_palco
AND P.festival = F.id_festival
AND A.publico_presente > (SELECT AVG(publico_presente) FROM Apresentacao1) ORDER BY A.publico_presente DESC;
-- Gera o público por gênero musical
-- COUNT, SUM e GROUP BY
SELECT B.genero, COUNT(DISTINCT B.id_banda) AS quantidade_de_bandas, SUM(A.publico_presente) AS total_publico_gerado
FROM Banda1 B
INNER JOIN Apresentacao1 A ON B.id_banda = A.banda
GROUP BY B.genero
ORDER BY total_publico_gerado DESC;
-- Gera o nome dos palcos e seus respectivos festivais que tiveram mais de 3 shows
SELECT P.nome_palco, F.nome_festival, COUNT(*) AS QUANTIDADE_SHOWS
FROM PALCO1 P INNER JOIN APRESENTACAO1 A ON A.palco = P.id_palco inner join FESTIVAL1 F on F.id_festival = P.festival
GROUP BY P.nome_palco, F.nome_festival HAVING COUNT(*) > 3
ORDER BY QUANTIDADE_SHOWS DESC;

-- ORDER BY e OUTER JOIN
SELECT M.nome, I.tipo
FROM MEMBRO1 M LEFT OUTER JOIN INSTRUMENTO1 I 
ON I.MEMBRO = M.CPF 
ORDER BY TIPO;

-- MAX e MIN 
SELECT 
    F.nome_festival,
    Maximos.genero AS genero_mais_ouvido,
    Extremos.maior_publico,
    Minimos.genero AS genero_menos_ouvido,
    Extremos.menor_publico
FROM (
    SELECT 
        T_Sub.id_festival, 
        MAX(T_Sub.total_ouvintes) AS maior_publico,
        MIN(T_Sub.total_ouvintes) AS menor_publico
    FROM (
        SELECT 
            P.festival AS id_festival, 
            B.genero, 
            SUM(A.publico_presente) AS total_ouvintes
        FROM BANDA1 B
        INNER JOIN APRESENTACAO1 A ON A.banda = B.id_banda 
        INNER JOIN PALCO1 P ON P.id_palco = A.palco
        GROUP BY P.festival, B.genero
    ) T_Sub
    GROUP BY T_Sub.id_festival
) Extremos
INNER JOIN FESTIVAL1 F ON F.id_festival = Extremos.id_festival

INNER JOIN (
    SELECT 
        P.festival AS id_festival, 
        B.genero, 
        SUM(A.publico_presente) AS total_ouvintes
    FROM BANDA1 B
    INNER JOIN APRESENTACAO1 A ON A.banda = B.id_banda 
    INNER JOIN PALCO1 P ON P.id_palco = A.palco
    GROUP BY P.festival, B.genero
) Maximos ON Maximos.id_festival = Extremos.id_festival AND Maximos.total_ouvintes = Extremos.maior_publico

INNER JOIN (
    SELECT 
        P.festival AS id_festival, 
        B.genero, 
        SUM(A.publico_presente) AS total_ouvintes
    FROM BANDA1 B
    INNER JOIN APRESENTACAO1 A ON A.banda = B.id_banda 
    INNER JOIN PALCO1 P ON P.id_palco = A.palco
    GROUP BY P.festival, B.genero
) Minimos ON Minimos.id_festival = Extremos.id_festival AND Minimos.total_ouvintes = Extremos.menor_publico;

-- a gnt deixa os dois ss
--MAX E MIN talvez esteja muito simples, sera q reclamam se bem que é importante ter esses dados ne?
SELECT banda, cache_combinado AS maior_cache
FROM Apresentacao1
WHERE cache_combinado = (SELECT MAX(cache_combinado) FROM Apresentacao1);

SELECT banda, cache_combinado AS menor_cache
FROM Apresentacao1
WHERE cache_combinado = (SELECT MIN(cache_combinado) FROM Apresentacao1);



--LIKE
SELECT I.marca, M.nome
FROM Instrumento1 I
INNER JOIN Membro1 M
WHERE marca LIKE 'Gibson%'
    ON M.cpf = I.membro
ORDER BY I.marca;

--SUBCONSULTA COM IN
SELECT M.nome, B.nome_banda 
FROM Membro1 M 
inner join Banda1 B 
on M.banda = B.id_banda 
WHERE B.id_banda 
in (SELECT banda FROM Apresentacao1 A);

-- SUBCONSULTA COM All
-- Pegar as informações da apresentação com maior audiencia
SELECT B.nome_banda, P.nome_palco, F.NOME_FESTIVAL, A.HORA_INICIO, A.HORA_FIM, A.PUBLICO_PRESENTE, A.CACHE_COMBINADO FROM Apresentacao1 A
INNER JOIN Banda1 B ON A.banda = B.id_banda
INNER JOIN Palco1 P ON A.palco = P.id_palco 
INNER JOIN Festival1 F on F.id_festival = P.festival 
WHERE A.publico_presente >= ALL (
    SELECT publico_presente 
    FROM Apresentacao1
);

-- Subconsulta com Any
SELECT B.nome_banda, B.genero, A.cache_combinado
FROM Banda1 B
INNER JOIN Apresentacao1 A ON B.id_banda = A.banda
WHERE B.genero != 'Sertanejo' 
  AND A.cache_combinado > ANY (
      SELECT cache_combinado 
      FROM Apresentacao1 A
      INNER JOIN Banda1 B ON A.banda = B.id_banda
      WHERE B.genero = 'Sertanejo'
  );

-- IS NULL
SELECT B.nome_banda, B.genero
FROM Banda1 B
WHERE B.madrinha IS NULL;


-- Cria view da lineup do festival

CREATE VIEW lineup AS
SELECT f.nome_festival AS Nome_Festival, p.nome_palco AS Palco, b.nome_banda AS Banda, a.hora_inicio AS Inicio, a.hora_fim AS Fim
FROM Apresentacao1 a
INNER JOIN Banda1 b ON a.banda = b.id_banda
INNER JOIN Palco1 p ON a.palco = p.id_palco
INNER JOIN Festival1 f ON p.festival = f.id_festival;

SELECT * FROM lineup
ORDER BY Nome_Festival ASC, Inicio ASC, Palco ASC;

-- MINUS

SELECT A.nome_banda
FROM Apresentacao1 A
WHERE A.id_festival == 1
MINUS
SELECT A.nome_banda
FROM Apresentacao1 A
WHERE A.id_festival == 2;

--INTERSECT

SELECT B.genero
FROM banda1 B
INNER JOIN Apresentacao1 A ON B.id_banda = A.banda
INNER JOIN palco1 P ON A.Palco = P.id_palco
INNER JOIN festival1 F ON P.festival = F.id_festival
WHERE F.id_festival = 1

INTERSECT

SELECT B.genero
FROM banda1 B
INNER JOIN Apresentacao1 A ON B.id_banda = A.banda
INNER JOIN palco P ON A.Palco = P.id_palco
INNER JOIN FESTIVAL1 F ON P.festival = F.id_festival
WHERE F.id_festival = 15;



INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 2, TO_TIMESTAMP('2026-09-12 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-12 21:30', 'YYYY-MM-DD HH24:MI'), 35000, 140000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 1, TO_TIMESTAMP('2026-09-15 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-15 20:30', 'YYYY-MM-DD HH24:MI'), 60000, 200000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 2, TO_TIMESTAMP('2026-09-18 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-18 19:30', 'YYYY-MM-DD HH24:MI'), 25000, 95000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 3, TO_TIMESTAMP('2026-03-26 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-26 22:30', 'YYYY-MM-DD HH24:MI'), 45000, 160000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 4, TO_TIMESTAMP('2026-03-27 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-27 23:59', 'YYYY-MM-DD HH24:MI'), 20000, 180000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 5, TO_TIMESTAMP('2026-02-15 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-15 23:30', 'YYYY-MM-DD HH24:MI'), 15000, 75000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 6, TO_TIMESTAMP('2026-02-16 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-17 00:30', 'YYYY-MM-DD HH24:MI'), 30000, 150000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 7, TO_TIMESTAMP('2026-04-19 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-20 00:30', 'YYYY-MM-DD HH24:MI'), 8000, 90000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 8, TO_TIMESTAMP('2026-04-19 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 21:30', 'YYYY-MM-DD HH24:MI'), 5000, 60000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 9, TO_TIMESTAMP('2026-06-12 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 19:30', 'YYYY-MM-DD HH24:MI'), 38000, 150000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 10, TO_TIMESTAMP('2026-06-12 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 21:30', 'YYYY-MM-DD HH24:MI'), 15000, 120000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 11, TO_TIMESTAMP('2026-07-25 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-25 23:30', 'YYYY-MM-DD HH24:MI'), 48000, 80000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 12, TO_TIMESTAMP('2026-07-26 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-26 21:30', 'YYYY-MM-DD HH24:MI'), 18000, 65000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 13, TO_TIMESTAMP('2026-01-31 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 23:30', 'YYYY-MM-DD HH24:MI'), 58000, 350000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 14, TO_TIMESTAMP('2026-01-31 01:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 03:00', 'YYYY-MM-DD HH24:MI'), 25000, 220000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 15, TO_TIMESTAMP('2026-10-11 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-12 01:00', 'YYYY-MM-DD HH24:MI'), 75000, 400000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 16, TO_TIMESTAMP('2026-10-12 00:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-12 02:00', 'YYYY-MM-DD HH24:MI'), 30000, 190000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 17, TO_TIMESTAMP('2026-11-20 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 00:30', 'YYYY-MM-DD HH24:MI'), 9500, 70000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 18, TO_TIMESTAMP('2026-11-21 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 21:00', 'YYYY-MM-DD HH24:MI'), 2500, 35000.00);


INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 19, TO_TIMESTAMP('2026-09-29 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-29 23:30', 'YYYY-MM-DD HH24:MI'), 65000, 320000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 20, TO_TIMESTAMP('2026-09-28 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-28 19:30', 'YYYY-MM-DD HH24:MI'), 28000, 85000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (6, 21, TO_TIMESTAMP('2026-05-15 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 20:30', 'YYYY-MM-DD HH24:MI'), 42000, 130000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (15, 22, TO_TIMESTAMP('2026-05-15 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 18:00', 'YYYY-MM-DD HH24:MI'), 9000, 45000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 23, TO_TIMESTAMP('2026-07-06 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-06 21:30', 'YYYY-MM-DD HH24:MI'), 50000, 95000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 24, TO_TIMESTAMP('2026-07-06 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-07 01:00', 'YYYY-MM-DD HH24:MI'), 20000, 250000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 25, TO_TIMESTAMP('2026-01-20 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-20 23:30', 'YYYY-MM-DD HH24:MI'), 48000, 160000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 26, TO_TIMESTAMP('2026-01-21 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-21 22:30', 'YYYY-MM-DD HH24:MI'), 19000, 140000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 27, TO_TIMESTAMP('2026-10-16 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 23:30', 'YYYY-MM-DD HH24:MI'), 38000, 130000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 28, TO_TIMESTAMP('2026-10-17 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-17 21:30', 'YYYY-MM-DD HH24:MI'), 12000, 70000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 27, TO_TIMESTAMP('2026-10-15 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-15 22:30', 'YYYY-MM-DD HH24:MI'), 35000, 145000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (13, 29, TO_TIMESTAMP('2026-05-21 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-21 21:30', 'YYYY-MM-DD HH24:MI'), 9000, 20000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (13, 30, TO_TIMESTAMP('2026-05-22 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-22 20:30', 'YYYY-MM-DD HH24:MI'), 4500, 15000.00);

COMMIT;


INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 1, TO_TIMESTAMP('2026-09-16 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-16 21:30', 'YYYY-MM-DD HH24:MI'), 75000, 180000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 2, TO_TIMESTAMP('2026-09-16 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-16 19:30', 'YYYY-MM-DD HH24:MI'), 30000, 90000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 1, TO_TIMESTAMP('2026-09-19 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-20 01:00', 'YYYY-MM-DD HH24:MI'), 90000, 350000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 3, TO_TIMESTAMP('2026-03-25 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-25 18:30', 'YYYY-MM-DD HH24:MI'), 35000, 100000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 4, TO_TIMESTAMP('2026-03-26 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-26 20:30', 'YYYY-MM-DD HH24:MI'), 18000, 85000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 3, TO_TIMESTAMP('2026-03-27 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-27 21:30', 'YYYY-MM-DD HH24:MI'), 40000, 160000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 6, TO_TIMESTAMP('2026-02-16 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-16 21:30', 'YYYY-MM-DD HH24:MI'), 28000, 95000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 5, TO_TIMESTAMP('2026-02-17 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-17 22:30', 'YYYY-MM-DD HH24:MI'), 14000, 65000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (6, 7, TO_TIMESTAMP('2026-04-18 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-18 20:30', 'YYYY-MM-DD HH24:MI'), 7500, 80000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 8, TO_TIMESTAMP('2026-04-19 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 19:30', 'YYYY-MM-DD HH24:MI'), 4000, 35000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 7, TO_TIMESTAMP('2026-04-19 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 22:30', 'YYYY-MM-DD HH24:MI'), 8000, 110000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 9, TO_TIMESTAMP('2026-06-12 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 17:30', 'YYYY-MM-DD HH24:MI'), 25000, 120000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 10, TO_TIMESTAMP('2026-06-12 17:30', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 19:00', 'YYYY-MM-DD HH24:MI'), 12000, 75000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 9, TO_TIMESTAMP('2026-06-12 22:30', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 23:59', 'YYYY-MM-DD HH24:MI'), 35000, 170000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 11, TO_TIMESTAMP('2026-07-18 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-18 21:30', 'YYYY-MM-DD HH24:MI'), 40000, 135000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 12, TO_TIMESTAMP('2026-07-22 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-22 20:30', 'YYYY-MM-DD HH24:MI'), 19000, 85000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 11, TO_TIMESTAMP('2026-07-27 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-27 22:30', 'YYYY-MM-DD HH24:MI'), 45000, 160000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 13, TO_TIMESTAMP('2026-01-30 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-30 19:30', 'YYYY-MM-DD HH24:MI'), 42000, 130000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 14, TO_TIMESTAMP('2026-01-30 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 01:00', 'YYYY-MM-DD HH24:MI'), 22000, 180000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 13, TO_TIMESTAMP('2026-01-31 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 20:30', 'YYYY-MM-DD HH24:MI'), 48000, 110000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 15, TO_TIMESTAMP('2026-10-11 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-11 22:00', 'YYYY-MM-DD HH24:MI'), 65000, 250000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 16, TO_TIMESTAMP('2026-10-10 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-10 23:00', 'YYYY-MM-DD HH24:MI'), 28000, 200000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 17, TO_TIMESTAMP('2026-11-20 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-20 21:30', 'YYYY-MM-DD HH24:MI'), 8500, 65000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 18, TO_TIMESTAMP('2026-11-21 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 23:30', 'YYYY-MM-DD HH24:MI'), 3000, 90000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 19, TO_TIMESTAMP('2026-09-28 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-28 23:30', 'YYYY-MM-DD HH24:MI'), 55000, 80000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 20, TO_TIMESTAMP('2026-09-29 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-29 20:30', 'YYYY-MM-DD HH24:MI'), 25000, 120000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 21, TO_TIMESTAMP('2026-05-15 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 17:30', 'YYYY-MM-DD HH24:MI'), 35000, 50000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 22, TO_TIMESTAMP('2026-05-15 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 22:30', 'YYYY-MM-DD HH24:MI'), 10000, 130000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 24, TO_TIMESTAMP('2026-07-05 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-05 22:00', 'YYYY-MM-DD HH24:MI'), 18000, 170000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 23, TO_TIMESTAMP('2026-07-06 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-06 19:30', 'YYYY-MM-DD HH24:MI'), 45000, 140000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 25, TO_TIMESTAMP('2026-01-20 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-20 20:30', 'YYYY-MM-DD HH24:MI'), 42000, 135000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 26, TO_TIMESTAMP('2026-01-21 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-22 00:30', 'YYYY-MM-DD HH24:MI'), 19000, 300000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 27, TO_TIMESTAMP('2026-10-16 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 20:30', 'YYYY-MM-DD HH24:MI'), 32000, 100000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 28, TO_TIMESTAMP('2026-10-17 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-17 19:30', 'YYYY-MM-DD HH24:MI'), 14000, 85000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 27, TO_TIMESTAMP('2026-10-15 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 00:30', 'YYYY-MM-DD HH24:MI'), 35000, 160000.00);

INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 29, TO_TIMESTAMP('2026-05-20 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-20 22:30', 'YYYY-MM-DD HH24:MI'), 9500, 130000.00);
INSERT INTO Apresentacao1 (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 30, TO_TIMESTAMP('2026-05-22 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-22 22:30', 'YYYY-MM-DD HH24:MI'), 4800, 60000.00);

COMMIT;
