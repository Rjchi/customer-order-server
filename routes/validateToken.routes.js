const express = require("express");

const auth = require("../middlewares/auth.middleware.js");
const controller = require("../controllers/validateToken.controller.js");

const router = express.Router();

router.get("/api/validate-token", auth, controller.getCurrentToken);

module.exports = router;
