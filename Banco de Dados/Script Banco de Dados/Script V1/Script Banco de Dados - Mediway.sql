/*
Nome - RA
*/

CREATE DATABASE Mediway;
USE Mediway;

-- CRIAÇÃO DA TABELA EMPRESA
CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cnpj VARCHAR(14) UNIQUE NOT NULL,
token VARCHAR(64) UNIQUE
);

-- INSERÇÃO DE DADOS NA TABELA EMPRESA
INSERT INTO empresa (nome, CNPJ, token) VALUES 
	('Farmácia Central LTDA', '12345678000195', 'OEXL2RBY6mYaSTbPoF22xLK6m8TIk8kRcAQgRkJCSGZQDJIiik6YteYyY7reo7CR'),
    ('Translog Transportes SA', '98765432000188', 'UqFbqaEGsPzrSIuc6mQxKUqib2qqGfgWjg0YHar98b1C2B9dixxWBQVIptiVCOLf'),
    ('Saúde+ Distribuidora ME', '11223344000177', 'ZYRJDOVgpacZOwKhxjtTOECcMOiKdPVTuzmsMPmBKslXalYklDakZhZxcuULmHcd');
    
-- CRIAÇÃO DA TABELA VACINA
CREATE TABLE vacina(
idVacina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
temperatura_minima INT,
temperatura_maxima INT
);

-- INSERÇÃO DE DADOS NA TABELA VACINA
INSERT INTO vacina (nome, temperatura_minima, temperatura_maxima) VALUES 
    ('Vacina Pfizer', 2, 8),
    ('Insulina Humana', 2, 8),
    ('Eritropoetina', 2, 8);

-- CRIAÇÃO DA TABELA USUARIO
CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(60) UNIQUE,
senha VARCHAR(45) NOT NULL,
telefone CHAR(11),
fkEmpresa INT,
CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);
	
-- INSERÇÃO DE DADOS NA TABELA USUARIO
INSERT INTO usuario(nome, cpf, email, senha, telefone, fkEmpresa) VALUES
	('João Silva','52598742411','joao@gmail.com','123456', '11985378011', 1),
    ('Ana Silva', '12345678901', 'ana.silva@email.com', 'senha123', '11987654321', 2),
    ('Carlos Souza', '98765432100', 'carlos.souza@email.com', 'minhaSenha', '21999887766', 3);


-- CRIAÇÃO DA TABELA VEICULO
CREATE TABLE veiculo(
idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(30),
marca VARCHAR (30),
placa VARCHAR (7) UNIQUE,
fkVacina INT,
fkEmpresa INT,
CONSTRAINT FkVeiculoVacina FOREIGN KEY (fkVacina) REFERENCES vacina(idVacina),
CONSTRAINT FkVeiculoEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

-- INSERÇÃO DE DADOS NA TABELA VEICULO
INSERT INTO veiculo (modelo, marca, placa, fkVacina, fkEmpresa) VALUES
	('Accelo 1016', 'Mercedes-Benz', 'PQR3456',1 ,1),
	('VM 270', 'Volvo', 'STU7890', 2, 2),
	('Daily 35S14', 'Iveco', 'VWX1234', 3, 3);

-- CRIAÇÃO DA TABELA SENSOR
CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome CHAR(11),
fkVeiculo INT UNIQUE,
CONSTRAINT fkSensorVeiculo FOREIGN KEY (fkVeiculo) REFERENCES veiculo(idVeiculo)
);

-- INSERÇÃO DE DADOS NA TABELA SENSOR
INSERT INTO sensor (nome, fkVeiculo) VALUES
	('sensor_001', 1),
	('sensor_002', 2),
	('sensor_003', 3);

-- CRIAÇÃO DA TABELA REGISTROSENSOR
CREATE TABLE registroSensor(
idResgistroSensor INT PRIMARY KEY AUTO_INCREMENT,
dtRegistro DATETIME,
tempAtual DECIMAL (4,2),
fkSensor INT,
CONSTRAINT fkSensorRegistroSensor FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);

INSERT INTO registroSensor (dtRegistro, fkSensor) VALUES
	('2025-08-26 10:00:00', 05.02, 1),
	('2025-08-26 10:15:00', 06.05, 2),
	('2025-08-26 11:00:00', 08.00, 3);

-- COMANDOS:
SELECT * FROM usuario;
SELECT * FROM empresa;
SELECT * FROM medicamento;
SELECT * FROM veiculo;
DESCRIBE usuario;
DESCRIBE empresa;
DESCRIBE medicamento;
DESCRIBE veiculo;
SHOW TABLES;
