-- ==========================================
-- 1. ENDEREÇOS
-- ==========================================

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('50740-000', 'Av. Jornalista Aníbal Fernandes', 'Recife', 'PE');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('01001-000', 'Praça da Sé', 'São Paulo', 'SP');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('20040-002', 'Rua da Assembleia', 'Rio de Janeiro', 'RJ');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('30130-100', 'Av. Afonso Pena', 'Belo Horizonte', 'MG');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('80010-000', 'Rua XV de Novembro', 'Curitiba', 'PR');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('40020-000', 'Av. Sete de Setembro', 'Salvador', 'BA');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('70040-010', 'Esplanada dos Ministérios', 'Brasília', 'DF');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('60060-000', 'Rua Floriano Peixoto', 'Fortaleza', 'CE');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('69005-000', 'Rua Eduardo Ribeiro', 'Manaus', 'AM');

INSERT INTO Endereco (cep, rua, cidade, estado)
VALUES ('88010-000', 'Rua Felipe Schmidt', 'Florianópolis', 'SC');


-- ==========================================
-- 2. USUÁRIOS
-- ==========================================

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('111.111.111-11', 'flavio.araujo@email.com',
     'Flávio Araújo Filho', '50740-000', 'S/N',
     TO_DATE('1998-05-15', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('222.222.222-22', 'joao.silva@email.com',
     'João Silva', '01001-000', '100',
     TO_DATE('1985-10-12', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('333.333.333-33', 'maria.santos@email.com',
     'Maria Santos', '20040-002', '55A',
     TO_DATE('2000-01-20', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('444.444.444-44', 'carlos.oliveira@email.com',
     'Carlos Oliveira', '30130-100', '250',
     TO_DATE('1992-03-08', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('555.555.555-55', 'ana.costa@email.com',
     'Ana Costa', '80010-000', '42',
     TO_DATE('1997-07-19', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('666.666.666-66', 'pedro.almeida@email.com',
     'Pedro Almeida', '40020-000', '710',
     TO_DATE('1989-11-02', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('777.777.777-77', 'juliana.lima@email.com',
     'Juliana Lima', '70040-010', '120',
     TO_DATE('2001-04-25', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('888.888.888-88', 'lucas.martins@email.com',
     'Lucas Martins', '60060-000', '85',
     TO_DATE('1995-09-14', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('999.999.999-99', 'beatriz.rocha@email.com',
     'Beatriz Rocha', '69005-000', '310',
     TO_DATE('2002-12-03', 'YYYY-MM-DD'));

INSERT INTO Usuario
    (cpf, email, nome, cep, numero, data_nascimento)
VALUES
    ('123.456.789-00', 'rafael.gomes@email.com',
     'Rafael Gomes', '88010-000', '500',
     TO_DATE('1990-06-27', 'YYYY-MM-DD'));


-- ==========================================
-- 3. TELEFONES
-- ==========================================

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('111.111.111-11', '(81) 99999-9999');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('111.111.111-11', '(81) 98888-7777');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('222.222.222-22', '(11) 98888-8888');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('333.333.333-33', '(21) 97777-6666');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('444.444.444-44', '(31) 96666-5555');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('555.555.555-55', '(41) 95555-4444');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('555.555.555-55', '(41) 94444-3333');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('666.666.666-66', '(71) 93333-2222');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('777.777.777-77', '(61) 92222-1111');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('888.888.888-88', '(85) 91111-0000');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('999.999.999-99', '(92) 98888-1234');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('123.456.789-00', '(48) 97777-4321');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('123.456.789-00', '(48) 96666-5432');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('222.222.222-22', '(11) 97777-1234');

INSERT INTO Telefone_Usuario (cpf, telefone)
VALUES ('333.333.333-33', '(21) 96666-4321');


-- ==========================================
-- 4. ALUNOS
-- ==========================================

-- Flávio também será professor, demonstrando
-- especialização sobreposta.
INSERT INTO Aluno (cpf)
VALUES ('111.111.111-11');

INSERT INTO Aluno (cpf)
VALUES ('333.333.333-33');

INSERT INTO Aluno (cpf)
VALUES ('444.444.444-44');

INSERT INTO Aluno (cpf)
VALUES ('555.555.555-55');

INSERT INTO Aluno (cpf)
VALUES ('666.666.666-66');

INSERT INTO Aluno (cpf)
VALUES ('777.777.777-77');

INSERT INTO Aluno (cpf)
VALUES ('888.888.888-88');


-- ==========================================
-- 5. PROFESSORES
-- ==========================================

-- Flávio também é aluno: especialização sobreposta.
INSERT INTO Professor (cpf, biografia)
VALUES
    ('111.111.111-11',
     'Monitor do CIn e desenvolvedor com experiência em Python, bancos de dados e desenvolvimento de sistemas.');

INSERT INTO Professor (cpf, biografia)
VALUES
    ('222.222.222-22',
     'Especialista em Banco de Dados e Inteligência Artificial com 10 anos de experiência.');

INSERT INTO Professor (cpf, biografia)
VALUES
    ('666.666.666-66',
     'Engenheiro de software e especialista em desenvolvimento de aplicações web e APIs.');

INSERT INTO Professor (cpf, biografia)
VALUES
    ('888.888.888-88',
     'Especialista em análise de dados, estatística aplicada e visualização de informações.');

INSERT INTO Professor (cpf, biografia)
VALUES
    ('123.456.789-00',
     'Profissional de computação em nuvem com experiência em arquitetura AWS e engenharia de dados.');


-- ==========================================
-- 6. TITULAÇÕES
-- ==========================================

INSERT INTO Titulacao_Professor
    (cpf, titulacao_academica)
VALUES
    ('111.111.111-11', 'Graduando em Ciência da Computação');

INSERT INTO Titulacao_Professor
    (cpf, titulacao_academica)
VALUES
    ('111.111.111-11', 'Monitor de Introdução à Programação');

INSERT INTO Titulacao_Professor
    (cpf, titulacao_academica)
VALUES
    ('222.222.222-22', 'Doutorado em Ciência da Computação');

INSERT INTO Titulacao_Professor
    (cpf, titulacao_academica)
VALUES
    ('222.222.222-22', 'Mestrado em Engenharia de Software');

INSERT INTO Titulacao_Professor
    (cpf, titulacao_academica)
VALUES
    ('666.666.666-66', 'Mestrado em Engenharia de Software');

INSERT INTO Titulacao_Professor
    (cpf, titulacao_academica)
VALUES
    ('888.888.888-88', 'Doutorado em Estatística');

INSERT INTO Titulacao_Professor
    (cpf, titulacao_academica)
VALUES
    ('123.456.789-00', 'Especialização em Computação em Nuvem');


-- ==========================================
-- 7. CURSOS
-- ==========================================

INSERT INTO Curso
    (codigo, titulo, carga_horaria, preco_base)
VALUES
    (1, 'Lógica de Programação', 40, 99.90);

INSERT INTO Curso
    (codigo, titulo, carga_horaria, preco_base)
VALUES
    (2, 'Banco de Dados SQL', 60, 149.90);

INSERT INTO Curso
    (codigo, titulo, carga_horaria, preco_base)
VALUES
    (3, 'Machine Learning Avançado', 80, 299.90);

INSERT INTO Curso
    (codigo, titulo, carga_horaria, preco_base)
VALUES
    (4, 'Desenvolvimento Web com Python', 70, 249.90);

INSERT INTO Curso
    (codigo, titulo, carga_horaria, preco_base)
VALUES
    (5, 'Engenharia de Dados', 90, 349.90);

INSERT INTO Curso
    (codigo, titulo, carga_horaria, preco_base)
VALUES
    (6, 'Computação em Nuvem', 50, 279.90);


-- ==========================================
-- 8. MÓDULOS
-- ==========================================

-- Curso 1
INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (1, 1, 'Introdução aos Algoritmos',
     'Conceitos fundamentais de lógica e algoritmos.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (1, 2, 'Estruturas Condicionais',
     'Operadores relacionais, lógicos e estruturas de decisão.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (1, 3, 'Estruturas de Repetição',
     'Laços de repetição e resolução de problemas iterativos.');

-- Curso 2
INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (2, 1, 'Modelagem Relacional',
     'Formas Normais, chaves e transformação do modelo conceitual.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (2, 2, 'SQL Básico',
     'Comandos DDL, DML e consultas relacionais.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (2, 3, 'Consultas e Junções',
     'JOINs, agrupamentos, subconsultas e funções de agregação.');

-- Curso 3
INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (3, 1, 'Fundamentos de Machine Learning',
     'Conceitos fundamentais de aprendizado supervisionado e não supervisionado.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (3, 2, 'Modelos de Classificação',
     'Árvores de decisão, regressão logística e avaliação de modelos.');

-- Curso 4
INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (4, 1, 'Python para Web',
     'Fundamentos do desenvolvimento web utilizando Python.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (4, 2, 'APIs REST',
     'Criação e consumo de APIs seguindo o padrão REST.');

-- Curso 5
INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (5, 1, 'Fundamentos da Engenharia de Dados',
     'Conceitos de pipelines, ETL, ELT e arquitetura de dados.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (5, 2, 'ETL e Pipelines',
     'Construção e automação de pipelines de dados.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (5, 3, 'Data Warehouse',
     'Modelagem dimensional, fatos e dimensões.');

-- Curso 6
INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (6, 1, 'Fundamentos de Cloud',
     'Conceitos de computação em nuvem e modelos de serviço.');

INSERT INTO Modulo
    (codigo_curso, numero_modulo, titulo_modulo, descricao)
VALUES
    (6, 2, 'Armazenamento e Computação',
     'Serviços de armazenamento, máquinas virtuais e escalabilidade.');


-- ==========================================
-- 9. CUPONS
-- ==========================================

INSERT INTO Cupom
    (codigo_cupom, percentual_desconto)
VALUES
    ('PROMO20', 20.00);

INSERT INTO Cupom
    (codigo_cupom, percentual_desconto)
VALUES
    ('BEMVINDO', 50.00);

INSERT INTO Cupom
    (codigo_cupom, percentual_desconto)
VALUES
    ('DADOS15', 15.00);

INSERT INTO Cupom
    (codigo_cupom, percentual_desconto)
VALUES
    ('NATAL30', 30.00);


-- ==========================================
-- 10. MATRÍCULAS
-- ==========================================

-- Maria concluiu Lógica de Programação.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('333.333.333-33', 1,
     TO_DATE('2026-08-01', 'YYYY-MM-DD'),
     'Concluído', 100);

-- Maria está cursando Banco de Dados.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('333.333.333-33', 2,
     TO_DATE('2026-10-01', 'YYYY-MM-DD'),
     'Ativo', 65);

-- Flávio está cursando Machine Learning.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('111.111.111-11', 3,
     TO_DATE('2026-09-15', 'YYYY-MM-DD'),
     'Ativo', 45.50);

-- Carlos concluiu Lógica.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('444.444.444-44', 1,
     TO_DATE('2026-06-10', 'YYYY-MM-DD'),
     'Concluído', 100);

-- Carlos está cursando Banco de Dados.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('444.444.444-44', 2,
     TO_DATE('2026-08-20', 'YYYY-MM-DD'),
     'Ativo', 80);

-- Ana concluiu Lógica.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('555.555.555-55', 1,
     TO_DATE('2026-05-12', 'YYYY-MM-DD'),
     'Concluído', 100);

-- Ana cancelou Banco de Dados.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('555.555.555-55', 2,
     TO_DATE('2026-07-03', 'YYYY-MM-DD'),
     'Cancelado', 25);

-- Pedro está cursando Engenharia de Dados.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('666.666.666-66', 5,
     TO_DATE('2026-09-01', 'YYYY-MM-DD'),
     'Ativo', 55);

-- Juliana está cursando Desenvolvimento Web.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('777.777.777-77', 4,
     TO_DATE('2026-08-15', 'YYYY-MM-DD'),
     'Ativo', 70);

-- Lucas concluiu Banco de Dados.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('888.888.888-88', 2,
     TO_DATE('2026-04-10', 'YYYY-MM-DD'),
     'Concluído', 100);

-- Lucas está cursando Machine Learning.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('888.888.888-88', 3,
     TO_DATE('2026-09-20', 'YYYY-MM-DD'),
     'Ativo', 35);

-- Flávio também está cursando Engenharia de Dados.
INSERT INTO Matricula
    (cpf_aluno, codigo_curso, data_inscricao, status, progresso)
VALUES
    ('111.111.111-11', 5,
     TO_DATE('2026-10-02', 'YYYY-MM-DD'),
     'Ativo', 20);


-- ==========================================
-- 11. CERTIFICADOS
-- ==========================================

INSERT INTO Certificado
    (numero_registro, data_emissao, url_validacao,
     cpf_aluno, codigo_curso)
VALUES
    (seq_certificado.NEXTVAL,
     TO_DATE('2026-08-30', 'YYYY-MM-DD'),
     'https://cert.plataforma.com/validar/aB3f9',
     '333.333.333-33', 1);

INSERT INTO Certificado
    (numero_registro, data_emissao, url_validacao,
     cpf_aluno, codigo_curso)
VALUES
    (seq_certificado.NEXTVAL,
     TO_DATE('2026-07-20', 'YYYY-MM-DD'),
     'https://cert.plataforma.com/validar/cD7h2',
     '444.444.444-44', 1);

INSERT INTO Certificado
    (numero_registro, data_emissao, url_validacao,
     cpf_aluno, codigo_curso)
VALUES
    (seq_certificado.NEXTVAL,
     TO_DATE('2026-06-22', 'YYYY-MM-DD'),
     'https://cert.plataforma.com/validar/eF8k4',
     '555.555.555-55', 1);

INSERT INTO Certificado
    (numero_registro, data_emissao, url_validacao,
     cpf_aluno, codigo_curso)
VALUES
    (seq_certificado.NEXTVAL,
     TO_DATE('2026-06-05', 'YYYY-MM-DD'),
     'https://cert.plataforma.com/validar/gH1m6',
     '888.888.888-88', 2);

INSERT INTO Certificado
    (numero_registro, data_emissao, url_validacao,
     cpf_aluno, codigo_curso)
VALUES
    (seq_certificado.NEXTVAL,
     TO_DATE('2026-06-10', 'YYYY-MM-DD'),
     'https://cert.plataforma.com/validar/iJ5p8',
     '888.888.888-88', 2);


-- ==========================================
-- 12. LECIONA
-- ==========================================

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('111.111.111-11', 1);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('111.111.111-11', 2);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('222.222.222-22', 2);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('222.222.222-22', 3);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('666.666.666-66', 4);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('666.666.666-66', 5);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('888.888.888-88', 3);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('888.888.888-88', 5);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('123.456.789-00', 5);

INSERT INTO Leciona (cpf_professor, codigo_curso)
VALUES ('123.456.789-00', 6);


-- ==========================================
-- 13. PRÉ-REQUISITOS
-- ==========================================

INSERT INTO Exige
    (codigo_curso_principal, codigo_curso_prerequisito, nivel_exigencia)
VALUES
    (2, 1, 'Obrigatório');

INSERT INTO Exige
    (codigo_curso_principal, codigo_curso_prerequisito, nivel_exigencia)
VALUES
    (3, 1, 'Recomendado');

INSERT INTO Exige
    (codigo_curso_principal, codigo_curso_prerequisito, nivel_exigencia)
VALUES
    (3, 2, 'Recomendado');

INSERT INTO Exige
    (codigo_curso_principal, codigo_curso_prerequisito, nivel_exigencia)
VALUES
    (4, 1, 'Obrigatório');

INSERT INTO Exige
    (codigo_curso_principal, codigo_curso_prerequisito, nivel_exigencia)
VALUES
    (5, 2, 'Obrigatório');

INSERT INTO Exige
    (codigo_curso_principal, codigo_curso_prerequisito, nivel_exigencia)
VALUES
    (5, 3, 'Recomendado');

INSERT INTO Exige
    (codigo_curso_principal, codigo_curso_prerequisito, nivel_exigencia)
VALUES
    (6, 1, 'Recomendado');


-- ==========================================
-- 14. PROMOÇÕES
-- ==========================================

INSERT INTO Promocao
    (codigo_curso, codigo_cupom, data_inicio, data_fim)
VALUES
    (3, 'PROMO20',
     TO_DATE('2026-01-01', 'YYYY-MM-DD'),
     TO_DATE('2026-03-31', 'YYYY-MM-DD'));

INSERT INTO Promocao
    (codigo_curso, codigo_cupom, data_inicio, data_fim)
VALUES
    (2, 'BEMVINDO',
     TO_DATE('2026-01-15', 'YYYY-MM-DD'),
     TO_DATE('2026-02-28', 'YYYY-MM-DD'));

INSERT INTO Promocao
    (codigo_curso, codigo_cupom, data_inicio, data_fim)
VALUES
    (5, 'DADOS15',
     TO_DATE('2026-08-01', 'YYYY-MM-DD'),
     TO_DATE('2026-10-31', 'YYYY-MM-DD'));

INSERT INTO Promocao
    (codigo_curso, codigo_cupom, data_inicio, data_fim)
VALUES
    (6, 'NATAL30',
     TO_DATE('2026-11-01', 'YYYY-MM-DD'),
     TO_DATE('2026-12-31', 'YYYY-MM-DD'));

INSERT INTO Promocao
    (codigo_curso, codigo_cupom, data_inicio, data_fim)
VALUES
    (4, 'DADOS15',
     TO_DATE('2026-09-01', 'YYYY-MM-DD'),
     TO_DATE('2026-11-30', 'YYYY-MM-DD'));

INSERT INTO Promocao
    (codigo_curso, codigo_cupom, data_inicio, data_fim)
VALUES
    (1, 'BEMVINDO',
     TO_DATE('2026-01-01', 'YYYY-MM-DD'),
     TO_DATE('2026-01-31', 'YYYY-MM-DD'));


-- ==========================================
-- 15. DÚVIDAS
-- ==========================================

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('333.333.333-33',
     '222.222.222-22',
     2, 1,
     TO_DATE('2026-10-05 14:30', 'YYYY-MM-DD HH24:MI'),
     'Como defino a dependência transitiva?',
     'Uma dependência transitiva ocorre quando um atributo não-chave determina outro atributo não-chave.',
     'Respondida');

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('333.333.333-33',
     '111.111.111-11',
     2, 2,
     TO_DATE('2026-10-06 09:15', 'YYYY-MM-DD HH24:MI'),
     'Qual a diferença entre DELETE e DROP?',
     'DELETE remove registros de uma tabela, enquanto DROP remove a própria estrutura da tabela.',
     'Respondida');

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('444.444.444-44',
     '111.111.111-11',
     1, 2,
     TO_DATE('2026-09-12 16:20', 'YYYY-MM-DD HH24:MI'),
     'Quando devo utilizar uma estrutura IF?',
     NULL,
     'Pendente');

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('444.444.444-44',
     '222.222.222-22',
     2, 3,
     TO_DATE('2026-09-20 10:05', 'YYYY-MM-DD HH24:MI'),
     'Como funciona o GROUP BY em uma consulta?',
     'GROUP BY agrupa registros que possuem os mesmos valores nas colunas especificadas.',
     'Respondida');

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('666.666.666-66',
     '666.666.666-66',
     5, 1,
     TO_DATE('2026-10-03 18:40', 'YYYY-MM-DD HH24:MI'),
     'Qual a diferença entre ETL e ELT?',
     'No ETL a transformação normalmente ocorre antes da carga, enquanto no ELT os dados são carregados antes da transformação.',
     'Respondida');

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('666.666.666-66',
     '123.456.789-00',
     5, 2,
     TO_DATE('2026-10-04 11:10', 'YYYY-MM-DD HH24:MI'),
     'Como posso automatizar a execução de um pipeline?',
     NULL,
     'Pendente');

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('777.777.777-77',
     '666.666.666-66',
     4, 2,
     TO_DATE('2026-09-28 13:45', 'YYYY-MM-DD HH24:MI'),
     'Qual é a vantagem de utilizar uma API REST?',
     'APIs REST permitem disponibilizar recursos de forma padronizada através de requisições HTTP.',
     'Respondida');

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('888.888.888-88',
     '888.888.888-88',
     3, 1,
     TO_DATE('2026-10-01 15:00', 'YYYY-MM-DD HH24:MI'),
     'Qual a diferença entre aprendizado supervisionado e não supervisionado?',
     'No aprendizado supervisionado existem dados rotulados para orientar o treinamento, enquanto no não supervisionado o algoritmo busca padrões nos próprios dados.',
     'Respondida');

INSERT INTO Duvida
    (cpf_aluno, cpf_professor, codigo_curso, numero_modulo,
     data_hora, pergunta, resposta, status)
VALUES
    ('111.111.111-11',
     '123.456.789-00',
     5, 3,
     TO_DATE('2026-10-06 20:15', 'YYYY-MM-DD HH24:MI'),
     'Qual é a diferença entre Data Warehouse e banco de dados transacional?',
     NULL,
     'Pendente');