
var kpiModel = require("../models/kpiModel");


function obterAlertas(req, res) {
  var empresa = req.body.fkempresa;

  kpiModel.obterAlertas(empresa)
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
function obterAtencao(req, res) {
  var empresa = req.body.fkempresa;

  kpiModel.obterAtencao(empresa)
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

function obterNormal(req, res) {
  var empresa = req.body.fkempresa;

  kpiModel.obterNormal(empresa)
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
function obterQtd(req, res) {
  var empresa = req.body.fkempresa;

  kpiModel.obterQtd(empresa)
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
    obterAlertas, 
    obterAtencao, 
    obterNormal, 
    obterQtd
}