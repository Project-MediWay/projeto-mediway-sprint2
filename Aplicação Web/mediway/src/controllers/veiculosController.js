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
function obterPlaca(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .obterPlaca(veiculo)
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
function alertasEspec(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .alertasEspec(veiculo)
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
function tempAtual(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .tempAtual(veiculo)
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
function tempMin(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .tempMin(veiculo)
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


function tempMax(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .tempMax(veiculo)
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

function obterGrafico4Horas(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel.obterGrafico4Horas(veiculo)
    .then(function (resultado) {
      res.status(200).json(resultado);
    })
    .catch(function (erro) {
      res.status(500).json({ erro: erro.message });
    });
}

function obterGrafico7Dias(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel.obterGrafico7Dias(veiculo)
    .then(function (resultado) {
      res.status(200).json(resultado);
    })
    .catch(function (erro) {
      res.status(500).json({ erro: erro.message });
    });
}

function obterGraficoMensal(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel.obterGraficoMensal(veiculo)
    .then(function (resultado) {
      res.status(200).json(resultado);
    })
    .catch(function (erro) {
      res.status(500).json({ erro: erro.message });
    });
}







function tempMaxSem(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .tempMaxSem(veiculo)
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

function tempMinSem(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .tempMinSem(veiculo)
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

function tempMaxMen(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .tempMaxMen(veiculo)
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

function tempMinMen(req, res) {
  var veiculo = req.params.idVeiculo;

  veiculosModel
    .tempMinMen(veiculo)
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
  obterHistorico,
  obterPlaca,
  alertasEspec,
  tempAtual,
  tempMin,
  tempMax,
  tempMaxSem,
  tempMinSem,
  tempMinMen,
  tempMaxMen,
  obterGrafico4Horas,
  obterGrafico7Dias,
  obterGraficoMensal
}