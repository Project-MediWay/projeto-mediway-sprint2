DROP DATABASE Mediway;
CREATE DATABASE Mediway;
USE Mediway;

-- CRIAÇÃO DA TABELA EMPRESA
CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cnpj VARCHAR(14) UNIQUE NOT NULL,
token VARCHAR(64) UNIQUE NOT NULL
);

-- CRIAÇÃO DA TABELA USUARIO
CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(60) UNIQUE NOT NULL,
senha VARCHAR(45) NOT NULL,
telefone CHAR(11),
fkEmpresa INT,
CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
suporteTecnico TINYINT
);

-- CRIAÇÃO DA TABELA VEICULO
CREATE TABLE veiculo(
idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(30),
marca VARCHAR (30),
placa VARCHAR (7) UNIQUE NOT NULL,
fkEmpresa INT,
CONSTRAINT FkVeiculoEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

-- CRIAÇÃO DA TABELA VACINA
CREATE TABLE vacina(
idVacina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

-- CRIAÇÃO DA TABELA VIAGEM
CREATE TABLE viagem(
idViagem INT,
empresaFinal VARCHAR(45) NOT NULL,
fkVeiculo INT,
fkVacina INT,
CONSTRAINT fkVeiculoViagem
	FOREIGN KEY (fkVeiculo)
		REFERENCES veiculo(idVeiculo),
CONSTRAINT fkVacinaViagem
	FOREIGN KEY (fkVacina)
		REFERENCES vacina(idVacina),
CONSTRAINT pkComposta
	PRIMARY KEY (idViagem, fkVeiculo, fkVacina)
);

-- CRIAÇÃO DA TABELA SENSOR
CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome CHAR(11) NOT NULL,
fkVeiculo INT UNIQUE,
CONSTRAINT fkSensorVeiculo FOREIGN KEY (fkVeiculo) REFERENCES veiculo(idVeiculo)
);

-- CRIAÇÃO DA TABELA REGISTROSENSOR
CREATE TABLE registroSensor(
idRegistroSensor INT AUTO_INCREMENT,
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
temperatura_atual DECIMAL (4,2),
fkSensor INT,
CONSTRAINT pkComposta PRIMARY KEY (idRegistroSensor, fkSensor),
CONSTRAINT fkSensorRegistroSensor FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);

-- INSERÇÃO DE DADOS NA TABELA EMPRESA
INSERT INTO empresa (nome, CNPJ, token) VALUES 
	('Farmácia Central LTDA', '12345678000195', 'OEXL2RBY6mYaSTbPoF22xLK6m8TIk8kRcAQgRkJCSGZQDJIiik6YteYyY7reo7CR'),
    ('Translog Transportes SA', '98765432000188', 'UqFbqaEGsPzrSIuc6mQxKUqib2qqGfgWjg0YHar98b1C2B9dixxWBQVIptiVCOLf'),
    ('Saúde+ Distribuidora ME', '11223344000177', 'ZYRJDOVgpacZOwKhxjtTOECcMOiKdPVTuzmsMPmBKslXalYklDakZhZxcuULmHcd');
	
-- INSERÇÃO DE DADOS NA TABELA USUARIO
INSERT INTO usuario(nome, cpf, email, senha, telefone, fkEmpresa, suporteTecnico) VALUES
	('João Silva','52598742411','joao@gmail.com','123456', '11985378011', 1, TRUE),
    ('Ana Silva', '12345678901', 'ana.silva@email.com', 'senha123', '11987654321', 2, FALSE),
    ('Carlos Souza', '98765432100', 'carlos.souza@email.com', 'minhaSenha', '21999887766', 3, FALSE);

-- INSERÇÃO DE DADOS NA TABELA VEICULO
INSERT INTO veiculo (modelo, marca, placa, fkEmpresa) VALUES
	('Accelo 1016', 'Mercedes-Benz', 'PQR3456',1),
	('VM 270', 'Volvo', 'STU7890', 2),
	('Daily 35S14', 'Iveco', 'VWX1234', 3),
    ('Constellation 24.280', 'Volkswagen', 'XYZ5678', 2),
	('Cargo 1723', 'Ford', 'JKL9012', 3),
	('FH 460', 'Volvo', 'MNO3456', 1),
	('Actros 2651', 'Mercedes-Benz', 'DEF6789', 3),
	('Stralis 440', 'Iveco', 'GHI2345', 1),
	('Atego 2426', 'Mercedes-Benz', 'LMN4567', 2),
    ('Atego 2426', 'Mercedes-Benz', 'ABC1456', 2);

-- INSERÇÃO DE DADOS NA TABELA VACINA
INSERT INTO vacina (nome) VALUES 
	('BCG'),
	('Hepatite B'),
	('Febre tifoide'),
	('Poliomelite 2'),
	('Influenza inativada'),
	('Raiva inativada'),
	('Tríplice viral');
    
-- INSERÇÃO DE DADOS NA TABELA VIAGEM
INSERT INTO viagem VALUES 
	(1, 'Hospital Amparo Maternal', 1, 1),
	(2, 'Rede DOR São Luiz', 2, 2),
	(3, 'Lavoisier', 3, 3),
	(4, 'Fleury Medicina e Saúde', 4, 4),
	(5, 'Drogaria São Paulo,', 5, 5),
	(6, 'MSD Saúde Animal', 6, 6),
	(7, 'Laboratório Oswaldo Cruz', 7, 7);
    
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
	('sensor_009', 9),
    ('sensor_010', 10);
    

INSERT INTO registroSensor (dtRegistro, temperatura_atual, fkSensor) VALUES
('2025-12-04 21:00:00', 4.80, 4),    
('2025-12-04 21:10:00', 6.20, 4),    -- Dentro da faixa (3-7)
('2025-12-04 21:20:00', 5.50, 4),    -- Dentro da faixa (3-7)
('2025-12-04 21:30:00', 8.00, 4),    -- Exatamente 8°C (10%)
('2025-12-04 21:40:00', 3.80, 4),    -- Dentro da faixa (3-7)
('2025-12-04 21:50:00', 6.70, 4),    -- Dentro da faixa (3-7)
('2025-12-04 22:00:00', 4.20, 4),    -- Dentro da faixa (3-7)
('2025-12-04 22:10:00', 2.00, 4),    -- Exatamente 2°C (10%)
('2025-12-04 22:20:00', 5.90, 4),    -- Dentro da faixa (3-7)
('2025-12-04 22:30:00', 3.50, 4),    -- Dentro da faixa (3-7)
('2025-12-04 22:40:00', 6.80, 4),    -- Dentro da faixa (3-7)
('2025-12-04 22:50:00', 4.60, 4),    -- Dentro da faixa (3-7)
('2025-12-04 23:00:00', 7.20, 4),    -- Dentro da faixa (3-7)
('2025-12-04 23:10:00', 11.50, 4),   -- Fora da faixa mas dentro do limite (10%)
('2025-12-04 23:20:00', 5.30, 4),    -- Dentro da faixa (3-7)
('2025-12-04 23:30:00', 3.20, 4),    -- Dentro da faixa (3-7)
('2025-12-04 23:40:00', 6.40, 4),    -- Dentro da faixa (3-7)
('2025-12-04 23:50:00', -2.50, 4),   -- Fora da faixa mas dentro do limite (10%)
('2025-12-05 00:00:00', 4.90, 4);    -- Dentro da faixa (3-7)

-- INSERTS para o sensor 2 (21:00 até 00:00 - dia 05/12)
INSERT INTO registroSensor (dtRegistro, temperatura_atual, fkSensor) VALUES
('2025-12-04 21:00:00', 3.70, 2),    -- Dentro da faixa (3-7)
('2025-12-04 21:10:00', 6.80, 2),    -- Dentro da faixa (3-7)
('2025-12-04 21:20:00', 8.00, 2),    -- Exatamente 8°C (10%)
('2025-12-04 21:30:00', 4.50, 2),    -- Dentro da faixa (3-7)
('2025-12-04 21:40:00', 5.90, 2),    -- Dentro da faixa (3-7)
('2025-12-04 21:50:00', 3.20, 2),    -- Dentro da faixa (3-7)
('2025-12-04 22:00:00', 6.50, 2),    -- Dentro da faixa (3-7)
('2025-12-04 22:10:00', 4.80, 2),    -- Dentro da faixa (3-7)
('2025-12-04 22:20:00', 2.00, 2),    -- Exatamente 2°C (10%)
('2025-12-04 22:30:00', 7.10, 2),    -- Dentro da faixa (3-7)
('2025-12-04 22:40:00', 5.40, 2),    -- Dentro da faixa (3-7)
('2025-12-04 22:50:00', 3.60, 2),    -- Dentro da faixa (3-7)
('2025-12-04 23:00:00', 6.20, 2),    -- Dentro da faixa (3-7)
('2025-12-04 23:10:00', -3.20, 2),   -- Fora da faixa mas dentro do limite (10%)
('2025-12-04 23:20:00', 4.90, 2),    -- Dentro da faixa (3-7)
('2025-12-04 23:30:00', 5.70, 2),    -- Dentro da faixa (3-7)
('2025-12-04 23:40:00', 3.40, 2),    -- Dentro da faixa (3-7)
('2025-12-04 23:50:00', 10.80, 2),   -- Fora da faixa mas dentro do limite (10%)
('2025-12-05 00:00:00', 6.10, 2);    -- Dentro da faixa (3-7)

-- INSERTS para o sensor 9 (21:00 até 00:00 - dia 05/12)
INSERT INTO registroSensor (dtRegistro, temperatura_atual, fkSensor) VALUES
('2025-12-04 21:00:00', 5.50, 9),    -- Dentro da faixa (3-7)
('2025-12-04 21:10:00', 3.80, 9),    -- Dentro da faixa (3-7)
('2025-12-04 21:20:00', 6.70, 9),    -- Dentro da faixa (3-7)
('2025-12-04 21:30:00', 4.20, 9),    -- Dentro da faixa (3-7)
('2025-12-04 21:40:00', 2.00, 9),    -- Exatamente 2°C (10%)
('2025-12-04 21:50:00', 5.90, 9),    -- Dentro da faixa (3-7)
('2025-12-04 22:00:00', 7.10, 9),    -- Dentro da faixa (3-7)
('2025-12-04 22:10:00', 4.50, 9),    -- Dentro da faixa (3-7)
('2025-12-04 22:20:00', 6.30, 9),    -- Dentro da faixa (3-7)
('2025-12-04 22:30:00', 3.70, 9),    -- Dentro da faixa (3-7)
('2025-12-04 22:40:00', 8.00, 9),    -- Exatamente 8°C (10%)
('2025-12-04 22:50:00', 5.20, 9),    -- Dentro da faixa (3-7)
('2025-12-04 23:00:00', 4.80, 9),    -- Dentro da faixa (3-7)
('2025-12-04 23:10:00', 6.60, 9),    -- Dentro da faixa (3-7)
('2025-12-04 23:20:00', 11.20, 9),   -- Fora da faixa mas dentro do limite (10%)
('2025-12-04 23:30:00', 3.90, 9),    -- Dentro da faixa (3-7)
('2025-12-04 23:40:00', 5.40, 9),    -- Dentro da faixa (3-7)
('2025-12-04 23:50:00', -1.80, 9),   -- Fora da faixa mas dentro do limite (10%)
('2025-12-05 00:00:00', 6.80, 9);    -- Dentro da faixa (3-7)

-- INSERTS para o sensor 10 (21:00 até 00:00 - dia 05/12)
INSERT INTO registroSensor (dtRegistro, temperatura_atual, fkSensor) VALUES
('2025-12-04 21:00:00', 4.60, 10),   -- Dentro da faixa (3-7)
('2025-12-04 21:10:00', 6.90, 10),   -- Dentro da faixa (3-7)
('2025-12-04 21:20:00', 3.50, 10),   -- Dentro da faixa (3-7)
('2025-12-04 21:30:00', 5.70, 10),   -- Dentro da faixa (3-7)
('2025-12-04 21:40:00', 7.20, 10),   -- Dentro da faixa (3-7)
('2025-12-04 21:50:00', 4.30, 10),   -- Dentro da faixa (3-7)
('2025-12-04 22:00:00', 2.00, 10),   -- Exatamente 2°C (10%)
('2025-12-04 22:10:00', 6.10, 10),   -- Dentro da faixa (3-7)
('2025-12-04 22:20:00', 3.80, 10),   -- Dentro da faixa (3-7)
('2025-12-04 22:30:00', 5.40, 10),   -- Dentro da faixa (3-7)
('2025-12-04 22:40:00', 8.00, 10),   -- Exatamente 8°C (10%)
('2025-12-04 22:50:00', 6.50, 10),   -- Dentro da faixa (3-7)
('2025-12-04 23:00:00', 4.20, 10),   -- Dentro da faixa (3-7)
('2025-12-04 23:10:00', -3.50, 10),  -- Fora da faixa mas dentro do limite (10%)
('2025-12-04 23:20:00', 5.80, 10),   -- Dentro da faixa (3-7)
('2025-12-04 23:30:00', 3.90, 10),   -- Dentro da faixa (3-7)
('2025-12-04 23:40:00', 6.70, 10),   -- Dentro da faixa (3-7)
('2025-12-04 23:50:00', 9.80, 10),   -- Fora da faixa mas dentro do limite (10%)
('2025-12-05 00:00:00', 4.50, 10);   -- Dentro da faixa (3-7)
    
INSERT INTO registroSensor (dtRegistro, temperatura_atual, fkSensor) VALUES
('2025-12-05 12:00:00', -9.00, 2);  -- insert de testes

select * from registroSensor where fkSensor = 2;


    
    

-- COMANDOS:
-- SELECIONANDO TODOS OS DADOS DA TABELA USUARIO E EMPRESA
SELECT * FROM usuario JOIN empresa ON fkEmpresa = idEmpresa;

-- SELECIONANDO NOMES DA TABELA USUARIO E EMPRESA
SELECT usuario.nome AS Nome_Usuario, 
		empresa.nome AS Nome_Empresa
		FROM usuario JOIN empresa ON fkEmpresa = idEmpresa;
        
-- EMPRESA, VEICULO
SELECT empresa.nome AS Nome_Empresa,
		veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo
		FROM empresa JOIN veiculo ON fkEmpresa = idEmpresa;

-- SENSOR, REGISTROSENSOR
SELECT sensor.nome AS Nome_Sensor,
		registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.temperatura_atual AS Temperatura_Atual_Sensor
        FROM sensor JOIN registroSensor ON fkSensor = idSensor;
        
-- VEICULO, SENSOR, REGISTROSENSOR
SELECT veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        sensor.nome AS Nome_Sensor,
        registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.temperatura_atual AS Temperatura_Atual_Sensor
        FROM veiculo JOIN sensor ON fkVeiculo = idVeiculo
        JOIN registroSensor ON fkSensor = idSensor
        where fkempresa = 2;
        
-- VEICULO, SENSOR, REGISTROSENSOR
SELECT veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        sensor.nome AS Nome_Sensor,
        idSensor as id,
        registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.temperatura_atual AS Temperatura_Atual_Sensor
        FROM veiculo JOIN sensor ON fkVeiculo = idVeiculo
        JOIN registroSensor ON fkSensor = idSensor;
        
        
        
-- EMPRESA, VEICULO, SENSOR, REGISTROSENSOR
SELECT empresa.nome AS Nome_Empresa,
		veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        sensor.nome AS Nome_Sensor,
        registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.temperatura_atual AS Temperatura_Atual_Sensor
		FROM empresa JOIN veiculo ON fkEmpresa = idEmpresa
        JOIN sensor ON fkVeiculo = idVeiculo JOIN registroSensor ON fkSensor = idSensor;
        
-- EMPRESA, VEICULO, SENSOR, REGISTROSENSOR COM WHERE
SELECT empresa.nome AS Nome_Empresa,
		veiculo.modelo AS Modelo_Veículo,
        veiculo.placa AS Placa_Veículo,
        sensor.nome AS Nome_Sensor,
        registroSensor.dtRegistro AS Data_e_Hora_Sensor,
        registroSensor.temperatura_atual AS Temperatura_Atual_Sensor
		FROM empresa JOIN veiculo ON fkEmpresa = idEmpresa
        JOIN sensor ON fkVeiculo = idVeiculo JOIN registroSensor ON fkSensor = idSensor WHERE sensor.nome = 'sensor_001';
        
-- VEICULO, VACINA E VIAGEM
SELECT veiculo.placa AS Placa_Veiculo,
	viagem.fkVeiculo AS fkVeiculo,
	veiculo.fkEmpresa AS fkEmpresa,
    empresa.nome AS Empresa,
    viagem.fkVacina AS fkVacina,
    vacina.nome AS Vacina,
    viagem.empresaFinal AS Empresa_Final
    FROM empresa join veiculo on veiculo.fkEmpresa = empresa.idEmpresa
    join viagem on viagem.fkVeiculo = veiculo.idVeiculo
    join vacina on vacina.idVacina = viagem.fkVacina;



















-- PUXAR OS VEICULOS DE DETERMINADA EMPRESA PARA O PAINEL DE VEICULOS
CREATE VIEW painelVeiculos AS
SELECT 
    v.fkEmpresa,
    v.idVeiculo,
    v.placa,
    rs.temperatura_atual,
    rs.dtRegistro
FROM veiculo v
JOIN sensor s ON v.idVeiculo = s.fkVeiculo
JOIN registroSensor rs ON s.idSensor = rs.fkSensor
AND rs.dtRegistro = (
    SELECT MAX(rs2.dtRegistro)
    FROM registroSensor rs2
    JOIN sensor s2 ON rs2.fkSensor = s2.idSensor
    WHERE s2.fkVeiculo = v.idVeiculo
);

SELECT * FROM painelVeiculos
WHERE fkEmpresa = 2;


-- PUXAR O HISTORICO DE ALERTAS
CREATE VIEW historicoAlertas AS
SELECT  fkEmpresa,
		veiculo.placa,
		temperatura_atual,
        dtRegistro
FROM veiculo
JOIN sensor ON idVeiculo = fkVeiculo
JOIN registroSensor ON idSensor = fkSensor
WHERE (temperatura_atual < 2 OR temperatura_atual > 8);
        
SELECT * FROM historicoAlertas
WHERE fkEmpresa = 2;


-- PUXAR KPI GERAL QUANTIDADE DE VEICULOS
CREATE VIEW quantidadeVeiculos AS
SELECT COUNT(*) AS quantidadeVeiculo,
	fkEmpresa
FROM veiculo
group by fkEmpresa;

SELECT * FROM quantidadeVeiculos
WHERE fkEmpresa = 2;

select * from usuario;


-- PUXAR KPI GERAL VEICULOS COM TEMPERATURA NORMAL
SELECT COUNT(DISTINCT v.idVeiculo) as total_ideal
FROM veiculo v
WHERE v.fkEmpresa = 2
AND (
    SELECT rs.temperatura_atual
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    WHERE s.fkVeiculo = v.idVeiculo
    ORDER BY rs.dtRegistro DESC
    LIMIT 1
) > 2 AND (
    SELECT rs.temperatura_atual
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    WHERE s.fkVeiculo = v.idVeiculo
    ORDER BY rs.dtRegistro DESC
    LIMIT 1
) < 8;


-- PUXAR KPI GERAL VEICULOS COM TEMPERATURA NO LIMITE
SELECT COUNT(DISTINCT v.idVeiculo) as total_limite
FROM veiculo v
WHERE v.fkEmpresa = 2
AND (
    SELECT rs.temperatura_atual
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    WHERE s.fkVeiculo = v.idVeiculo
    ORDER BY rs.dtRegistro DESC
    LIMIT 1
) IN (2, 8);


-- PUXAR KPI GERAL VEICULOS COM TEMPERATURA NO LIMITE
SELECT COUNT(DISTINCT v.idVeiculo) as total_alerta
FROM veiculo v
WHERE v.fkEmpresa = 2
AND (
    SELECT rs.temperatura_atual
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    WHERE s.fkVeiculo = v.idVeiculo
    ORDER BY rs.dtRegistro DESC
    LIMIT 1
) < 2 OR (
    SELECT rs.temperatura_atual
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    WHERE s.fkVeiculo = v.idVeiculo
    ORDER BY rs.dtRegistro DESC
    LIMIT 1
) > 8;


-- PUXAR KPI ESPECIFICA TOTAL ALERTAS 
SELECT COUNT(*) as total_alertas_4h
        FROM registroSensor rs
        JOIN sensor s ON rs.fkSensor = s.idSensor
        WHERE s.fkVeiculo = 2
        AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 4 HOUR)
        AND (rs.temperatura_atual < 2 OR rs.temperatura_atual > 8);


