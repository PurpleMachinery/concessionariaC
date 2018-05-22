USE MASTER;
DROP DATABASE bdEmpresa;
CREATE DATABASE bdEmpresa;
GO

USE bdEmpresa;

CREATE TABLE tbPessoa(
	pk_id INT PRIMARY KEY IDENTITY(1,1),
	nome NVARCHAR(40) NOT NULL,
	sexo BIT NOT NULL,
	cpf NVARCHAR(11) NOT NULL UNIQUE,
	telefone NVARCHAR(20) NOT NULL,
	email NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE tbFuncionario(
	pk_id INT PRIMARY KEY IDENTITY(1,1),
	fk_pessoa INT REFERENCES tbPessoa(pk_id) NOT NULL,
	salario FLOAT NOT NULL,
	carteira_trabalho NVARCHAR(20) NOT NULL 
);
CREATE TABLE tbCliente(
	pk_id INT PRIMARY KEY IDENTITY(1,1),
	fk_pessoa INT REFERENCES tbPessoa(pk_id) NOT NULL
);
CREATE TABLE tbProduto(
	pk_id INT PRIMARY KEY IDENTITY(1,1),
	nome NVARCHAR(50) NOT NULL,
	preco FLOAT NOT NULL,
	validade DATE
);
CREATE TABLE tbVenda(
	pk_id INT PRIMARY KEY IDENTITY(1,1),
	fk_cliente INT REFERENCES tbCliente(pk_id) NOT NULL,
	fk_produto INT REFERENCES tbProduto(pk_id) NOT NULL,
	fk_funcionario INT REFERENCES tbFuncionario(pk_id) NOT NULL
);