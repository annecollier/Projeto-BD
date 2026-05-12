CREATE OR REPLACE PROCEDURE cadastrar_membro (
    p_cpf           IN CHAR,
    p_nome          IN VARCHAR2,
    p_banda         IN NUMBER,
    p_especialidade IN CHAR 
) AS
BEGIN
    IF p_especialidade NOT IN ('I', 'V', 'A') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: O membro DEVE ter uma especialidade. Use I (Instrumentista), V (Vocalista) ou A (Ambos).');
    END IF;

    INSERT INTO Membro (cpf, nome, banda) 
    VALUES (p_cpf, p_nome, p_banda);

    IF p_especialidade IN ('I', 'A') THEN
        INSERT INTO Instrumentista (cpf_instrumentista) VALUES (p_cpf);
    END IF;

    IF p_especialidade IN ('V', 'A') THEN
        INSERT INTO Vocalista (cpf_vocalista) VALUES (p_cpf);
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
-- pra rodar é só colocar EXECUTE cadastrar_membro(cpf, nome, id, (I, V, A)) 
