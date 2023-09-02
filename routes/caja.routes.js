const { Router } = require("express");
const { deleteOrdersByTable } = require("../controllers/caja.controller.js");

const router = Router();

router.delete("/api/delete-orders-by-table/:table", deleteOrdersByTable);

module.exports = router;