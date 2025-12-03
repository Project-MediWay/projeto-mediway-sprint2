var express = require("express");
var router = express.Router();

var veiculosController = require("../controllers/veiculosController");

router.get("/obterVeiculos/:fkempresa", function (req, res) {
    veiculosController.obterVeiculos(req, res);
})

router.get("/obterHistorico/:fkempresa", function (req, res) {
    veiculosController.obterHistorico(req, res);
})

module.exports = router;