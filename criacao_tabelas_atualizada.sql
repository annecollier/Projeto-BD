-- ============================================================
-- 1. LIMPEZA DAS TABELAS E SEQUENCES
-- ============================================================

DROP TABLE Canta CASCADE CONSTRAINTS;
DROP TABLE Musica CASCADE CONSTRAINTS;
DROP TABLE Instrumento CASCADE CONSTRAINTS;
DROP TABLE Telefone_membro CASCADE CONSTRAINTS;
DROP TABLE Vocalista CASCADE CONSTRAINTS;
DROP TABLE Instrumentista CASCADE CONSTRAINTS;
DROP TABLE Apresentacao CASCADE CONSTRAINTS;
DROP TABLE Utiliza CASCADE CONSTRAINTS;
DROP TABLE Palco CASCADE CONSTRAINTS;
DROP TABLE Membro CASCADE CONSTRAINTS;
DROP TABLE Banda CASCADE CONSTRAINTS;
DROP TABLE Equipamento_de_palco CASCADE CONSTRAINTS;
DROP TABLE Festival CASCADE CONSTRAINTS;

DROP SEQUENCE seq_banda;
DROP SEQUENCE seq_festival;
DROP SEQUENCE seq_palco;
DROP SEQUENCE seq_equipamento;
DROP SEQUENCE seq_musica;

-- ============================================================
-- 2. SEQUENCES
-- ============================================================

CREATE SEQUENCE seq_banda
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE seq_festival
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE seq_palco
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE seq_equipamento
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE seq_musica
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


-- ============================================================
-- 3. ENTIDADES PRINCIPAIS
-- ============================================================

CREATE TABLE Festival (
    id_festival     NUMBER(10)      DEFAULT seq_festival.NEXTVAL NOT NULL,
    nome_festival   VARCHAR2(100)   NOT NULL,
    edicao          NUMBER(10)      NOT NULL,
    local           VARCHAR2(150)   NOT NULL,
    data_inicio     DATE            NOT NULL,
    data_fim        DATE            NOT NULL,

    CONSTRAINT pk_festival PRIMARY KEY (id_festival),
    CONSTRAINT uq_festival_nome_edicao UNIQUE (nome_festival, edicao),
    CONSTRAINT chk_festival_datas CHECK (data_fim >= data_inicio),
    CONSTRAINT chk_festival_edicao CHECK (edicao > 0)
);


CREATE TABLE Equipamento_de_palco (
    id_equipamento  NUMBER(10)      DEFAULT seq_equipamento.NEXTVAL NOT NULL,
    tipo            VARCHAR2(80)    NOT NULL,

    CONSTRAINT pk_equipamento PRIMARY KEY (id_equipamento),
    CONSTRAINT chk_equip_tipo CHECK (tipo IN (
        'Caixa de som',
        'Amplificador',
        'Mesa de som',
        'Microfone',
        'Monitor de palco',
        'Iluminacao LED',
        'Gerador',
        'Cabo P10',
        'Cabo XLR',
        'Direct Box',
        'Subwoofer',
        'Pedal de efeito',
        'Outro'
    ))
);


CREATE TABLE Banda (
    id_banda        NUMBER(10)      DEFAULT seq_banda.NEXTVAL NOT NULL,
    nome_banda      VARCHAR2(100)   NOT NULL,
    genero          VARCHAR2(50)    NOT NULL,
    rider_tecnico   VARCHAR2(4000)  NOT NULL,
    lider           CHAR(11),
    madrinha        NUMBER(10),

    CONSTRAINT pk_banda PRIMARY KEY (id_banda),

    CONSTRAINT fk_banda_madrinha FOREIGN KEY (madrinha)
        REFERENCES Banda(id_banda)
        ON DELETE SET NULL,

    CONSTRAINT chk_banda_genero CHECK (genero IN (
        'Rock',
        'Pop',
        'Sertanejo',
        'Forro',
        'MPB',
        'Jazz',
        'Blues',
        'Eletronico',
        'Hip-Hop',
        'Reggae',
        'Metal',
        'Punk',
        'Classico',
        'Outro'
    ))
);


