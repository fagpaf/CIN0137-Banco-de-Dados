-- ============================================================================
-- ARQUIVO: sql/01_consultas.sql
-- ITENS DA CHECKLIST: SELECT-FROM-WHERE, BETWEEN, IN, LIKE, IS NULL, 
-- INNER JOIN, MAX, MIN, AVG, COUNT, LEFT OUTER JOIN, SUBCONSULTAS 
-- (RELACIONAL, IN, ANY, ALL), ORDER BY, GROUP BY, HAVING, UNION/INTERSECT/MINUS.
-- ============================================================================

-- 1. [SELECT-FROM-WHERE], [BETWEEN], [IN], [LIKE], [INNER JOIN], [ORDER BY]
-- Regra de Negócio: Relatório de engajamento listando alunos de estados do Nordeste/Sudeste selecionados, matriculados em cursos de 'Dados' ou 'Programação' com progresso entre 20% e 90%.
SELECT 
    u.nome AS nome_aluno,
    e.cidade,
    e.estado,
    c.titulo AS curso_matriculado,
    m.progresso,
    m.data_inscricao
FROM Matricula m
INNER JOIN Aluno a ON m.cpf_aluno = a.cpf
INNER JOIN Usuario u ON a.cpf = u.cpf
INNER JOIN Endereco e ON u.cep = e.cep
INNER JOIN Curso c ON m.codigo_curso = c.codigo
WHERE e.estado IN ('PE', 'RJ', 'MG', 'CE')
  AND m.progresso BETWEEN 20.00 AND 90.00
  AND (c.titulo LIKE '%Dados%' OR c.titulo LIKE '%Programação%')
ORDER BY m.progresso DESC, u.nome ASC;

-- 2. [IS NULL / IS NOT NULL]
-- Regra de Negócio: Painel de SLA — listar dúvidas que ainda NÃO possuem resposta.
SELECT 
    u_aluno.nome AS aluno_solicitante,
    u_prof.nome AS professor_tutor,
    c.titulo AS curso,
    d.pergunta
FROM Duvida d
INNER JOIN Usuario u_aluno ON d.cpf_aluno = u_aluno.cpf
INNER JOIN Usuario u_prof ON d.cpf_professor = u_prof.cpf
INNER JOIN Curso c ON d.codigo_curso = c.codigo
WHERE d.resposta IS NULL
  AND d.status = 'Pendente';

-- 3. [MAX], [MIN], [AVG], [COUNT], [LEFT OUTER JOIN], [GROUP BY], [HAVING]
-- Regra de Negócio: Desempenho geral por curso (incluindo cursos sem matrículas via LEFT JOIN), filtrando grupos com pelo menos 1 aluno e média > 30%.
SELECT 
    c.codigo,
    c.titulo,
    COUNT(m.cpf_aluno) AS total_matriculas,
    MIN(NVL(m.progresso, 0)) AS menor_progresso,
    MAX(NVL(m.progresso, 0)) AS maior_progresso,
    ROUND(AVG(NVL(m.progresso, 0)), 2) AS media_progresso
FROM Curso c
LEFT OUTER JOIN Matricula m ON c.codigo = m.codigo_curso
GROUP BY c.codigo, c.titulo
HAVING COUNT(m.cpf_aluno) >= 1 
   AND AVG(NVL(m.progresso, 0)) > 30.00
ORDER BY media_progresso DESC;

-- 4. [SUBCONSULTA COM OPERADOR RELACIONAL]
-- Regra de Negócio: Cursos "Premium" cujo preço base é estritamente maior que a média.
SELECT codigo, titulo, preco_base
FROM Curso
WHERE preco_base > (
    SELECT AVG(preco_base) FROM Curso
);

-- 5. [SUBCONSULTA COM IN]
-- Regra de Negócio: Alunos que já possuem certificados E já submeteram dúvidas.
SELECT u.cpf, u.nome
FROM Usuario u
WHERE u.cpf IN (SELECT cpf_aluno FROM Certificado)
  AND u.cpf IN (SELECT cpf_aluno FROM Duvida);

-- 6. [SUBCONSULTA COM ANY]
-- Regra de Negócio: Cursos mais baratos que QUALQUER curso com pré-requisito 'Obrigatório'.
SELECT c.codigo, c.titulo, c.preco_base
FROM Curso c
WHERE c.preco_base < ANY (
    SELECT c_princ.preco_base
    FROM Curso c_princ
    INNER JOIN Exige ex ON c_princ.codigo = ex.codigo_curso_principal
    WHERE ex.nivel_exigencia = 'Obrigatório'
);

-- 7. [SUBCONSULTA COM ALL]
-- Regra de Negócio: Cursos com carga horária superior ou igual a TODOS os cursos lecionados pelo prof. Flávio Araújo Filho.
SELECT c.codigo, c.titulo, c.carga_horaria
FROM Curso c
WHERE c.carga_horaria >= ALL (
    SELECT c_flavio.carga_horaria
    FROM Curso c_flavio
    INNER JOIN Leciona l ON c_flavio.codigo = l.codigo_curso
    INNER JOIN Usuario u ON l.cpf_professor = u.cpf
    WHERE u.nome = 'Flávio Araújo Filho'
);

-- 8. [UNION / INTERSECT / MINUS]
-- Regra de Negócio: INTERSECT para achar perfis sobrepostos (Alunos E Professores) e MINUS para Alunos puros.
SELECT u.cpf, u.nome, 'Perfil Sobreposto (Aluno e Professor)' AS tipo_perfil
FROM Usuario u
WHERE u.cpf IN (
    SELECT cpf FROM Aluno
    INTERSECT
    SELECT cpf FROM Professor
)
UNION
SELECT u.cpf, u.nome, 'Apenas Aluno' AS tipo_perfil
FROM Usuario u
WHERE u.cpf IN (
    SELECT cpf FROM Aluno
    MINUS
    SELECT cpf FROM Professor
);