var express = require("express");
var router = express.Router();

var kpisController = require("../controllers/kpisController");

router.post("/obterAlertas", function (req, res) { 
    kpisController.obterAlertas(req, res);
})

router.post("/obterAtencao", function (req, res) {
    kpisController.obterAtencao(req, res);
})

router.post("/obterNormal", function (req, res) {
    kpisController.obterNormal(req, res);
})

router.post("/obterQtd", function (req, res) {
    kpisController.obterQtd(req, res);
})

router.post("/obterQtd", function (req, res) {
    kpisController.obterQtd(req, res);
})


module.exports = router;