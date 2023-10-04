const jwt = require("../utils/jwt.js");

const userAuthenticated = (req, res, next) => {
  try {
    const { authorization } = req.headers;
    if (authorization) {
      const token = authorization.replace("Bearer ", "");
      const userData = jwt.decodedToken(token);

      /**--------------------------------------------------
       * | Recuperamos la fecha de expiración del token
       * --------------------------------------------------*/
      const { exp } = userData;
      const currentTime = new Date().getTime();

      if (exp < currentTime) {
        return res.status(403).json({ message: `El token ha expirado.` });
      } else {
        next();
      }
    } else {
      return res.status(403).json({ message: "Token no proporcionado." });
    }
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

module.exports = userAuthenticated;
