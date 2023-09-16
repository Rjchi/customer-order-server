const { Router } = require("express");
const categorias = require("../controllers/categorias.controller.js")

const router = Router();

router.get("/api/get-categories", categorias.getCategories);

module.exports = router;
