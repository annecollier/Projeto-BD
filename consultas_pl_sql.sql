REM  AV4 - PL/SQL COMPLETO

CREATE OR REPLACE PACKAGE pkg_festival AS

    -- Tipos para uso interno (1. RECORD, 2. TABLE)
    TYPE t_resumo_banda IS RECORD (
        id_banda        Banda.id_banda%TYPE,        -- 6. %TYPE
        nome_banda      Banda.nome_banda%TYPE,
        genero          Banda.genero%TYPE,
        total_shows     NUMBER,
        receita_total   NUMBER,
        total_publico   NUMBER
    );

    TYPE t_lista_bandas IS TABLE OF t_resumo_banda  -- 2. TABLE
        INDEX BY PLS_INTEGER;

    -- Funcoes publicas
    FUNCTION calcular_receita_banda(p_id_banda IN NUMBER) RETURN NUMBER;         -- 5. FUNCTION
    FUNCTION classificar_desempenho(p_cache IN NUMBER) RETURN VARCHAR2;

    -- Procedures publicas
    PROCEDURE registrar_apresentacao(                                             -- 4. PROCEDURE
        p_banda         IN  NUMBER,
        p_palco         IN  NUMBER,
        p_hora_inicio   IN  TIMESTAMP,
        p_hora_fim      IN  TIMESTAMP,
        p_publico       IN  NUMBER,
        p_cache         IN  NUMBER,
        p_status        OUT VARCHAR2                                              -- 16. OUT
    );

    PROCEDURE relatorio_bandas_festival(
        p_id_festival   IN  NUMBER,
        p_lista         OUT t_lista_bandas
    );

END pkg_festival;
/


