var veiculos = require("../models/veiculosModel");

// function obterdadosKPI(req, res) {
//     var email = req.body.emailServer;
//     var senha = req.body.senhaServer;

//     if (email == undefined) {
//         res.status(400).send("Seu email está undefined!");
//     } else if (senha == undefined) {
//         res.status(400).send("Sua senha está indefinida!");
//     } else {

//         veiculos.obterdadosKPI(email, senha)
//             .then(
//                 function (resultadoVeiculos) {
//                     console.log(`\nResultados encontrados: ${resultadoVeiculos.length}`);
//                     console.log(`Resultados: ${JSON.stringify(resultadoVeiculos)}`); // transforma JSON em String

//                     if (resultadoVeiculos.length == 1) {
//                         console.log(resultadoVeiculos);
//                         res.json(resultadoVeiculos[0])
//                     } else if (resultadoVeiculos.length >= 0) {
//                         res.status(403).send("email e/ou senha inválido(s)");
//                         return res.status(403).send("email e/ou senha inválido(s)");
//                     } else {
//                         res.status(403).send("Mais de um usuário com o mesmo login e senha!");
//                     }
//                 }
//             ).catch(
//                 function (erro) {
//                     console.log(erro);
//                     console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
//                     res.status(500).json(erro.sqlMessage);
//                 }
//             );
//     }

// }



function obterVeiculos(req, res) {
  var empresa = req.params.fkempresa;

  veiculos
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

module.exports = {
    // obterdadosKPI,
    obterVeiculos
}