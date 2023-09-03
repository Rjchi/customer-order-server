const pool = require("../database/db.js");

const deleteOrdersByTable = async (req, res) => {
  try {
    const [result] = await pool.query("DELETE FROM pedidos WHERE mesa = ?", [
      req.params.table,
    ]);
    if (result.affectedRows !== 0) {
        return res.status(200).json({ message: "Eliminado correctamente" });
    }
    return res.status(404).json({ message: "No hay pedidos para esa mesa" });
  } catch (error) {
    res.status(500).json({
      message: `Error al eliminar pedidos de una mesa detalles ${error.message}`,
    });
  }
};

module.exports = { deleteOrdersByTable };
