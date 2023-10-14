const { Router } = require("express");

const caja = require("../controllers/caja.controller.js");
const auth = require("../middlewares/auth.middleware.js");

const router = Router();

router.delete(
  "/api/delete-orders-by-table/:table",
  auth,
  caja.deleteOrdersByTable
);

module.exports = router;
