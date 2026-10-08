CREATE TABLE Endereco (
    cep VARCHAR2(10),
    rua VARCHAR2(150) NOT NULL,
    cidade VARCHAR2(100) NOT NULL,
    estado VARCHAR2(2) NOT NULL,
    CONSTRAINT pk_endereco PRIMARY KEY (cep)
);

CREATE TABLE Usuario (
    cpf VARCHAR2(14),
    email VARCHAR2(150) NOT NULL UNIQUE,
    nome VARCHAR2(150) NOT NULL,
    cep VARCHAR2(10) NOT NULL,
    numero VARCHAR2(10),
    data_nascimento DATE NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (cpf),
    CONSTRAINT fk_usuario_endereco FOREIGN KEY (cep) REFERENCES Endereco(cep)
);

CREATE TABLE Telefone_Usuario (
    cpf VARCHAR2(14),
    telefone VARCHAR2(20),
    CONSTRAINT pk_telefone_usuario PRIMARY KEY (cpf, telefone),
    CONSTRAINT fk_telefone_usuario FOREIGN KEY (cpf) REFERENCES Usuario(cpf) ON DELETE CASCADE
);

CREATE TABLE Aluno (
    cpf VARCHAR2(14),
    CONSTRAINT pk_aluno PRIMARY KEY (cpf),
    CONSTRAINT fk_aluno_usuario FOREIGN KEY (cpf) REFERENCES Usuario(cpf) ON DELETE CASCADE
);

CREATE TABLE Professor (
    cpf VARCHAR2(14),
    biografia VARCHAR2(1000),
    CONSTRAINT pk_professor PRIMARY KEY (cpf),
    CONSTRAINT fk_professor_usuario FOREIGN KEY (cpf) REFERENCES Usuario(cpf) ON DELETE CASCADE
);

CREATE TABLE Titulacao_Professor (
    cpf VARCHAR2(14),
    titulacao_academica VARCHAR2(150),
    CONSTRAINT pk_titulacao_prof PRIMARY KEY (cpf, titulacao_academica),
    CONSTRAINT fk_titulacao_prof FOREIGN KEY (cpf) REFERENCES Professor(cpf) ON DELETE CASCADE
);

CREATE TABLE Curso (
    codigo NUMBER,
    titulo VARCHAR2(150) NOT NULL,
    carga_horaria NUMBER NOT NULL,
    preco_base NUMBER(10, 2) NOT NULL,
    CONSTRAINT pk_curso PRIMARY KEY (codigo),
    CONSTRAINT chk_carga_horaria CHECK (carga_horaria > 0),
    CONSTRAINT chk_preco_base CHECK (preco_base >= 0)
);

CREATE TABLE Modulo (
    codigo_curso NUMBER,
    numero_modulo NUMBER,
    titulo_modulo VARCHAR2(150) NOT NULL,
    descricao VARCHAR2(500),
    CONSTRAINT pk_modulo PRIMARY KEY (codigo_curso, numero_modulo),
    CONSTRAINT fk_modulo_curso FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo) ON DELETE CASCADE,
    CONSTRAINT chk_numero_modulo CHECK (numero_modulo > 0)
);

CREATE TABLE Cupom (
    codigo_cupom VARCHAR2(30),
    percentual_desconto NUMBER(5, 2) NOT NULL,
    CONSTRAINT pk_cupom PRIMARY KEY (codigo_cupom),
    CONSTRAINT chk_percentual CHECK (percentual_desconto > 0 AND percentual_desconto <= 100)
);

