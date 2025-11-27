var database = require("../database/config");

function obterEmpresa(token) {
    console.log("ACESSEI O EMPRESA MODEL");

    var instrucaoSql = `
        SELECT idEmpresa
        FROM empresa 
        WHERE token = '${token}';
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql

module.exports = {
    obterEmpresa
};
