const { Router } = require("express");
const { getProducts } = require("../controllers/producto.controller.js");

const router = Router();

router.get("/api/get-products", getProducts);

module.exports = router;