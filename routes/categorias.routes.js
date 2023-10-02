const { Router } = require("express");
const categorias = require("../controllers/categorias.controller.js");

const router = Router();

router
  .get("/api/categories", categorias.getCategories)
  .post("/api/categories", categorias.createCategory)
  .put("/api/categories", categorias.updateCategory)
  .delete("/api/categories", categorias.deleteCategory);

module.exports = router;