CREATE OR REPLACE PACKAGE BODY pkg_festival AS

    -- 5. FUNCTION: retorna receita total acumulada de uma banda
    -- SELECT INTO (13), %TYPE (6), EXCEPTION (15)
    FUNCTION calcular_receita_banda(p_id_banda IN NUMBER) RETURN NUMBER IS
        v_receita   NUMBER := 0;
        v_nome      Banda.nome_banda%TYPE;              -- 6. %TYPE
    BEGIN
        -- 13. SELECT ... INTO
        SELECT NVL(SUM(cache_combinado), 0)
        INTO   v_receita
        FROM   Apresentacao
        WHERE  banda = p_id_banda;

        RETURN v_receita;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN                         -- 15. EXCEPTION WHEN
            RETURN 0;
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001,
                'Erro ao calcular receita da banda ' || p_id_banda || ': ' || SQLERRM);
    END calcular_receita_banda;

 -- 5. FUNCTION: classifica desempenho de cache por faixa
    -- CASE WHEN (9)
    -- --------------------------------------------------------
    FUNCTION classificar_desempenho(p_cache IN NUMBER) RETURN VARCHAR2 IS
        v_classe VARCHAR2(20);
    BEGIN
        -- 9. CASE WHEN
        v_classe := CASE
            WHEN p_cache >= 300000 THEN 'Headliner'
            WHEN p_cache >= 150000 THEN 'Principal'
            WHEN p_cache >= 80000  THEN 'Intermediario'
            WHEN p_cache >= 30000  THEN 'Abertura'
            ELSE                        'Sem cache'
        END;
        RETURN v_classe;
    END classificar_desempenho;

 -- 4. PROCEDURE: registra apresentacao com validacoes
    -- IF ELSIF (8), EXCEPTION (15), IN/OUT (16), SELECT INTO (13)
    PROCEDURE registrar_apresentacao(
        p_banda         IN  NUMBER,
        p_palco         IN  NUMBER,
        p_hora_inicio   IN  TIMESTAMP,
        p_hora_fim      IN  TIMESTAMP,
        p_publico       IN  NUMBER,
        p_cache         IN  NUMBER,
        p_status        OUT VARCHAR2
    ) IS
        v_capacidade    Palco.capacidade_maxima%TYPE;   -- 6. %TYPE
        v_conflito      NUMBER := 0;
    BEGIN
        -- Valida horario
        -- 8. IF ELSIF
        IF p_hora_fim <= p_hora_inicio THEN
            p_status := 'ERRO: hora_fim deve ser posterior a hora_inicio';
            RETURN;
        ELSIF p_publico < 0 THEN
            p_status := 'ERRO: publico_presente nao pode ser negativo';
            RETURN;
        ELSIF p_cache < 0 THEN
            p_status := 'ERRO: cache_combinado nao pode ser negativo';
            RETURN;
        END IF;

        -- 13. SELECT INTO: busca capacidade do palco
        SELECT capacidade_maxima
        INTO   v_capacidade
        FROM   Palco
        WHERE  id_palco = p_palco;

        -- Alerta se publico excede capacidade (nao bloqueia, apenas avisa)
        IF p_publico > v_capacidade THEN
            p_status := 'AVISO: publico (' || p_publico || ') excede capacidade do palco (' || v_capacidade || ')';
        END IF;

        -- Verifica conflito de horario no mesmo palco
        SELECT COUNT(*)
        INTO   v_conflito
        FROM   Apresentacao
        WHERE  palco       = p_palco
          AND  hora_inicio < p_hora_fim
          AND  hora_fim    > p_hora_inicio;

        IF v_conflito > 0 THEN
            p_status := 'ERRO: conflito de horario neste palco para o periodo solicitado';
            RETURN;
        END IF;

        -- Insere a apresentacao
        INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
        VALUES (p_banda, p_palco, p_hora_inicio, p_hora_fim, p_publico, p_cache);

        COMMIT;
        p_status := 'OK: apresentacao registrada com sucesso';

    EXCEPTION
        WHEN NO_DATA_FOUND THEN                         -- 15. EXCEPTION WHEN
            p_status := 'ERRO: palco ' || p_palco || ' nao encontrado';
        WHEN DUP_VAL_ON_INDEX THEN
            p_status := 'ERRO: apresentacao duplicada (mesma banda, palco e horario)';
        WHEN OTHERS THEN
            ROLLBACK;
            p_status := 'ERRO inesperado: ' || SQLERRM;
    END registrar_apresentacao;


    -- 4. PROCEDURE: gera lista de bandas de um festival
    -- CURSOR (14), FOR IN LOOP (12), RECORD (1), TABLE (2)
    PROCEDURE relatorio_bandas_festival(
        p_id_festival   IN  NUMBER,
        p_lista         OUT t_lista_bandas
    ) IS
        -- 14. CURSOR com parametro
        CURSOR c_bandas(p_fest NUMBER) IS
            SELECT B.id_banda, B.nome_banda, B.genero,
                   COUNT(A.hora_inicio)   AS total_shows,
                   SUM(A.cache_combinado) AS receita_total,
                   SUM(A.publico_presente) AS total_publico
            FROM   Banda B
            INNER JOIN Apresentacao A ON B.id_banda = A.banda
            INNER JOIN Palco P        ON A.palco    = P.id_palco
            WHERE  P.festival = p_fest
            GROUP BY B.id_banda, B.nome_banda, B.genero
            ORDER BY receita_total DESC;

        v_rec   t_resumo_banda;     -- 1. RECORD
        v_idx   PLS_INTEGER := 1;
    BEGIN
        -- 14. OPEN / FETCH / CLOSE
        OPEN c_bandas(p_id_festival);
        LOOP
            FETCH c_bandas INTO
                v_rec.id_banda,
                v_rec.nome_banda,
                v_rec.genero,
                v_rec.total_shows,
                v_rec.receita_total,
                v_rec.total_publico;

            EXIT WHEN c_bandas%NOTFOUND;    -- 10. LOOP EXIT WHEN

            p_lista(v_idx) := v_rec;        -- 2. TABLE (insere no tipo table)
            v_idx := v_idx + 1;
        END LOOP;
        CLOSE c_bandas;
    END relatorio_bandas_festival;

END pkg_festival;
/


-- 3. BLOCO ANONIMO: uso completo com RECORD, TABLE, cursores,
-- loops, IF ELSIF, CASE, %ROWTYPE, SELECT INTO, EXCEPTION

