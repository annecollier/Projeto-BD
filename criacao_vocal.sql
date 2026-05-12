CREATE SEQUENCE SEQ_MUSICA START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE TABLE Musica (
    id_musica         NUMBER(10)      DEFAULT seq_musica.NEXTVAL NOT NULL,
    nome              VARCHAR2(100)   NOT NULL,
    artista_original  VARCHAR2(100) NOT NULL,
    duracao           NUMBER(5) NOT NULL, 
    CONSTRAINT pk_musica PRIMARY KEY (id_musica)
);

CREATE TABLE Canta (
    musica         NUMBER(10)      NOT NULL,
    vocalista      CHAR(11)        NOT NULL,

    CONSTRAINT pk_canta PRIMARY KEY (musica, vocalista),
    CONSTRAINT fk_canta_musica FOREIGN KEY (musica)
        REFERENCES Musica(id_musica)
        ON DELETE CASCADE,
    CONSTRAINT fk_canta_vocalista FOREIGN KEY (vocalista)
        REFERENCES Vocalista(cpf_vocalista)
        ON DELETE CASCADE
);
