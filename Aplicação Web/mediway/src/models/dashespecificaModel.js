var database = require("../database/config")

function obterdadosKPI(temperatura_atual) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", temperatura_atual)

    var instrucaoSql = `
       SELECT COUNT(idVeiculo) AS 'Qtd de veículos Alerta'
    FROM Veiculo v
    JOIN Sensor s ON v.idVeiculo = s.fkVeiculo
    JOIN RegistroSensor rs ON rs.fkSensor = s.idSensor
    WHERE  '${temperatura_atual}'>8 OR '${temperatura_atual}'<2;';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



module.exports = {
    obterdadosKPI
};