#

## Banco de Dados
### Modelagem
[Modelo Conceitual](https://app.brmodeloweb.com/#!/publicview/66be4027a66393af24a5e53b)

![image](https://github.com/user-attachments/assets/6daa5be5-bc6e-48e6-a529-67255556db9a)


[Modelo Lógico](https://app.brmodeloweb.com/#!/publicview/66be4273a66393af24a5e70d)

![image](https://github.com/user-attachments/assets/81c69a32-1f2d-42ae-9c1d-c9f7e61ff9f4)

Script de Criação do Banco de Dados e Tabelas - MySQL
```
-- Criar o banco de dados
CREATE DATABASE banco_saf;

-- Selecionar o banco de dados para uso
USE banco_saf;

-- Criar a tabela usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL
);

-- Criar a tabela voluntarios
CREATE TABLE voluntarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);

-- Criar a tabela alunos
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    responsavel VARCHAR(100) NOT NULL,
    tel_responsavel VARCHAR(15),
    endereco TEXT
);

-- Criar a tabela atividades
CREATE TABLE atividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- Criar a tabela contribuicoes
CREATE TABLE contribuicoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_voluntario INT,
    data_contribuicao DATE NOT NULL,
    levar_lanche BOOLEAN NOT NULL,
    id_atividade_opcional INT,
    FOREIGN KEY (id_voluntario) REFERENCES voluntarios(id),
    FOREIGN KEY (id_atividade_opcional) REFERENCES atividades(id)
);

-- Criar a tabela programacao
CREATE TABLE programacao (
    data DATE PRIMARY KEY,
    id_atividade INT,
    id_voluntario_atividade INT,
    id_voluntario_lanche INT,
    FOREIGN KEY (id_atividade) REFERENCES atividades(id),
    FOREIGN KEY (id_voluntario_atividade) REFERENCES voluntarios(id),
    FOREIGN KEY (id_voluntario_lanche) REFERENCES voluntarios(id)
);


-- Criar a tabela presenca
CREATE TABLE presenca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    id_aluno INT,
    presente BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (data) REFERENCES programacao(data),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);

```
