var express = require("express");
var router = express.Router();

var veiculosController = require("../controllers/veiculosController");

router.get("/obter/:fkempresa", function (req, res) {
    veiculosController.obterdadosKPI(req, res);
})

router.get("/obterVeiculos/:fkempresa", function (req, res) {
    veiculosController.obterVeiculos(req, res);
})

module.exports = router;