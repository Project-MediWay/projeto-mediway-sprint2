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
    
-- CRIAÇÃO DA TABELA VACINA
CREATE TABLE vacina(
idVacina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
temperatura_minima INT,
temperatura_maxima INT
);

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

-- CRIAÇÃO DA TABELA SENSOR
CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome CHAR(11),
fkVeiculo INT UNIQUE,
CONSTRAINT fkSensorVeiculo FOREIGN KEY (fkVeiculo) REFERENCES veiculo(idVeiculo)
);

-- CRIAÇÃO DA TABELA REGISTROSENSOR
CREATE TABLE registroSensor(
idResgistroSensor INT PRIMARY KEY AUTO_INCREMENT,
dtRegistro DATETIME ,
tempAtual DECIMAL (4,2),
fkSensor INT,
CONSTRAINT fkSensorRegistroSensor FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);

ALTER TABLE registroSensor MODIFY COLUMN dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP;

-- INSERÇÃO DE DADOS NA TABELA EMPRESA
INSERT INTO empresa (nome, CNPJ, token) VALUES 
	('Farmácia Central LTDA', '12345678000195', 'OEXL2RBY6mYaSTbPoF22xLK6m8TIk8kRcAQgRkJCSGZQDJIiik6YteYyY7reo7CR'),
    ('Translog Transportes SA', '98765432000188', 'UqFbqaEGsPzrSIuc6mQxKUqib2qqGfgWjg0YHar98b1C2B9dixxWBQVIptiVCOLf'),
    ('Saúde+ Distribuidora ME', '11223344000177', 'ZYRJDOVgpacZOwKhxjtTOECcMOiKdPVTuzmsMPmBKslXalYklDakZhZxcuULmHcd');

-- INSERÇÃO DE DADOS NA TABELA VACINA
INSERT INTO vacina (nome, temperatura_minima, temperatura_maxima) VALUES 
    ('Vacina Pfizer', 2, 8),
    ('Insulina Humana', 2, 8),
    ('Eritropoetina', 2, 8),
    ('Vacina BCG', 2, 8),
    ('Vacina adsorvida difteria e tétano adulto', 2, 8),
	('Vacina hepatite B', 2, 8),
	('Vacina rotavírus humano G1P1', 2, 8),
	('Vacina sarampo, caxumba, rubéola', 2, 8);	
	
-- INSERÇÃO DE DADOS NA TABELA USUARIO
INSERT INTO usuario(nome, cpf, email, senha, telefone, fkEmpresa) VALUES
	('João Silva','52598742411','joao@gmail.com','123456', '11985378011', 1),
    ('Ana Silva', '12345678901', 'ana.silva@email.com', 'senha123', '11987654321', 2),
    ('Carlos Souza', '98765432100', 'carlos.souza@email.com', 'minhaSenha', '21999887766', 3);

-- INSERÇÃO DE DADOS NA TABELA VEICULO
INSERT INTO veiculo (modelo, marca, placa, fkVacina, fkEmpresa) VALUES
	('Accelo 1016', 'Mercedes-Benz', 'PQR3456',1 ,1),
	('VM 270', 'Volvo', 'STU7890', 2, 2),
	('Daily 35S14', 'Iveco', 'VWX1234', 3, 3),
    ('Constellation 24.280', 'Volkswagen', 'XYZ5678', 1, 2),
	('Cargo 1723', 'Ford', 'JKL9012', 2, 3),
	('FH 460', 'Volvo', 'MNO3456', 7, 1),
	('Actros 2651', 'Mercedes-Benz', 'DEF6789', 6, 3),
	('Stralis 440', 'Iveco', 'GHI2345', 5, 1),
	('Atego 2426', 'Mercedes-Benz', 'LMN4567', 4, 2);

-- INSERÇÃO DE DADOS NA TABELA SENSOR
INSERT INTO sensor (nome, fkVeiculo) VALUES
	('sensor_001', 1),
	('sensor_002', 2),
	('sensor_003', 3),
	('sensor_004', 4),
	('sensor_005', 5),
	('sensor_006', 6),
	('sensor_007', 7),
	('sensor_008', 8),
	('sensor_009', 9);
    
