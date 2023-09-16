const { Router } = require("express");
const pedido = require("../controllers/pedido.controller.js");

const router = Router();

router
  .get("/api/get-order-by-table", pedido.getOrderbyTable)
  .get("/api/get-orders", pedido.getOrders)
  .get("/api/get-orders-not-check", pedido.getOrdersNotCheck)

  .post("/api/create-order", pedido.createOrder)

  .put("/api/update-order/:id", pedido.updateOrder)
  .put("/api/update-check/:id", pedido.updateCheck)

  .delete("/api/delete-order/:id", pedido.deleteOrder)
  .delete("/api/delete-orders", pedido.deleteOrders);

module.exports = router;