-- PUXAR KPI ESPECIFICA TOTAL ALERTAS
SELECT temperatura_atual 
FROM registroSensor 
WHERE fkSensor = (SELECT idSensor FROM sensor WHERE fkVeiculo = 2)
ORDER BY dtRegistro DESC 
LIMIT 1;


-- PUXAR KPI ESPECIFICA TEMPERATURA MINIMA
SELECT MIN(temperatura_atual) as temp_min_4h
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = 2
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 4 HOUR);


-- PUXAR KPI ESPECIFICA TEMPERATURA MAXIMA
SELECT MAX(temperatura_atual) as temp_max_4h
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = 2
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 4 HOUR);

-- PUXAR GRAFICO ESPECIFICO 4 HORAS
SELECT	temperatura_atual,
		DATE_FORMAT(dtRegistro, '%H:%i') as hora
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = 2
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 4 HOUR)
ORDER BY rs.dtRegistro ASC;


-- PUXAR GRAFICO ESPECIFICO 7 DIAS
SELECT 	DATE(dtRegistro) as data,
		COUNT(CASE WHEN temperatura_atual < 2 OR temperatura_atual > 8 THEN 1 END) as alertas
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = 2
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 7 DAY)
GROUP BY DATE(dtRegistro)
ORDER BY data ASC;


