var dashespecifica = require("../models/dashespecificaModel");

function obterdadosKPI(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        dashespecifica.obterdadosKPI(email, senha)
            .then(
                function (resultadoobterdadosKPI) {
                    console.log(`\nResultados encontrados: ${resultadoobterdadosKPI.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoobterdadosKPI)}`); // transforma JSON em String

                    if (resultadoobterdadosKPI.length == 1) {
                        console.log(resultadoobterdadosKPI);
                        res.json(resultadoobterdadosKPI[0])
                    } else if (resultadoobterdadosKPI.length >= 0) {
                        res.status(403).send("email e/ou senha inválido(s)");
                        return res.status(403).send("email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}


module.exports = {
    obterdadosKPI
}