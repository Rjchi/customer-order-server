const pool = require("../database/db.js");

const getCategories = async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * FROM categorias");

    if (result.length === 0)
      return res.status(404).json({ message: `No hay categorias.` });

    return res.json(result);
  } catch (error) {
    return res.status(500).json({
      message: `Error al consultar todas las categorias detalles: ${error.message}`,
    });
  }
};

module.exports = {
  getCategories,
};