CREATE TABLE Membro (
    cpf     CHAR(11)        NOT NULL,
    nome    VARCHAR2(100)   NOT NULL,
    banda   NUMBER(10)      NOT NULL,

    CONSTRAINT pk_membro PRIMARY KEY (cpf),

    CONSTRAINT uq_membro_cpf_banda UNIQUE (cpf, banda),

    CONSTRAINT fk_membro_banda FOREIGN KEY (banda)
        REFERENCES Banda(id_banda)
        ON DELETE CASCADE
        DEFERRABLE INITIALLY DEFERRED,

    CONSTRAINT chk_membro_cpf CHECK (REGEXP_LIKE(cpf, '^[0-9]{11}$'))
);


-- FK do líder da banda.
-- Ela é adicionada depois de Membro porque depende da tabela Membro.
ALTER TABLE Banda
ADD CONSTRAINT fk_banda_lider_mesma_banda
FOREIGN KEY (lider, id_banda)
REFERENCES Membro(cpf, banda)
DEFERRABLE INITIALLY DEFERRED;


-- ============================================================
-- 4. ESPECIALIZAÇÕES DE MEMBRO
-- ============================================================

CREATE TABLE Instrumentista (
    cpf_instrumentista CHAR(11) NOT NULL,

    CONSTRAINT pk_instrumentista PRIMARY KEY (cpf_instrumentista),

    CONSTRAINT fk_instrumentista_membro FOREIGN KEY (cpf_instrumentista)
        REFERENCES Membro(cpf)
        ON DELETE CASCADE
);


CREATE TABLE Vocalista (
    cpf_vocalista CHAR(11) NOT NULL,

    CONSTRAINT pk_vocalista PRIMARY KEY (cpf_vocalista),

    CONSTRAINT fk_vocalista_membro FOREIGN KEY (cpf_vocalista)
        REFERENCES Membro(cpf)
        ON DELETE CASCADE
);


-- ============================================================
-- 5. ATRIBUTO MULTIVALORADO: TELEFONE DE MEMBRO
-- ============================================================

CREATE TABLE Telefone_membro (
    membro      CHAR(11)       NOT NULL,
    telefone    VARCHAR2(20)   NOT NULL,

    CONSTRAINT pk_telefone_membro PRIMARY KEY (membro, telefone),

    CONSTRAINT fk_tel_membro FOREIGN KEY (membro)
        REFERENCES Membro(cpf)
        ON DELETE CASCADE,

    CONSTRAINT chk_telefone CHECK (REGEXP_LIKE(telefone, '^[0-9]{10,11}$'))
);


-- ============================================================
-- 6. INSTRUMENTO
-- Instrumento pertence a exatamente um Instrumentista.
-- Um Instrumentista pode possuir vários Instrumentos.
-- ============================================================

CREATE TABLE Instrumento (
    membro      CHAR(11)       NOT NULL,
    cod_inv     NUMBER(10)     NOT NULL,
    tipo        VARCHAR2(60)   NOT NULL,
    marca       VARCHAR2(60)   NOT NULL,

    CONSTRAINT pk_instrumento PRIMARY KEY (membro, cod_inv),

    CONSTRAINT fk_instrumento_inst FOREIGN KEY (membro)
        REFERENCES Instrumentista(cpf_instrumentista)
        ON DELETE CASCADE,

    CONSTRAINT chk_instrumento_tipo CHECK (tipo IN (
        'Guitarra',
        'Baixo',
        'Bateria',
        'Teclado',
        'Violao',
        'Contrabaixo',
        'Saxofone',
        'Trompete',
        'Flauta',
        'Violino',
        'Percussao',
        'Outro'
    ))
);


CREATE OR REPLACE TRIGGER trg_gera_cod_inv
BEFORE INSERT ON Instrumento
FOR EACH ROW
BEGIN
    SELECT NVL(MAX(cod_inv), 0) + 1
    INTO :NEW.cod_inv
    FROM Instrumento
    WHERE membro = :NEW.membro;
END;
/


-- ============================================================
-- 7. MÚSICA E RELACIONAMENTO CANTA
-- ============================================================

CREATE TABLE Musica (
    id_musica         NUMBER(10)      DEFAULT seq_musica.NEXTVAL NOT NULL,
    nome              VARCHAR2(100)   NOT NULL,
    artista_original  VARCHAR2(100)   NOT NULL,
    duracao           NUMBER(5)       NOT NULL,

    CONSTRAINT pk_musica PRIMARY KEY (id_musica),

    CONSTRAINT chk_musica_duracao CHECK (duracao > 0)
);


