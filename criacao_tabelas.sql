REM   Script: create table
REM   av3

CREATE SEQUENCE seq_banda START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_festival START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_palco START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_equipamento START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

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
        'Caixa de som', 'Amplificador', 'Mesa de som', 'Microfone',
        'Monitor de palco', 'Iluminacao LED', 'Gerador', 'Cabo P10',
        'Cabo XLR', 'Direct Box', 'Subwoofer', 'Pedal de efeito', 'Outro'
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
        'Rock', 'Pop', 'Sertanejo', 'Forro', 'MPB', 'Jazz', 'Blues',
        'Eletronico', 'Hip-Hop', 'Reggae', 'Metal', 'Punk', 'Classico', 'Outro'
    ))
);

CREATE TABLE Membro (
    cpf                 CHAR(11)        NOT NULL,
    nome                VARCHAR2(100)   NOT NULL,
    banda               NUMBER(10),

    eh_produtor         CHAR(1) DEFAULT 'N' NOT NULL,
    eh_compositor       CHAR(1) DEFAULT 'N' NOT NULL,
    eh_instrumentista   CHAR(1) DEFAULT 'N' NOT NULL,
    eh_vocalista        CHAR(1) DEFAULT 'N' NOT NULL,

    CONSTRAINT pk_membro PRIMARY KEY (cpf),
    CONSTRAINT uq_membro_cpf_banda UNIQUE (cpf, banda),
    
    CONSTRAINT fk_membro_banda FOREIGN KEY (banda)
        REFERENCES Banda(id_banda)
        ON DELETE SET NULL,
        
    CONSTRAINT chk_membro_cpf CHECK (REGEXP_LIKE(cpf, '^[0-9]{11}$')),
    CONSTRAINT chk_membro_produtor CHECK (eh_produtor IN ('S', 'N')),
    CONSTRAINT chk_membro_compositor CHECK (eh_compositor IN ('S', 'N')),
    CONSTRAINT chk_membro_instrumentista CHECK (eh_instrumentista IN ('S', 'N')),
    CONSTRAINT chk_membro_vocalista CHECK (eh_vocalista IN ('S', 'N')),

    CONSTRAINT chk_membro_tipo_obrigatorio CHECK (
        eh_instrumentista = 'S' OR eh_vocalista = 'S'
    )
);

ALTER TABLE Banda
    ADD CONSTRAINT fk_banda_lider_mesma_banda
    FOREIGN KEY (lider, id_banda)
    REFERENCES Membro(cpf, banda)
    DEFERRABLE INITIALLY DEFERRED;

CREATE TABLE Telefone_membro (
    membro      CHAR(11)       NOT NULL,
    telefone    VARCHAR2(20)   NOT NULL,

    CONSTRAINT pk_telefone_membro PRIMARY KEY (membro, telefone),
    CONSTRAINT fk_tel_membro FOREIGN KEY (membro)
        REFERENCES Membro(cpf)
        ON DELETE CASCADE,
    CONSTRAINT chk_telefone CHECK (REGEXP_LIKE(telefone, '^[0-9]{10,11}$'))
);

CREATE TABLE Instrumento (
    membro      CHAR(11)       NOT NULL,
    cod_inv     NUMBER(10)     NOT NULL, 
    tipo        VARCHAR2(60)   NOT NULL,
    marca       VARCHAR2(60),

    CONSTRAINT pk_instrumento PRIMARY KEY (membro, cod_inv),
    CONSTRAINT fk_instrumento_membro FOREIGN KEY (membro)
        REFERENCES Membro(cpf)
        ON DELETE CASCADE,
    CONSTRAINT chk_instrumento_tipo CHECK (tipo IN (
        'Guitarra', 'Baixo', 'Bateria', 'Teclado', 'Violao', 'Contrabaixo',
        'Saxofone', 'Trompete', 'Flauta', 'Violino', 'Percussao', 'Outro'
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
    CONSTRAINT chk_apres_publico CHECK (publico_presente IS NULL OR publico_presente >= 0),
    CONSTRAINT chk_apres_cache CHECK (cache_combinado IS NULL OR cache_combinado >= 0)
);
