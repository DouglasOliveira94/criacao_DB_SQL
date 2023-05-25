-- CRIANDO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS financeiroDB;
USE financeiroDB;

-- CRIAÇÃO DA TABELA DE FUNCIONARIOS
-- DEVERÁ TER OBRIGATORIAMENTE TODOS OS DADOS DOS FUNCIONARIOS, COM O ID COMO CHAVE PRIMARIA 

CREATE TABLE IF NOT EXISTS financeiroDB.funcionarios(
ID_funcionario INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
nome VARCHAR (255) NOT NULL,
sobrenome VARCHAR (255) NOT NULL,
CPF VARCHAR (255) NOT NULL,
telefone VARCHAR (255) NOT NULL,
salario DECIMAL (15,2) NOT NULL,
ativo BOOLEAN
)
COMMENT "TABELA QUE ARMAZENA TODAS AS INFORMACOES DOS FUNCIONARIOS";

-- CRIAÇÃO DA TABELA CONTAS A PAGAR
CREATE TABLE IF NOT EXISTS financeiroDB.contas_a_pagar(
ID_transacao INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY ,
nome_recebedor VARCHAR (255) NOT NULL ,
CNPJ VARCHAR (255),
CPF VARCHAR (255) ,
data_transacao DATE NOT NULL ,
valor DECIMAL (8,2) ,
forma_pagamento VARCHAR (255),
ID_funcionario INT NOT NULL ,
FOREIGN KEY (ID_funcionario) REFERENCES funcionarios(ID_funcionario)
)
COMMENT "TABELA QUE ARMAZENA TODAS AS CONTAS A PAGAR DA EMPRESA";
-- ESSA TABELA ARMAZENARÁ TODOS OS DADOS DAS CONTAS A PAGAR, O ID DO FUNCIONARIO É REFERENTE AO ID_FUNCIONARIO
-- DA TABELA FUNCIONARIO

CREATE TABLE IF NOT EXISTS financeiroDB.contas_a_receber(
ID_transacao INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY ,
nome_pagador VARCHAR (255) NOT NULL ,
CNPJ VARCHAR (255),
CPF VARCHAR (255) ,
data_transacao DATE NOT NULL ,
valor DECIMAL (8,2) ,
forma_pagamento VARCHAR (255),
ID_funcionario INT NOT NULL ,
FOREIGN KEY (ID_funcionario) REFERENCES funcionarios(ID_funcionario)
)
COMMENT "TABELA QUE ARMAZENA TODAS AS CONTAS A RECEBER DA EMPRESA"
-- ESSA TABELA ARMAZENARÁ TODOS OS DADOS DAS CONTAS A RECEBER, O ID DO FUNCIONARIO É REFERENTE AO ID_FNCIONARIO
-- DA TABELA FUNCIONARIO