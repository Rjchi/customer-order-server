const pool = require("../database/db.js");

const getProducts = async (req, res) => {
  try {
    const [result] = await pool.query(
      "SELECT productos.id as id_producto, nombre_producto, imagen_producto, categorias.id as id_categoria, nombre_categoria, productos.precio_producto FROM productos, categorias WHERE productos.categoria_id = categorias.id"
    );

    if (result.length === 0) return res.status(204);

    return res.json(result);
  } catch (error) {
    return res.status(500).json({
      message: `Error al consultar todos los productos detalles: ${error.message}`,
    });
  }
};

const createProduct = async (req, res) => {
  try {
    const category = await pool.query("SELECT * FROM categorias WHERE id = ?", [
      req.body.categoria_id,
    ]);

    if (category[0].length !== 0) {
      const [result] = await pool.query(
        "INSERT INTO productos(nombre_producto, precio_producto, categoria_id, imagen_producto) VALUES (?, ?, ?, ?)",
        [
          req.body.nombre_producto,
          req.body.precio_producto,
          req.body.categoria_id,
          req.body.imagen_producto,
        ]
      );

      if (result.affectedRows !== 0) {
        return res.sendStatus(204);
      } else {
        return res
          .status(500)
          .json({ message: `Error al crear un nuevo producto.` });
      }
    } else {
      return res
        .status(404)
        .json({ message: `No existe la categoria con ese id.` });
    }
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

const updateProduct = async (req, res) => {
  try {
    const category = await pool.query("SELECT * FROM categorias WHERE id = ?", [
      req.body.categoria_id,
    ]);

    const product = await pool.query("SELECT * FROM productos WHERE id = ?", [
      req.body.id,
    ]);

    /**----------------------------------------------------
     * Validamos que la categoria y el producto existan
     * ----------------------------------------------------*/
    if (category[0].length !== 0) {
      if (product[0].length !== 0) {
        const [result] = await pool.query(
          "UPDATE productos SET nombre_producto = ?, precio_producto = ?, categoria_id = ?, imagen_producto = ? WHERE id = ?",
          [
            req.body.nombre_producto,
            req.body.precio_producto,
            req.body.categoria_id,
            req.body.imagen_producto,
            req.body.id,
          ]
        );

        if (result.affectedRows !== 0) {
          return res.sendStatus(204);
        } else {
          return res
            .status(500)
            .json({ message: `Error al actualizar el producto.` });
        }
      } else {
        return res
          .status(404)
          .json({ message: `No existe el producto con ese id.` });
      }
    } else {
      return res
        .status(404)
        .json({ message: `No existe la categoria con ese id.` });
    }
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

const deleteProduct = async (req, res) => {
  try {
    const product = await pool.query("SELECT * FROM productos WHERE id = ?", [
      req.body.id,
    ]);

    if (product[0].length !== 0) {
      const [result] = await pool.query("DELETE FROM productos WHERE id = ?", [
        req.body.id,
      ]);

      if (result.affectedRows !== 0) {
        return res.sendStatus(204);
      } else {
        return res
          .status(500)
          .json({ message: `Error al actualizar un producto.` });
      }
    } else {
      return res
        .status(404)
        .json({ message: `No existe producto con ese id.` });
    }
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getProducts,
  createProduct,
  updateProduct,
  deleteProduct,
};
