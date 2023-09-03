const pool = require("../database/db.js");

// Consultas para cliente:
const createOrder = async (req, res) => {
  try {
    const { nombre, cantidad, mesa, precio } = req.body;

    const [result] = await pool.query(
      "INSERT INTO pedidos(nombre, cantidad, mesa, precio) VALUES (?, ?, ?, ?)",
      [nombre, cantidad, mesa, precio]
    );

    if (result.affectedRows === 0)
      return res.status(500).json({ message: "No se pudo crear el pedido" });

    return res.sendStatus(204);
  } catch (error) {
    return res
      .status(500)
      .json({ message: `Error al crear el pedido detalles: ${error.message}` });
  }
};

const updateOrder = async (req, res) => {
  try {
    const [result] = await pool.query("UPDATE pedidos SET ? WHERE id = ?", [
      req.body,
      req.params.id,
    ]);

    if (result.affectedRows === 0)
      return res.status(404).json({ message: "Pedido no encontrado" });

    return res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({
      message: `Error al actualizar el pedido detalles: ${error.message}`,
    });
  }
};

// Ambos:
const deleteOrder = async (req, res) => {
  try {
    const [result] = await pool.query("DELETE FROM pedidos WHERE id = ?", [
      req.params.id,
    ]);

    if (result.affectedRows !== 0)
      return res.status(200).json({ message: "Pedido Eliminado" });

    return res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({
      message: `Error al eliminar el pedido detalles: ${error.message}`,
    });
  }
};

// Consultas para cocina:
const getOrderbyTable = async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * FROM pedidos WHERE mesa = ?", [
      req.query.mesa,
    ]);

    if (result.length === 0)
      return res
        .status(404)
        .json({ message: `La mesa ${req.query.mesa} no tiene pedidos.` });

    return res.json(result);
  } catch (error) {
    return res.status(500).json({
      message: `Error al consultar los pedidos de la mesa detalles: ${error.message}`,
    });
  }
};

const deleteOrders = async (req, res) => {
  try {
    const [result] = await pool.query("DELETE FROM pedidos");

    if (result.affectedRows !== 0)
      return res
        .status(200)
        .json({ message: `Pedidos eliminado Correctamente` });

    return res.status(404).json({ message: "No hay pedidos para eliminar" });
  } catch (error) {
    return res.status(500).json({
      message: `Error al elminar los pedidos detalles: ${error.message}`,
    });
  }
};

const getOrders = async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * From pedidos");
    return res.json(result);
  } catch (error) {
    return res.status(500).json({
      message: `Error al consultar todos los pedidos detalles: ${error.message}`,
    });
  }
};

const getOrdersNotCheck = async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * From pedidos WHERE listo = 0");
    return res.json(result);
  } catch (error) {
    return res.status(500).json({
      message: `Error al consultar todos los pedidos detalles: ${error.message}`,
    });
  }
};

const updateCheck = async (req, res) => {
  try {
    const [result] = await pool.query(
      "UPDATE pedidos SET listo = 1 WHERE id = ?",
      [req.params.id]
    );
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({
      message: `Error al consultar todos los pedidos detalles: ${error.message}`,
    });
  }
};

module.exports = {
  createOrder,
  updateOrder,
  deleteOrder,
  getOrderbyTable,
  deleteOrders,
  getOrders,
  getOrdersNotCheck,
  updateCheck,
};
