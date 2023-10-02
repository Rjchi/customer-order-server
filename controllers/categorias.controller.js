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

const createCategory = async (req, res) => {
  try {
    const [result] = await pool.query(
      "INSERT INTO categorias(nombre_categoria) VALUES (?)",
      [req.body.nombre_categoria]
    );

    if (result.affectedRows !== 0) {
      return res.sendStatus(204);
    } else {
      return res
        .status(500)
        .json({ message: `Error al crear una nueva categoria.` });
    }
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

const updateCategory = async (req, res) => {
  try {
    const category = await pool.query("SELECT * FROM categorias WHERE id = ?", [
      req.body.id,
    ]);

    if (category[0].length !== 0) {
      const [result] = await pool.query(
        "UPDATE categorias SET nombre_categoria = ? WHERE id = ?",
        [req.body.nombre_categoria_up, req.body.id]
      );

      if (result.affectedRows !== 0) {
        return res.sendStatus(204);
      } else {
        return res
          .status(500)
          .json({ message: `Error al actualizar la categoria.` });
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

const deleteCategory = async (req, res) => {
  try {
    const [result] = await pool.query("DELETE FROM categorias WHERE id = ?", [
      req.body.id,
    ]);

    if (result.affectedRows !== 0) {
      return res.sendStatus(204);
    } else {
      return res
        .status(404)
        .json({ message: `No se encontro la categoria con ese id.` });
    }
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getCategories,
  createCategory,
  updateCategory,
  deleteCategory,
};