-- PUXAR GRAFICO ESPECIFICO ULTIMO MES
SELECT 
    CONCAT('Semana ', semana_num) as semana,
    COUNT(*) as alertas
FROM (
    SELECT 
        CASE 
            WHEN DAY(dtRegistro) BETWEEN 1 AND 7 THEN 1
            WHEN DAY(dtRegistro) BETWEEN 8 AND 14 THEN 2
            WHEN DAY(dtRegistro) BETWEEN 15 AND 21 THEN 3
            ELSE 4
        END as semana_num
    FROM registroSensor rs
    INNER JOIN sensor s ON rs.fkSensor = s.idSensor
    WHERE s.fkVeiculo = 2
        AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 30 DAY)
        AND (rs.temperatura_atual < 2 OR rs.temperatura_atual > 8)
) as subquery
GROUP BY semana_num
ORDER BY semana_num;


-- tempMinSemana
SELECT MIN(temperatura_atual) as temp_min_semana
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = 2
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 7 DAY);


-- tempMaxSemana
SELECT MAX(temperatura_atual) as temp_max_semana
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = 2
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 7 DAY);


-- tempMinMes
SELECT MIN(temperatura_atual) as temp_min_mes
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = 2
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 30 DAY);


-- tempMaxMes
SELECT MAX(temperatura_atual) as temp_max_mes
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = 2
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 30 DAY);





