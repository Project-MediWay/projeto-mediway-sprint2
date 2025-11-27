var empresaModel = require("../models/empresaModel");

function obterEmpresa(req, res) {
    var token = req.params.token; // ✔️ Correção principal

    if (!token) {
        return res.status(400).send("Token não informado.");
    }

    empresaModel.obterEmpresa(token)
        .then(function (resultadoEmpresa) {

            if (resultadoEmpresa.length > 0) {
                return res.status(200).json(resultadoEmpresa);
            } else {
                return res.status(404).send("Token não encontrado.");
            }

        })
        .catch(function (erro) {
            console.error("Erro ao consultar empresa:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    obterEmpresa
};
