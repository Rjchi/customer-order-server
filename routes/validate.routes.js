const express = require("express");
const validateCookie = require("../middlewares/validarCookie.middlewares.js");
const validate = require("../controllers/validate.controllers.js");

const router = express.Router();

router.get("/validate-cookie", validateCookie, validate.getUserLogged);

module.exports = router;