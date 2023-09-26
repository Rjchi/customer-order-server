const pool = require("../database/db.js");

const getProducts = async (req, res) => {
  try {
    const [result] = await pool.query(
      "SELECT productos.id as id_producto, nombre_producto, imagen_producto, categorias.id as id_categoria, nombre_categoria, productos.precio_producto FROM productos, categorias WHERE productos.categoria_id = categorias.id"
    );

    if (result.length === 0)
      return res.status(204);

    return res.json(result);
  } catch (error) {
    return res.status(500).json({
      message: `Error al consultar todos los productos detalles: ${error.message}`,
    });
  }
};

module.exports = {
    getProducts,
}