CREATE TABLE Canta (
    musica       NUMBER(10)  NOT NULL,
    vocalista    CHAR(11)    NOT NULL,

    CONSTRAINT pk_canta PRIMARY KEY (musica, vocalista),

    CONSTRAINT fk_canta_musica FOREIGN KEY (musica)
        REFERENCES Musica(id_musica)
        ON DELETE CASCADE,

    CONSTRAINT fk_canta_vocalista FOREIGN KEY (vocalista)
        REFERENCES Vocalista(cpf_vocalista)
        ON DELETE CASCADE
);


-- ============================================================
-- 8. PALCO
-- ============================================================

CREATE TABLE Palco (
    id_palco            NUMBER(10)      DEFAULT seq_palco.NEXTVAL NOT NULL,
    nome_palco          VARCHAR2(100)   NOT NULL,
    setor               VARCHAR2(50)    NOT NULL,
    tema                VARCHAR2(100),
    capacidade_maxima   NUMBER(10)      NOT NULL,
    festival            NUMBER(10)      NOT NULL,

    CONSTRAINT pk_palco PRIMARY KEY (id_palco),

    CONSTRAINT fk_palco_festival FOREIGN KEY (festival)
        REFERENCES Festival(id_festival)
        ON DELETE CASCADE,

    CONSTRAINT chk_palco_capacidade CHECK (capacidade_maxima > 0)
);


-- ============================================================
-- 9. RELACIONAMENTO UTILIZA
-- Banda utiliza equipamentos em palcos.
-- ============================================================

CREATE TABLE Utiliza (
    banda           NUMBER(10)     NOT NULL,
    palco           NUMBER(10)     NOT NULL,
    equipamento     NUMBER(10)     NOT NULL,

    CONSTRAINT pk_utiliza PRIMARY KEY (banda, palco, equipamento),

    CONSTRAINT fk_utiliza_banda FOREIGN KEY (banda)
        REFERENCES Banda(id_banda)
        ON DELETE CASCADE,

    CONSTRAINT fk_utiliza_palco FOREIGN KEY (palco)
        REFERENCES Palco(id_palco)
        ON DELETE CASCADE,

    CONSTRAINT fk_utiliza_equip FOREIGN KEY (equipamento)
        REFERENCES Equipamento_de_palco(id_equipamento)
        ON DELETE CASCADE
);


-- ============================================================
-- 10. RELACIONAMENTO APRESENTAÇÃO
-- ============================================================

CREATE TABLE Apresentacao (
    banda               NUMBER(10)      NOT NULL,
    palco               NUMBER(10)      NOT NULL,
    hora_inicio         TIMESTAMP       NOT NULL,
    hora_fim            TIMESTAMP       NOT NULL,
    publico_presente    NUMBER(10),
    cache_combinado     NUMBER(12, 2),

    CONSTRAINT pk_apresentacao PRIMARY KEY (banda, palco, hora_inicio),

    CONSTRAINT fk_apres_banda FOREIGN KEY (banda)
        REFERENCES Banda(id_banda)
        ON DELETE CASCADE,

    CONSTRAINT fk_apres_palco FOREIGN KEY (palco)
        REFERENCES Palco(id_palco)
        ON DELETE CASCADE,

    CONSTRAINT chk_apres_horario CHECK (hora_fim > hora_inicio),

    CONSTRAINT chk_apres_publico CHECK (
        publico_presente IS NULL OR publico_presente >= 0
    ),

    CONSTRAINT chk_apres_cache CHECK (
        cache_combinado IS NULL OR cache_combinado >= 0
    )
);


-- ============================================================
-- 11. PROCEDURE PARA CADASTRAR MEMBRO
-- Garante que todo membro seja Instrumentista, Vocalista ou Ambos.
-- ============================================================

CREATE OR REPLACE PROCEDURE cadastrar_membro (
    p_cpf           IN CHAR,
    p_nome          IN VARCHAR2,
    p_banda         IN NUMBER,
    p_especialidade IN CHAR
) AS
BEGIN
    IF p_especialidade NOT IN ('I', 'V', 'A') THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Erro: O membro DEVE ter uma especialidade. Use I (Instrumentista), V (Vocalista) ou A (Ambos).'
        );
    END IF;

    INSERT INTO Membro (cpf, nome, banda)
    VALUES (p_cpf, p_nome, p_banda);

    IF p_especialidade IN ('I', 'A') THEN
        INSERT INTO Instrumentista (cpf_instrumentista)
        VALUES (p_cpf);
    END IF;

    IF p_especialidade IN ('V', 'A') THEN
        INSERT INTO Vocalista (cpf_vocalista)
        VALUES (p_cpf);
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
