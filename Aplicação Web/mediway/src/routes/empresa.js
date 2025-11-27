var express = require("express");
var router = express.Router();

var empresaController = require("../controllers/empresaController");

router.get("/obter/:token", function (req, res) {
    empresaController.obterEmpresa(req, res);
});

module.exports = router;
