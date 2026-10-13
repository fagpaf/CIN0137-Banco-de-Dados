-- ============================================================================
-- ARQUIVO: plsql/01_blocos_e_estruturas.sql
-- ITENS DA CHECKLIST: BLOCO ANÔNIMO, USO DE RECORD, ESTRUTURA DE DADOS DO 
-- TIPO TABLE, FOR IN LOOP, CASE WHEN, IF ELSIF.
-- ============================================================================
SET SERVEROUTPUT ON;

DECLARE
    -- [USO DE RECORD]
    TYPE rec_resumo_curso IS RECORD (
        codigo_curso     Curso.codigo%TYPE,
        titulo_curso     Curso.titulo%TYPE,
        total_alunos     NUMBER,
        media_progresso  NUMBER(5,2),
        classificacao    VARCHAR2(30)
    );

    -- [ESTRUTURA DE DADOS DO TIPO TABLE]
    TYPE tab_resumo_cursos IS TABLE OF rec_resumo_curso INDEX BY PLS_INTEGER;
    
    v_tabela_cursos tab_resumo_cursos;
    v_idx           PLS_INTEGER := 0;
BEGIN
    -- [BLOCO ANÔNIMO] e [FOR IN LOOP]
    FOR r IN (
        SELECT c.codigo, c.titulo, COUNT(m.cpf_aluno) AS qtd_alunos, ROUND(AVG(NVL(m.progresso, 0)), 2) AS media_prog
        FROM Curso c
        LEFT JOIN Matricula m ON c.codigo = m.codigo_curso
        GROUP BY c.codigo, c.titulo
    ) LOOP
        v_idx := v_idx + 1;
        v_tabela_cursos(v_idx).codigo_curso    := r.codigo;
        v_tabela_cursos(v_idx).titulo_curso    := r.titulo;
        v_tabela_cursos(v_idx).total_alunos    := r.qtd_alunos;
        v_tabela_cursos(v_idx).media_progresso := r.media_prog;

        -- [CASE WHEN]
        v_tabela_cursos(v_idx).classificacao := CASE
            WHEN r.qtd_alunos = 0 THEN 'Sem Adesão'
            WHEN r.media_prog >= 60 THEN 'Alta Retenção'
            ELSE 'Crítico - Requer Tutoria'
        END;

        -- [IF ELSIF]
        IF v_tabela_cursos(v_idx).classificacao = 'Alta Retenção' THEN
            DBMS_OUTPUT.PUT_LINE('[DESTAQUE] Curso: ' || r.titulo || ' | Média: ' || r.media_prog || '%');
        ELSIF v_tabela_cursos(v_idx).classificacao = 'Crítico - Requer Tutoria' THEN
            DBMS_OUTPUT.PUT_LINE('[ALERTA]   Curso: ' || r.titulo || ' | Média: ' || r.media_prog || '%');
        ELSE
            DBMS_OUTPUT.PUT_LINE('[INFO]     Curso: ' || r.titulo || ' | Média: ' || r.media_prog || '%');
        END IF;
    END LOOP;
END;
/