INSERT INTO registroSensor (dtRegistro, tempAtual, fkSensor) VALUES
	('2025-08-26 10:00:00', 05.02, 1),
	('2025-08-26 10:15:00', 06.05, 2),
	('2025-08-26 11:00:00', 08.00, 3),
	('2025-06-26 12:00:00', 04.00, 4),
	('2025-04-26 01:00:00', 08.00, 5),
	('2025-01-26 11:00:00', 08.00, 6),
	('2025-03-22 15:00:00', 08.00, 7),
	('2025-07-20 08:00:00', 08.00, 8),
	('2025-05-26 11:00:00', 08.00, 9);

-- SELECIONANDO TODOS OS DADOS DA TABELA USUARIO E EMPRESA
SELECT * FROM usuario JOIN empresa ON fkEmpresa = idEmpresa;

-- SELECIONANDO NOMES DA TABELA USUARIO E EMPRESA
SELECT usuario.nome AS Nome_Usuario, 
		empresa.nome AS Nome_Empresa
		FROM usuario JOIN empresa ON fkEmpresa = idEmpresa;
        
-- EMPRESA, VEICULO, VACINA - (SUGESTÃO, ADD MAIS VEICULOS PARA CASA EMPRESA E MAIS VACINAS PARA VEICULO)
SELECT empresa.nome AS Nome_Empresa,
		veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        vacina.nome AS Nome_Vacina
		FROM empresa JOIN veiculo ON fkEmpresa = idEmpresa
        JOIN vacina ON fkVacina = idVacina;

-- SENSOR, REGISTROSENSOR
SELECT sensor.nome AS Nome_Sensor,
		registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.tempAtual AS Temperatura_Atual_Sensor
        FROM sensor JOIN registroSensor ON fkSensor = idSensor;
        
-- VEICULO, SENSOR, REGISTROSENSOR

SELECT veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        sensor.nome AS Nome_Sensor,
        registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.tempAtual AS Temperatura_Atual_Sensor
        FROM veiculo JOIN sensor ON fkVeiculo = idVeiculo
        JOIN registroSensor ON fkSensor = idSensor;
        
-- VEICULO, VACINA, SENSOR, REGISTROSENSOR
SELECT veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        vacina.nome AS Nome_Vacina,
        vacina.temperatura_minima AS Temperatura_Minima_Vacina,
        vacina.temperatura_maxima AS Temperatura_Maxima_Vacina,
        sensor.nome AS Nome_Sensor,
        registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.tempAtual AS Temperatura_Atual_Sensor
        FROM veiculo JOIN vacina ON fkVacina = idVacina JOIN sensor ON fkVeiculo = idVeiculo
        JOIN registroSensor ON fkSensor = idSensor;
        
-- EMPRESA, VEICULO, VACINA, SENSOR, REGISTROSENSOR
SELECT empresa.nome AS Nome_Empresa,
		veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        vacina.nome AS Nome_Vacina,
        sensor.nome AS Nome_Sensor,
        registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.tempAtual AS Temperatura_Atual_Sensor
		FROM empresa JOIN veiculo ON fkEmpresa = idEmpresa
        JOIN vacina ON fkVacina = idVacina
        JOIN sensor ON fkVeiculo = idVeiculo JOIN registroSensor ON fkSensor = idSensor;
        
-- EMPRESA, VEICULO, VACINA, SENSOR, REGISTROSENSOR COM WHERE
SELECT empresa.nome AS Nome_Empresa,
		veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        vacina.nome AS Nome_Vacina,
        sensor.nome AS Nome_Sensor,
        registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.tempAtual AS Temperatura_Atual_Sensor
		FROM empresa JOIN veiculo ON fkEmpresa = idEmpresa
        JOIN vacina ON fkVacina = idVacina
        JOIN sensor ON fkVeiculo = idVeiculo JOIN registroSensor ON fkSensor = idSensor WHERE sensor.nome = 'sensor_001';
        


-- COMANDOS:
SELECT * FROM usuario;
SELECT * FROM empresa;
SELECT * FROM vacina;
SELECT * FROM veiculo;
SELECT * FROM sensor;
SELECT * FROM registroSensor;
DESCRIBE usuario;
DESCRIBE empresa;
DESCRIBE vacina;
DESCRIBE veiculo;
DESCRIBE sensor;
DESCRIBE registroSensor;
SHOW TABLES;
