
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
   SELECT placa as Placa_Veiculo FROM Veiculo where idVeiculo   = ${veiculo};
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
             DATE(dtRegistro) as data,
            COUNT(CASE WHEN temperatura_atual < 2 OR temperatura_atual > 8 THEN 1 END) as alertas
        FROM registroSensor rs
        INNER JOIN sensor s ON rs.fkSensor = s.idSensor
        WHERE s.fkVeiculo = ${veiculo}
        AND rs.dtRegistro >= DATE_SUB(NOW(), INTERVAL 7 DAY)
        GROUP BY DATE(dtRegistro)  -- Já está correto, agrupando pela mesma expressão do SELECT
        ORDER BY data ASC;
    `;
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