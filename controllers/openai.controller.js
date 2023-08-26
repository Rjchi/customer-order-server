const { OpenAI } = require("openai");
const { OPENAI_KEY } = require("../config.js");

const openai = new OpenAI({
  apiKey: OPENAI_KEY,
});

const generateImage = async (req, res) => {
  try {
    const { prompt } = req.body;
    const response = await openai.images.generate({
      prompt: prompt,
      n: 1,
    });
    res.status(200).json(response.data);
  } catch (error) {
    console.log(`Detalles: ${error.message}`);
  }
};

module.exports = {
  generateImage,
};
