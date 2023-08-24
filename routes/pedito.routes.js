const { Router } = require("express");
const {
    createOrder,
    updateOrder,
    deleteOrder,
    getOrderbyTable,
    deleteOrders,
    getOrders,
} = require("../controllers/pedido.controller.js")

const router = Router();

router.post("/api/create-order", createOrder);
router.put("/api/update-order/:id", updateOrder);

router.delete("/api/delete-order/:id", deleteOrder);

router.get("/api/get-order-by-table", getOrderbyTable);
router.delete("/api/delete-orders", deleteOrders);
router.get("/api/get-orders", getOrders);

module.exports = router;
