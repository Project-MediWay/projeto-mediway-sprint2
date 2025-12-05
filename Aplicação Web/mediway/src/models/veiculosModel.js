
var database = require("../database/config")

function obterVeiculos(empresa) {
    var instrucaoSql = `
    SELECT * FROM painelVeiculos
    WHERE fkEmpresa = ${empresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterHistorico(empresa) {
    var instrucaoSql = `
    SELECT * FROM historicoAlertas
    WHERE fkEmpresa = ${empresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterPlaca(veiculo) {
    var instrucaoSql = `
   SELECT placa as Placa_Veiculo FROM veiculo where idVeiculo   = ${veiculo};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function alertasEspec(veiculo) {
    var instrucaoSql = `
        SELECT COUNT(*) as total_alertas_4h
        FROM registroSensor rs
        JOIN sensor s ON rs.fkSensor = s.idSensor
        WHERE s.fkVeiculo = ${veiculo}
        AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 24 HOUR)
        AND (rs.temperatura_atual < 2 OR rs.temperatura_atual > 8);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function tempAtual(veiculo) {
    var instrucaoSql = `
 SELECT temperatura_atual 
FROM registroSensor 
WHERE fkSensor = (SELECT idSensor FROM sensor WHERE fkVeiculo = ${veiculo})
ORDER BY dtRegistro DESC 
LIMIT 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function tempMin(veiculo) {
    var instrucaoSql = `
SELECT MIN(temperatura_atual) as temp_min_4h
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = ${veiculo}
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 4 HOUR);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function tempMax(veiculo) {
    var instrucaoSql = `
SELECT MAX(temperatura_atual) as temp_max_4h
FROM registroSensor rs
INNER JOIN sensor s ON rs.fkSensor = s.idSensor
WHERE s.fkVeiculo = ${veiculo}
AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 4 HOUR);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function obterGrafico4Horas(veiculo) {
    var instrucaoSql = `
        SELECT 
            temperatura_atual,
            DATE_FORMAT(dtRegistro, '%H:%i') as hora
        FROM registroSensor rs
        INNER JOIN sensor s ON rs.fkSensor = s.idSensor
        WHERE s.fkVeiculo = ${veiculo}
        AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 4 HOUR)
        ORDER BY rs.dtRegistro ASC
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

function obterGrafico7Dias(veiculo) {
    var instrucaoSql = `
        SELECT 
            DATE(dtRegistro) as data,
            COUNT(CASE WHEN temperatura_atual < 2 OR temperatura_atual > 8 THEN 1 END) as alertas
        FROM registroSensor rs
        INNER JOIN sensor s ON rs.fkSensor = s.idSensor
        WHERE s.fkVeiculo = ${veiculo}
        AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 7 DAY)
        GROUP BY DATE(dtRegistro)
        ORDER BY data ASC
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

function obterGraficoMensal(veiculo) {
    var instrucaoSql = `
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
    WHERE s.fkVeiculo = ${veiculo}
        AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 30 DAY)
        AND (rs.temperatura_atual < 2 OR rs.temperatura_atual > 8)
) as subquery
GROUP BY semana_num
ORDER BY semana_num;`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}





module.exports = {
    obterVeiculos,
    obterHistorico,
    obterPlaca,
    alertasEspec,
    tempAtual,
    tempMin,
    tempMax,
    obterGrafico4Horas,
    obterGrafico7Dias,
    obterGraficoMensal
};