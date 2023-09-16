const { Router } = require("express");
const productos = require("../controllers/producto.controller.js");

const router = Router();

router.get("/api/get-products", productos.getProducts);

module.exports = router;
