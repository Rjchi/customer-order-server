/**------------------------------------------------------------------
 * bcrypt es para aplicar "hashing" y "salting" de contraseñas
 * Con el fin de almacenar contraseñas seguras en la base de datos
 ------------------------------------------------------------------*/
const bcrypt = require("bcrypt");
const pool = require("../database/db.js");

const Logueo = async (req, res) => {
  try {
    const user = await pool.query(
      "SELECT * FROM usuarios WHERE documento = ?",
      [req.body.documento]
    );

    if (user[0].length !== 0) {
      /**---------------------------------------------
         * Aqui comparamos la contraseña ingresada con
         * La misma contraseña hasheada
         ---------------------------------------------*/
      const match = await bcrypt.compare(
        req.body.contrasenia,
        user[0][0].contrasenia_hash
      );
      if (match) {
        return res.status(200).json({
          id: user[0][0].id,
          nombre: user[0][0].nombre,
          documento: user[0][0].documento,
        });
      } else {
        return res
          .status(401)
          .json({ message: `Las credenciales son incorrectas.` });
      }
    }
    return res.status(404).json({ message: `Usuario no encontrado.` });
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

const Registro = async (req, res) => {
  try {
    if (req.body.contrasenia.length > 4) {
      /**--------------------------------------------
         * Este es el numero de rondas del hashing
         --------------------------------------------*/
      const saltRounds = 10;
      /**-------------------------------
       * Aqui hasheamos la contraseña
       -------------------------------*/
      const hashedPassword = await bcrypt.hash(
        req.body.contrasenia,
        saltRounds
      );

      const [result] = await pool.query(
        "INSERT INTO usuarios (documento, nombre, contrasenia_hash) VALUES (?, ?, ?)",
        [req.body.documento, req.body.nombre, hashedPassword]
      );

      if (result.affectedRows === 1) {
        return res
          .status(200)
          .json({ message: `Usuario registrar exitosamente.` });
      }
      return res.status(400);
    }
    return res
      .status(400)
      .json({ error: "Error al intentar registrar un nuevo usuario" });
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

module.exports = {
  Logueo,
  Registro,
};
