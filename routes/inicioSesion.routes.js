const express = require("express");
const controller = require("../controllers/inicioSesion.controller");

const router = express.Router();

router.post("/api/logueo", controller.Logueo);
router.post("/api/registro", controller.Registro);
router.post("/api/logout", controller.logout);

module.exports = router;