const { Router } = require("express");
const caja = require("../controllers/caja.controller.js");

const router = Router();

router.delete("/api/delete-orders-by-table/:table", caja.deleteOrdersByTable);

module.exports = router;
