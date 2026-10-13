-- ============================================================================
-- ARQUIVO: plsql/02_procedures_functions.sql
-- ITENS DA CHECKLIST: CREATE PROCEDURE, CREATE FUNCTION, %TYPE, %ROWTYPE, 
-- SELECT … INTO, USO DE PARÂMETROS (IN, OUT, IN OUT), WHILE LOOP.
-- ============================================================================

-- 1. [CREATE FUNCTION], [%TYPE], [WHILE LOOP]
CREATE OR REPLACE FUNCTION fn_indice_qualidade_professor (
    p_cpf_professor IN Professor.cpf%TYPE
) RETURN NUMBER IS
    v_total_duvidas       NUMBER := 0;
    v_duvidas_respondidas NUMBER := 0;
    v_qtd_cursos          NUMBER := 0;
    v_contador            NUMBER := 1;
    v_bonus_cursos        NUMBER := 0;
    v_indice_final        NUMBER(5,2) := 0;
BEGIN
    SELECT COUNT(*), COUNT(CASE WHEN status = 'Respondida' AND resposta IS NOT NULL THEN 1 END)
    INTO v_total_duvidas, v_duvidas_respondidas
    FROM Duvida WHERE cpf_professor = p_cpf_professor;

    SELECT COUNT(*) INTO v_qtd_cursos
    FROM Leciona WHERE cpf_professor = p_cpf_professor;

    -- [WHILE LOOP]
    WHILE v_contador <= v_qtd_cursos LOOP
        v_bonus_cursos := v_bonus_cursos + 2;
        v_contador := v_contador + 1;
    END LOOP;

    IF v_total_duvidas = 0 THEN
        v_indice_final := 80 + v_bonus_cursos; 
    ELSE
        v_indice_final := ROUND((v_duvidas_respondidas / v_total_duvidas) * 90, 2) + v_bonus_cursos;
    END IF;

    RETURN LEAST(v_indice_final, 100);
END fn_indice_qualidade_professor;
/

-- 2. [CREATE PROCEDURE], [%ROWTYPE], [SELECT ... INTO], [PARÂMETROS IN, OUT, IN OUT]
CREATE OR REPLACE PROCEDURE prc_atualizar_progresso (
    p_cpf_aluno       IN Matricula.cpf_aluno%TYPE,
    p_codigo_curso    IN Matricula.codigo_curso%TYPE,
    p_incremento_prog IN OUT NUMBER,
    p_msg_resultado   OUT VARCHAR2
) IS
    v_matricula Matricula%ROWTYPE; -- [%ROWTYPE]
BEGIN
    -- [SELECT ... INTO]
    SELECT * INTO v_matricula
    FROM Matricula
    WHERE cpf_aluno = p_cpf_aluno AND codigo_curso = p_codigo_curso;

    p_incremento_prog := v_matricula.progresso + p_incremento_prog;
    
    IF p_incremento_prog >= 100 THEN
        p_incremento_prog := 100;
    END IF;

    UPDATE Matricula
    SET progresso = p_incremento_prog,
        status = CASE WHEN p_incremento_prog = 100 THEN 'Concluído' ELSE status END
    WHERE cpf_aluno = p_cpf_aluno AND codigo_curso = p_codigo_curso;

    p_msg_resultado := 'Progresso atualizado com sucesso para ' || p_incremento_prog || '%.';
END prc_atualizar_progresso;
/