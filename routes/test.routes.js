// Router --> modulo para crear multiples rutas.
const { Router } = require("express");
const pool = require("../database/db.js")

const router = Router();

router.get("/test", async (req, res) => {
    const [ result ] = await pool.query("SELECT 1 + 1 AS RESULT");
    res.json({
        test: `ting`,
        query: `El resultado de la suma es: ${result[0].RESULT}`
    });
})

module.exports = router;