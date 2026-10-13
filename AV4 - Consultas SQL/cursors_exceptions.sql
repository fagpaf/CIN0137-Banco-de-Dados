-- ============================================================================
-- ARQUIVO: plsql/03_cursors_exceptions.sql
-- ITENS DA CHECKLIST: CURSOR (OPEN, FETCH, CLOSE), LOOP EXIT WHEN, EXCEPTION WHEN.
-- ============================================================================
SET SERVEROUTPUT ON;

DECLARE
    -- [CURSOR] Declaração explícita
    CURSOR cur_duvidas_pendentes IS
        SELECT d.cpf_aluno, c.titulo, d.pergunta
        FROM Duvida d
        INNER JOIN Curso c ON d.codigo_curso = c.codigo
        WHERE d.status = 'Pendente';

    v_aluno    Duvida.cpf_aluno%TYPE;
    v_curso    Curso.titulo%TYPE;
    v_pergunta Duvida.pergunta%TYPE;
    v_dummy    NUMBER;
BEGIN
    -- [OPEN]
    OPEN cur_duvidas_pendentes;
    
    LOOP
        -- [FETCH]
        FETCH cur_duvidas_pendentes INTO v_aluno, v_curso, v_pergunta;
        -- [LOOP EXIT WHEN]
        EXIT WHEN cur_duvidas_pendentes%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Dúvida Pendente em ' || v_curso || ': ' || v_pergunta);
    END LOOP;
    
    -- [CLOSE]
    CLOSE cur_duvidas_pendentes;

    -- Simulação de Erro para acionar a Exception
    SELECT codigo INTO v_dummy FROM Curso WHERE codigo = 99999;

-- [EXCEPTION WHEN]
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Exceção Tratada: Nenhum dado encontrado para a operação solicitada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro Crítico: ' || SQLERRM);
END;
/