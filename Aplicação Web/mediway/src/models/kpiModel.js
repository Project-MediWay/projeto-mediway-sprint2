
    var database = require("../database/config")
    // var empresa = sessionStorage.ID_EMPRESA;

    function obterAlertas(empresa) {
        var instrucaoSql =
            ` SELECT COUNT(*) AS total_alertas
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    JOIN veiculo v ON s.fkVeiculo = v.idVeiculo
    WHERE v.fkEmpresa = ${empresa}
    AND (rs.temperatura_atual > 8 OR rs.temperatura_atual < 2);`

        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    }
    function obterAtencao(empresa) {
        var instrucaoSql =
            ` SELECT COUNT(*) AS total_limite
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    JOIN veiculo v ON s.fkVeiculo = v.idVeiculo
    WHERE v.fkEmpresa = ${empresa}
    AND (rs.temperatura_atual = 2 OR rs.temperatura_atual = 8);`

        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    }

    function obterNormal(empresa) {
        var instrucaoSql =
            `SELECT COUNT(*) AS total_ideal
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    JOIN veiculo v ON s.fkVeiculo = v.idVeiculo
    WHERE v.fkEmpresa = ${empresa}
    AND rs.temperatura_atual > 2 AND rs.temperatura_atual < 8;`

        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    }
    function obterQtd(empresa) {
        var instrucaoSql =
            `SELECT COUNT(*) AS total_registros
    FROM registroSensor rs
    JOIN sensor s ON rs.fkSensor = s.idSensor
    JOIN veiculo v ON s.fkVeiculo = v.idVeiculo
    WHERE v.fkEmpresa = ${empresa}`

        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    }


    module.exports = {
        obterAlertas, 
        obterAtencao, 
        obterNormal, 
        obterQtd
    };