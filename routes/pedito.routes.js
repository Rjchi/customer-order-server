const { Router } = require("express");

const auth = require("../middlewares/auth.middleware.js");
const pedido = require("../controllers/pedido.controller.js");

const router = Router();

router
  .get("/api/get-order-by-table", pedido.getOrderbyTable)
  .get("/api/get-orders", auth, pedido.getOrders)
  .get("/api/get-orders-not-check", auth, pedido.getOrdersNotCheck)

  .post("/api/create-order", pedido.createOrder)

  .put("/api/update-order/:id", pedido.updateOrder)
  .put("/api/update-check/:id", auth, pedido.updateCheck)

  .delete("/api/delete-order/:id", auth, pedido.deleteOrder)
  .delete("/api/delete-orders", pedido.deleteOrders);

module.exports = router;
