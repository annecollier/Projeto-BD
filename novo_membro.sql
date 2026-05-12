CREATE TABLE Membro (
    cpf                 CHAR(11)        NOT NULL,
    nome                VARCHAR2(100)   NOT NULL,
    banda               NUMBER(10),

    CONSTRAINT pk_membro PRIMARY KEY (cpf),
    CONSTRAINT uq_membro_cpf_banda UNIQUE (cpf, banda),
    
    CONSTRAINT fk_membro_banda FOREIGN KEY (banda)
        REFERENCES Banda(id_banda)
        ON DELETE SET NULL,
        
    CONSTRAINT chk_membro_cpf CHECK (REGEXP_LIKE(cpf, '^[0-9]{11}$')),
    CONSTRAINT chk_membro_instrumentista CHECK (eh_instrumentista IN ('S', 'N')),
    CONSTRAINT chk_membro_vocalista CHECK (eh_vocalista IN ('S', 'N')),

    -- Garante a Especialização TOTAL (obriga a ser pelo menos um dos dois)
    CONSTRAINT chk_membro_tipo_obrigatorio CHECK (
        eh_instrumentista = 'S' OR eh_vocalista = 'S'
    )
);


CREATE TABLE Instrumentista (
    cpf_membro          CHAR(11)        NOT NULL,
    
    CONSTRAINT pk_instrumentista PRIMARY KEY (cpf_membro),
    
    CONSTRAINT fk_inst_membro FOREIGN KEY (cpf_membro) 
        REFERENCES Membro(cpf) 
        ON DELETE CASCADE
);

CREATE TABLE Vocalista (
    cpf_membro          CHAR(11)        NOT NULL,
    
    CONSTRAINT pk_vocalista PRIMARY KEY (cpf_membro),
    
    CONSTRAINT fk_voc_membro FOREIGN KEY (cpf_membro) 
        REFERENCES Membro(cpf) 
        ON DELETE CASCADE
);

CREATE TABLE Instrumento (
    membro      CHAR(11)       NOT NULL,
    cod_inv     NUMBER(10)     NOT NULL, 
    tipo        VARCHAR2(60)   NOT NULL,
    marca       VARCHAR2(60)   NOT NULL

    CONSTRAINT pk_instrumento PRIMARY KEY (membro, cod_inv),
    
    -- A grande mudança: A Foreign Key agora aponta para a Subclasse!
    CONSTRAINT fk_instrumento_membro FOREIGN KEY (membro)
        REFERENCES Instrumentista(cpf_membro)
        ON DELETE CASCADE,
        
    CONSTRAINT chk_instrumento_tipo CHECK (tipo IN (
        'Guitarra', 'Baixo', 'Bateria', 'Teclado', 'Violao', 'Contrabaixo',
        'Saxofone', 'Trompete', 'Flauta', 'Violino', 'Percussao', 'Outro'
    ))
);