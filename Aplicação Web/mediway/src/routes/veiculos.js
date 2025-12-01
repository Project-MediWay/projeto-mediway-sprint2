var express = require("express");
var router = express.Router();

var dashespecificaController = require("../controllers/dashespecificaController");

//Recebendo os dados do html e direcionando para a função cadastrar de dashespecificaController.js
router.get("/obter/:fkempresa", function (req, res) {
    dashespecificaController.obterdadosKPI(req, res);
})

module.exports = router;