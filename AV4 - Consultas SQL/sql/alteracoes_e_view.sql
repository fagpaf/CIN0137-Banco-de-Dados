-- 1. ALTER TABLE
ALTER TABLE Curso 
ADD nivel_dificuldade VARCHAR2(20) DEFAULT 'Intermediário'
CONSTRAINT chk_nivel_curso CHECK (nivel_dificuldade IN ('Iniciante', 'Intermediário', 'Avançado'));

-- 2. CREATE INDEX
CREATE INDEX idx_duvida_status_data ON Duvida (status, data_hora);

-- 3. INSERT INTO
INSERT INTO Aluno (cpf) VALUES ('999.999.999-99');
INSERT INTO Matricula (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES ('999.999.999-99', 1, TO_DATE('2026-10-10', 'YYYY-MM-DD'), 'Ativo', 15.00);

-- 4. UPDATE
UPDATE Curso 
SET nivel_dificuldade = CASE 
    WHEN carga_horaria <= 45 THEN 'Iniciante'
    WHEN carga_horaria <= 75 THEN 'Intermediário'
    ELSE 'Avançado'
END;

UPDATE Matricula 
SET progresso = progresso + 5.00 
WHERE codigo_curso = 2 AND status = 'Ativo' AND progresso <= 95.00;

-- 5. DELETE
DELETE FROM Matricula WHERE cpf_aluno = '999.999.999-99' AND codigo_curso = 1;
DELETE FROM Aluno WHERE cpf = '999.999.999-99';

-- 6. CREATE VIEW
CREATE OR REPLACE VIEW vw_auditoria_promocional AS
SELECT 
    c.codigo AS codigo_curso,
    c.titulo AS titulo_curso,
    c.preco_base,
    cup.codigo_cupom,
    cup.percentual_desconto,
    ROUND(c.preco_base * (1 - (cup.percentual_desconto / 100)), 2) AS preco_com_desconto,
    p.data_inicio,
    p.data_fim
FROM Curso c
JOIN Promocao p ON c.codigo = p.codigo_curso
JOIN Cupom cup ON p.codigo_cupom = cup.codigo_cupom;

-- 7. GRANT / REVOKE
/*
GRANT SELECT ON vw_auditoria_promocional TO PUBLIC;
REVOKE SELECT ON vw_auditoria_promocional FROM PUBLIC;
*/