# SAF
```
Estrutura de diretórios
│
├── public
│   ├── index.html
│   ├── voluntario.html
│   ├── contribuicao.html
│   ├── cadastro.html
│   ├── login.html
│   └── aluno.html
│
├── CSS
│   └── (arquivos .css)
│
├── script.js
├── server.js
├── package.json
└── .env

```
Script de criação do banco de dados e tabelas:
```
-- Criação do banco de dados
CREATE DATABASE banco_saf;

-- Seleção do banco de dados
USE banco_saf;

-- Criação da tabela 'voluntario'
CREATE TABLE voluntario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(30),
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Criação da tabela 'usuario'
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela 'atividade'
CREATE TABLE atividade (
    id_atividade INT AUTO_INCREMENT PRIMARY KEY,
    atividade VARCHAR(255) NOT NULL
);

-- Criação da tabela 'aluno'
CREATE TABLE aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    responsavel VARCHAR(100),
    tel_responsavel VARCHAR(15),
    endereco VARCHAR(255)
    
);

-- Criação da tabela 'contribuicao'
CREATE TABLE contribuicao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    id_voluntario INT,
    id_atividade INT,
    lanche BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_voluntario) REFERENCES voluntario(id),
    FOREIGN KEY (id_atividade) REFERENCES atividade(id_atividade)
);
SELECT * from contribuicao;
```
