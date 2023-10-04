/**------------------------------------------
 * Ruta para testeo de la base de datos
 ------------------------------------------*/

const { Router } = require("express");
const pool = require("../database/db.js");
const auth = require("../middlewares/auth.middleware.js")

const router = Router();

router.get("/test", async (req, res) => {
  const [result] = await pool.query("SELECT 1 + 1 AS RESULT");
  res.json({
    test: `ting`,
    query: `El resultado de la suma es: ${result[0].RESULT}`,
  });
});

router.get("/testing", auth, async (req, res) => {
  res.json({
    message: "Bien"
  })
});

module.exports = router;
