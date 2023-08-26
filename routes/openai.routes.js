const { Router } = require("express");
const { generateImage } = require("../controllers/openai.controller.js");

const router = Router();

router.post("/openai", generateImage);

module.exports = router;
