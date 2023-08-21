const { Router } = require("express");
const { getCategories } = require("../controllers/categorias.controller.js")

const router = Router();

router.get("/api/get-categories", getCategories);

module.exports = router;