DECLARE
    -- 1. RECORD: estrutura para consolidar dados de um palco
    TYPE t_info_palco IS RECORD (
        nome_palco      VARCHAR2(100),
        nome_festival   VARCHAR2(100),
        qtd_shows       NUMBER,
        publico_total   NUMBER,
        receita_total   NUMBER
    );

    -- 2. TABLE: colecao indexada de palcos
    TYPE t_tabela_palcos IS TABLE OF t_info_palco INDEX BY PLS_INTEGER;

    -- 7. %ROWTYPE: linha inteira da tabela Apresentacao
    v_apres         Apresentacao%ROWTYPE;
    v_palcos        t_tabela_palcos;
    v_info          t_info_palco;
    v_idx           PLS_INTEGER := 1;
    v_total_geral   NUMBER := 0;
    v_media_cache   NUMBER;
    v_classificacao VARCHAR2(30);

    -- 14. CURSOR explicito
    CURSOR c_palcos_ativos IS
        SELECT P.nome_palco, F.nome_festival,
               COUNT(A.hora_inicio)    AS qtd_shows,
               SUM(A.publico_presente) AS publico_total,
               SUM(A.cache_combinado)  AS receita_total
        FROM   Palco P
        INNER JOIN Festival F     ON P.festival = F.id_festival
        INNER JOIN Apresentacao A ON A.palco    = P.id_palco
        GROUP BY P.nome_palco, F.nome_festival
        HAVING COUNT(A.hora_inicio) > 1
        ORDER BY receita_total DESC;

BEGIN
    -- 13. SELECT INTO
    SELECT AVG(cache_combinado)
    INTO   v_media_cache
    FROM   Apresentacao;

    DBMS_OUTPUT.PUT_LINE('=== RELATORIO DE PALCOS ATIVOS ===');
    DBMS_OUTPUT.PUT_LINE('Media de cache por show: R$ ' || ROUND(v_media_cache, 2));
    DBMS_OUTPUT.PUT_LINE('----------------------------------');

    -- 14. OPEN / FETCH / CLOSE
    OPEN c_palcos_ativos;
    LOOP
        FETCH c_palcos_ativos INTO
            v_info.nome_palco,
            v_info.nome_festival,
            v_info.qtd_shows,
            v_info.publico_total,
            v_info.receita_total;

        EXIT WHEN c_palcos_ativos%NOTFOUND;     -- 10. LOOP EXIT WHEN

        v_palcos(v_idx) := v_info;
        v_total_geral   := v_total_geral + v_info.receita_total;
        v_idx           := v_idx + 1;
    END LOOP;
    CLOSE c_palcos_ativos;

    -- 12. FOR IN LOOP: itera sobre a colecao preenchida
    IF v_palcos.COUNT > 0 THEN

    FOR i IN 1 .. v_palcos.COUNT LOOP

        -- 9. CASE WHEN: classifica palco por receita
        v_classificacao := CASE
            WHEN v_palcos(i).receita_total >= 500000 THEN 'Palco Platina'
            WHEN v_palcos(i).receita_total >= 300000 THEN 'Palco Ouro'
            WHEN v_palcos(i).receita_total >= 150000 THEN 'Palco Prata'
            ELSE 'Palco Bronze'
        END;

        -- 8. IF ELSIF: alerta de ocupacao
        IF v_palcos(i).qtd_shows >= 5 THEN
            DBMS_OUTPUT.PUT_LINE('[ALTA DEMANDA] ' || v_palcos(i).nome_palco);

        ELSIF v_palcos(i).qtd_shows >= 3 THEN
            DBMS_OUTPUT.PUT_LINE('[DEMANDA MEDIA] ' || v_palcos(i).nome_palco);

        ELSE
            DBMS_OUTPUT.PUT_LINE('[BAIXA DEMANDA] ' || v_palcos(i).nome_palco);
        END IF;

        DBMS_OUTPUT.PUT_LINE(
            '  Festival : ' || v_palcos(i).nome_festival || CHR(10) ||
            '  Shows    : ' || v_palcos(i).qtd_shows     || CHR(10) ||
            '  Publico  : ' || v_palcos(i).publico_total || CHR(10) ||
            '  Receita  : R$ ' || v_palcos(i).receita_total || CHR(10) ||
            '  Categoria: ' || v_classificacao
        );

        DBMS_OUTPUT.PUT_LINE('----------------------------------');

    END LOOP;

