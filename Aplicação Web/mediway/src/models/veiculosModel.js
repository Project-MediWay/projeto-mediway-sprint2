var database = require("../database/config")

function obterVeiculos(empresa){
    var instrucaoSql = `
    SELECT * FROM painelVeiculos
    WHERE fkEmpresa = ${empresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterHistorico(empresa){
    var instrucaoSql = `
    SELECT * FROM historicoAlertas
    WHERE fkEmpresa = ${empresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    obterVeiculos,
    obterHistorico
};