CREATE TABLE Matricula (
    cpf_aluno VARCHAR2(14),
    codigo_curso NUMBER,
    data_inscricao DATE NOT NULL,
    status VARCHAR2(20) NOT NULL,
    progresso NUMBER(5, 2) DEFAULT 0,
    CONSTRAINT pk_matricula PRIMARY KEY (cpf_aluno, codigo_curso),
    CONSTRAINT fk_mat_aluno FOREIGN KEY (cpf_aluno) REFERENCES Aluno(cpf),
    CONSTRAINT fk_mat_curso FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo),
    CONSTRAINT chk_status_mat CHECK (status IN ('Ativo', 'Concluído', 'Cancelado')),
    CONSTRAINT chk_progresso CHECK (progresso >= 0 AND progresso <= 100)
);

-- Sequência exigida no checklist para gerar os números de registro dos certificados
CREATE SEQUENCE seq_certificado 
START WITH 1000 
INCREMENT BY 1;

CREATE TABLE Certificado (
    numero_registro NUMBER,
    data_emissao DATE NOT NULL,
    url_validacao VARCHAR2(255) NOT NULL UNIQUE,
    cpf_aluno VARCHAR2(14) NOT NULL,
    codigo_curso NUMBER NOT NULL,
    CONSTRAINT pk_certificado PRIMARY KEY (numero_registro),
    CONSTRAINT fk_cert_matricula FOREIGN KEY (cpf_aluno, codigo_curso) REFERENCES Matricula(cpf_aluno, codigo_curso) ON DELETE CASCADE
);

CREATE TABLE Leciona (
    cpf_professor VARCHAR2(14),
    codigo_curso NUMBER,
    CONSTRAINT pk_leciona PRIMARY KEY (cpf_professor, codigo_curso),
    CONSTRAINT fk_lec_prof FOREIGN KEY (cpf_professor) REFERENCES Professor(cpf),
    CONSTRAINT fk_lec_curso FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo)
);

CREATE TABLE Exige (
    codigo_curso_principal NUMBER,
    codigo_curso_prerequisito NUMBER,
    nivel_exigencia VARCHAR2(50),
    CONSTRAINT pk_exige PRIMARY KEY (codigo_curso_principal, codigo_curso_prerequisito),
    CONSTRAINT fk_exige_princ FOREIGN KEY (codigo_curso_principal) REFERENCES Curso(codigo),
    CONSTRAINT fk_exige_pre FOREIGN KEY (codigo_curso_prerequisito) REFERENCES Curso(codigo),
    CONSTRAINT chk_curso_diferente CHECK (codigo_curso_principal <> codigo_curso_prerequisito)
);

CREATE TABLE Promocao (
    codigo_curso NUMBER,
    codigo_cupom VARCHAR2(30),
    data_inicio DATE,
    data_fim DATE,
    CONSTRAINT pk_promocao PRIMARY KEY (codigo_curso, codigo_cupom, data_inicio),
    CONSTRAINT fk_promo_curso FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo),
    CONSTRAINT fk_promo_cupom FOREIGN KEY (codigo_cupom) REFERENCES Cupom(codigo_cupom),
    CONSTRAINT chk_datas_promo CHECK (data_fim > data_inicio)
);

CREATE TABLE Duvida (
    cpf_aluno VARCHAR2(14),
    cpf_professor VARCHAR2(14),
    codigo_curso NUMBER,
    numero_modulo NUMBER,
    data_hora DATE,
    pergunta VARCHAR2(1000) NOT NULL,
    resposta VARCHAR2(1000),
    status VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_duvida PRIMARY KEY (cpf_aluno, cpf_professor, codigo_curso, numero_modulo, data_hora),
    CONSTRAINT fk_duv_aluno FOREIGN KEY (cpf_aluno) REFERENCES Aluno(cpf),
    CONSTRAINT fk_duv_prof FOREIGN KEY (cpf_professor) REFERENCES Professor(cpf),
    CONSTRAINT fk_duv_modulo FOREIGN KEY (codigo_curso, numero_modulo) REFERENCES Modulo(codigo_curso, numero_modulo),
    CONSTRAINT chk_status_duvida CHECK (status IN ('Pendente', 'Respondida', 'Fechada'))
);