END IF;

    DBMS_OUTPUT.PUT_LINE('Receita total consolidada: R$ ' || v_total_geral);

    -- 11. WHILE LOOP: aplica reajuste simulado ate atingir meta
    DECLARE
        v_meta      NUMBER := v_total_geral * 1.20;   -- meta: 20% acima do atual
        v_simulado  NUMBER := v_total_geral;
        v_meses     NUMBER := 0;
        v_taxa      NUMBER := 0.03;                   -- crescimento mensal de 3%
    BEGIN
        WHILE v_simulado < v_meta LOOP                -- 11. WHILE LOOP
            v_simulado := v_simulado * (1 + v_taxa);
            v_meses    := v_meses + 1;
            EXIT WHEN v_meses > 24;                   -- seguranca contra loop infinito
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Meta +20% atingida em aprox. ' || v_meses || ' meses (taxa 3%/mes)');
    END;

EXCEPTION
    WHEN NO_DATA_FOUND THEN                           -- 15. EXCEPTION WHEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma apresentacao encontrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/


-- 4/5. PROCEDURE e FUNCTION standalone (fora do package) para demonstracao direta dos itens 4 e 5
-- FUNCTION standalone: calcula percentual de ocupacao de um palco em um festival especifico
CREATE OR REPLACE FUNCTION fn_pct_ocupacao_palco(
    p_id_palco      IN NUMBER,
    p_id_festival   IN NUMBER
) RETURN NUMBER IS
    v_capacidade    Palco.capacidade_maxima%TYPE;    -- 6. %TYPE
    v_media_pub     NUMBER;
    v_pct           NUMBER;
BEGIN
    -- 13. SELECT INTO
    SELECT capacidade_maxima
    INTO   v_capacidade
    FROM   Palco
    WHERE  id_palco = p_id_palco;

    SELECT NVL(AVG(A.publico_presente), 0)
    INTO   v_media_pub
    FROM   Apresentacao A
    INNER JOIN Palco P ON A.palco = P.id_palco
    WHERE  P.id_palco = p_id_palco
      AND  P.festival = p_id_festival;

    -- 8. IF ELSIF: evita divisao por zero
    IF v_capacidade = 0 THEN
        RETURN 0;
    ELSE
        v_pct := ROUND(v_media_pub / v_capacidade * 100, 2);
        RETURN v_pct;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN         -- 15. EXCEPTION WHEN
        RETURN NULL;
    WHEN ZERO_DIVIDE THEN
        RETURN 0;
END fn_pct_ocupacao_palco;
/

-- PROCEDURE standalone: ajusta caches de uma banda inteira com base em indice de reajuste e registra em DBMS_OUTPUT
CREATE OR REPLACE PROCEDURE sp_reajustar_cache_banda(
    p_id_banda      IN  NUMBER,
    p_percentual    IN  NUMBER,
    p_qtd_ajustada  OUT NUMBER
) IS
    v_banda_row     Banda%ROWTYPE;
    v_novo_cache    Apresentacao.cache_combinado%TYPE;

    -- variaveis auxiliares para FETCH
    v_banda         NUMBER;
    v_palco         NUMBER;
    v_hora_inicio   TIMESTAMP;

    CURSOR c_apres(p_banda NUMBER) IS
        SELECT banda, palco, hora_inicio, cache_combinado
        FROM   Apresentacao
        WHERE  banda = p_banda
          AND  cache_combinado IS NOT NULL
        FOR UPDATE OF cache_combinado;

BEGIN
    -- 13. SELECT INTO
    SELECT *
    INTO   v_banda_row
    FROM   Banda
    WHERE  id_banda = p_id_banda;

    DBMS_OUTPUT.PUT_LINE('Reajustando caches de: ' || v_banda_row.nome_banda);

    p_qtd_ajustada := 0;

    -- 14. OPEN / FETCH / CLOSE
    OPEN c_apres(p_id_banda);

    LOOP
        FETCH c_apres INTO
            v_banda,
            v_palco,
            v_hora_inicio,
            v_novo_cache;

        EXIT WHEN c_apres%NOTFOUND;

        v_novo_cache := ROUND(
            v_novo_cache * (1 + p_percentual / 100),
            2
        );

        UPDATE Apresentacao
        SET    cache_combinado = v_novo_cache
        WHERE  CURRENT OF c_apres;

        p_qtd_ajustada := p_qtd_ajustada + 1;

    END LOOP;

    CLOSE c_apres;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        p_qtd_ajustada || ' apresentacao(oes) reajustada(s).'
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Banda ' || p_id_banda || ' nao encontrada.'
        );

    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;

END sp_reajustar_cache_banda;
/

-- 19. TRIGGER DE COMANDO (statement-level)
--  Impede qualquer DELETE em Apresentacao fora do horario comercial

