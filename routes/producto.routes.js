const { Router } = require("express");
const productos = require("../controllers/producto.controller.js");

const router = Router();

router
  .get("/api/get-products", productos.getProducts)
  .post("/api/products", productos.createProduct)
  .put("/api/products", productos.updateProduct)
  .delete("/api/products", productos.deleteProduct)

module.exports = router;
