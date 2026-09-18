# Mapeamento e Normalização (AV2)

### 1. Usuário (e atributos multivalorados)

Aplicando a 1FN (removendo atributos compostos como endereço e multivalorados como telefone), temos:

`Usuario(cpf, email, nome, cep, estado, numero, rua, cidade, data_nascimento)`
cpf → email, nome, cep, estado, numero, rua, cidade, data_nascimento
cep → rua, cidade, estado

**Justificativa:** Identificamos uma dependência transitiva (cpf determina cep, que por sua vez determina rua, cidade e estado). Isso fere a 3FN. Para resolver, quebramos em duas tabelas:

**Tabelas normalizadas:**
`Endereco(cep, rua, cidade, estado)`
cep → rua, cidade, estado

`Usuario(cpf, email, nome, cep*, numero, data_nascimento)`
cpf → email, nome, cep, numero, data_nascimento

O atributo multivalorado virou tabela própria (Regra de mapeamento):
`Telefone_Usuario(cpf*, telefone)`
cpf, telefone → (nenhum atributo não-chave)

### 2. Aluno e Professor (Herança)

Herança total e sobreposta, mapeada em tabelas separadas que herdam a PK.

`Aluno(cpf*)`
cpf → (nenhum)

`Professor(cpf*, biografia)`
cpf → biografia

`Titulacao_Professor(cpf*, titulacao_academica)`
cpf, titulacao_academica → (nenhum)

**Justificativa:** Atributo multivalorado virou tabela. Nenhuma dessas tabelas tem dependência parcial ou transitiva. Todas na FNBC.

### 3. Curso

`Curso(codigo, titulo, carga_horaria, preco_base)`
codigo → titulo, carga_horaria, preco_base

**Justificativa:** A chave é simples e todos os atributos dependem apenas dela. FNBC.

### 4. Módulo

`Modulo(codigo_curso*, numero_modulo, titulo_modulo, descricao)`
codigo_curso, numero_modulo → titulo_modulo, descricao

**Justificativa:** Sendo entidade fraca, recebe a PK de Curso. Título e descrição dependem da chave composta inteira, então não há dependência parcial (2FN ok). Também não há dependência transitiva. FNBC.

### 5. Cupom

`Cupom(codigo_cupom, percentual_desconto)`
codigo_cupom → percentual_desconto

**Justificativa:** PK simples, sem transitividade. FNBC.

### 6. Matrícula (Associativa)

`Matricula(cpf_aluno*, codigo_curso*, data_inscricao, status, progresso)`
cpf_aluno, codigo_curso → data_inscricao, status, progresso

**Justificativa:** O progresso, status e data não dependem só do aluno ou só do curso, mas da relação entre eles (PK completa). FNBC.

### 7. Certificado (Relacionamento 1:1 com Matrícula)

`Certificado(numero_registro, data_emissao, url_validacao, cpf_aluno*, codigo_curso*)`
numero_registro → data_emissao, url_validacao, cpf_aluno, codigo_curso

**Justificativa:** Relacionamento 1:1 mapeado adicionando a FK da Matrícula. Todos os atributos dependem unicamente do número de registro do certificado. FNBC.

### 8. Leciona (Relacionamento N:M)

`Leciona(cpf_professor*, codigo_curso*)`
cpf_professor, codigo_curso → (nenhum)

**Justificativa:** Tabela de relacionamento sem atributos não-chave. FNBC.

### 9. Exige (Auto-relacionamento N:M)

`Exige(codigo_curso_principal*, codigo_curso_prerequisito*, nivel_exigencia)`
codigo_curso_principal, codigo_curso_prerequisito → nivel_exigencia

**Justificativa:** O nível de exigência depende unicamente da chave composta. FNBC.

### 10. Promoção (Relacionamento N:M Temporal)

`Promocao(codigo_curso*, codigo_cupom*, data_inicio, data_fim)`
codigo_curso, codigo_cupom, data_inicio → data_fim

**Justificativa:** A data final depende da combinação curso + cupom e da data inicial. Tudo depende da PK composta. FNBC.

### 11. Dúvida (Relacionamento Ternário)

`Duvida(cpf_aluno*, cpf_professor*, codigo_curso*, numero_modulo*, id_duvida, pergunta, resposta, data_hora, status)`
cpf_aluno, cpf_professor, codigo_curso, numero_modulo, id_duvida → pergunta, resposta, data_hora, status

**Justificativa:** Os textos da pergunta/resposta e as informações da transação dependem integralmente dessa PK composta (que engloba os 3 participantes e um identificador para repetições). FNBC.

---

## Esquema Relacional Normalizado

Endereco (**cep**, rua, cidade, estado)
Usuario (**cpf**, email, nome, cep*, numero, data_nascimento)
Telefone_Usuario (**cpf***, **telefone**)
Aluno (**cpf***)
Professor (**cpf***, biografia)
Titulacao_Professor (**cpf***, **titulacao_academica**)
Curso (**codigo**, titulo, carga_horaria, preco_base)
Modulo (**codigo_curso***, **numero_modulo**, titulo_modulo, descricao)
Cupom (**codigo_cupom**, percentual_desconto)
Matricula (**cpf_aluno***, **codigo_curso***, data_inscricao, status, progresso)
Certificado (**numero_registro**, data_emissao, url_validacao, cpf_aluno*, codigo_curso*)
Leciona (**cpf_professor***, **codigo_curso***)
Exige (**codigo_curso_principal***, **codigo_curso_prerequisito***, nivel_exigencia)
Promocao (**codigo_curso***, **codigo_cupom***, **data_inicio**, data_fim)
Duvida (**cpf_aluno***, **cpf_professor***, **codigo_curso***, **numero_modulo***, **id_duvida**, pergunta, resposta, data_hora, status)

