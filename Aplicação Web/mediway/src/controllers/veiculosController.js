var veiculosModel = require("../models/veiculosModel");

function obterVeiculos(req, res) {
  var empresa = req.params.fkempresa;

  veiculosModel
    .obterVeiculos(empresa)
    .then(function (resultado) {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).json([]);
      }
    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao buscar os dados: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}

function obterHistorico(req, res) {
  var empresa = req.params.fkempresa;

  veiculosModel
    .obterHistorico(empresa)
    .then(function (resultado) {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).json([]);
      }
    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao buscar os dados: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    obterVeiculos,
    obterHistorico
}