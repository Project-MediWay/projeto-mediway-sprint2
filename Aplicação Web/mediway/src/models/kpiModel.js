
    var database = require("../database/config")
    // var empresa = sessionStorage.ID_EMPRESA;

    function obterAlertas(empresa) {
        var instrucaoSql =
            ` SELECT COUNT(DISTINCT v.idVeiculo) as total_alerta
FROM veiculo v
WHERE v.fkEmpresa = ${empresa}
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
) > 8;`
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    }

    function obterAtencao(empresa) {
        var instrucaoSql =
            `SELECT COUNT(DISTINCT v.idVeiculo) as total_limite
FROM veiculo v
WHERE v.fkEmpresa = ${empresa}
AND (
    SELECT rs.temperatura_atual
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    WHERE s.fkVeiculo = v.idVeiculo
    ORDER BY rs.dtRegistro DESC
    LIMIT 1
) IN (2, 8);`

        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    }

    function obterNormal(empresa) {
        var instrucaoSql =
            `SELECT COUNT(DISTINCT v.idVeiculo) as total_ideal
FROM veiculo v
WHERE v.fkEmpresa = ${empresa}
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
) < 8;`

        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    }
    function obterQtd(empresa) {
        var instrucaoSql =
            `SELECT * FROM quantidadeVeiculos
            WHERE fkEmpresa = ${empresa};`

        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    }


    module.exports = {
        obterAlertas, 
        obterAtencao, 
        obterNormal, 
        obterQtd
    };