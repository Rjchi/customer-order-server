/**------------------------------------------------------------------
 * bcrypt es para aplicar "hashing" y "salting" de contraseñas
 * Con el fin de almacenar contraseñas seguras en la base de datos
 ------------------------------------------------------------------*/
const bcrypt = require("bcrypt");
const jwt = require("../utils/jwt.js");
const pool = require("../database/db.js");

const Logueo = async (req, res) => {
  try {
    const selectUser = async (doc) => {
      return await pool.query("SELECT * FROM usuarios WHERE documento = ?", [
        doc,
      ]);
    };

    const selectRol = async (id) => {
      return await pool.query("SELECT rol_nombre FROM rol WHERE rol_id = ?", [
        id,
      ]);
    };

    let user = await selectUser(req.body.documento);

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
        const usu_rol = await selectRol(user[0][0].usu_rol_id);

        await pool.query(
          "UPDATE usuarios SET usu_activo = true, usu_ingreso = NOW(), usu_salida = null WHERE id = ?",
          [user[0][0].id]
        );

        let user_log = await selectUser(req.body.documento);
        delete user_log[0][0].contrasenia_hash;
        delete user_log[0][0].usu_rol_id;

        /**------------------------------------------------------
         * Almacenamos la información del usuario en la sesión
         ------------------------------------------------------*/
        const usuario = {
          ...user_log[0][0],
          usu_rol: usu_rol[0][0].rol_nombre,
        };

        /**--------------------------------------
         * | Creamos el token para el usuario
         * --------------------------------------*/
        return res.status(200).json({
          token: jwt.createAccessToken(usuario),
          refresh: jwt.createRefreshToken(usuario),
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
        "INSERT INTO usuarios (documento, nombre, contrasenia_hash, usu_rol_id) VALUES (?, ?, ?, ?)",
        [
          req.body.documento,
          req.body.nombre,
          hashedPassword,
          req.body.usu_rol_id,
        ]
      );

      if (result.affectedRows === 1) {
        return res
          .status(200)
          .json({ message: `Usuario registrar exitosamente.` });
      }
      return res.sendStatus(400);
    }
    return res
      .status(400)
      .json({ error: "Error al intentar registrar un nuevo usuario" });
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

const logout = (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      res.status(500).json({ message: "Error al cerrar sesión" });
      throw err;
    } else {
      res.status(204).send();
    }
  });
};

module.exports = {
  Logueo,
  Registro,
  logout,
};
