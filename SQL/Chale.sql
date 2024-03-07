CREATE DATABASE DESAFIO;

USE DESAFIO;

CREATE  TABLE IF NOT EXISTS cliente (
	codCliente INT PRIMARY KEY AUTO_INCREMENT,
    rgCliente VARCHAR (15) NOT NULL,
    enderecoCliente VARCHAR (50) NOT NULL,
    bairroCliente VARCHAR(30) NOT NULL,
    cidadeCliente VARCHAR(30) NOT NULL,
    estadoCliente VARCHAR(30) NOT NULL,
    CEPCliente VARCHAR(15) NOT NULL,
    nascimentoCliente DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS item (
	nomeItem VARCHAR (50) PRIMARY KEY NOT NULL,
	descricaoItem VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Chale (
	codChale INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(50) NOT NULL,
    capacidade INT NOT NULL,
    valorAltaEstacao INT NOT NULL,
    valorBaixaEstacao INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Chale_item (
	codChale INT,
	nomeItem VARCHAR (50),
	FOREIGN KEY (codChale) REFERENCES Chale (codChale),
    FOREIGN KEY (nomeItem) REFERENCES item (nomeItem)
);

CREATE TABLE IF NOT EXISTS hospedagem (
	codHospedagem INT PRIMARY KEY AUTO_INCREMENT,
    codChale INT,
    estado VARCHAR(30) NOT NULL,
    dataInicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    dataFim DATE,
    qtdPessoas INT,
    desconto INT,
    valorFinal INT,
    FOREIGN KEY (codChale) REFERENCES chale (CodChale),
    FOREIGN KEY (codChale) REFERENCES cliente (codCliente)
);

CREATE TABLE IF NOT EXISTS telefone (
	telefone INT PRIMARY KEY NOT NULL,
    codCliente INT,
    tipoTelefone INT NOT NULL,
    FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente)
);

CREATE TABLE IF NOT EXISTS Servico (
	codServico INT PRIMARY KEY AUTO_INCREMENT,
    nomeServico VARCHAR(50),
	valorServico INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Hospedagem_Servico (
	codHospedagem INT PRIMARY KEY,
    dataServico DATE DEFAULT CURRENT_TIMESTAMP,
    codServico INT,
    valorServico INT NOT NULL,
    FOREIGN KEY (codHospedagem) REFERENCES hospedagem (codHospedagem),
    FOREIGN KEY (codServico) REFERENCES servico (codServico)
);

-- Inserindo 5 dados fictícios na tabela cliente
INSERT INTO cliente (rgCliente, enderecoCliente, bairroCliente, cidadeCliente, estadoCliente, CEPCliente, nascimentoCliente)
VALUES
('123456789', 'Rua das Flores, 123', 'Centro', 'Cidade Alegre', 'Estado Feliz', '12345-678', '1990-01-01'),
('987654321', 'Avenida dos Pássaros, 456', 'Jardim Primavera', 'Cidade Serena', 'Estado Tranquilo', '87654-321', '1985-05-15'),
('111223344', 'Rua das Montanhas, 789', 'Vila Vista', 'Cidade Bela', 'Estado Encantado', '11122-334', '1988-08-25'),
('555444333', 'Avenida do Mar, 101', 'Praia Azul', 'Cidade Costeira', 'Estado Litorâneo', '55443-332', '1995-12-10'),
('999888777', 'Rua do Campo, 202', 'Vila Verde', 'Cidade Rural', 'Estado Sossegado', '99887-776', '1992-04-30');

-- Inserindo 5 dados fictícios na tabela item
INSERT INTO item (nomeItem, descricaoItem)
VALUES
('Toalha', 'Toalha de algodão macio'),
('Travesseiro', 'Travesseiro ortopédico'),
('Cobertor', 'Cobertor quente e confortável'),
('Shampoo', 'Shampoo suave para todos os tipos de cabelo'),
('Secador', 'Secador de cabelo profissional');

-- Inserindo 5 dados fictícios na tabela Chale
INSERT INTO chale (localizacao, capacidade, valorAltaEstacao, valorBaixaEstacao)
VALUES
('Praia', 5, 200, 100),
('Montanha', 4, 180, 90),
('Centro', 6, 220, 110),
('Campo', 3, 160, 80),
('Bosque', 8, 240, 120);

-- Inserindo 5 dados fictícios na tabela Chale_item
INSERT INTO chale_item (codChale, nomeItem)
VALUES
(1, 'Toalha'),
(2, 'Travesseiro'),
(3, 'Cobertor'),
(4, 'Shampoo'),
(5, 'Secador');

-- Inserindo 5 dados fictícios na tabela hospedagem
INSERT INTO hospedagem (codChale, estado, dataInicio, dataFim, qtdPessoas, desconto, valorFinal)
VALUES
(1, 'Reservado', '2024-03-06 12:00:00', '2024-03-10', 2, 0, 400),
(2, 'Concluído', '2024-03-08 14:30:00', '2024-03-12', 3, 10, 450),
(3, 'Pendente', '2024-03-10 10:00:00', '2024-03-15', 4, 5, 500),
(4, 'Reservado', '2024-03-12 16:45:00', '2024-03-17', 2, 0, 320),
(5, 'Concluído', '2024-03-14 08:00:00', '2024-03-19', 6, 15, 600);

-- Inserindo 5 dados fictícios na tabela telefone
INSERT INTO telefone (telefone, codCliente, tipoTelefone)
VALUES
(111222333, 1, 1),
(222333444, 2, 2),
(333444555, 3, 1),
(444555666, 4, 2),
(555666777, 5, 1);

-- Inserindo 5 dados fictícios na tabela servico
INSERT INTO servico (nomeServico, valorServico)
VALUES
('Limpeza Diária', 50),
('Café da Manhã', 30),
('Estacionamento', 20),
('Wi-Fi', 15),
('Piscina', 40);

-- Inserindo 5 dados fictícios na tabela hospedagem_servico
INSERT INTO hospedagem_servico (codHospedagem, dataServico, codServico, valorServico)
VALUES
(1, '2024-03-07', 1, 50),
(2, '2024-03-09', 2, 30),
(3, '2024-03-11', 3, 20),
(4, '2024-03-13', 4, 15),
(5, '2024-03-15', 5, 40);

SELECT * 
FROM cliente, chale, servico
