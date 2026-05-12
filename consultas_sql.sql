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
