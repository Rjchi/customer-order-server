/**----------------------------------------------
 * | Enviamos el token si es que es valido para
 * | Validarlo nuevamente y asi evitamos guardarlo
 * | En una cookie o en el almacenamiento local
 * ----------------------------------------------*/
const getCurrentToken = (req, res) => {
  try {
    const token = req.currentToken;

    if (token) {
      return res.status(200).json({
        token,
      });
    } else {
      return res.status(404).json({ message: `El token es invalido.` });
    }
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

module.exports = { getCurrentToken };