CREATE OR REPLACE TRIGGER trg_protege_delete_apres
BEFORE DELETE ON Apresentacao
DECLARE
    v_hora NUMBER := TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'));
BEGIN
    -- 8. IF ELSIF dentro do trigger
    IF v_hora < 8 OR v_hora >= 18 THEN
        RAISE_APPLICATION_ERROR(-20010,
            'Delecoes em Apresentacao so sao permitidas entre 08h e 18h. ' ||
            'Hora atual: ' || v_hora || 'h');
    ELSIF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=AMERICAN') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20011,
            'Delecoes em Apresentacao nao sao permitidas aos fins de semana.');
    END IF;
END trg_protege_delete_apres;
/


-- 20. TRIGGER DE LINHA (row-level)  -- item ja existia, mas
-- recriado com logica mais rica: valida sobreposicao de horario
-- e registra historico de alteracoes de cache

-- Tabela auxiliar para log (crie antes do trigger)
CREATE TABLE log_cache_apresentacao (
    id_log NUMBER,
    banda           NUMBER(10),
    palco           NUMBER(10),
    hora_inicio     TIMESTAMP,
    cache_anterior  NUMBER(12,2),
    cache_novo      NUMBER(12,2),
    alterado_em     TIMESTAMP DEFAULT SYSTIMESTAMP,
    alterado_por    VARCHAR2(50) DEFAULT USER
);

CREATE OR REPLACE TRIGGER trg_valida_e_loga_apresentacao
BEFORE INSERT OR UPDATE ON Apresentacao
FOR EACH ROW
BEGIN

    -- valida horario
    IF :NEW.hora_fim <= :NEW.hora_inicio THEN
        RAISE_APPLICATION_ERROR(
            -20020,
            'Hora final deve ser maior que hora inicial.'
        );
    END IF;

    -- valida publico
    IF :NEW.publico_presente < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20021,
            'Publico nao pode ser negativo.'
        );
    END IF;

    -- valida cache
    IF :NEW.cache_combinado < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20022,
            'Cache nao pode ser negativo.'
        );
    END IF;

    -- log de alteracao
    IF UPDATING AND
       :OLD.cache_combinado != :NEW.cache_combinado THEN

        INSERT INTO log_cache_apresentacao
        (
            banda,
            palco,
            hora_inicio,
            cache_anterior,
            cache_novo
        )
        VALUES
        (
            :NEW.banda,
            :NEW.palco,
            :NEW.hora_inicio,
            :OLD.cache_combinado,
            :NEW.cache_combinado
        );

    END IF;

END trg_valida_e_loga_apresentacao;
/


-- BLOCO DE TESTE: chama procedures e valida resultados
SET SERVEROUTPUT ON;

-- Testa a procedure de registro com parametros IN/OUT
DECLARE
    v_status VARCHAR2(200);
BEGIN
    pkg_festival.registrar_apresentacao(
        p_banda       => 1,
        p_palco       => 1,
        p_hora_inicio => TO_TIMESTAMP('2026-12-01 20:00', 'YYYY-MM-DD HH24:MI'),
        p_hora_fim    => TO_TIMESTAMP('2026-12-01 22:00', 'YYYY-MM-DD HH24:MI'),
        p_publico     => 40000,
        p_cache       => 180000,
        p_status      => v_status
    );
    DBMS_OUTPUT.PUT_LINE('Status registro: ' || v_status);
END;
/

-- Testa function de receita e classificacao
DECLARE
    v_receita   NUMBER;
    v_classe    VARCHAR2(30);
BEGIN
    FOR i IN 1..5 LOOP                          -- 12. FOR IN LOOP
        v_receita := pkg_festival.calcular_receita_banda(i);
        v_classe  := pkg_festival.classificar_desempenho(v_receita);
        DBMS_OUTPUT.PUT_LINE(
            'Banda ' || i || ': R$ ' || v_receita || ' - ' || v_classe
        );
    END LOOP;
END;
/

-- Testa procedure de reajuste com parametro OUT
DECLARE
    v_qtd NUMBER;
BEGIN
    sp_reajustar_cache_banda(
        p_id_banda      => 3,
        p_percentual    => 5,
        p_qtd_ajustada  => v_qtd
    );
    DBMS_OUTPUT.PUT_LINE('Shows reajustados: ' || v_qtd);
END;
/
