var express = require("express");
var router = express.Router();

var veiculosController = require("../controllers/veiculosController");

router.get("/obterVeiculos/:fkempresa", function (req, res) {
    veiculosController.obterVeiculos(req, res);
})

router.get("/obterHistorico/:fkempresa", function (req, res) {
    veiculosController.obterHistorico(req, res);
})

router.get("/obterPlaca/:idVeiculo", function (req, res) {
    veiculosController.obterPlaca(req, res);
})
router.get("/alertasEspec/:idVeiculo", function (req, res) {
    veiculosController.alertasEspec(req, res);
})
router.get("/tempAtual/:idVeiculo", function (req, res) {
    veiculosController.tempAtual(req, res);
})
router.get("/tempMin/:idVeiculo", function (req, res) {
    veiculosController.tempMin(req, res);
})
router.get("/tempMax/:idVeiculo", function (req, res) {
    veiculosController.tempMax(req, res);
})
router.get("/obterGrafico4Horas/:idVeiculo", function (req, res) {
    veiculosController.obterGrafico4Horas(req, res);
});

router.get("/obterGrafico7Dias/:idVeiculo", function (req, res) {
    veiculosController.obterGrafico7Dias(req, res);
});
router.get("/obterGraficoMensal/:idVeiculo", function (req, res) {
    veiculosController.obterGraficoMensal(req, res);
});




module.exports = router;